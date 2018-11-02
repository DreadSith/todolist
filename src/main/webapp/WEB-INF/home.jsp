<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
    <h1>TODO list</h1>
</body>

<form method="post">

    <table border="2">
        <tr>
            <td>ID</td>
            <td>Due Date</td>
            <td>Description</td>
        </tr>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306";
                String username="root";
                String password="admin";
                String query="select * from work.todolist";
                Connection conn = DriverManager.getConnection(url,username,password);
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);
                while(rs.next())
                {

        %>
        <tr>
            <td><%=rs.getInt("ID") %></td>
            <td><%=rs.getString("dueDate") %></td>
            <td><%=rs.getString("item") %></td>
        </tr>
        <%

            }
        %>
    </table>
    <%
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    %>

</form>
</html>