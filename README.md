<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>mVehicleshop — README</title>
  <style>
    :root{
      --bg:#0b1220;
      --card:#0f1a2e;
      --card2:#101f38;
      --text:#e8eefc;
      --muted:#a8b3cf;
      --line:rgba(232,238,252,.12);
      --accent:#66ff9a;
      --warn:#ffcc66;
      --code:#081022;
      --shadow: 0 18px 60px rgba(0,0,0,.35);
      --radius:16px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
      background: radial-gradient(1200px 700px at 20% 10%, rgba(102,255,154,.08), transparent 60%),
                  radial-gradient(900px 600px at 85% 20%, rgba(120,170,255,.08), transparent 55%),
                  linear-gradient(180deg, #070b14, var(--bg));
      color:var(--text);
      line-height:1.55;
    }
    .wrap{max-width:1080px;margin:0 auto;padding:36px 18px 80px}
    header{
      padding:26px 22px;
      border:1px solid var(--line);
      background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.03));
      border-radius: calc(var(--radius) + 6px);
      box-shadow: var(--shadow);
    }
    h1{margin:0 0 10px;font-size:34px;letter-spacing:.2px}
    .subtitle{margin:0;color:var(--muted)}
    .pillrow{display:flex;flex-wrap:wrap;gap:10px;margin-top:16px}
    .pill{
      font-size:12px;
      padding:6px 10px;
      border-radius:999px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.04);
      color:var(--muted);
    }
    .pill strong{color:var(--text);font-weight:600}
    nav{
      margin-top:18px;
      display:flex;
      flex-wrap:wrap;
      gap:10px;
    }
    nav a{
      color:var(--text);
      text-decoration:none;
      border:1px solid var(--line);
      background: rgba(255,255,255,.03);
      padding:8px 10px;
      border-radius:12px;
      font-size:13px;
    }
    nav a:hover{background: rgba(255,255,255,.06)}
    .grid{
      margin-top:18px;
      display:grid;
      grid-template-columns: 1fr;
      gap:14px;
    }
    .card{
      padding:18px 18px 16px;
      border:1px solid var(--line);
      border-radius: var(--radius);
      background: linear-gradient(180deg, rgba(255,255,255,.05), rgba(255,255,255,.02));
      box-shadow: var(--shadow);
    }
    .card h2{margin:0 0 10px;font-size:18px}
    .muted{color:var(--muted)}
    .split{
      display:grid;
      grid-template-columns: 1fr;
      gap:12px;
    }
    @media (min-width: 900px){
      .split{grid-template-columns: 1fr 1fr;}
    }
    .langTitle{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:10px;
      margin-bottom:8px;
    }
    .tag{
      font-size:12px;
      padding:6px 10px;
      border-radius:999px;
      border:1px solid var(--line);
      background: rgba(102,255,154,.10);
      color: var(--accent);
      white-space:nowrap;
    }
    ul{margin:10px 0 0 18px}
    li{margin:6px 0}
    code, pre{
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
    }
    pre{
      background: rgba(8,16,34,.85);
      border:1px solid var(--line);
      border-radius: 14px;
      padding:12px 12px;
      overflow:auto;
      margin:10px 0 0;
    }
    .note{
      margin-top:10px;
      padding:12px 12px;
      border-radius: 14px;
      border:1px solid rgba(255,204,102,.25);
      background: rgba(255,204,102,.08);
      color: var(--text);
    }
    .note strong{color:var(--warn)}
    table{
      width:100%;
      border-collapse:collapse;
      margin-top:10px;
      overflow:hidden;
      border-radius:14px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.03);
    }
    th, td{
      padding:10px 10px;
      border-bottom:1px solid var(--line);
      vertical-align:top;
      font-size:14px;
    }
    th{color:var(--text);text-align:left;background: rgba(255,255,255,.04)}
    tr:last-child td{border-bottom:none}
    footer{
      margin-top:18px;
      color:var(--muted);
      font-size:13px;
      text-align:center;
    }
    .small{font-size:13px}
  </style>
