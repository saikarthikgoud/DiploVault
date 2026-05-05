<!DOCTYPE HTML>
<html>
<head>
  <title>DiploVault</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <style>
    *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      background: #F2F7FD;
      color: #1d1d1f;
      font-family: -apple-system, 'Helvetica Neue', Helvetica, Arial, sans-serif;
      min-height: 100vh;
    }
    #main { position: relative; min-height: 100vh; }
    .accent-bar {
      height: 3px;
      width: 100%;
      background: linear-gradient(90deg, #0c2d4a, #0284c7, #38bdf8);
    }
    header {
      position: sticky;
      top: 0;
      z-index: 100;
      width: 100%;
      background: #0c2d4a;
    }
    #logo { display: none; }
    nav { width: 100%; max-width: 1200px; margin: 0 auto; padding: 0 40px; }
    ul#nav {
      list-style: none;
      display: flex !important;
      flex-direction: row !important;
      align-items: center;
      height: 60px;
      padding: 0; margin: 0;
      background: transparent !important;
      border: none !important;
      float: none !important;
    }
    .nav-brand {
      font-size: 20px;
      font-weight: 800;
      color: #fff;
      margin-right: 36px;
      letter-spacing: -0.02em;
      white-space: nowrap;
      text-decoration: none;
      transition: color 0.15s;
    }
    .nav-brand span { color: #38bdf8; }
    .nav-brand:hover { color: #38bdf8 !important; }
    ul#nav li {
      display: flex !important;
      float: none !important;
      background: transparent !important;
      border: none !important;
      padding: 0 !important;
      margin: 0 !important;
      position: relative;
    }
    ul#nav li a {
      display: block !important;
      padding: 0 22px !important;
      font-size: 16px !important;
      font-weight: 600;
      color: rgba(255,255,255,1) !important;
      text-decoration: none !important;
      line-height: 60px !important;
      transition: color 0.15s, background 0.15s !important;
      white-space: nowrap !important;
      background: transparent !important;
      border: none !important;
    }
    ul#nav li a:hover {
      color: #fff !important;
      background: rgba(255,255,255,0.12) !important;
    }
    ul#nav li.selected a {
      color: #38bdf8 !important;
      font-weight: 700 !important;
    }

    /* Logout red */
    .logout-link {
      color: #ff6b6b !important;
    }
    .logout-link:hover {
      color: #ff4444 !important;
      background: rgba(255,80,80,0.1) !important;
    }

    /* Dropdown */
    ul#nav li ul {
      display: none;
      position: absolute;
      top: 60px;
      left: 0;
      background: #0c2d4a;
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 12px;
      min-width: 160px;
      padding: 8px 0;
      list-style: none;
      z-index: 200;
    }
    ul#nav li:hover ul { display: block; }
    ul#nav li ul li {
      display: block !important;
      width: 100%;
    }
    ul#nav li ul li a {
      padding: 10px 20px !important;
      line-height: 1.4 !important;
      color: rgba(255,255,255,0.75) !important;
      font-size: 14px !important;
      display: block !important;
      border-radius: 0 !important;
    }
    ul#nav li ul li a:hover {
      color: #fff !important;
      background: rgba(255,255,255,0.1) !important;
    }

    /* WELCOME CONTENT */
    #site_content {
      position: relative;
      z-index: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: calc(100vh - 63px);
      padding: 40px 24px;
      background: #F2F7FD;
    }
    #sidebar_container { display: none; }
    #content {
      text-align: center;
      animation: fadeUp 0.8s cubic-bezier(0.16,1,0.3,1) both;
    }
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .welcome-icon {
      width: 80px;
      height: 80px;
      background: #E0F2FE;
      border-radius: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 28px;
    }
    .welcome-icon svg {
      width: 40px;
      height: 40px;
    }
    .welcome-title {
      font-size: clamp(32px, 5vw, 52px);
      font-weight: 800;
      letter-spacing: -0.03em;
      color: #0c2d4a;
      margin-bottom: 8px;
    }
    .welcome-title span { color: #0ea5e9; }
    .welcome-sub {
      font-size: 18px;
      color: #4a7a9b;
      font-weight: 400;
      margin-bottom: 40px;
    }

    /* Quick action cards */
    .action-cards {
      display: flex;
      gap: 16px;
      justify-content: center;
      flex-wrap: wrap;
      margin-top: 16px;
    }
    .action-card {
      background: #fff;
      border: 1px solid rgba(2,132,199,0.15);
      border-radius: 16px;
      padding: 24px 28px;
      width: 200px;
      text-align: center;
      text-decoration: none;
      transition: transform 0.2s, box-shadow 0.2s;
      cursor: pointer;
    }
    .action-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 10px 28px rgba(2,132,199,0.14);
    }
    .action-card-icon {
      width: 44px;
      height: 44px;
      background: #E0F2FE;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 12px;
    }
    .action-card-icon svg { width: 22px; height: 22px; }
    .action-card h3 {
      font-size: 14px;
      font-weight: 700;
      color: #0c2d4a;
    }
  </style>
</head>
<body>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a class="nav-brand" href="diplo_page.jsp">Diplo<span>Vault</span></a></li>
          <li class="selected"><a href="diplo_page.jsp">Diplo Home</a></li>
          <li><a href="filecluster.jsp">File Cluster</a></li>
          <li><a href="#">Diplo &#9662;
            <ul>
              <li><a href="master.jsp">Master</a></li>
              <li><a href="worker.jsp">Worker</a></li>
            </ul>
          </a></li>
          <li><a href="index.html" class="logout-link">Logout</a></li>
        </ul>
      </nav>
    </header>

    <div id="site_content">
      <div id="sidebar_container"></div>
      <div id="content">
        <div class="welcome-icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
               stroke-linecap="round" stroke-linejoin="round">
            <path d="M12 2L2 7l10 5 10-5-10-5z"/>
            <path d="M2 17l10 5 10-5"/>
            <path d="M2 12l10 5 10-5"/>
          </svg>
        </div>
        <div class="welcome-title">Welcome to Diplo<span>Vault</span></div>
        <div class="welcome-sub">Store and manage files securely in the cloud.</div>

        <div class="action-cards">
          <a href="filecluster.jsp" class="action-card">
            <div class="action-card-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
                   stroke-linecap="round" stroke-linejoin="round">
                <path d="M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z"/>
              </svg>
            </div>
            <h3>File Cluster</h3>
          </a>
          <a href="master.jsp" class="action-card">
            <div class="action-card-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
                   stroke-linecap="round" stroke-linejoin="round">
                <rect x="2" y="3" width="20" height="14" rx="2"/>
                <path d="M8 21h8M12 17v4"/>
              </svg>
            </div>
            <h3>Master</h3>
          </a>
          <a href="worker.jsp" class="action-card">
            <div class="action-card-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
                   stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="3"/>
                <path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83"/>
              </svg>
            </div>
            <h3>Worker</h3>
          </a>
        </div>
      </div>
    </div>

  </div>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>