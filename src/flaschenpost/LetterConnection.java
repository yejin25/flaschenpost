package flaschenpost;

import java.sql.*;
import java.util.HashMap;

public class LetterConnection {
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public LetterConnection() throws SQLException, ClassNotFoundException {
        String dbUrl = "jdbc:mysql://yjin.namsu.xyz:3306/flaschenpost?serverTimezone=UTC";
        String dbId = "flaschenpost";
        String dbPassword = "q1w2e3";
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbId, dbPassword);
    }

    public String add(Letter letter) {
        boolean executeReturn = false;

        String query = "INSERT INTO Letter(GroupNumber, Context, Font, Color) VALUES(?, ?, ?, ?) ";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, letter.getGroup());
            preparedStatement.setString(2, letter.getContext());
            preparedStatement.setString(3, letter.getFont());
            preparedStatement.setString(4, letter.getColor());
            preparedStatement.execute();

            executeReturn = true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            executeReturn = false;
        }

        if (executeReturn) {
            return letter.getGroup() + "_" + getInsertNum(letter.getGroup());
        } else {
            return "NULL";
        }

    }

    public String getInsertNum(String group) {
        Letter calculationLetter = new Letter();
        if (group != null) {
            String query = "SELECT * FROM Letter WHERE GroupNumber=" + group + " ORDER BY LetterNumber DESC LIMIT 1;";

            try {
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    calculationLetter.setLetterNumber(resultSet.getString("LetterNumber"));
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return calculationLetter.getLetterNumber();
    }

    public Letter get(int index) {
        Letter receiveLetter = new Letter();
        String query = "SELECT * FROM Letter WHERE LetterNumber=";
        try {
            preparedStatement = connection.prepareStatement(query + index);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                receiveLetter.setGroup(resultSet.getString("GroupNumber"));
                receiveLetter.setContext(resultSet.getString("Context"));
                receiveLetter.setFont(resultSet.getString("Font"));
                receiveLetter.setColor(resultSet.getString("Color"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return receiveLetter;
    }

    public HashMap<String, Letter> getSelection(int groupNum) {
        HashMap<String, Letter> letterHashMap = new HashMap<String, Letter>();

        String query = "SELECT * FROM Letter WHERE GroupNumber=" + groupNum + " ORDER BY LetterNumber;";
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Letter receiveLetter = new Letter();
                receiveLetter.setGroup(resultSet.getString("GroupNumber"));
                receiveLetter.setContext(resultSet.getString("Context"));
                receiveLetter.setFont(resultSet.getString("Font"));
                receiveLetter.setColor(resultSet.getString("Color"));

                letterHashMap.put(resultSet.getString("LetterNumber"), receiveLetter);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return letterHashMap;
    }
}