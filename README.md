<div align="center">
  <h1>Premium Delux Motorsport</h1>
  <p><b>Premium Vehicle Shop System for FiveM (Qbox / QBCore)</b></p>
  <p>Enterprise-grade structure • Modern NUI • NPC Vendor • Admin Panel (ACE) • Scalable Catalog</p>

  <p>
    <img alt="Framework" src="https://img.shields.io/badge/Framework-Qbox%20%7C%20QBCore-5865F2?style=for-the-badge">
    <img alt="Database" src="https://img.shields.io/badge/Database-oxmysql-2ea44f?style=for-the-badge">
    <img alt="UI" src="https://img.shields.io/badge/UI-NUI%20(HTML%2FCSS%2FJS)-111827?style=for-the-badge">
    <img alt="Target" src="https://img.shields.io/badge/Target-ox_target%20%7C%20qb--target-0ea5e9?style=for-the-badge">
    <img alt="Permissions" src="https://img.shields.io/badge/Permissions-ACE-f59e0b?style=for-the-badge">
  </p>
</div>

<hr/>

<h2>📌 Description / Descrição</h2>

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>Português (BR)</h3>
      <p>
        <b>mVehicleshop</b> é um sistema completo e moderno de <b>loja de veículos</b> para FiveM,
        focado em <b>Qbox (MRI)</b> com compatibilidade para <b>QBCore</b>.  
        Oferece uma <b>NUI elegante</b>, interação com <b>NPC vendedor</b> (ALT/Target),
        e um <b>painel administrativo in-game</b> com permissões seguras via <b>ACE</b>.
      </p>
      <p>
        Admins podem <b>criar, editar e remover veículos</b> do catálogo em tempo real,
        gerenciando <b>preço, estoque, categoria e imagem</b>, sem necessidade de restart.
        O objetivo é substituir scripts antigos com uma solução <b>profissional, escalável e mantenível</b>.
      </p>
    </td>
    <td width="50%" valign="top">
      <h3>English</h3>
      <p>
        <b>mVehicleshop</b> is a complete and modern <b>vehicle dealership</b> system for FiveM,
        primarily designed for <b>Qbox (MRI)</b> while remaining compatible with <b>QBCore</b>.  
        It provides a <b>premium NUI</b>, <b>NPC vendor</b> interaction (ALT/Target),
        and a secure <b>in-game admin panel</b> powered by <b>ACE permissions</b>.
      </p>
      <p>
        Admins can <b>create, edit and remove vehicles</b> from the catalog in real time,
        managing <b>price, stock, category and image</b> without server restarts.
        The goal is to replace legacy dealership scripts with a <b>professional, scalable and maintainable</b> solution.
      </p>
    </td>
  </tr>
</table>

<hr/>

<h2>✨ Key Features</h2>

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>Player Features</h3>
      <ul>
        <li>Configurable NPC dealer (model, scenario, location)</li>
        <li>ALT/Target interaction (supports <code>ox_target</code> or <code>qb-target</code>)</li>
        <li>Modern and clean NUI interface</li>
        <li>Category-based browsing (Sports, Super, Sedans, SUVs, Motorcycles, etc.)</li>
        <li>Vehicle cards with price, stock and image</li>
        <li>Integrated purchase flow (cash or bank)</li>
        <li>Automatic vehicle delivery and optional key integration</li>
      </ul>
    </td>
    <td width="50%" valign="top">
      <h3>Administrative Features</h3>
      <ul>
        <li>Secure in-game admin panel (ACE-based)</li>
        <li>Create / update / delete vehicles</li>
        <li>Manage: label, model, category, image URL, price and stock</li>
        <li>Live catalog updates (no restart needed)</li>
        <li>Designed for scalable multi-dealership setups</li>
      </ul>
      <blockquote>
        <b>Note:</b> Qbox/MRI commonly uses ACE permissions instead of “groups”.
        This README includes the recommended enterprise approach for admin access control.
      </blockquote>
    </td>
  </tr>
</table>

<hr/>

<h2>🛠️ Technology Stack</h2>

<table>
  <thead>
    <tr>
      <th align="left">Layer</th>
      <th align="left">Technologies</th>
      <th align="left">Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Client</td>
      <td>Lua</td>
      <td>NPC interaction, UI open/close, purchase requests, vehicle delivery</td>
    </tr>
    <tr>
      <td>Server</td>
      <td>Lua + oxmysql</td>
      <td>Catalog storage, validation, stock control, purchase processing</td>
    </tr>
    <tr>
      <td>UI (NUI)</td>
      <td>HTML + CSS + JavaScript</td>
      <td>UI/UX (cards, categories, admin panel forms)</td>
    </tr>
    <tr>
      <td>Utilities</td>
      <td>ox_lib</td>
      <td>Callbacks, context menus, notifications and utilities</td>
    </tr>
  </tbody>
