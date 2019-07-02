package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beam.Servizio;



public class ConnessioneServizi extends Connessione{
	public ConnessioneServizi(){
		super();
	}
	
	private static final String TABLE_NAME = "servizi";
	
	public synchronized void doSave(Servizio ser) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (nome, descrizione, prezzo,foto) VALUES (?, ?, ?, ?)";

		try {
			connection = super.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, ser.getNome());
			preparedStatement.setString(2, ser.getDescrizione());
			preparedStatement.setDouble(3, ser.getPrezzo());
			preparedStatement.setString(4, ser.getFoto());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized Servizio doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Servizio ser=new Servizio();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE nome = ?";

		try {
			connection = super.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ser.setNome(rs.getString("nome"));
				ser.setDescrizione(rs.getString("descrizione"));
				ser.setPrezzo(rs.getDouble("prezzo"));
				ser.setFoto(rs.getString("foto"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return ser;
	}
	
	public synchronized Collection<Servizio> doRetrieveAll(String order) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<Servizio> list = new LinkedList<Servizio>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME;
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}


		try {
			connection = super.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Servizio ser = new Servizio();

				ser.setNome(rs.getString("nome"));
				ser.setDescrizione(rs.getString("descrizione"));
				ser.setPrezzo(rs.getDouble("prezzo"));
				ser.setFoto(rs.getString("foto"));
				list.add(ser);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return list;
	}
	public synchronized boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE nome = ?";

		try {
			connection = super.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
}
