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
    .logout-link { color: #ff6b6b !important; }
    .logout-link:hover {
      color: #ff4444 !important;
      background: rgba(255,80,80,0.1) !important;
    }

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
    .welcome-icon svg { width: 40px; height: 40px; }

    .welcome-title {
      font-size: clamp(32px, 5vw, 52px);
      font-weight: 800;
      letter-spacing: -0.03em;
      color: #0c2d4a;
      margin-bottom: 8px;
    }
    .welcome-title span { color: #0ea5e9; }

    .welcome-sub {
      font-size: 17px;
      color: #4a7a9b;
      font-weight: 400;
      max-width: 480px;
      margin: 0 auto 40px;
      line-height: 1.6;
    }

    .action-cards {
      display: flex;
      gap: 20px;
      justify-content: center;
      flex-wrap: wrap;
    }
    .action-card {
      background: #fff;
      border: 1px solid rgba(2,132,199,0.15);
      border-radius: 16px;
      padding: 28px 32px;
      width: 200px;
      text-align: center;
      text-decoration: none;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .action-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 10px 28px rgba(2,132,199,0.14);
    }
    .action-card-icon {
      width: 48px;
      height: 48px;
      background: #E0F2FE;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 14px;
    }
    .action-card-icon svg { width: 24px; height: 24px; }
    .action-card h3 {
      font-size: 15px;
      font-weight: 700;
      color: #0c2d4a;
    }
  </style>
</head>
<body>
  <%
    if (request.getParameter("no") != null) {
      out.println("<script>alert('You do not have permission to do this.')</script>");
    }
    if (request.getParameter("status") != null) {
      out.println("<script>alert('Your request has been sent to the private cloud.')</script>");
    }
  %>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul id="nav">
          <li><a class="nav-brand" href="user_page1.jsp">Diplo<span>Vault</span></a></li>
          <li class="selected"><a href="user_page1.jsp">User Home</a></li>
          <li><a href="upload.jsp">Upload</a></li>
          <li><a href="molecule.jsp">Molecules</a></li>
          <li><a href="index.html" class="logout-link">Logout</a></li>
        </ul>
      </nav>
    </header>

    <div id="site_content">
      <div id="content">
        <%
          HttpSession user = request.getSession();
          String uname = user.getAttribute("username").toString();
          String name = user.getAttribute("name").toString();
        %>
        <div class="welcome-icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
               stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
            <circle cx="12" cy="7" r="4"/>
          </svg>
        </div>
        <div class="welcome-title">Welcome, <span><%=name%></span></div>
        <div class="welcome-sub">Upload and search your files efficiently in the vault.</div>

        <div class="action-cards">
          <a href="upload.jsp" class="action-card">
            <div class="action-card-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
                   stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                <polyline points="17 8 12 3 7 8"/>
                <line x1="12" y1="3" x2="12" y2="15"/>
              </svg>
            </div>
            <h3>Upload File</h3>
          </a>
          <a href="molecule.jsp" class="action-card">
            <div class="action-card-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2"
                   stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="3"/>
                <path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83"/>
              </svg>
            </div>
            <h3>Molecules</h3>
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