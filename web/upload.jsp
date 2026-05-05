<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
    #content { width: 100%; max-width: 460px; text-align: center; }

    .page-header { margin-bottom: 28px; }
    .page-header span {
      display: block;
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: #0284c7;
      margin-bottom: 6px;
    }
    .page-header h1 {
      font-size: 30px;
      font-weight: 800;
      letter-spacing: -0.03em;
      color: #0c2d4a;
    }

    .upload-card {
      background: #fff;
      border: 1px solid rgba(2,132,199,0.15);
      border-radius: 20px;
      padding: 48px 40px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 8px 32px rgba(2,132,199,0.10);
    }
    .upload-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      background: linear-gradient(90deg, #0c2d4a, #0284c7, #38bdf8);
    }

    .file-label {
      font-size: 13px;
      font-weight: 600;
      color: #0c2d4a;
      display: block;
      text-align: left;
      margin-bottom: 10px;
    }
    input[type="file"] {
      width: 100%;
      padding: 12px 14px;
      background: #F2F7FD;
      border: 1px solid rgba(2,132,199,0.25);
      border-radius: 10px;
      color: #0c2d4a;
      font-size: 14px;
      font-family: -apple-system, 'Helvetica Neue', Helvetica, Arial, sans-serif;
      margin-bottom: 28px;
      cursor: pointer;
      transition: border-color 0.2s;
    }
    input[type="file"]:hover {
      border-color: #0284c7;
      background: #fff;
    }
    .btn-row {
      display: flex;
      gap: 12px;
      justify-content: center;
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
</head>
<body>
  <%
    if (request.getParameter("status") != null) {
      out.println("<script>alert('File uploaded to DiploVault successfully!')</script>");
    }
    if (request.getParameter("failed") != null) {
      out.println("<script>alert('File name already exists!')</script>");
    }
    if (request.getParameter("fail") != null) {
      out.println("<script>alert('File content already exists!')</script>");
    }
  %>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul id="nav">
          <li><a class="nav-brand" href="user_page1.jsp">Diplo<span>Vault</span></a></li>
          <li><a href="user_page1.jsp">User Home</a></li>
          <li class="selected"><a href="upload.jsp">Upload</a></li>
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
        <div class="page-header">
          <span>Welcome, <%=name%></span>
          <h1>Upload File</h1>
        </div>
        <div class="upload-card">
          <form action="upload" name="name" method="post" enctype="multipart/form-data">
            <label class="file-label">Select a file from your device</label>
            <input type="file" name="file" />
             
            <div class="btn-row">
              <input type="submit" value="Upload" />
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