package com.richitec.appvcenter.mvc.model;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class VersionDao {
	private JdbcTemplate jdbc;
	
	public void setDataSource(DataSource ds) {
		jdbc = new JdbcTemplate(ds);
	}
}
