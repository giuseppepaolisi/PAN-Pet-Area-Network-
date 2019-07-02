package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import beam.UtenteRegistrazione;

//import beam.UtenteRegistrazione;;


public class ConnessioneUtente extends Connessione{
	
	public ConnessioneUtente(){
		super();
	}
	
	private static final String TABLE_NAME = "utenti";
	
	public synchronized void doSave(UtenteRegistrazione utente) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				                                                      //                                           
				+ " (email,password,nome,cognome,città,via,`numero civico`,`data nascita`,`numero telefono`,intestatario,`numero carta`,`data scadenza`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println(insertSQL);
		try {
			connection = super.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getEmail());
			preparedStatement.setString(2, utente.getPass());
			preparedStatement.setString(3, utente.getNome());
			preparedStatement.setString(4, utente.getCognome());
			preparedStatement.setString(5, utente.getCitta());
			preparedStatement.setString(6, utente.getVia());
			preparedStatement.setInt(7, utente.getNcv());
			//System.out.println(utente.getNascita().getDataSTR());
			preparedStatement.setString(8, utente.getNascita().getDataSTR());
			preparedStatement.setString(9, utente.getTell());
			preparedStatement.setString(10, utente.getIntestatario());
			preparedStatement.setString(11, utente.getNcarta());
			preparedStatement.setString(12,utente.getScadenza().getDataSTR());

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
}
