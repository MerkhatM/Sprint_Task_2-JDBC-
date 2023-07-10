package com.example.sprint_task_jdbc.dbManager;

import com.example.sprint_task_jdbc.models.Item;
import com.example.sprint_task_jdbc.models.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    public static void connect(){
        try{
            Class.forName("org.postgresql.Driver");
            connection= DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/Sprint_Task_JDBC",
                    "postgres",
                    "2805");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Item> getItems(){
        ArrayList<Item> items=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("select * from items");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Item item=new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                items.add(item);
            }
            resultSet.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return items;
    }

    public static Item getTaskByID(Long id){
        Item item=null;
        try {
            PreparedStatement statement=connection.prepareStatement("select * from items where id=?");
            statement.setLong(1,id);
            ResultSet resultSet= statement.executeQuery();
            if(resultSet.next()){
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setId(resultSet.getLong("description"));
                item.setPrice(resultSet.getDouble("price"));
            }
            resultSet.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return item;
    }

    public static User getUserByEmailAndPassword(String email, String password){
        User user=null;
        try {
            PreparedStatement statement=connection.prepareStatement("Select * from users where email=? AND password=?");
            statement.setString(1,email);
            statement.setString(2,password);
            ResultSet resultSet=statement.executeQuery();
            if(resultSet.next()){
                user=new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
