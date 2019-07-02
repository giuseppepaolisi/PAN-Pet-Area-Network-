package beam;

import java.io.Serializable;

import supporto.Data;

public class Servizio implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nome;
	private String descrizione;
	private double prezzo;
	private String foto;
	private int quantita;
	private Data datai,dataf;

	public Servizio(){
		nome="";
		descrizione="";
		prezzo=0;
		foto="";
		quantita=1;
		datai=new Data();
		dataf=new Data();
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	@Override
	public String toString() {
		return "Servizio [nome=" + nome + ", descrizione=" + descrizione + ", prezzo=" + prezzo + ", foto=" + foto
				+ ", quantita=" + quantita + ", datai=" + datai + ", dataf=" + dataf + "]";
	}

	public Data getDatai() {
		return datai;
	}

	public void setDatai(Data datai) {
		this.datai = datai;
	}

	public Data getDataf() {
		return dataf;
	}

	public void setDataf(Data dataf) {
		this.dataf = dataf;
	}
	
}
