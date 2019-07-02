package beam;
import java.io.Serializable;
import supporto.Data;

public class UtenteRegistrazione implements Serializable{

	private static final long serialVersionUID = 1L;
	private String email;
	private String pass;
	private String nome;
	private String cognome;
	private Data nascita;
	private String citta;
	private String via;
	private int ncv;
	private String tell;
	private String intestatario;
	private String ncarta;
	private Data scadenza;
	
	public UtenteRegistrazione(){
		email="";
		pass="";
		nome="";
		cognome="";
		setNascita(new Data());
		citta="";
		via="";
		ncv=0;
		tell="";
		intestatario="";
		ncarta="";
		scadenza= new Data();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public int getNcv() {
		return ncv;
	}

	public void setNcv(int ncv) {
		this.ncv = ncv;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getIntestatario() {
		return intestatario;
	}

	public void setIntestatario(String intestatario) {
		this.intestatario = intestatario;
	}

	public String getNcarta() {
		return ncarta;
	}

	public void setNcarta(String ncarta) {
		this.ncarta = ncarta;
	}

	public Data getScadenza() {
		return scadenza;
	}

	public void setScadenza(Data scadenza) {
		this.scadenza = scadenza;
	}

	public Data getNascita() {
		return nascita;
	}

	public void setNascita(Data nascita) {
		this.nascita = nascita;
	}
	
	@Override
	public String toString() {
		return "UtenteRegistrazione [email=" + email + ", pass=" + pass + ", nome=" + nome + ", cognome=" + cognome
				+ ", nascita=" + nascita + ", citta=" + citta + ", via=" + via + ", ncv=" + ncv + ", tell=" + tell
				+ ", intestatario=" + intestatario + ", ncarta=" + ncarta + ", scadenza=" + scadenza + "]";
	}
}
