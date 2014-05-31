package edu.gmu.authorservice.dao;

import edu.gmu.authorservice.model.Author;

import java.util.*;

public class InMemoryAuthorDao implements AuthorDao {


    private Author _author;

    private Collection<Author> _authorlist;

    public void populateAuthors(){
        _authorlist = new ArrayList<Author>();
        _author = new Author(1, "Tom Mackie", "1958-1-12", "American", "Rated be photographer", "Tom Mackie has been a photographer all his working life. His degree in commercial photography took him first of all to Los Angeles, where he spent five years as an industrial and architectural photographer.", "http://www.tommackie.com/assets/images/tomJokulsarlon.jpg");
        _author = new Author(2, "Pat Riley", "1945-3-1945", "American", "5x NBA Champion", "Patrick James \"Pat\" Riley is an American professional basketball executive, and a former coach and player in the National Basketball Association..", "http://static.comicvine.com/uploads/original/11/114666/2957629-pat_riley_oj_mayo.png");
        _author = new Author(3, "Pat Riley", "1945-3-1945", "American", "5x NBA Champion", "Patrick James \"Pat\" Riley is an American professional basketball executive, and a former coach and player in the National Basketball Association.", "http://static.comicvine.com/uploads/original/11/114666/2957629-pat_riley_oj_mayo.png");
        _author = new Author(4, "Jack Tatum", "1948-11-18", "American", "Rated be photographer", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "http://www.youdontknowjersey.com/wp-content/uploads/2010/07/tatum4.jpg");

    }

    @Override
    public Author getAuthor(Integer id) {

        for (Author author: _authorlist){
            if(author.getId() == id)
            {
                return author;
            }
        }

        return null;
    }

    @Override
    public Collection<Author> getAllAuthors() {
        return _authorlist;
    }

}
