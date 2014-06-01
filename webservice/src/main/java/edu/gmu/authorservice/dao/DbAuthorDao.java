package edu.gmu.authorservice.dao;

import edu.gmu.authorservice.SQLiteHelper;
import edu.gmu.authorservice.model.Author;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by ericoboite on 5/27/14.
 */
public class DbAuthorDao implements AuthorDao{

    @Override
    public Author getAuthor(Integer id) {
        String dbUrl = "jdbc:sqlite:db/authors.db";
        DataSource dataSource = SQLiteHelper.getDataSource(dbUrl);
        Author author = new Author();

        String sql = "select * from authors where id= ?";

        try (Connection conn = dataSource.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            // Should be at least 1 entry, only use first one - should put a lot
            // more error checking in here, but didn't since it was not in the
            // required tasks
            if (rs.next()) {
                author.setId(rs.getInt("id"));
                author.setName(rs.getString("name"));
                author.setDob(rs.getString("dob"));
                author.setNationality(rs.getString("nationality"));
                author.setBiography(rs.getString("biography"));
                author.setAwards(rs.getString("awards"));
                author.setImage_url(rs.getString("image_url"));

            }
        } catch (SQLException sqle) {
            // Write out Log error statement
            // return whatever is in the author record
            System.out.println("Error in retrieving record: " + sqle.getLocalizedMessage());

        }


        return author;
    }

    @Override
    public Collection<Author> getAllAuthors() {
        String dbUrl = "jdbc:sqlite:db/authors.db";
        DataSource dataSource = SQLiteHelper.getDataSource(dbUrl);

        String sql = "select * from authors";

        List<Author> authors = new ArrayList<>();

        try (Connection conn = dataSource.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Integer id = rs.getInt("id");
                String name = rs.getString("name");
                String dob = rs.getString("dob");
                String nationality = rs.getString("nationality");
                String biography = rs.getString("biography");
                String awards = rs.getString("awards");
                String imageUrl = rs.getString("image_url");
                authors.add(new Author(id, name, dob, nationality, biography, awards, imageUrl));
            }

            // Catch Exception
        } catch(SQLException sqle) {
            // Create a log error statement
            // return author arraylist
            System.out.println("Error in retrieving all record: " + sqle.getLocalizedMessage());
        }

        return authors;
    }

}
