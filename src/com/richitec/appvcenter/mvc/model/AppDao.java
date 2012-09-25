package com.richitec.appvcenter.mvc.model;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class AppDao {
	private JdbcTemplate jdbc;

	public void setDataSource(DataSource ds) {
		jdbc = new JdbcTemplate(ds);
	}

	public int saveApp(String appName) {
		String sql = "INSERT INTO application (name) VALUES(?)";
		return jdbc.update(sql, appName);
	}

	public List<Map<String, Object>> getApps() {
		String sql = "SELECT * FROM application";
		return jdbc.queryForList(sql);
	}

	public String getAppName(String appId) {
		String sql = "SELECT name FROM application WHERE appId = ?";
		return jdbc.queryForObject(sql, new Object[] { appId }, String.class);
	}

	public int saveVersion(String appId, String type, String version,
			String fileName) {
		String sql = "INSERT INTO app_version (type, client_name, version, appId) VALUES(?,?,?,?)";
		return jdbc.update(sql, type, fileName, version, appId);
	}

	public List<Map<String, Object>> getVersions(String appId) {
		String sql = "SELECT * FROM app_version WHERE appId = ? ORDER BY update_time DESC";
		return jdbc.queryForList(sql, appId);
	}
	
	public String getNewestAppClient(String appId, String deviceType) {
		String sql = "SELECT client_name FROM app_version WHERE appId = ? AND type = ? ORDER BY update_time DESC LIMIT 1";
		return jdbc.queryForObject(sql, new Object[] {appId, deviceType}, String.class);
	}
	
	public String getNewestAppVersion(String appId, String deviceType) {
		String sql = "SELECT version FROM app_version WHERE appId = ? AND type = ? ORDER BY update_time DESC LIMIT 1";
		return jdbc.queryForObject(sql, new Object[] {appId, deviceType}, String.class);
	}
}