</head>
<body>
  <div class="wrap">
    <header>
      <h1>mVehicleshop</h1>
      <p class="subtitle">Premium Vehicle Shop System for FiveM (Qbox / QBCore) — Enterprise-grade structure, modern NUI, admin panel and scalable catalog management.</p>

      <div class="pillrow">
        <div class="pill"><strong>Framework:</strong> Qbox (MRI) / QBCore</div>
        <div class="pill"><strong>Database:</strong> oxmysql</div>
        <div class="pill"><strong>UI:</strong> NUI (HTML/CSS/JS)</div>
        <div class="pill"><strong>Target:</strong> ox_target / qb-target</div>
        <div class="pill"><strong>Permissions:</strong> ACE (recommended)</div>
      </div>

      <nav>
        <a href="#description">Description</a>
        <a href="#features">Features</a>
        <a href="#stack">Technology</a>
        <a href="#compatibility">Compatibility</a>
        <a href="#structure">Structure</a>
        <a href="#installation">Installation</a>
        <a href="#permissions">Admin Permissions</a>
        <a href="#configuration">Configuration</a>
        <a href="#catalog">Vehicle Catalog</a>
        <a href="#philosophy">Design Philosophy</a>
        <a href="#roadmap">Roadmap</a>
        <a href="#license">License</a>
        <a href="#support">Support</a>
      </nav>
    </header>

    <section id="description" class="grid">
      <div class="card">
        <h2>Description</h2>
        <div class="split">
          <div>
            <div class="langTitle">
              <strong>Português (BR)</strong>
              <span class="tag">PT-BR</span>
            </div>
            <p class="muted">
              <strong>mVehicleshop</strong> é um sistema completo e moderno de <strong>loja de veículos</strong> para FiveM,
              projetado com foco em <strong>Qbox (MRI)</strong>, performance e experiência do usuário.
              O recurso entrega uma <strong>NUI elegante</strong>, interação com <strong>NPC vendedor</strong> (ALT/Target),
              e um <strong>painel administrativo in-game</strong> com permissões seguras via <strong>ACE</strong>.
            </p>
            <p class="muted">
              Administradores podem <strong>criar, editar e remover veículos</strong> do catálogo em tempo real,
              gerenciar <strong>preços, estoque, categorias e imagens</strong>, sem necessidade de reiniciar o servidor.
              O objetivo é substituir scripts antigos e limitados, oferecendo uma solução <strong>profissional, escalável e mantenível</strong>.
            </p>
          </div>

          <div>
            <div class="langTitle">
              <strong>English</strong>
              <span class="tag">EN</span>
            </div>
            <p class="muted">
              <strong>mVehicleshop</strong> is a complete and modern <strong>vehicle dealership</strong> system for FiveM,
              designed with <strong>Qbox (MRI)</strong> as a primary target while keeping compatibility with <strong>QBCore</strong>.
              It provides a <strong>premium NUI</strong>, <strong>NPC vendor</strong> interaction (ALT/Target),
              and a secure <strong>in-game admin panel</strong> powered by <strong>ACE permissions</strong>.
            </p>
            <p class="muted">
              Administrators can <strong>create, edit and remove vehicles</strong> from the catalog in real time,
              managing <strong>prices, stock, categories and images</strong> without server restarts.
              The goal is to replace legacy dealership scripts with a solution that is <strong>professional, scalable and maintainable</strong>.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section id="features" class="grid">
      <div class="card">
        <h2>Key Features</h2>

        <div class="split">
          <div>
            <strong>Player Features</strong>
            <ul>
              <li>Configurable NPC dealer (model, scenario, location)</li>
              <li>ALT/Target interaction (supports <code>ox_target</code> or <code>qb-target</code>)</li>
              <li>Modern and clean NUI interface</li>
              <li>Category browsing (Sports, Super, Sedans, SUVs, Motorcycles, etc.)</li>
              <li>Vehicle cards with price, stock and image</li>
              <li>Integrated purchase flow (cash or bank)</li>
              <li>Automatic vehicle delivery and optional key integration</li>
            </ul>
          </div>

          <div>
            <strong>Administrative Features</strong>
            <ul>
              <li>Secure in-game admin panel (ACE-based)</li>
              <li>Create / update / delete vehicles</li>
              <li>Manage: label, model, category, image URL, price and stock</li>
              <li>Live catalog updates (no restart needed)</li>
              <li>Designed for scalable multi-dealership setups</li>
            </ul>

            <div class="note">
              <strong>Note:</strong> Qbox/MRI commonly uses ACE permissions instead of “groups”.
              This README includes a recommended enterprise approach for admin access control.
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="stack" class="grid">
      <div class="card">
        <h2>Technology Stack</h2>
        <table>
          <thead>
            <tr>
              <th>Layer</th>
              <th>Technologies</th>
              <th>Purpose</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Client</td>
              <td>Lua</td>
              <td>NPC interaction, UI open/close, purchase request, vehicle delivery</td>
            </tr>
            <tr>
              <td>Server</td>
              <td>Lua + oxmysql</td>
              <td>Catalog storage, validation, stock control, purchase processing</td>
            </tr>
            <tr>
              <td>UI (NUI)</td>
              <td>HTML + CSS + JavaScript</td>
              <td>Premium UI/UX (cards, categories, admin panel forms)</td>
            </tr>
            <tr>
              <td>Utilities</td>
              <td>ox_lib</td>
              <td>Callbacks, context menus, notifications and overall framework glue</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section id="compatibility" class="grid">
      <div class="card">
        <h2>Compatibility</h2>
        <table>
          <thead>
            <tr>
              <th>Component</th>
              <th>Supported</th>
              <th>Notes</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Framework</td>
              <td>Qbox (MRI), QBCore</td>
              <td>Admin panel recommended via ACE (Qbox standard)</td>
            </tr>
            <tr>
              <td>Target</td>
              <td>ox_target, qb-target</td>
              <td>ALT interaction via target entity</td>
            </tr>
            <tr>
              <td>Database</td>
              <td>oxmysql</td>
              <td>Catalog stored in <code>mvehicleshop_vehicles</code></td>
            </tr>
            <tr>
              <td>Vehicle Keys</td>
              <td>Qbox keys / QB keys</td>
              <td>Configurable integration and fallback options</td>
            </tr>
            <tr>
              <td>Garages</td>
              <td>Standard QB/Qbox schemas</td>
              <td>May be adapted if your database schema differs</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section id="structure" class="grid">
      <div class="card">
        <h2>Resource Structure</h2>
        <pre><code>mVehicleshop/
  fxmanifest.lua
  config.lua
  shared/bridge.lua
  client/main.lua
  server/main.lua
  web/index.html
  web/style.css
  web/app.js
  sql.sql</code></pre>
        <p class="muted small">
          The structure is designed to keep responsibilities separated (client/server/UI), improving long-term maintainability.
        </p>
      </div>
    </section>

    <section id="installation" class="grid">
      <div class="card">
        <h2>Installation</h2>

        <div class="split">
          <div>
            <strong>1) Requirements</strong>
            <ul>
              <li><code>ox_lib</code></li>
              <li><code>oxmysql</code></li>
              <li><code>ox_target</code> or <code>qb-target</code></li>
              <li><code>qbx_core</code> (Qbox/MRI) or <code>qb-core</code> (QBCore)</li>
            </ul>

            <strong>2) Database</strong>
            <p class="muted">Import <code>sql.sql</code> into your database to create the catalog table.</p>
          </div>

          <div>
            <strong>3) server.cfg</strong>
            <pre><code>ensure ox_lib
