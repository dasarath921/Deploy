<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />
  <title>NovaMart — Premium E-Commerce UI</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #f4f7fb;
      --bg-soft: #eef3f9;
      --surface: rgba(255,255,255,0.72);
      --surface-strong: #ffffff;
      --text: #0f172a;
      --muted: #5b667a;
      --line: rgba(148,163,184,0.22);
      --primary: #4f46e5;
      --primary-2: #7c3aed;
      --accent: #06b6d4;
      --success: #10b981;
      --warning: #f59e0b;
      --danger: #ef4444;
      --shadow-lg: 0 30px 70px rgba(15, 23, 42, 0.10);
      --shadow-md: 0 18px 40px rgba(15, 23, 42, 0.08);
      --shadow-sm: 0 10px 20px rgba(15, 23, 42, 0.06);
      --radius-xl: 32px;
      --radius-lg: 24px;
      --radius-md: 18px;
      --radius-sm: 14px;
      --pill: 999px;
      --grad-main: linear-gradient(135deg, #0f172a 0%, #1d4ed8 42%, #7c3aed 100%);
      --grad-soft: linear-gradient(135deg, rgba(79,70,229,0.16), rgba(6,182,212,0.12));
      --card-blur: blur(16px);
      --transition: 0.28s cubic-bezier(.2,.8,.2,1);
    }

    body.dark {
      --bg: #07111f;
      --bg-soft: #0b1728;
      --surface: rgba(15, 23, 42, 0.72);
      --surface-strong: #0f172a;
      --text: #f8fafc;
      --muted: #a8b4c8;
      --line: rgba(148,163,184,0.14);
      --shadow-lg: 0 32px 70px rgba(0, 0, 0, 0.38);
      --shadow-md: 0 18px 40px rgba(0, 0, 0, 0.28);
      --shadow-sm: 0 10px 20px rgba(0, 0, 0, 0.20);
      --grad-main: linear-gradient(135deg, #020617 0%, #172554 45%, #581c87 100%);
      --grad-soft: linear-gradient(135deg, rgba(79,70,229,0.22), rgba(6,182,212,0.18));
    }

    html { scroll-behavior: smooth; }
    body {
      font-family: 'Plus Jakarta Sans', sans-serif;
      color: var(--text);
      background:
        radial-gradient(circle at top left, rgba(99,102,241,0.14), transparent 30%),
        radial-gradient(circle at top right, rgba(6,182,212,0.12), transparent 22%),
        linear-gradient(180deg, var(--bg) 0%, var(--bg-soft) 100%);
      transition: background var(--transition), color var(--transition);
    }

    img { display: block; max-width: 100%; }
    button, input { font: inherit; }
    a { text-decoration: none; color: inherit; }

    .container {
      width: min(1280px, calc(100% - 32px));
      margin: 0 auto;
    }

    .topbar {
      position: sticky;
      top: 0;
      z-index: 1000;
      backdrop-filter: blur(18px);
      -webkit-backdrop-filter: blur(18px);
      background: color-mix(in srgb, var(--bg) 76%, transparent);
      border-bottom: 1px solid var(--line);
    }

    .nav {
      min-height: 84px;
      display: grid;
      grid-template-columns: auto 1fr auto;
      align-items: center;
      gap: 22px;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 12px;
      font-size: 1.5rem;
      font-weight: 800;
      letter-spacing: -0.03em;
    }

    .brand-mark {
      width: 42px;
      height: 42px;
      border-radius: 14px;
      display: grid;
      place-items: center;
      color: white;
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      box-shadow: 0 10px 24px rgba(99,102,241,0.35);
    }

    .brand-text {
      background: linear-gradient(135deg, var(--text), var(--primary));
      -webkit-background-clip: text;
      color: transparent;
    }

    .nav-center {
      display: flex;
      align-items: center;
      gap: 18px;
      justify-content: space-between;
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 8px;
      padding: 6px;
      background: var(--surface);
      border: 1px solid var(--line);
      border-radius: var(--pill);
      box-shadow: var(--shadow-sm);
      backdrop-filter: var(--card-blur);
    }

    .nav-link {
      padding: 12px 18px;
      border-radius: var(--pill);
      font-weight: 700;
      color: var(--muted);
      transition: var(--transition);
    }

    .nav-link.active,
    .nav-link:hover {
      color: white;
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      box-shadow: 0 12px 24px rgba(79,70,229,0.22);
    }

    .search-wrap {
      flex: 1;
      max-width: 420px;
      position: relative;
    }

    .search-box {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 14px 16px 14px 18px;
      border-radius: var(--pill);
      background: var(--surface);
      border: 1px solid var(--line);
      backdrop-filter: var(--card-blur);
      box-shadow: var(--shadow-sm);
      transition: var(--transition);
    }

    .search-box:focus-within {
      border-color: rgba(99,102,241,0.45);
      box-shadow: 0 0 0 4px rgba(99,102,241,0.10), var(--shadow-sm);
      transform: translateY(-1px);
    }

    .search-box i { color: var(--muted); }
    .search-box input {
      width: 100%;
      border: 0;
      outline: 0;
      background: transparent;
      color: var(--text);
    }

    .nav-actions {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .icon-btn {
      width: 46px;
      height: 46px;
      border-radius: 16px;
      border: 1px solid var(--line);
      background: var(--surface);
      color: var(--text);
      display: grid;
      place-items: center;
      box-shadow: var(--shadow-sm);
      backdrop-filter: var(--card-blur);
      transition: var(--transition);
      position: relative;
    }

    .icon-btn:hover {
      transform: translateY(-2px);
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      color: white;
      border-color: transparent;
    }

    .badge-count {
      position: absolute;
      top: -6px;
      right: -6px;
      width: 22px;
      height: 22px;
      border-radius: 50%;
      display: grid;
      place-items: center;
      background: linear-gradient(135deg, #ef4444, #f97316);
      color: #fff;
      font-size: 11px;
      font-weight: 800;
      border: 2px solid var(--surface-strong);
    }

    .hero {
      padding: 28px 0 0;
    }

    .hero-shell {
      position: relative;
      overflow: hidden;
      min-height: 640px;
      border-radius: 40px;
      background: var(--grad-main);
      box-shadow: var(--shadow-lg);
      isolation: isolate;
    }

    .hero-shell::before,
    .hero-shell::after {
      content: "";
      position: absolute;
      border-radius: 50%;
      filter: blur(16px);
      opacity: 0.7;
      z-index: -1;
    }

    .hero-shell::before {
      width: 360px;
      height: 360px;
      top: -120px;
      left: -60px;
      background: rgba(6,182,212,0.22);
    }

    .hero-shell::after {
      width: 420px;
      height: 420px;
      right: -120px;
      bottom: -160px;
      background: rgba(124,58,237,0.24);
    }

    .hero-grid {
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 32px;
      align-items: center;
      padding: 70px 56px 56px;
    }

    .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      padding: 10px 16px;
      border-radius: var(--pill);
      background: rgba(255,255,255,0.12);
      border: 1px solid rgba(255,255,255,0.18);
      color: #e2e8f0;
      font-weight: 700;
      margin-bottom: 20px;
      backdrop-filter: blur(10px);
    }

    .hero-copy h1 {
      font-size: clamp(2.8rem, 5vw, 4.9rem);
      line-height: 0.95;
      letter-spacing: -0.05em;
      color: white;
      margin-bottom: 20px;
      max-width: 11ch;
    }

    .hero-copy h1 span {
      color: #7dd3fc;
    }

    .hero-copy p {
      font-size: 1.08rem;
      line-height: 1.8;
      color: rgba(255,255,255,0.82);
      max-width: 58ch;
      margin-bottom: 30px;
    }

    .hero-cta {
      display: flex;
      flex-wrap: wrap;
      gap: 14px;
      margin-bottom: 28px;
    }

    .btn {
      border: 0;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      font-weight: 800;
      letter-spacing: -0.01em;
    }

    .btn-primary {
      padding: 15px 24px;
      border-radius: var(--pill);
      color: white;
      background: linear-gradient(135deg, #06b6d4, #3b82f6 45%, #7c3aed);
      box-shadow: 0 16px 35px rgba(59,130,246,0.35);
    }

    .btn-primary:hover {
      transform: translateY(-2px) scale(1.01);
      box-shadow: 0 20px 40px rgba(59,130,246,0.45);
    }

    .btn-secondary {
      padding: 15px 22px;
      border-radius: var(--pill);
      color: white;
      background: rgba(255,255,255,0.10);
      border: 1px solid rgba(255,255,255,0.18);
      backdrop-filter: blur(10px);
    }

    .btn-secondary:hover {
      transform: translateY(-2px);
      background: rgba(255,255,255,0.16);
    }

    .hero-stats {
      display: flex;
      flex-wrap: wrap;
      gap: 14px;
    }

    .stat-chip {
      min-width: 150px;
      padding: 16px 18px;
      border-radius: 22px;
      background: rgba(255,255,255,0.10);
      border: 1px solid rgba(255,255,255,0.16);
      color: white;
      backdrop-filter: blur(12px);
    }

    .stat-chip strong {
      display: block;
      font-size: 1.25rem;
      margin-bottom: 4px;
    }

    .hero-visual {
      position: relative;
      min-height: 510px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .hero-main-card {
      width: min(420px, 100%);
      background: rgba(255,255,255,0.10);
      border: 1px solid rgba(255,255,255,0.15);
      border-radius: 30px;
      padding: 20px;
      box-shadow: 0 24px 50px rgba(0,0,0,0.20);
      backdrop-filter: blur(16px);
      transform: rotate(-4deg);
    }

    .hero-main-card img {
      width: 100%;
      height: 360px;
      object-fit: cover;
      border-radius: 22px;
      margin-bottom: 18px;
    }

    .hero-card-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
      color: white;
    }

    .hero-card-row h3 {
      font-size: 1.3rem;
      margin-bottom: 6px;
    }

    .hero-float,
    .hero-float-2 {
      position: absolute;
      background: rgba(255,255,255,0.12);
      color: white;
      border: 1px solid rgba(255,255,255,0.16);
      border-radius: 22px;
      padding: 16px 18px;
      box-shadow: 0 16px 30px rgba(0,0,0,0.16);
      backdrop-filter: blur(12px);
    }

    .hero-float {
      left: 0;
      bottom: 40px;
    }

    .hero-float-2 {
      right: 10px;
      top: 52px;
    }

    .hero-float .mini,
    .hero-float-2 .mini {
      font-size: 0.82rem;
      color: rgba(255,255,255,0.80);
    }

    .section {
      padding: 74px 0 0;
    }

    .section-head {
      display: flex;
      align-items: end;
      justify-content: space-between;
      gap: 20px;
      margin-bottom: 28px;
    }

    .section-copy h2 {
      font-size: clamp(1.9rem, 3vw, 2.6rem);
      letter-spacing: -0.04em;
      margin-bottom: 8px;
    }

    .section-copy p {
      color: var(--muted);
      max-width: 60ch;
    }

    .filter-pills {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }

    .pill {
      padding: 10px 16px;
      border-radius: var(--pill);
      border: 1px solid var(--line);
      background: var(--surface);
      color: var(--muted);
      font-weight: 700;
      box-shadow: var(--shadow-sm);
      backdrop-filter: var(--card-blur);
      transition: var(--transition);
    }

    .pill:hover,
    .pill.active {
      color: white;
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      border-color: transparent;
    }

    .category-grid {
      display: grid;
      grid-template-columns: repeat(6, minmax(0, 1fr));
      gap: 18px;
    }

    .category-card {
      padding: 22px 18px;
      border-radius: 26px;
      border: 1px solid var(--line);
      background: var(--surface);
      box-shadow: var(--shadow-sm);
      backdrop-filter: var(--card-blur);
      transition: var(--transition);
      cursor: pointer;
      position: relative;
      overflow: hidden;
    }

    .category-card::before {
      content: "";
      position: absolute;
      inset: auto -40% -40% auto;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: rgba(99,102,241,0.10);
      transition: var(--transition);
    }

    .category-card:hover {
      transform: translateY(-6px);
      box-shadow: var(--shadow-md);
      border-color: rgba(99,102,241,0.35);
    }

    .category-card:hover::before { transform: scale(1.4); }

    .category-icon {
      width: 56px;
      height: 56px;
      border-radius: 18px;
      display: grid;
      place-items: center;
      margin-bottom: 16px;
      color: white;
      font-size: 1.3rem;
      background: linear-gradient(135deg, var(--primary), var(--accent));
      box-shadow: 0 16px 28px rgba(79,70,229,0.22);
    }

    .category-card h4 {
      font-size: 1rem;
      margin-bottom: 8px;
      letter-spacing: -0.02em;
    }

    .category-card p {
      color: var(--muted);
      font-size: 0.92rem;
    }

    .products-shell {
      display: grid;
      grid-template-columns: 280px 1fr;
      gap: 24px;
      align-items: start;
    }

    .sidebar-card,
    .promo-card {
      border-radius: 30px;
      border: 1px solid var(--line);
      background: var(--surface);
      box-shadow: var(--shadow-md);
      backdrop-filter: var(--card-blur);
    }

    .sidebar-card {
      padding: 22px;
      position: sticky;
      top: 108px;
    }

    .side-title {
      font-size: 1.05rem;
      font-weight: 800;
      margin-bottom: 16px;
      letter-spacing: -0.02em;
    }

    .sort-row {
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin-bottom: 18px;
    }

    .sort-btn {
      text-align: left;
      padding: 14px 16px;
      border-radius: 16px;
      border: 1px solid var(--line);
      background: var(--surface-strong);
      color: var(--muted);
      font-weight: 700;
      transition: var(--transition);
    }

    .sort-btn:hover,
    .sort-btn.active {
      background: var(--grad-soft);
      color: var(--text);
      border-color: rgba(99,102,241,0.35);
      transform: translateX(2px);
    }

    .side-offer {
      margin-top: 20px;
      padding: 20px;
      border-radius: 24px;
      background: linear-gradient(135deg, rgba(79,70,229,0.16), rgba(6,182,212,0.16));
      border: 1px solid rgba(99,102,241,0.18);
    }

    .side-offer h4 {
      font-size: 1.05rem;
      margin-bottom: 8px;
    }

    .side-offer p {
      color: var(--muted);
      line-height: 1.6;
      margin-bottom: 12px;
      font-size: 0.94rem;
    }

    .product-grid {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 22px;
    }

    .product-card {
      position: relative;
      overflow: hidden;
      border-radius: 28px;
      border: 1px solid var(--line);
      background: var(--surface);
      box-shadow: var(--shadow-md);
      backdrop-filter: var(--card-blur);
      transition: var(--transition);
    }

    .product-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 28px 50px rgba(15, 23, 42, 0.14);
    }

    .product-media {
      position: relative;
      height: 270px;
      overflow: hidden;
    }

    .product-media img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s ease;
    }

    .product-card:hover .product-media img { transform: scale(1.06); }

    .tag-row {
      position: absolute;
      inset: 14px 14px auto 14px;
      display: flex;
      justify-content: space-between;
      align-items: start;
      gap: 10px;
      z-index: 2;
    }

    .tag,
    .wish-btn {
      backdrop-filter: blur(10px);
      background: rgba(255,255,255,0.76);
      border: 1px solid rgba(255,255,255,0.65);
      box-shadow: var(--shadow-sm);
    }

    body.dark .tag,
    body.dark .wish-btn {
      background: rgba(15,23,42,0.65);
      border-color: rgba(255,255,255,0.08);
    }

    .tag {
      padding: 8px 12px;
      border-radius: var(--pill);
      font-size: 0.78rem;
      font-weight: 800;
      color: var(--text);
    }

    .wish-btn {
      width: 40px;
      height: 40px;
      border-radius: 14px;
      display: grid;
      place-items: center;
      color: var(--text);
      transition: var(--transition);
    }

    .wish-btn:hover {
      background: linear-gradient(135deg, #fb7185, #ef4444);
      color: white;
      border-color: transparent;
    }

    .product-info {
      padding: 18px;
    }

    .product-meta {
      display: flex;
      justify-content: space-between;
      align-items: start;
      gap: 12px;
      margin-bottom: 10px;
    }

    .product-title {
      font-weight: 800;
      font-size: 1.08rem;
      letter-spacing: -0.02em;
      margin-bottom: 6px;
    }

    .subtext {
      font-size: 0.92rem;
      color: var(--muted);
    }

    .rating {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 8px 12px;
      border-radius: var(--pill);
      background: color-mix(in srgb, var(--warning) 12%, transparent);
      font-size: 0.84rem;
      font-weight: 800;
      color: var(--text);
      white-space: nowrap;
    }

    .price-row {
      display: flex;
      align-items: baseline;
      gap: 10px;
      margin: 14px 0 16px;
    }

    .price {
      font-size: 1.45rem;
      font-weight: 800;
      letter-spacing: -0.03em;
      color: var(--primary);
    }

    .old-price {
      color: var(--muted);
      text-decoration: line-through;
      font-weight: 700;
    }

    .product-actions {
      display: flex;
      gap: 10px;
    }

    .cart-btn,
    .ghost-btn {
      border-radius: 16px;
      height: 48px;
      transition: var(--transition);
      font-weight: 800;
    }

    .cart-btn {
      flex: 1;
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      color: #fff;
      box-shadow: 0 16px 28px rgba(79,70,229,0.22);
    }

    .cart-btn:hover { transform: translateY(-2px); }

    .ghost-btn {
      width: 52px;
      border: 1px solid var(--line);
      background: var(--surface-strong);
      color: var(--text);
    }

    .ghost-btn:hover {
      background: var(--bg-soft);
      transform: translateY(-2px);
    }

    .deal-banner {
      margin-top: 32px;
      padding: 34px;
      border-radius: 34px;
      background: linear-gradient(135deg, rgba(79,70,229,0.10), rgba(6,182,212,0.10));
      border: 1px solid var(--line);
      box-shadow: var(--shadow-md);
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 26px;
      align-items: center;
      overflow: hidden;
      position: relative;
    }

    .deal-banner::after {
      content: "";
      position: absolute;
      inset: auto -80px -80px auto;
      width: 220px;
      height: 220px;
      border-radius: 50%;
      background: rgba(99,102,241,0.12);
      filter: blur(8px);
    }

    .deal-copy h3 {
      font-size: clamp(1.8rem, 3vw, 2.7rem);
      letter-spacing: -0.04em;
      margin-bottom: 12px;
    }

    .deal-copy p {
      color: var(--muted);
      line-height: 1.7;
      margin-bottom: 18px;
      max-width: 52ch;
    }

    .timer {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
      margin-bottom: 18px;
    }

    .time-box {
      min-width: 84px;
      padding: 16px 14px;
      border-radius: 20px;
      background: var(--surface-strong);
      border: 1px solid var(--line);
      box-shadow: var(--shadow-sm);
      text-align: center;
    }

    .time-box strong {
      display: block;
      font-size: 1.6rem;
      color: var(--primary);
      letter-spacing: -0.04em;
      margin-bottom: 4px;
    }

    .deal-visual {
      position: relative;
      min-height: 320px;
      display: grid;
      place-items: center;
    }

    .deal-image {
      width: 100%;
      max-width: 420px;
      border-radius: 30px;
      box-shadow: var(--shadow-lg);
      transform: rotate(3deg);
    }

    .deal-badge {
      position: absolute;
      top: 20px;
      left: 10px;
      padding: 10px 14px;
      border-radius: var(--pill);
      color: white;
      font-weight: 800;
      background: linear-gradient(135deg, #ef4444, #f97316);
      box-shadow: 0 16px 28px rgba(239,68,68,0.22);
    }

    .testimonials-grid {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 22px;
    }

    .testimonial-card {
      padding: 24px;
      border-radius: 28px;
      border: 1px solid var(--line);
      background: var(--surface);
      box-shadow: var(--shadow-md);
      backdrop-filter: var(--card-blur);
      transition: var(--transition);
    }

    .testimonial-card:hover {
      transform: translateY(-6px);
    }

    .testi-head {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-bottom: 18px;
    }

    .testi-head img {
      width: 56px;
      height: 56px;
      border-radius: 18px;
      object-fit: cover;
    }

    .stars {
      color: #fbbf24;
      margin-top: 4px;
      font-size: 0.92rem;
    }

    .testimonial-card p {
      color: var(--muted);
      line-height: 1.75;
    }

    .newsletter {
      margin-top: 32px;
      overflow: hidden;
      position: relative;
      border-radius: 36px;
      padding: 42px;
      color: white;
      background: linear-gradient(135deg, #4f46e5, #0ea5e9 55%, #7c3aed);
      box-shadow: var(--shadow-lg);
    }

    .newsletter::before,
    .newsletter::after {
      content: "";
      position: absolute;
      border-radius: 50%;
      background: rgba(255,255,255,0.12);
      filter: blur(10px);
    }

    .newsletter::before {
      width: 180px;
      height: 180px;
      top: -40px;
      right: -40px;
    }

    .newsletter::after {
      width: 130px;
      height: 130px;
      left: -20px;
      bottom: -30px;
    }

    .newsletter-grid {
      position: relative;
      z-index: 1;
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 20px;
      align-items: center;
    }

    .newsletter h3 {
      font-size: clamp(1.8rem, 2.6vw, 2.6rem);
      letter-spacing: -0.04em;
      margin-bottom: 10px;
    }

    .newsletter p {
      max-width: 58ch;
      color: rgba(255,255,255,0.84);
      line-height: 1.7;
    }

    .newsletter-form {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
      justify-content: flex-end;
    }

    .newsletter-form .input-wrap {
      display: flex;
      align-items: center;
      gap: 12px;
      min-width: 320px;
      padding: 14px 18px;
      border-radius: var(--pill);
      background: rgba(255,255,255,0.14);
      border: 1px solid rgba(255,255,255,0.18);
      backdrop-filter: blur(10px);
    }

    .newsletter-form input {
      border: 0;
      outline: 0;
      background: transparent;
      color: white;
      width: 100%;
    }

    .newsletter-form input::placeholder { color: rgba(255,255,255,0.72); }

    .newsletter-msg {
      margin-top: 14px;
      color: rgba(255,255,255,0.92);
      min-height: 22px;
      font-weight: 700;
    }

    footer {
      padding: 54px 0 34px;
    }

    .footer-wrap {
      display: grid;
      grid-template-columns: 1.1fr repeat(3, 0.6fr);
      gap: 26px;
      padding: 30px;
      border-radius: 34px;
      border: 1px solid var(--line);
      background: var(--surface);
      box-shadow: var(--shadow-md);
      backdrop-filter: var(--card-blur);
    }

    .footer-brand p,
    .footer-col a,
    .footer-col p {
      color: var(--muted);
      line-height: 2;
    }

    .footer-col h4 {
      margin-bottom: 10px;
      letter-spacing: -0.02em;
    }

    .copyright {
      text-align: center;
      color: var(--muted);
      margin-top: 18px;
      font-size: 0.95rem;
    }

    .toast {
      position: fixed;
      left: 50%;
      bottom: 26px;
      transform: translateX(-50%) translateY(20px);
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      color: white;
      padding: 14px 20px;
      border-radius: var(--pill);
      box-shadow: 0 18px 36px rgba(79,70,229,0.32);
      font-weight: 800;
      opacity: 0;
      pointer-events: none;
      transition: 0.3s ease;
      z-index: 1200;
    }

    .toast.show {
      opacity: 1;
      transform: translateX(-50%) translateY(0);
    }

    @media (max-width: 1180px) {
      .hero-grid,
      .deal-banner,
      .newsletter-grid,
      .products-shell,
      .footer-wrap {
        grid-template-columns: 1fr;
      }

      .product-grid,
      .testimonials-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }

      .category-grid {
        grid-template-columns: repeat(3, minmax(0, 1fr));
      }

      .sidebar-card { position: static; }
      .newsletter-form { justify-content: flex-start; }
    }

    @media (max-width: 900px) {
      .nav {
        grid-template-columns: 1fr;
        gap: 14px;
        padding: 14px 0;
      }

      .nav-center {
        flex-direction: column;
        align-items: stretch;
      }

      .hero-grid {
        padding: 44px 24px 26px;
      }

      .hero-copy h1 { max-width: none; }
      .hero-visual { min-height: 440px; }
      .nav-links { overflow-x: auto; }
    }

    @media (max-width: 680px) {
      .container { width: min(100% - 22px, 1280px); }
      .category-grid,
      .product-grid,
      .testimonials-grid {
        grid-template-columns: 1fr;
      }

      .hero-shell { min-height: auto; border-radius: 28px; }
      .hero-main-card { transform: none; }
      .hero-float, .hero-float-2 {
        position: static;
        margin-top: 14px;
      }

      .hero-visual {
        display: flex;
        flex-direction: column;
        align-items: stretch;
      }

      .section { padding-top: 56px; }
      .section-head { flex-direction: column; align-items: start; }
      .newsletter,
      .deal-banner,
      .footer-wrap,
      .sidebar-card { padding: 22px; }
      .newsletter-form .input-wrap { min-width: 100%; }
      .nav-actions { justify-content: space-between; }
      .search-wrap { max-width: none; }
    }
  </style>
</head>
<body>
  <header class="topbar">
    <div class="container nav">
      <a href="#" class="brand">
        <span class="brand-mark"><i class="fa-solid fa-bolt"></i></span>
        <span class="brand-text">NovaMart</span>
      </a>

      <div class="nav-center">
        <nav class="nav-links">
          <a href="#home" class="nav-link active">Home</a>
          <a href="#categories" class="nav-link">Categories</a>
          <a href="#products" class="nav-link">Trending</a>
          <a href="#deals" class="nav-link">Deals</a>
          <a href="#reviews" class="nav-link">Reviews</a>
        </nav>

        <div class="search-wrap">
          <div class="search-box">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" id="globalSearch" placeholder="Search premium tech, fashion, accessories..." />
          </div>
        </div>
      </div>

      <div class="nav-actions">
        <button class="icon-btn" id="themeToggle" aria-label="Toggle theme"><i class="fa-solid fa-moon"></i></button>
        <button class="icon-btn" aria-label="Favorites"><i class="fa-regular fa-heart"></i></button>
        <button class="icon-btn" id="cartIconBtn" aria-label="Cart">
          <i class="fa-solid fa-bag-shopping"></i>
          <span class="badge-count" id="cartCountDisplay">0</span>
        </button>
      </div>
    </div>
  </header>

  <main id="home">
    <section class="hero">
      <div class="container">
        <div class="hero-shell">
          <div class="hero-grid">
            <div class="hero-copy">
              <div class="eyebrow"><i class="fa-solid fa-sparkles"></i> Curated luxury drops • New season collection</div>
              <h1>Shop the <span>future</span> of modern lifestyle.</h1>
              <p>
                Premium gadgets, statement fashion, and everyday essentials designed with a bold visual identity.
                Experience a richer storefront with better discovery, cleaner navigation, and standout product storytelling.
              </p>
              <div class="hero-cta">
                <button class="btn btn-primary" id="shopNowHero">Shop Collection <i class="fa-solid fa-arrow-right"></i></button>
                <button class="btn btn-secondary" id="exploreDealsHero">Explore Deals</button>
              </div>
              <div class="hero-stats">
                <div class="stat-chip"><strong>12K+</strong><span>happy customers</span></div>
                <div class="stat-chip"><strong>4.9/5</strong><span>average rating</span></div>
                <div class="stat-chip"><strong>48h</strong><span>express delivery</span></div>
              </div>
            </div>

            <div class="hero-visual">
              <div class="hero-main-card">
                <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=900&q=80" alt="Premium sneakers">
                <div class="hero-card-row">
                  <div>
                    <p style="opacity:.8; margin-bottom:4px;">Spotlight product</p>
                    <h3>Nova Air Pulse</h3>
                    <span style="opacity:.85;">Engineered comfort • Limited release</span>
                  </div>
                  <div style="text-align:right;">
                    <strong style="font-size:1.4rem;">$279</strong>
                    <div style="opacity:.8;">launch offer</div>
                  </div>
                </div>
              </div>
              <div class="hero-float">
                <strong>Free shipping</strong>
                <div class="mini">On all orders above $150</div>
              </div>
              <div class="hero-float-2">
                <strong>New member perk</strong>
                <div class="mini">Extra 10% on first purchase</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="categories">
      <div class="container">
        <div class="section-head">
          <div class="section-copy">
            <h2>Curated categories</h2>
            <p>Every collection is arranged for faster exploration and stronger visual focus.</p>
          </div>
          <div class="filter-pills" id="categoryPills"></div>
        </div>
        <div class="category-grid" id="categoryGrid"></div>
      </div>
    </section>

    <section class="section" id="products">
      <div class="container">
        <div class="section-head">
          <div class="section-copy">
            <h2>Trending products</h2>
            <p>Upgraded product cards with better imagery, compact metadata, and clearer call-to-action buttons.</p>
          </div>
        </div>

        <div class="products-shell">
          <aside class="sidebar-card">
            <div class="side-title">Quick filters</div>
            <div class="sort-row" id="sortControls">
              <button class="sort-btn active" data-sort="all">All products</button>
              <button class="sort-btn" data-sort="price-low">Price: Low to High</button>
              <button class="sort-btn" data-sort="price-high">Price: High to Low</button>
              <button class="sort-btn" data-sort="top-rated">Top rated</button>
            </div>
            <div class="side-offer">
              <h4>Members Week</h4>
              <p>Use code <strong>NOVA10</strong> for an extra discount on trending collections and premium bundles.</p>
              <button class="btn btn-primary" style="width:100%; height:48px;">Unlock offer</button>
            </div>
          </aside>

          <div>
            <div class="product-grid" id="productGrid"></div>
          </div>
        </div>

        <div class="deal-banner" id="deals">
          <div class="deal-copy">
            <h3>Flash deal on MacBook Pro M3</h3>
            <p>
              A cleaner promotional block with bold typography, stronger countdown cards, and higher image contrast for better conversion focus.
            </p>
            <div class="timer">
              <div class="time-box"><strong id="days">00</strong><span>Days</span></div>
              <div class="time-box"><strong id="hours">00</strong><span>Hours</span></div>
              <div class="time-box"><strong id="minutes">00</strong><span>Mins</span></div>
              <div class="time-box"><strong id="seconds">00</strong><span>Secs</span></div>
            </div>
            <div class="price-row" style="margin-bottom:22px;">
              <span class="price">$1,299</span>
              <span class="old-price">$1,699</span>
            </div>
            <button class="btn btn-primary" id="flashDealBtn">Grab Deal Now <i class="fa-solid fa-bolt"></i></button>
          </div>
          <div class="deal-visual">
            <span class="deal-badge">20% OFF</span>
            <img class="deal-image" src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="MacBook Pro">
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="reviews">
      <div class="container">
        <div class="section-head">
          <div class="section-copy">
            <h2>What customers are saying</h2>
            <p>A more premium testimonial layout makes reviews easier to scan and visually more trustworthy.</p>
          </div>
        </div>
        <div class="testimonials-grid" id="testimonialList"></div>

        <div class="newsletter">
          <div class="newsletter-grid">
            <div>
              <h3>Join the NovaMart inner circle</h3>
              <p>Get early access to limited drops, weekly curated edits, members-only bundles, and launch-day promotions.</p>
              <div class="newsletter-msg" id="newsletterMsgModern"></div>
            </div>
            <form id="newsletterFormModern" class="newsletter-form">
              <div class="input-wrap">
                <i class="fa-regular fa-envelope"></i>
                <input type="email" id="newsEmail" placeholder="Enter your email address" required>
              </div>
              <button type="submit" class="btn btn-primary">Subscribe Now</button>
            </form>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container">
      <div class="footer-wrap">
        <div class="footer-brand">
          <div class="brand" style="margin-bottom:12px;">
            <span class="brand-mark"><i class="fa-solid fa-bolt"></i></span>
            <span class="brand-text">NovaMart</span>
          </div>
          <p>Next-generation commerce with premium visuals, elevated interactions, and modern shopping flows.</p>
        </div>
        <div class="footer-col">
          <h4>Shop</h4>
          <p>New arrivals</p>
          <p>Best sellers</p>
          <p>Gift cards</p>
        </div>
        <div class="footer-col">
          <h4>Company</h4>
          <p>About</p>
          <p>Careers</p>
          <p>Sustainability</p>
        </div>
        <div class="footer-col">
          <h4>Support</h4>
          <p>Help center</p>
          <p>Returns</p>
          <p>Contact</p>
        </div>
      </div>
      <div class="copyright">© 2026 NovaMart — Premium storefront redesign</div>
    </div>
  </footer>

  <div class="toast" id="toast"></div>

  <script>
    const CATEGORIES = [
      { id: 'all', name: 'All', icon: 'fa-layer-group', desc: 'Browse everything' },
      { id: 'audio', name: 'Audio & Hi-Fi', icon: 'fa-headphones', desc: 'Studio-grade sound' },
      { id: 'wearables', name: 'Wearables', icon: 'fa-clock', desc: 'Smart daily essentials' },
      { id: 'gaming', name: 'Gaming Gear', icon: 'fa-gamepad', desc: 'Performance first' },
      { id: 'fashion', name: 'Streetwear', icon: 'fa-shirt', desc: 'Bold visual identity' },
      { id: 'accessories', name: 'Luxury Acc.', icon: 'fa-gem', desc: 'Refined finishing touch' },
      { id: 'smart-home', name: 'Smart Home', icon: 'fa-house-signal', desc: 'Smarter living spaces' }
    ];

    const PRODUCTS = [
      { id: 101, title: 'Sony WH-1000XM6', price: 399, oldPrice: 499, rating: 5.0, reviews: 324, img: 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=900&q=80', category: 'audio', badge: 'Best Seller', meta: 'Immersive wireless audio' },
      { id: 102, title: 'Apple Watch Ultra 2', price: 749, oldPrice: 799, rating: 5.0, reviews: 512, img: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=900&q=80', category: 'wearables', badge: 'New', meta: 'Adventure-ready smartwatch' },
      { id: 103, title: 'Razer Blade 16', price: 2799, oldPrice: 3199, rating: 4.8, reviews: 210, img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=900&q=80', category: 'gaming', badge: 'Pro', meta: 'Desktop-class gaming power' },
      { id: 104, title: 'Off-White Hoodie', price: 420, oldPrice: 650, rating: 4.7, reviews: 89, img: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=900&q=80', category: 'fashion', badge: 'Limited', meta: 'Iconic streetwear silhouette' },
      { id: 105, title: 'Dyson V15 Detect', price: 599, oldPrice: 749, rating: 4.9, reviews: 178, img: 'https://images.unsplash.com/photo-1558317374-067fb5f30001?auto=format&fit=crop&w=900&q=80', category: 'smart-home', badge: 'Hot', meta: 'Intelligent deep cleaning' },
      { id: 106, title: 'Bose QC Ultra', price: 379, oldPrice: 429, rating: 4.9, reviews: 267, img: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=80', category: 'audio', badge: 'Editor\'s Pick', meta: 'Quiet luxury listening' }
    ];

    const testimonialsData = [
      { name: 'Sophia Chen', text: 'This redesign feels premium and polished. Product discovery is faster, and the overall shopping flow feels far more luxurious.', rating: 5, avatar: 'https://randomuser.me/api/portraits/women/68.jpg' },
      { name: 'James Walker', text: 'The upgraded cards, cleaner spacing, and bold hero section make the experience feel like a real modern brand.', rating: 5, avatar: 'https://randomuser.me/api/portraits/men/32.jpg' },
      { name: 'Elena Rodriguez', text: 'Love the new visual hierarchy. The deals section and newsletter block look much stronger than before.', rating: 5, avatar: 'https://randomuser.me/api/portraits/women/44.jpg' }
    ];

    let cartCount = 0;
    let currentCategory = 'all';
    let currentSort = 'all';

    const categoryGrid = document.getElementById('categoryGrid');
    const productGrid = document.getElementById('productGrid');
    const categoryPills = document.getElementById('categoryPills');
    const cartCountSpan = document.getElementById('cartCountDisplay');
    const searchInput = document.getElementById('globalSearch');
    const toast = document.getElementById('toast');
    const newsletterForm = document.getElementById('newsletterFormModern');
    const newsletterMsg = document.getElementById('newsletterMsgModern');

    function showToast(message) {
      toast.textContent = message;
      toast.classList.add('show');
      clearTimeout(showToast.timer);
      showToast.timer = setTimeout(() => toast.classList.remove('show'), 2200);
    }

    function renderCategoryPills() {
      categoryPills.innerHTML = CATEGORIES.map(cat => `
        <button class="pill ${cat.id === currentCategory ? 'active' : ''}" data-category="${cat.id}">${cat.name}</button>
      `).join('');

      categoryPills.querySelectorAll('.pill').forEach(btn => {
        btn.addEventListener('click', () => {
          currentCategory = btn.dataset.category;
          searchInput.value = '';
          renderCategoryPills();
          renderProducts();
        });
      });
    }

    function renderCategories() {
      categoryGrid.innerHTML = CATEGORIES.filter(c => c.id !== 'all').map(cat => `
        <article class="category-card" data-category="${cat.id}">
          <div class="category-icon"><i class="fa-solid ${cat.icon}"></i></div>
          <h4>${cat.name}</h4>
          <p>${cat.desc}</p>
        </article>
      `).join('');

      categoryGrid.querySelectorAll('.category-card').forEach(card => {
        card.addEventListener('click', () => {
          currentCategory = card.dataset.category;
          renderCategoryPills();
          renderProducts();
          document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
        });
      });
    }

    function getFilteredProducts() {
      const query = searchInput.value.trim().toLowerCase();
      let items = [...PRODUCTS];

      if (currentCategory !== 'all') {
        items = items.filter(item => item.category === currentCategory);
      }

      if (query) {
        items = items.filter(item =>
          item.title.toLowerCase().includes(query) ||
          item.category.toLowerCase().includes(query) ||
          item.meta.toLowerCase().includes(query)
        );
      }

      if (currentSort === 'price-low') items.sort((a, b) => a.price - b.price);
      if (currentSort === 'price-high') items.sort((a, b) => b.price - a.price);
      if (currentSort === 'top-rated') items.sort((a, b) => b.rating - a.rating || b.reviews - a.reviews);

      return items;
    }

    function renderProducts() {
      const items = getFilteredProducts();

      if (!items.length) {
        productGrid.innerHTML = `
          <div class="promo-card" style="grid-column:1/-1; padding:28px; text-align:center;">
            <h3 style="font-size:1.4rem; margin-bottom:8px;">No matching products found</h3>
            <p style="color:var(--muted);">Try a different keyword or category filter.</p>
          </div>
        `;
        return;
      }

      productGrid.innerHTML = items.map(p => `
        <article class="product-card">
          <div class="product-media">
            <div class="tag-row">
              <span class="tag">${p.badge || 'Popular'}</span>
              <button class="wish-btn" aria-label="Add to wishlist"><i class="fa-regular fa-heart"></i></button>
            </div>
            <img src="${p.img}" alt="${p.title}" loading="lazy">
          </div>
          <div class="product-info">
            <div class="product-meta">
              <div>
                <h3 class="product-title">${p.title}</h3>
                <div class="subtext">${p.meta}</div>
              </div>
              <div class="rating"><i class="fa-solid fa-star"></i> ${p.rating} (${p.reviews})</div>
            </div>
            <div class="price-row">
              <span class="price">$${p.price.toLocaleString()}</span>
              <span class="old-price">$${p.oldPrice.toLocaleString()}</span>
            </div>
            <div class="product-actions">
              <button class="cart-btn" data-id="${p.id}"><i class="fa-solid fa-cart-shopping"></i> Add to cart</button>
              <button class="ghost-btn"><i class="fa-solid fa-arrow-up-right-from-square"></i></button>
            </div>
          </div>
        </article>
      `).join('');

      productGrid.querySelectorAll('.cart-btn').forEach(btn => {
        btn.addEventListener('click', () => addToCart(Number(btn.dataset.id), btn));
      });
    }

    function addToCart(id, btn) {
      const product = PRODUCTS.find(p => p.id === id);
      if (!product) return;
      cartCount += 1;
      cartCountSpan.textContent = cartCount;
      const original = btn.innerHTML;
      btn.innerHTML = '<i class="fa-solid fa-check"></i> Added';
      btn.style.opacity = '0.9';
      setTimeout(() => {
        btn.innerHTML = original;
        btn.style.opacity = '1';
      }, 1200);
      showToast(`${product.title} added to cart`);
    }

    function renderTestimonials() {
      const list = document.getElementById('testimonialList');
      list.innerHTML = testimonialsData.map(item => `
        <article class="testimonial-card">
          <div class="testi-head">
            <img src="${item.avatar}" alt="${item.name}">
            <div>
              <strong>${item.name}</strong>
              <div class="stars">${'★'.repeat(item.rating)}</div>
            </div>
          </div>
          <p>“${item.text}”</p>
        </article>
      `).join('');
    }

    function startCountdown() {
      const targetDate = new Date();
      targetDate.setDate(targetDate.getDate() + 2);
      targetDate.setHours(targetDate.getHours() + 5);

      const update = () => {
        const diff = targetDate - new Date();
        if (diff <= 0) {
          ['days','hours','minutes','seconds'].forEach(id => document.getElementById(id).textContent = '00');
          return;
        }
        const d = Math.floor(diff / (1000 * 60 * 60 * 24));
        const h = Math.floor((diff / (1000 * 60 * 60)) % 24);
        const m = Math.floor((diff / (1000 * 60)) % 60);
        const s = Math.floor((diff / 1000) % 60);
        document.getElementById('days').textContent = String(d).padStart(2, '0');
        document.getElementById('hours').textContent = String(h).padStart(2, '0');
        document.getElementById('minutes').textContent = String(m).padStart(2, '0');
        document.getElementById('seconds').textContent = String(s).padStart(2, '0');
      };

      update();
      setInterval(update, 1000);
    }

    function setupSorting() {
      document.querySelectorAll('.sort-btn').forEach(btn => {
        btn.addEventListener('click', () => {
          document.querySelectorAll('.sort-btn').forEach(b => b.classList.remove('active'));
          btn.classList.add('active');
          currentSort = btn.dataset.sort;
          renderProducts();
        });
      });
    }

    function setupTheme() {
      const themeToggle = document.getElementById('themeToggle');
      themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('dark');
        const icon = themeToggle.querySelector('i');
        icon.className = document.body.classList.contains('dark') ? 'fa-solid fa-sun' : 'fa-solid fa-moon';
      });
    }

    function setupSearch() {
      searchInput.addEventListener('input', renderProducts);
    }

    function setupCtas() {
      document.getElementById('shopNowHero').addEventListener('click', () => {
        document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
      });

      document.getElementById('exploreDealsHero').addEventListener('click', () => {
        document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
      });

      document.getElementById('flashDealBtn').addEventListener('click', () => {
        cartCount += 1;
        cartCountSpan.textContent = cartCount;
        showToast('MacBook Pro M3 added to cart');
      });

      document.getElementById('cartIconBtn').addEventListener('click', () => {
        showToast(`Cart has ${cartCount} item(s)`);
      });
    }

    function setupNewsletter() {
      newsletterForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const email = document.getElementById('newsEmail').value.trim();
        if (!email || !email.includes('@')) {
          newsletterMsg.textContent = 'Please enter a valid email address.';
          return;
        }
        newsletterMsg.textContent = `Thanks — ${email} is now subscribed.`;
        document.getElementById('newsEmail').value = '';
        setTimeout(() => newsletterMsg.textContent = '', 2600);
      });
    }

    function init() {
      renderCategoryPills();
      renderCategories();
      renderProducts();
      renderTestimonials();
      startCountdown();
      setupSorting();
      setupTheme();
      setupSearch();
      setupCtas();
      setupNewsletter();
    }

    init();
  </script>
</body>
</html>
