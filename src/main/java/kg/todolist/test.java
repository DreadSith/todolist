package kg.todolist;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class test  {

    private static final String jdbc_driver = "com.mysql.jdbc.Driver";
    private static final String db_url = "jdbc:mysql://localhost:3306";
    private static final String db_user = "root";
    private static final String db_pass = "admin";

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }


    public static void main(String [ ] args) throws SQLException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int year = 2018;
        int month = 11;
        int day = 05;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, day);

        java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
        System.out.println(date);

        Connection db_conn = DriverManager.getConnection(db_url,db_user,db_pass);
        PreparedStatement preparedStatement = null;

        //Inserting record



        String sql = "INSERT INTO work.todolist"
                + "(dueDate, item) VALUES"
                + "(?,?)";

        preparedStatement = db_conn.prepareStatement(sql);

        preparedStatement.setDate(1, date);
        preparedStatement.setString(2, "Do this.");

        preparedStatement.executeUpdate();

    }
}
