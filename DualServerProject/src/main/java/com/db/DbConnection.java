/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.db;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Java4
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dualserver", "root", "Manjeet@123#");
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Eroor occur in Get Connnection");
        }
        return con;
    }
}