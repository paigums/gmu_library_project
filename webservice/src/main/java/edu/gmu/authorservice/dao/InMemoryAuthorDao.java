package edu.gmu.authorservice.dao;

import edu.gmu.authorservice.model.Author;

import java.util.*;

public class InMemoryAuthorDao implements AuthorDao {


    private Author _author;

    private Collection<Author> _authorlist;

    public void populateAuthors(){
        _authorlist = new ArrayList<Author>();
        _author = new Author(1, "Tom Mackie", "1958-1-12", "American", "Rated be photographer", "Tom Mackie has been a photographer all his working life. His degree in commercial photography took him first of all to Los Angeles, where he spent five years as an industrial and architectural photographer.", "http://www.tommackie.com/assets/images/tomJokulsarlon.jpg");
        _author = new Author(2, "Tom Mackie", "1958-1-12", "American", "Rated be photographer", "Tom Mackie has been a photographer all his working life. His degree in commercial photography took him first of all to Los Angeles, where he spent five years as an industrial and architectural photographer.", "http://www.tommackie.com/assets/images/tomJokulsarlon.jpg");
        _author = new Author(3, "Tom Mackie", "1958-1-12", "American", "Rated be photographer", "Tom Mackie has been a photographer all his working life. His degree in commercial photography took him first of all to Los Angeles, where he spent five years as an industrial and architectural photographer.", "http://www.tommackie.com/assets/images/tomJokulsarlon.jpg");
        _author = new Author(4, "Tom Mackie", "1958-1-12", "American", "Rated be photographer", "Tom Mackie has been a photographer all his working life. His degree in commercial photography took him first of all to Los Angeles, where he spent five years as an industrial and architectural photographer.", "http://www.tommackie.com/assets/images/tomJokulsarlon.jpg");

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
