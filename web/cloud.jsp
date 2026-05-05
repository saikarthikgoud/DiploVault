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
    #content { width: 100%; max-width: 440px; }
    .login-card {
      background: #fff;
      border: 1px solid rgba(2,132,199,0.15);
      border-radius: 20px;
      padding: 48px 40px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 8px 32px rgba(2,132,199,0.10);
    }
    .login-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      background: linear-gradient(90deg, #0c2d4a, #0284c7, #38bdf8);
    }
    .login-card h1 {
      font-size: 26px;
      font-weight: 700;
      color: #0c2d4a;
      letter-spacing: -0.02em;
      margin-bottom: 8px;
      text-align: center;
    }
    .login-card .subtitle {
      font-size: 13px;
      color: #4a7a9b;
      text-align: center;
      margin-bottom: 32px;
    }
    .field-row {
      display: flex;
      flex-direction: column;
      margin-bottom: 20px;
      width: 100%;
    }
    .field-row label {
      font-size: 13px;
      font-weight: 600;
      color: #0c2d4a;
      margin-bottom: 8px;
    }
    .field-row input[type="text"],
    .field-row input[type="password"] {
      width: 100%;
      height: 44px;
      background: #F2F7FD;
      border: 1px solid rgba(2,132,199,0.25);
      border-radius: 10px;
      color: #0c2d4a;
      font-size: 15px;
      padding: 0 14px;
      outline: none;
      transition: border-color 0.2s, box-shadow 0.2s;
      font-family: -apple-system, 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    .field-row input:focus {
      border-color: #0284c7;
      background: #fff;
      box-shadow: 0 0 0 3px rgba(2,132,199,0.12);
    }
    .field-row input::placeholder { color: #8aafc7; }
    .btn-row {
      display: flex;
      gap: 12px;
      justify-content: center;
      margin-top: 32px;
    }
    input[type="submit"] {
      height: 44px;
      width: 130px;
      background: #0c2d4a;
      color: #fff;
      border: none;
      border-radius: 10px;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.2s;
      font-family: -apple-system, 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    input[type="submit"]:hover { background: #0284c7; }
    input[type="reset"] {
      height: 44px;
      width: 130px;
      background: #fff;
      color: #0c2d4a;
      border: 1.5px solid #0c2d4a;
      border-radius: 10px;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s;
      font-family: -apple-system, 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    input[type="reset"]:hover { background: #0c2d4a; color: #fff; }
  </style>
  <script>
    function validation() {
      var uname = document.ulogin.username.value;
      var pass = document.ulogin.password.value;
      if (uname == "") {
        alert("Enter Cloud ID");
        document.ulogin.username.focus();
        return false;
      }
      if (pass == "") {
        alert("Enter password");
        document.ulogin.password.focus();
        return false;
      }
    }
  </script>
</head>
<body>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul id="nav">
          <li><a class="nav-brand" href="index.html">Diplo<span>Vault</span></a></li>
          <li><a href="index.html">Home</a></li>
          <li><a href="diplo.jsp">Diplo Admin</a></li>
          <li class="selected"><a href="cloud.jsp">Cloud Server</a></li>
          <li><a href="user.jsp">Data User</a></li>
          <li><a href="register.jsp">Registration</a></li>
        </ul>
      </nav>
    </header>

    <div id="site_content">
      <div id="sidebar_container"></div>
      <div id="content">
        <div class="login-card">
          <h1>Cloud Server Login</h1>
          <p class="subtitle">Secure Storage &amp; File Management System</p>
          <form action="pcloud_login" name="ulogin" method="post" onsubmit="return validation()">
            <div class="field-row">
              <label>Cloud ID</label>
              <input type="text" name="username" required placeholder="Enter Cloud ID" />
            </div>
            <div class="field-row">
              <label>Password</label>
              <input type="password" name="password" required placeholder="Enter password" />
            </div>
            <div class="btn-row">
              <input type="submit" value="Submit" />
              <input type="reset" value="Reset" />
            </div>
          </form>
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