<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NovaMart — Modern E-Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    :root{
      --bg:#ffffff;--bg2:#f4f5f7;--surface:#ffffff;--text:#0f1117;--text2:#6b7280;--text3:#9ca3af;
      --border:rgba(0,0,0,0.08);--border2:rgba(0,0,0,0.14);--accent:#4f6ef7;--accent-dark:#3a5ce0;
      --radius:12px;--radius-lg:18px;--transition:all 0.18s cubic-bezier(0.2,0,0,1);
    }
    body.dark{
      --bg:#0f1117;--bg2:#1a1d27;--surface:#1a1d27;--text:#f1f3f9;--text2:#9ca3af;--text3:#6b7280;
      --border:rgba(255,255,255,0.07);--border2:rgba(255,255,255,0.12);
    }
    body{font-family:'Inter',sans-serif;background:var(--bg);color:var(--text);transition:var(--transition);min-height:100vh}

    /* HEADER */
    .header{display:flex;align-items:center;justify-content:space-between;padding:14px 32px;border-bottom:0.5px solid var(--border);position:sticky;top:0;background:var(--bg);z-index:100;gap:16px}
    .logo{font-size:20px;font-weight:800;color:var(--text);letter-spacing:-0.03em;display:flex;align-items:center;gap:7px;text-decoration:none}
    .logo-dot{width:9px;height:9px;border-radius:50%;background:var(--accent);flex-shrink:0}
    .nav{display:flex;gap:24px}
    .nav a{font-size:13px;font-weight:500;color:var(--text2);text-decoration:none;transition:var(--transition)}
    .nav a:hover,.nav a.active{color:var(--text)}
    .search{display:flex;align-items:center;gap:8px;background:var(--bg2);border:0.5px solid var(--border);border-radius:20px;padding:8px 16px;width:220px;transition:var(--transition)}
    .search:focus-within{border-color:var(--accent);box-shadow:0 0 0 3px rgba(79,110,247,0.12)}
    .search input{background:transparent;border:none;outline:none;font-size:13px;color:var(--text);width:100%;font-family:inherit}
    .search input::placeholder{color:var(--text3)}
    .header-actions{display:flex;gap:8px;align-items:center}
    .icon-btn{width:36px;height:36px;border-radius:50%;background:var(--bg2);border:0.5px solid var(--border);display:flex;align-items:center;justify-content:center;cursor:pointer;transition:var(--transition);color:var(--text);position:relative;flex-shrink:0}
    .icon-btn:hover{border-color:var(--border2);background:var(--surface)}
    .icon-btn svg{width:15px;height:15px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
    .cart-badge{position:absolute;top:-4px;right:-4px;background:var(--accent);color:#fff;font-size:10px;font-weight:700;width:16px;height:16px;border-radius:50%;display:flex;align-items:center;justify-content:center}

    /* HERO */
    .hero{display:grid;grid-template-columns:1fr 420px;gap:16px;padding:20px 32px}
    .hero-main{background:#0f1117;border-radius:var(--radius-lg);padding:44px 40px;display:flex;flex-direction:column;justify-content:space-between;position:relative;overflow:hidden;min-height:320px}
    .hero-main::before{content:'';position:absolute;top:-80px;right:-80px;width:280px;height:280px;border-radius:50%;background:rgba(79,110,247,0.1)}
    .hero-main::after{content:'';position:absolute;bottom:-60px;left:40px;width:180px;height:180px;border-radius:50%;background:rgba(79,110,247,0.06)}
    .hero-eyebrow{font-size:11px;font-weight:600;letter-spacing:0.09em;text-transform:uppercase;color:var(--accent);margin-bottom:14px;position:relative}
    .hero-main h1{font-size:38px;font-weight:800;color:#fff;line-height:1.12;letter-spacing:-0.03em;max-width:300px;position:relative}
    .hero-main p{font-size:14px;color:rgba(255,255,255,0.5);margin-top:12px;line-height:1.6;max-width:280px;position:relative}
    .hero-btns{display:flex;gap:10px;margin-top:32px;position:relative}
    .btn-white{background:#fff;color:#0f1117;border:none;padding:10px 22px;border-radius:20px;font-size:13px;font-weight:700;cursor:pointer;font-family:inherit;transition:var(--transition)}
    .btn-white:hover{background:#e8ecff;color:var(--accent)}
    .btn-ghost{background:rgba(255,255,255,0.07);color:#fff;border:0.5px solid rgba(255,255,255,0.15);padding:10px 22px;border-radius:20px;font-size:13px;font-weight:500;cursor:pointer;font-family:inherit;transition:var(--transition)}
    .btn-ghost:hover{background:rgba(255,255,255,0.12)}
    .hero-side{display:flex;flex-direction:column;gap:14px}
    .hero-card{background:var(--bg2);border:0.5px solid var(--border);border-radius:var(--radius-lg);padding:24px;display:flex;flex-direction:column;justify-content:space-between;cursor:pointer;transition:var(--transition);flex:1}
    .hero-card:hover{border-color:var(--accent)}
    .hero-card-label{font-size:11px;font-weight:600;letter-spacing:0.07em;text-transform:uppercase;color:var(--text3)}
    .hero-card h3{font-size:18px;font-weight:700;margin-top:6px;letter-spacing:-0.02em}
    .hero-card-price{font-size:24px;font-weight:800;color:var(--accent);letter-spacing:-0.02em}
    .hero-card-old{font-size:13px;color:var(--text3);text-decoration:line-through;margin-left:6px;font-weight:400}
    .hero-card-tag{display:inline-block;background:rgba(79,110,247,0.1);color:var(--accent);font-size:11px;font-weight:600;padding:3px 10px;border-radius:10px;margin-top:10px}

    /* CATEGORIES */
    .section{padding:32px 32px 0}
    .section-label{font-size:11px;font-weight:600;letter-spacing:0.09em;text-transform:uppercase;color:var(--text3);margin-bottom:16px}
    .cats{display:grid;grid-template-columns:repeat(6,1fr);gap:10px}
    .cat{background:var(--bg2);border:0.5px solid var(--border);border-radius:var(--radius-lg);padding:20px 12px;text-align:center;cursor:pointer;transition:var(--transition)}
    .cat:hover{border-color:var(--accent);background:var(--surface)}
    .cat-icon{font-size:24px;margin-bottom:8px}
    .cat span{font-size:12px;font-weight:500;color:var(--text2)}

    /* PRODUCTS */
    .products-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:18px}
    .products-header h2{font-size:20px;font-weight:700;letter-spacing:-0.02em}
    .filters{display:flex;gap:6px}
    .filter{background:var(--bg2);border:0.5px solid var(--border);padding:6px 14px;border-radius:14px;font-size:12px;font-weight:500;cursor:pointer;color:var(--text2);transition:var(--transition);font-family:inherit}
    .filter:hover{border-color:var(--border2)}
    .filter.active{background:var(--accent);border-color:var(--accent);color:#fff}
    .grid{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
    .card{background:var(--surface);border:0.5px solid var(--border);border-radius:var(--radius-lg);overflow:hidden;cursor:pointer;transition:var(--transition);position:relative}
    .card:hover{border-color:var(--border2);transform:translateY(-3px)}
    .card-img{width:100%;height:190px;object-fit:cover;display:block;background:var(--bg2)}
    .card-badge{position:absolute;top:12px;left:12px;background:var(--accent);color:#fff;font-size:11px;font-weight:700;padding:3px 10px;border-radius:10px;letter-spacing:0.02em}
    .card-body{padding:16px}
    .card-brand{font-size:11px;font-weight:600;letter-spacing:0.06em;text-transform:uppercase;color:var(--text3)}
    .card-title{font-size:15px;font-weight:600;margin-top:3px;letter-spacing:-0.01em;line-height:1.3}
    .card-stars{font-size:12px;color:var(--text3);margin-top:4px}
    .card-stars .s{color:#f5a623}
    .card-foot{display:flex;align-items:center;justify-content:space-between;margin-top:12px}
    .card-price{font-size:17px;font-weight:800;letter-spacing:-0.02em}
    .card-old{font-size:12px;color:var(--text3);text-decoration:line-through;margin-left:4px}
    .add-btn{width:32px;height:32px;border-radius:50%;background:var(--accent);border:none;color:#fff;font-size:20px;cursor:pointer;display:flex;align-items:center;justify-content:center;font-family:inherit;line-height:1;transition:var(--transition);flex-shrink:0}
    .add-btn:hover{background:var(--accent-dark);transform:scale(1.08)}

    /* FLASH SALE */
    .flash{margin:28px 32px 0;background:#0f1117;border-radius:var(--radius-lg);padding:36px;display:flex;align-items:center;gap:36px}
    body.dark .flash{background:#12151f;border:0.5px solid var(--border)}
    .flash-img{width:220px;height:170px;object-fit:cover;border-radius:10px;flex-shrink:0}
    .flash-eyebrow{font-size:11px;font-weight:600;letter-spacing:0.09em;text-transform:uppercase;color:var(--accent);margin-bottom:10px}
    .flash h2{font-size:26px;font-weight:800;color:#fff;letter-spacing:-0.02em;line-height:1.2}
    .flash-price{font-size:30px;font-weight:800;color:#fff;margin-top:16px;letter-spacing:-0.02em}
    .flash-old{font-size:17px;font-weight:400;color:rgba(255,255,255,0.35);text-decoration:line-through;margin-left:8px}
    .timer{display:flex;gap:10px;margin-top:18px}
    .time-box{background:rgba(255,255,255,0.06);border-radius:8px;padding:10px 14px;text-align:center;min-width:54px}
    .time-n{font-size:24px;font-weight:800;color:#fff;line-height:1}
    .time-l{font-size:10px;color:rgba(255,255,255,0.35);margin-top:3px;text-transform:uppercase;letter-spacing:0.06em}

    /* TESTIMONIALS */
    .testi-row{display:flex;gap:16px;overflow-x:auto;padding-bottom:8px;scrollbar-width:none}
    .testi-row::-webkit-scrollbar{display:none}
    .testi-card{min-width:300px;background:var(--surface);border:0.5px solid var(--border);border-radius:var(--radius-lg);padding:24px;flex-shrink:0}
    .testi-top{display:flex;gap:12px;align-items:center;margin-bottom:14px}
    .testi-avatar{width:44px;height:44px;border-radius:50%;object-fit:cover;flex-shrink:0}
    .testi-name{font-size:14px;font-weight:600}
    .testi-stars{color:#f5a623;font-size:13px;margin-top:1px}
    .testi-text{font-size:13px;color:var(--text2);line-height:1.6}

    /* NEWSLETTER */
    .newsletter{margin:28px 32px 0;background:linear-gradient(120deg,#1a237e,#4f6ef7 60%,#7c4dff);border-radius:var(--radius-lg);padding:48px 40px;text-align:center;color:#fff}
    .newsletter h3{font-size:26px;font-weight:800;letter-spacing:-0.02em}
    .newsletter p{font-size:14px;opacity:0.75;margin-top:8px}
    .nl-form{display:flex;justify-content:center;gap:10px;margin-top:24px;flex-wrap:wrap}
    .nl-form input{padding:11px 22px;border-radius:20px;border:none;width:280px;background:rgba(255,255,255,0.95);font-size:14px;font-family:inherit;outline:none}
    .nl-form input:focus{box-shadow:0 0 0 3px rgba(255,255,255,0.3)}
    .btn-accent{background:#fff;color:#1a237e;border:none;padding:11px 24px;border-radius:20px;font-size:13px;font-weight:700;cursor:pointer;font-family:inherit;transition:var(--transition)}
    .btn-accent:hover{background:#e8ecff}
    .nl-msg{margin-top:14px;font-size:13px;min-height:20px}

    /* FOOTER */
    footer{margin-top:48px;padding:40px 32px 28px;border-top:0.5px solid var(--border)}
    .footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;margin-bottom:32px}
    .footer-brand{font-size:19px;font-weight:800;letter-spacing:-0.03em;display:flex;align-items:center;gap:7px;margin-bottom:12px}
    .footer-desc{font-size:13px;color:var(--text2);line-height:1.6;max-width:220px}
    .footer-heading{font-size:12px;font-weight:600;letter-spacing:0.07em;text-transform:uppercase;color:var(--text3);margin-bottom:14px}
    .footer-links{display:flex;flex-direction:column;gap:10px}
    .footer-links a{font-size:13px;color:var(--text2);text-decoration:none;transition:var(--transition)}
    .footer-links a:hover{color:var(--text)}
    .footer-bottom{border-top:0.5px solid var(--border);padding-top:20px;font-size:12px;color:var(--text3);display:flex;justify-content:space-between}

    /* TOAST */
    .toast{position:fixed;bottom:24px;left:50%;transform:translateX(-50%);background:#0f1117;color:#fff;padding:11px 24px;border-radius:20px;font-size:13px;font-weight:500;z-index:9999;opacity:0;transition:opacity 0.3s;pointer-events:none;white-space:nowrap;font-family:'Inter',sans-serif}
    .toast.show{opacity:1}

    /* NO RESULTS */
    .no-results{grid-column:1/-1;text-align:center;padding:48px;color:var(--text3);font-size:14px}

    /* RESPONSIVE */
    @media(max-width:1024px){
      .hero{grid-template-columns:1fr}.hero-side{flex-direction:row}.cats{grid-template-columns:repeat(3,1fr)}.grid{grid-template-columns:repeat(2,1fr)}
      .footer-grid{grid-template-columns:1fr 1fr}
    }
    @media(max-width:700px){
      .header{padding:12px 16px}.hero{padding:12px 16px}.section{padding:20px 16px 0}
      .hero-main h1{font-size:28px}.hero-side{flex-direction:column}
      .cats{grid-template-columns:repeat(2,1fr)}.grid{grid-template-columns:1fr}
      .flash{flex-direction:column;padding:24px 20px;margin:20px 16px 0}.flash-img{width:100%;height:180px}
      .newsletter{margin:20px 16px 0;padding:32px 20px}
      footer{padding:28px 16px 20px}.footer-grid{grid-template-columns:1fr 1fr}.nav{display:none}
    }
    button{cursor:pointer}
  </style>
</head>
<body>

  <!-- HEADER -->
  <header class="header">
    <a class="logo" href="#"><div class="logo-dot"></div> NovaMart</a>
    <nav class="nav">
      <a href="#" class="active">Home</a>
      <a href="#products">Shop</a>
      <a href="#flash">Deals</a>
      <a href="#newsletter">Newsletter</a>
    </nav>
    <div class="search">
      <svg viewBox="0 0 16 16"><circle cx="6.5" cy="6.5" r="5.5"/><path d="M10.5 10.5L14 14" stroke-linecap="round"/></svg>
      <input type="text" id="search-input" placeholder="Search products...">
    </div>
    <div class="header-actions">
      <div class="icon-btn" id="theme-toggle" title="Toggle dark mode">
        <svg id="theme-icon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1111.21 3a7 7 0 009.79 9.79z"/></svg>
      </div>
      <div class="icon-btn" title="Wishlist">
        <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"/></svg>
      </div>
      <div class="icon-btn" id="cart-btn" title="Cart">
        <svg viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/></svg>
        <div class="cart-badge" id="cart-count">0</div>
      </div>
    </div>
  </header>

  <!-- HERO -->
  <section class="hero">
    <div class="hero-main">
      <div>
        <div class="hero-eyebrow">New season drop</div>
        <h1>Elevate your everyday carry</h1>
        <p>Curated drops. Premium gear. Limited quantities — updated daily.</p>
      </div>
      <div class="hero-btns">
        <button class="btn-white" onclick="document.getElementById('products').scrollIntoView({behavior:'smooth'})">Shop now →</button>
        <button class="btn-ghost" onclick="document.getElementById('flash').scrollIntoView({behavior:'smooth'})">View deals</button>
      </div>
    </div>
    <div class="hero-side">
      <div class="hero-card" onclick="document.getElementById('flash').scrollIntoView({behavior:'smooth'})">
        <div>
          <div class="hero-card-label">⚡ Flash deal</div>
          <h3>MacBook Pro M3</h3>
        </div>
        <div>
          <span class="hero-card-price">$1,299</span><span class="hero-card-old">$1,699</span>
          <div><div class="hero-card-tag">Ends in 2d 5h</div></div>
        </div>
      </div>
      <div class="hero-card">
        <div>
          <div class="hero-card-label">★ Most loved</div>
          <h3>Sony WH-1000XM6</h3>
        </div>
        <div>
          <span class="hero-card-price">$399</span><span class="hero-card-old">$499</span>
          <div><div class="hero-card-tag">5.0 · 324 reviews</div></div>
        </div>
      </div>
    </div>
  </section>

  <!-- CATEGORIES -->
  <section class="section">
    <div class="section-label">Browse by category</div>
    <div class="cats" id="cats"></div>
  </section>

  <!-- PRODUCTS -->
  <section class="section" id="products" style="padding-top:32px">
    <div class="products-header">
      <h2>Trending now</h2>
      <div class="filters" id="filters">
        <button class="filter active" data-f="all">All</button>
        <button class="filter" data-f="audio">Audio</button>
        <button class="filter" data-f="wearables">Wearables</button>
        <button class="filter" data-f="gaming">Gaming</button>
        <button class="filter" data-f="fashion">Fashion</button>
      </div>
    </div>
    <div class="grid" id="product-grid"></div>
  </section>

  <!-- FLASH SALE -->
  <div id="flash">
    <section class="flash">
      <img class="flash-img" src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=500&q=80" alt="MacBook Pro M3">
      <div>
        <div class="flash-eyebrow">⚡ Flash sale · limited time</div>
        <h2>MacBook Pro M3<br>Biggest discount yet</h2>
        <div class="flash-price">$1,299 <span class="flash-old">$1,699</span></div>
        <div class="timer">
          <div class="time-box"><div class="time-n" id="t-d">02</div><div class="time-l">Days</div></div>
          <div class="time-box"><div class="time-n" id="t-h">05</div><div class="time-l">Hrs</div></div>
          <div class="time-box"><div class="time-n" id="t-m">00</div><div class="time-l">Min</div></div>
          <div class="time-box"><div class="time-n" id="t-s">00</div><div class="time-l">Sec</div></div>
        </div>
        <button class="btn-white" style="margin-top:24px;background:var(--accent);color:#fff;font-size:14px;padding:12px 28px" onclick="addToCart('MacBook Pro M3')">Grab deal →</button>
      </div>
    </section>
  </div>

  <!-- TESTIMONIALS -->
  <section class="section" style="padding-top:32px">
    <div class="section-label">Customer love</div>
    <div class="testi-row" id="testi-row"></div>
  </section>

  <!-- NEWSLETTER -->
  <div id="newsletter">
    <section class="newsletter">
      <h3>Join the inner circle</h3>
      <p>Early access to sales, new arrivals & exclusive member rewards</p>
      <form class="nl-form" id="nl-form">
        <input type="email" id="nl-email" placeholder="you@example.com" required>
        <button type="submit" class="btn-accent">Subscribe →</button>
      </form>
      <div class="nl-msg" id="nl-msg"></div>
    </section>
  </div>

  <!-- FOOTER -->
  <footer>
    <div class="footer-grid">
      <div>
        <div class="footer-brand"><div class="logo-dot"></div> NovaMart</div>
        <p class="footer-desc">Next-gen e-commerce. Premium products, fast delivery, and world-class support.</p>
      </div>
      <div>
        <div class="footer-heading">Explore</div>
        <div class="footer-links">
          <a href="#">About us</a>
          <a href="#">Careers</a>
          <a href="#">Sustainability</a>
          <a href="#">Press</a>
        </div>
      </div>
      <div>
        <div class="footer-heading">Support</div>
        <div class="footer-links">
          <a href="#">Help center</a>
          <a href="#">Returns</a>
          <a href="#">Shipping</a>
          <a href="#">Contact</a>
        </div>
      </div>
      <div>
        <div class="footer-heading">Legal</div>
        <div class="footer-links">
          <a href="#">Privacy</a>
          <a href="#">Terms</a>
          <a href="#">Cookies</a>
          <a href="#">Accessibility</a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 NovaMart — Redefining modern retail</span>
      <span>Made with ♥ for shoppers everywhere</span>
    </div>
  </footer>

  <div class="toast" id="toast"></div>

  <script>
    const CATEGORIES = [
      {id:"audio",name:"Audio",icon:"🎧"},
      {id:"wearables",name:"Wearables",icon:"⌚"},
      {id:"gaming",name:"Gaming",icon:"🎮"},
      {id:"fashion",name:"Streetwear",icon:"👕"},
      {id:"accessories",name:"Accessories",icon:"💎"},
      {id:"smart-home",name:"Smart Home",icon:"🏠"}
    ];

    const PRODUCTS = [
      {id:101,brand:"Sony",title:"WH-1000XM6",price:399,old:499,stars:5,reviews:324,img:"https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=600&q=80",cat:"audio",badge:"Best Seller"},
      {id:102,brand:"Apple",title:"Watch Ultra 2",price:749,old:799,stars:5,reviews:512,img:"https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=600&q=80",cat:"wearables",badge:"New"},
      {id:103,brand:"Razer",title:"Blade 16",price:2799,old:3199,stars:4.8,reviews:210,img:"https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80",cat:"gaming"},
      {id:104,brand:"Off-White",title:"Classic Hoodie",price:420,old:650,stars:4.7,reviews:89,img:"https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=600&q=80",cat:"fashion",badge:"Limited"},
      {id:105,brand:"Dyson",title:"V15 Detect",price:599,old:749,stars:4.9,reviews:178,img:"https://images.unsplash.com/photo-1558317374-067fb5f30001?auto=format&fit=crop&w=600&q=80",cat:"smart-home"},
      {id:106,brand:"Bose",title:"QC Ultra",price:379,old:429,stars:4.9,reviews:267,img:"https://images.unsplash.com/photo-1583394838336-acd977736f90?auto=format&fit=crop&w=600&q=80",cat:"audio"}
    ];

    const TESTIMONIALS = [
      {name:"Sophia Chen",text:"Absolutely love the minimalist design and fast shipping. My new favorite store.",rating:5,avatar:"https://randomuser.me/api/portraits/women/68.jpg"},
      {name:"James Walker",text:"The flash sale was insane! Grabbed the MacBook at an incredible price. Arrived in 2 days.",rating:5,avatar:"https://randomuser.me/api/portraits/men/32.jpg"},
      {name:"Elena Rodriguez",text:"Customer support helped me within minutes. Premium experience all the way.",rating:5,avatar:"https://randomuser.me/api/portraits/women/44.jpg"},
      {name:"Marcus Lee",text:"Best online store I've used. The product quality matches the photos perfectly.",rating:5,avatar:"https://randomuser.me/api/portraits/men/55.jpg"}
    ];

    let cartCount = 0;

    // Render categories
    function renderCats() {
      document.getElementById('cats').innerHTML = CATEGORIES.map(c => `
        <div class="cat" onclick="filterByCategory('${c.id}')">
          <div class="cat-icon">${c.icon}</div>
          <span>${c.name}</span>
        </div>
      `).join('');
    }

    function filterByCategory(catId) {
      document.querySelectorAll('.filter').forEach(b => b.classList.remove('active'));
      const matchBtn = document.querySelector(`.filter[data-f="${catId}"]`);
      if (matchBtn) matchBtn.classList.add('active');
      renderProducts(PRODUCTS.filter(p => p.cat === catId));
      document.getElementById('products').scrollIntoView({behavior:'smooth'});
    }

    // Render products
    function renderProducts(items) {
      const grid = document.getElementById('product-grid');
      if (!items.length) {
        grid.innerHTML = '<div class="no-results">No products found. Try a different search.</div>';
        return;
      }
      grid.innerHTML = items.map(p => `
        <div class="card">
          ${p.badge ? `<div class="card-badge">${p.badge}</div>` : ''}
          <img class="card-img" src="${p.img}" alt="${p.title}" loading="lazy">
          <div class="card-body">
            <div class="card-brand">${p.brand}</div>
            <div class="card-title">${p.title}</div>
            <div class="card-stars"><span class="s">${'★'.repeat(Math.floor(p.stars))}${'☆'.repeat(5-Math.floor(p.stars))}</span> ${p.stars} (${p.reviews})</div>
            <div class="card-foot">
              <div><span class="card-price">$${p.price.toLocaleString()}</span><span class="card-old">$${p.old.toLocaleString()}</span></div>
              <button class="add-btn" onclick="addToCart('${p.title}')" title="Add to cart">+</button>
            </div>
          </div>
        </div>
      `).join('');
    }

    // Add to cart
    function addToCart(name) {
      cartCount++;
      document.getElementById('cart-count').textContent = cartCount;
      showToast(name + ' added to cart ✓');
    }

    // Toast
    function showToast(msg) {
      const t = document.getElementById('toast');
      t.textContent = msg;
      t.classList.add('show');
      setTimeout(() => t.classList.remove('show'), 2200);
    }

    // Filter buttons
    document.getElementById('filters').addEventListener('click', e => {
      const btn = e.target.closest('.filter');
      if (!btn) return;
      document.querySelectorAll('.filter').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const f = btn.dataset.f;
      renderProducts(f === 'all' ? PRODUCTS : PRODUCTS.filter(p => p.cat === f));
    });

    // Search
    document.getElementById('search-input').addEventListener('input', e => {
      const q = e.target.value.trim().toLowerCase();
      document.querySelectorAll('.filter').forEach(b => b.classList.remove('active'));
      document.querySelector('.filter[data-f="all"]').classList.add('active');
      renderProducts(q ? PRODUCTS.filter(p =>
        p.title.toLowerCase().includes(q) ||
        p.brand.toLowerCase().includes(q) ||
        p.cat.toLowerCase().includes(q)
      ) : PRODUCTS);
    });

    // Cart icon click
    document.getElementById('cart-btn').addEventListener('click', () => {
      showToast(`You have ${cartCount} item${cartCount !== 1 ? 's' : ''} in your cart`);
    });

    // Dark mode toggle
    const themeToggle = document.getElementById('theme-toggle');
    const themeIcon = document.getElementById('theme-icon');
    themeToggle.addEventListener('click', () => {
      document.body.classList.toggle('dark');
      if (document.body.classList.contains('dark')) {
        themeIcon.innerHTML = '<circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>';
      } else {
        themeIcon.innerHTML = '<path d="M21 12.79A9 9 0 1111.21 3a7 7 0 009.79 9.79z"/>';
      }
    });

    // Newsletter
    document.getElementById('nl-form').addEventListener('submit', e => {
      e.preventDefault();
      const email = document.getElementById('nl-email').value.trim();
      const msg = document.getElementById('nl-msg');
      msg.style.color = '#c3e6cb';
      msg.textContent = '🎉 Thanks! ' + email + ' is now subscribed.';
      document.getElementById('nl-email').value = '';
      setTimeout(() => msg.textContent = '', 3500);
    });

    // Countdown timer
    function startCountdown() {
      const end = new Date();
      end.setDate(end.getDate() + 2);
      end.setHours(end.getHours() + 5);
      function tick() {
        const diff = end - new Date();
        if (diff <= 0) return;
        const pad = n => n < 10 ? '0' + n : '' + n;
        document.getElementById('t-d').textContent = pad(Math.floor(diff / 86400000));
        document.getElementById('t-h').textContent = pad(Math.floor(diff / 3600000) % 24);
        document.getElementById('t-m').textContent = pad(Math.floor(diff / 60000) % 60);
        document.getElementById('t-s').textContent = pad(Math.floor(diff / 1000) % 60);
      }
      tick();
      setInterval(tick, 1000);
    }

    // Render testimonials
    function renderTestimonials() {
      document.getElementById('testi-row').innerHTML = TESTIMONIALS.map(t => `
        <div class="testi-card">
          <div class="testi-top">
            <img class="testi-avatar" src="${t.avatar}" alt="${t.name}">
            <div>
              <div class="testi-name">${t.name}</div>
              <div class="testi-stars">${'★'.repeat(t.rating)}</div>
            </div>
          </div>
          <div class="testi-text">"${t.text}"</div>
        </div>
      `).join('');
    }

    // Init
    renderCats();
    renderProducts(PRODUCTS);
    renderTestimonials();
    startCountdown();
  </script>
</body>
</html>
