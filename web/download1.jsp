<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@page import="pack.MailSender"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <script>
    function checkKey() {
      var fistInput = document.getElementById("savedK").value;
      var secondInput = document.getElementById("seconKey").value;
      if (fistInput != secondInput) {
        alert('Wrong Key');
        return false;
      } else {
        document.getElementById("f1").action = "download2.jsp";
      }
    }
  </script>
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
    #content { width: 100%; max-width: 600px; }

    .page-header {
      text-align: center;
      margin-bottom: 28px;
    }
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
      font-size: 26px;
      font-weight: 700;
      letter-spacing: -0.02em;
      color: #0c2d4a;
    }
    .page-header h1 em {
      color: #0ea5e9;
      font-style: normal;
    }

    .key-card {
      background: #fff;
      border: 1px solid rgba(2,132,199,0.15);
      border-radius: 20px;
      padding: 40px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 8px 32px rgba(2,132,199,0.10);
    }
    .key-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      background: linear-gradient(90deg, #0c2d4a, #0284c7, #38bdf8);
    }

    .file-content-label {
      font-size: 12px;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #4a7a9b;
      margin-bottom: 10px;
      display: block;
    }
    textarea {
      width: 100%;
      height: 180px;
      background: #F2F7FD;
      border: 1px solid rgba(2,132,199,0.2);
      border-radius: 12px;
      color: #0c2d4a;
      font-size: 13px;
      padding: 14px;
      resize: vertical;
      font-family: 'Menlo', 'Monaco', 'Courier New', monospace;
      margin-bottom: 24px;
      outline: none;
    }
    textarea:focus { border-color: #0284c7; }

    .field-row {
      display: flex;
      flex-direction: column;
      margin-bottom: 24px;
    }
    .field-row label {
      font-size: 13px;
      font-weight: 600;
      color: #0c2d4a;
      margin-bottom: 8px;
    }
    .field-row input[type="text"] {
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
    .field-row input[type="text"]:focus {
      border-color: #0284c7;
      background: #fff;
      box-shadow: 0 0 0 3px rgba(2,132,199,0.12);
    }
    .field-row input::placeholder { color: #8aafc7; }
    input[type="submit"] {
      height: 44px;
      width: 100%;
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
  </style>
</head>
<body>
  <%
    HttpSession user = request.getSession();
    String uname = user.getAttribute("username").toString();
    String name = user.getAttribute("name").toString();
    Connection con = Dbconnection.getConn();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
  %>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul id="nav">
          <li><a class="nav-brand" href="user_page1.jsp">Diplo<span>Vault</span></a></li>
          <li><a href="user_page1.jsp">User Home</a></li>
          <li><a href="upload.jsp">Upload</a></li>
          <li><a href="molecule.jsp">Molecules</a></li>
          <li><a href="index.html" class="logout-link">Logout</a></li>
        </ul>
      </nav>
    </header>

    <div id="site_content">
      <div id="content">
        <%
          HttpSession user1 = request.getSession();
          String name1 = user1.getAttribute("username").toString();
          String id = request.getQueryString();
          String fname = null;
          String firstKey = null;
          String contents = null;
          Statement st = con.createStatement();
          Statement st3 = con.createStatement();
          ResultSet rt2 = st3.executeQuery("select * from register where username='" + name1 + "'");
          if (rt2.next()) {
            String mail = rt2.getString("mail");
            ResultSet rt = st.executeQuery("select * from files where idfiles='" + id + "'");
            if (rt.next()) {
              firstKey = rt.getString("file_key");
              fname = rt.getString("filename");
              contents = rt.getString("content");
              new MailSender().sendMail(mail, "File Key", firstKey);
        %>
        <div class="page-header">
          <span>DiploVault - Enter File Key</span>
          <h1>File: <em><%=fname%></em></h1>
        </div>
        <div class="key-card">
          <form id="f1" method="post" onsubmit="return checkKey();">
            <input type="hidden" name="savedOutK" id="savedK" value="<%=firstKey%>" />
            <input type="hidden" name="fid" value="<%=id%>" />
            <span class="file-content-label">File Content (Encrypted)</span>
            <textarea name="fcontent"><%=contents%></textarea>
            <div class="field-row">
              <label>Enter File Key</label>
              <input type="text" name="seconKey" id="seconKey"
                     placeholder="Enter the key sent to your email" />
            </div>
            <input type="submit" value="Decrypt File" />
          </form>
        </div>
        <%
            }
          }
        %>
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