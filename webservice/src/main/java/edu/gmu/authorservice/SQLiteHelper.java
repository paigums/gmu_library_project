package edu.gmu.authorservice;

import org.sqlite.SQLiteDataSource;
import javax.sql.DataSource;

/**
 * Created by ericoboite on 5/27/14.
 */
public class SQLiteHelper {
    public static DataSource getDataSource(String dbUrl) {
        SQLiteDataSource ds = new SQLiteDataSource();
        ds.setUrl(dbUrl);
        return ds;
    }
}
