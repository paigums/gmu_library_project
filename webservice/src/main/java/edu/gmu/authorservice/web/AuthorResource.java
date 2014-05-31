package edu.gmu.authorservice.web;

import edu.gmu.authorservice.dao.AuthorDao;
import edu.gmu.authorservice.model.Author;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.Collection;
import java.util.logging.Logger;

@Path("/")
public class AuthorResource {

    private static final Logger logger = Logger.getLogger(AuthorResource.class.getName());

    private AuthorDao _authorDao;

    public AuthorResource(@Context Application app) throws Exception {
        _authorDao = (AuthorDao) app.getProperties().get("authorDao");
        logger.info("Using AuthorDao implementation " + _authorDao.getClass().getSimpleName());
    }

    //
    @Path("/test")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String test() {
        logger.info("Test if server is running and working");
        return "Success!! Server is running";
    }

    // TODO Implement two methods here: one to obtain all authors
    // and a second to obtain an author by id

    // Get all authors
    @Path("/authors/{authorid}.json")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Author author(@PathParam("authorid") Integer id) {
        return _authorDao.getAuthor(id);
    }

    // Get individual author
    @Path("/authors.json")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Collection<Author> authors() {
        return _authorDao.getAllAuthors();
    }

}
