package io.loopcamp.jdbctest.day01;

import org.junit.Assert;
import org.junit.Test;

import java.sql.*;
import java.util.*;

public class P04_ListOfMap {

    String dbUrl = "jdbc:oracle:thin:@54.224.70.64:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void test() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement stmnt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmnt.executeQuery("SELECT * FROM EMPLOYEES");
        ResultSetMetaData rsmd = rs.getMetaData();

        Map<String,Object> row1MapExpected = new HashMap<>(Map.of(
                "FIRST_NAME","Steven",
                "LAST_NAME","King",
                "SALARY",24000));
        Map<String,Object> row2MapExpected = new HashMap<>(Map.of(
                "FIRST_NAME","Neena",
                "LAST_NAME","Yang",
                "SALARY",17000));

        List<Map<String,Object>> listExpected = new ArrayList<>(Arrays.asList(
                row1MapExpected,
                row2MapExpected));

        rs.next();
        Map <String,Object> row1MapActual = new HashMap<>(Map.of(
                rsmd.getColumnName(2),rs.getString(rsmd.getColumnName(2)),
                rsmd.getColumnName(3),rs.getString(rsmd.getColumnName(3)),
                rsmd.getColumnName(8),rs.getString(rsmd.getColumnName(8))));
        rs.next();
        Map <String,Object> row2MapActual = new HashMap<>(Map.of(
                rsmd.getColumnName(2),rs.getString(rsmd.getColumnName(2) ),
                rsmd.getColumnName(3),rs.getString(rsmd.getColumnName(3)),
                rsmd.getColumnName(8),rs.getString(rsmd.getColumnName(8))));

        List<Map<String,Object>> listActual = new ArrayList<>(Arrays.asList(
                row1MapActual,
                row2MapActual));

        rs.close();
        stmnt.close();
        conn.close();

        Assert.assertEquals(listActual.toString(),listExpected.toString());
        Assert.assertEquals(row1MapExpected.toString(),row1MapActual.toString());
        Assert.assertEquals(row2MapExpected.toString(),row2MapActual.toString());

    }
}
