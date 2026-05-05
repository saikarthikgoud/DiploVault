<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
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
    .logout-link { color: #ff6b6b !important; }
    .logout-link:hover {
      color: #ff4444 !important;
      background: rgba(255,80,80,0.1) !important;
    }
    #site_content {
      position: relative;
      z-index: 1;
      max-width: 960px;
      margin: 0 auto;
      padding: 48px 24px 80px;
    }
    .page-header {
      text-align: center;
      margin-bottom: 32px;
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
      font-size: 30px;
      font-weight: 800;
      letter-spacing: -0.02em;
      color: #0c2d4a;
    }
    .table-card {
      background: #fff;
      border-radius: 16px;
      overflow: hidden;
      border: 1px solid rgba(2,132,199,0.13);
      box-shadow: 0 4px 20px rgba(2,132,199,0.08);
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    thead tr { background: #0c2d4a; }
    thead td {
      padding: 14px 24px;
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: rgba(255,255,255,0.8);
      text-align: center;
      border: none;
    }
    tbody tr {
      border-bottom: 1px solid rgba(2,132,199,0.08);
      transition: background 0.12s;
    }
    tbody tr:last-child { border-bottom: none; }
    tbody tr:nth-child(even) { background: #F8FBFF; }
    tbody tr:hover { background: #E0F2FE; }
    tbody td {
      padding: 14px 24px;
      font-size: 14px;
      color: #0c2d4a;
      text-align: center;
      border: none;
    }
    tbody td a {
      text-decoration: none;
      font-size: 13px;
      font-weight: 600;
      padding: 6px 16px;
      border-radius: 20px;
      transition: all 0.15s;
    }
    .btn-activate {
      color: #16a34a;
      border: 1px solid rgba(22,163,74,0.4);
    }
    .btn-activate:hover {
      background: #16a34a;
      color: #fff;
    }
    .btn-deactivate {
      color: #dc2626;
      border: 1px solid rgba(220,38,38,0.4);
    }
    .btn-deactivate:hover {
      background: #dc2626;
      color: #fff;
    }
    .status-yes {
      color: #16a34a;
      font-weight: 600;
    }
    .status-no {
      color: #dc2626;
      font-weight: 600;
    }
  </style>
</head>
<body>
  <%
    if (request.getParameter("rights") != null) {
      out.println("<script>alert('Updated successfully!')</script>");
    }
  %>
  <div id="main">
    <div class="accent-bar"></div>
    <header>
      <div id="logo"></div>
      <nav>
        <ul id="nav">
          <li><a class="nav-brand" href="cloud_page.jsp">Diplo<span>Vault</span></a></li>
          <li><a href="cloud_page.jsp">Cloud Home</a></li>
          <li class="selected"><a href="users_1.jsp">Users</a></li>
          <li><a href="files.jsp">Files</a></li>
          <li><a href="index.html" class="logout-link">Logout</a></li>
        </ul>
      </nav>
    </header>

    <div id="site_content">
      <%
        Connection con = Dbconnection.getConn();
        Statement st = con.createStatement();
        ResultSet rt = st.executeQuery("select * from register order by activate asc");
      %>
      <div id="content">
        <div class="page-header">
          <span>DiploVault - Cloud Panel</span>
          <h1>Users View</h1>
        </div>
        <div class="table-card">
          <form action="" method="get">
            <table>
              <thead>
                <tr>
                  <td>Username</td>
                  <td>Password</td>
                  <td>Mail</td>
                  <td>Status</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody>
                <%
                  while (rt.next()) {
                    String uname = rt.getString("username");
                    String mail = rt.getString("mail");
                    String status = rt.getString("activate");
                %>
                <tr>
                  <td><%=uname%></td>
                  <td>****</td>
                  <td><%=mail%></td>
                  <td>
                    <span class="<%=status.equalsIgnoreCase("yes") ? "status-yes" : "status-no"%>">
                      <%=status.equalsIgnoreCase("yes") ? "Active" : "Inactive"%>
                    </span>
                  </td>
                  <%if (status.equalsIgnoreCase("no")) {%>
                  <td><a href="activate.jsp?<%=uname%>" class="btn-activate">Activate</a></td>
                  <%} else {%>
                  <td><a href="deactivate.jsp?<%=uname%>" class="btn-deactivate">Deactivate</a></td>
                  <%}%>
                </tr>
                <%}%>
              </tbody>
            </table>
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