ensure oxmysql
ensure ox_target   # or qb-target
ensure mVehicleshop</code></pre>

            <div class="note">
              <strong>Tip:</strong> Make sure <code>oxmysql</code> is configured and connected properly (connection string / database access).
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="permissions" class="grid">
      <div class="card">
        <h2>Admin Permissions (Enterprise / ACE)</h2>
        <p class="muted">
          For Qbox/MRI servers, the recommended standard is to manage administrative access using <strong>ACE permissions</strong>.
          This approach is explicit, secure, and easy to audit.
        </p>

        <strong>Grant permission to admin group:</strong>
        <pre><code>add_ace group.admin mvehicleshop.admin allow</code></pre>

        <strong>Assign your player to admin group:</strong>
        <pre><code>add_principal identifier.license:YOUR_LICENSE_HERE group.admin</code></pre>

        <p class="muted small">
          To find your license identifier, use <code>status</code> in the server console.
        </p>
      </div>
    </section>

    <section id="configuration" class="grid">
      <div class="card">
        <h2>Configuration</h2>

        <div class="split">
          <div>
            <strong>Dealerships</strong>
            <p class="muted">Configure NPC and vehicle delivery coordinates in <code>config.lua</code>.</p>
            <pre><code>Config.Shops = {
  {
    id = 'pdm',
    label = 'Premium Deluxe Motorsport',
    ped = {
      model = 's_m_m_autoshop_02',
      coords = vec4(-56.46, -1097.19, 26.42, 71.0),
      scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
    spawn = {
      coords = vec4(-33.90, -1090.30, 26.42, 160.0)
    }
  }
}</code></pre>
          </div>

          <div>
            <strong>Categories</strong>
            <p class="muted">Categories are used by the UI as tabs. Keep IDs consistent with database entries.</p>
            <pre><code>Config.Categories = {
  { id = 'sports', label = 'Sports' },
  { id = 'super', label = 'Super' },
  { id = 'sedan', label = 'Sedans' },
  { id = 'suv', label = 'SUVs' },
  { id = 'motorcycle', label = 'Motorcycles' }
}</code></pre>

            <div class="note">
              <strong>Important:</strong> <code>shop</code> and <code>category</code> fields in the database must match these IDs exactly.
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="catalog" class="grid">
      <div class="card">
        <h2>Vehicle Catalog Management</h2>

        <div class="split">
          <div>
            <strong>Option A — In-Game Admin Panel (Recommended)</strong>
            <ul>
              <li>Open the shop via NPC</li>
              <li>Click <strong>Admin Panel</strong> (visible only for admins)</li>
              <li>Create or edit vehicles in real time</li>
              <li>No server restart required</li>
            </ul>
          </div>

          <div>
            <strong>Option B — SQL Inserts</strong>
            <p class="muted">You can quickly seed your catalog through SQL:</p>
            <pre><code>INSERT INTO mvehicleshop_vehicles (shop, category, model, label, price, stock, image)
VALUES
('pdm', 'super', 'adder', 'Adder', 230000, 5, 'https://image.url'),
('pdm', 'sports', 'sultan', 'Sultan', 80000, 10, 'https://image.url'),
('pdm', 'motorcycle', 'bati', 'Bati 801', 45000, 7, 'https://image.url');</code></pre>
          </div>
        </div>

        <div class="note">
          <strong>Image handling:</strong> Vehicle images are provided via URL. If no image is set, the UI can fallback to a placeholder.
        </div>
      </div>
    </section>

    <section id="philosophy" class="grid">
      <div class="card">
        <h2>Design Philosophy</h2>
        <ul>
          <li><strong>Enterprise organization:</strong> clear separation between client, server, and UI.</li>
          <li><strong>Performance-first:</strong> avoid heavy loops; leverage callbacks and on-demand updates.</li>
          <li><strong>Security:</strong> admin access via ACE permissions (auditable, explicit).</li>
          <li><strong>Scalability:</strong> supports multiple dealerships and expandable category structure.</li>
          <li><strong>Maintainability:</strong> clean code boundaries and predictable configuration points.</li>
        </ul>
      </div>
    </section>

    <section id="roadmap" class="grid">
      <div class="card">
        <h2>Roadmap (Planned Enhancements)</h2>
        <ul>
          <li>Test drive system with timer and safe return</li>
          <li>3D showroom preview (spawn preview vehicle when selecting a card)</li>
          <li>Advanced filtering and sorting (price, stock, category)</li>
          <li>Multi-currency support</li>
          <li>Import/export catalog templates</li>
          <li>Multiple dealerships with shared inventory (optional)</li>
        </ul>
      </div>
    </section>

    <section id="license" class="grid">
      <div class="card">
        <h2>License</h2>
        <p class="muted">
          This project is intended for FiveM server usage. Redistributions or modifications should keep original credits.
          If you plan to publish a fork, include attribution in the repository and within the resource metadata.
        </p>
      </div>
    </section>

    <section id="support" class="grid">
      <div class="card">
        <h2>Support & Contributions</h2>
        <p class="muted">
          Contributions, improvements and bug reports are welcome. Please open an issue with:
        </p>
        <ul>
          <li>Framework (Qbox/QBCore) and versions</li>
          <li>Database schema if customized</li>
          <li>Target system (ox_target/qb-target)</li>
          <li>Server console logs and reproduction steps</li>
        </ul>
        <p class="muted small">
          Enterprise tip: keep your changes modular and use configuration over code edits whenever possible.
        </p>
      </div>
    </section>

    <footer>
      <div>mVehicleshop — Premium Vehicle Shop System for FiveM (Qbox / QBCore)</div>
      <div class="small">Built for performance, clarity and scalability.</div>
    </footer>
  </div>
</body>
</html>
