<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%
try {
    String uname = request.getQueryString();
    Connection con = Dbconnection.getConn();
    Statement st = con.createStatement();
    int i = st.executeUpdate("update register set activate='no' where username='" + uname + "'");
    if (i != 0) {
        response.sendRedirect("users_1.jsp?");
    } else {
        out.println("error while updating data");
    }
} catch (Exception e) {
    out.println(e);
}
%>