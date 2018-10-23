package kg.todolist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test  {

    private static final String jdbc_driver = "com.mysql.jdbc.Driver";
    private static final String db_url = "jdbc:mysql://localhost:3306";
    private static final String db_user = "root";
    private static final String db_pass = "admin";

    Connection db_connection;

    {
        try {
            db_connection = DriverManager.getConnection(db_url,db_user,db_pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void main(String [ ] args)
    {
    }
}
