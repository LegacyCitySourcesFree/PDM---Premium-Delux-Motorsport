const app = document.getElementById('app');
const closeBtn = document.getElementById('closeBtn');
const adminBtn = document.getElementById('adminBtn');
const buyBtn = document.getElementById('buyBtn');
const grid = document.getElementById('grid');
const tabs = document.getElementById('tabs');

const shopTitle = document.getElementById('shopTitle');

const selName = document.getElementById('selName');
const selMeta = document.getElementById('selMeta');
const selPrice = document.getElementById('selPrice');
const selImg = document.getElementById('selImg');

const adminPanel = document.getElementById('adminPanel');

const a_id = document.getElementById('a_id');
const a_shop = document.getElementById('a_shop');
const a_category = document.getElementById('a_category');
const a_model = document.getElementById('a_model');
const a_label = document.getElementById('a_label');
const a_price = document.getElementById('a_price');
const a_stock = document.getElementById('a_stock');
const a_image = document.getElementById('a_image');

const saveBtn = document.getElementById('saveBtn');
const delBtn = document.getElementById('delBtn');

let currentShop = null;
let categories = [];
let allItems = [];
let currentCategory = null;
let selected = null;
let isAdmin = false;

function fmtMoney(v){
  try { return '$' + Number(v).toLocaleString('en-US'); } catch(e){ return '$' + v; }
}

function post(action, data={}){
  return fetch(`https://${GetParentResourceName()}/${action}`, {
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body: JSON.stringify(data)
  }).then(r=>r.json().catch(()=>({})));
}

function renderTabs(){
  tabs.innerHTML = '';
  categories.forEach(c => {
    const b = document.createElement('div');
    b.className = 'tab' + (currentCategory === c.id ? ' active' : '');
    b.textContent = c.label;
    b.onclick = () => { currentCategory = c.id; renderGrid(); renderTabs(); };
    tabs.appendChild(b);
  });
}

function placeholderImg(){
  return 'https://i.imgur.com/0Z8YwQp.png'; // placeholder simples
}

function renderGrid(){
  const items = allItems.filter(i => !currentCategory || i.category === currentCategory);
  grid.innerHTML = '';
  items.forEach(i => {
    const card = document.createElement('div');
    card.className = 'card';
    card.onclick = () => selectItem(i);

    const img = (i.image && i.image.length > 5) ? i.image : placeholderImg();

    card.innerHTML = `
      <div class="cardTop">
        <div class="badge">${(i.category || '').toUpperCase()}</div>
        <div class="stock">Estoque: ${i.stock}</div>
      </div>
      <div class="thumb"><img src="${img}" /></div>
      <div class="name">${i.label}</div>
      <div class="priceLine">
        <div class="money">${fmtMoney(i.price)}</div>
        <div class="badge">${i.model}</div>
      </div>
    `;
    grid.appendChild(card);
  });
}

function selectItem(i){
  selected = i;
  selName.textContent = i.label;
  selMeta.textContent = `${i.model} • estoque: ${i.stock}`;
  selPrice.textContent = fmtMoney(i.price);
  selImg.src = (i.image && i.image.length > 5) ? i.image : placeholderImg();
  buyBtn.disabled = !(i.stock > 0);

  // Preenche admin form pra editar
  if (isAdmin){
    a_id.value = i.id ?? '';
    a_shop.value = i.shop ?? currentShop ?? '';
    a_category.value = i.category ?? '';
    a_model.value = i.model ?? '';
    a_label.value = i.label ?? '';
    a_price.value = i.price ?? 0;
    a_stock.value = i.stock ?? 0;
    a_image.value = i.image ?? '';
  }
}

window.addEventListener('message', async (ev) => {
  const d = ev.data;
  if (d.action === 'open'){
    app.classList.remove('hidden');
    currentShop = d.shop.id;
    shopTitle.textContent = d.shop.label;

    // checa admin
    isAdmin = await post('isAdmin');
    if (isAdmin) adminBtn.classList.remove('hidden');
    else adminBtn.classList.add('hidden');

    adminPanel.classList.add('hidden');
  }

  if (d.action === 'catalog'){
    allItems = d.items || [];
    categories = d.categories || [];
    currentCategory = categories[0]?.id || null;
    renderTabs();
    renderGrid();
  }
});

closeBtn.onclick = () => post('close').then(() => app.classList.add('hidden'));

buyBtn.onclick = () => {
  if (!selected) return;
  post('buy', { shop: currentShop, vehicleId: selected.id });
};

adminBtn.onclick = () => {
  adminPanel.classList.toggle('hidden');
};

saveBtn.onclick = () => {
  const payload = {
    id: a_id.value ? Number(a_id.value) : null,
    shop: a_shop.value || currentShop,
    category: a_category.value,
    model: a_model.value,
    label: a_label.value,
    price: Number(a_price.value || 0),
    stock: Number(a_stock.value || 0),
    image: a_image.value
  };
  post('adminUpsert', payload);
};

delBtn.onclick = () => {
  if (!a_id.value) return;
  post('adminDelete', { id: Number(a_id.value), shop: a_shop.value || currentShop });
};

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape'){
    post('close').then(() => app.classList.add('hidden'));
  }
});