</table>

<hr/>

<h2>✅ Compatibility</h2>

<table>
  <thead>
    <tr>
      <th align="left">Component</th>
      <th align="left">Supported</th>
      <th align="left">Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Framework</td>
      <td>Qbox (MRI), QBCore</t>
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
  </tbody>
</table>

<hr/>

<h2>📁 Resource Structure</h2>

<pre><code>mri_vehicleshopcustom/
  fxmanifest.lua
  config.lua
  shared/bridge.lua
  client/main.lua
  server/main.lua
  web/index.html
  web/style.css
  web/app.js
  sql.sql</code></pre>

<hr/>

<h2>⚙️ Installation</h2>

<h3>1) Requirements</h3>
<ul>
  <li><code>ox_lib</code></li>
  <li><code>oxmysql</code></li>
  <li><code>ox_target</code> or <code>qb-target</code></li>
  <li><code>qbx_core</code> (Qbox/MRI) or <code>qb-core</code> (QBCore)</li>
</ul>

<h3>2) Database</h3>
<p>Import <code>sql.sql</code> into your database.</p>

<h2>🔐 Admin Permissions (ACE / Enterprise)</h2>
<p>
  Recommended for Qbox/MRI. Grant the permission to your admin group and assign your player:
</p>

<pre><code>add_ace group.admin mvehicleshop.admin allow
add_principal identifier.license:YOUR_LICENSE_HERE group.admin</code></pre>

<p>To find your license identifier, use <code>status</code> in the server console.</p>

<hr/>

<h2>🚗 Vehicle Catalog Management</h2>

<h3>Option A — In-Game Admin Panel (Recommended)</h3>
<ul>
  <li>Open the shop via NPC</li>
  <li>Click <b>Admin Panel</b> (visible only for admins)</li>
  <li>Create or edit vehicles in real time</li>
  <li>No server restart required</li>
</ul>

<h3>Option B — SQL Inserts</h3>
<pre><code>INSERT INTO mvehicleshop_vehicles (shop, category, model, label, price, stock, image)
VALUES
('pdm', 'super', 'adder', 'Adder', 230000, 5, 'https://image.url'),
('pdm', 'sports', 'sultan', 'Sultan', 80000, 10, 'https://image.url'),
('pdm', 'motorcycle', 'bati', 'Bati 801', 45000, 7, 'https://image.url');</code></pre>

<blockquote>
  <b>Important:</b> <code>shop</code> must match your <code>Config.Shops.id</code> and <code>category</code> must match your <code>Config.Categories.id</code>.
</blockquote>

<hr/>

<h2>🎯 Design Philosophy</h2>
<ul>
  <li><b>Enterprise organization:</b> clear separation between client, server, and UI.</li>
  <li><b>Performance-first:</b> avoids heavy loops; uses callbacks and on-demand updates.</li>
  <li><b>Security:</b> admin access via ACE permissions (explicit and auditable).</li>
  <li><b>Scalability:</b> supports multiple dealerships and expandable categories.</li>
  <li><b>Maintainability:</b> predictable configuration points and modular code.</li>
</ul>

<hr/>

<h2>🧭 Roadmap (Planned Enhancements)</h2>
<ul>
  <li>Test drive system with timer and safe return</li>
  <li>3D showroom preview (spawn preview vehicle when selecting a card)</li>
  <li>Advanced filtering and sorting (price, stock, category)</li>
  <li>Multi-currency support</li>
  <li>Import/export catalog templates</li>
  <li>Shared inventory across multiple dealerships (optional)</li>
</ul>

<hr/>

<h2>📄 License</h2>
<p>
  This project is intended for FiveM server usage. Redistribution or modification should retain original credits.
</p>

<hr/>

<h2>🤝 Support & Contributions</h2>
<p>
  Contributions and improvements are welcome. When reporting issues, include:
</p>
<ul>
  <li>Framework (Qbox/QBCore) and versions</li>
  <li>Target system (ox_target/qb-target)</li>
  <li>Database schema details if customized</li>
  <li>Server console logs and reproduction steps</li>
</ul>

<p align="center">
  <i>mVehicleshop — Built for performance, clarity and scalability.</i>
</p>
