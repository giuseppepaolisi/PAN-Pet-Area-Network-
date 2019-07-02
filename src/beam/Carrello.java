package beam;

import java.util.ArrayList;
import java.util.List;

import supporto.Data;

public class Carrello {
	private List<Servizio> list;
	
	public Carrello(){
		list=new ArrayList<Servizio>();
	}
	
	public void addServizio(Servizio ser){
		for(Servizio x:list){
			if(x.getNome().equals(ser.getNome())){
				x.setQuantita(x.getQuantita()+1);
				return;
			}		
		}
		if(ser.getNome().equals("Custodia")){
			ser.getDataf().setDay(1);
		}
		list.add(ser);
	}
	public void deleteServizio(Servizio ser){
		for(Servizio x: list){
			if(x.getNome().equals(ser.getNome())){
				list.remove(x);
				return;
			}
		}
	}
	public List<Servizio> getServizi(){
		return list;
	}
	
	public double getTotale(){
		double tot=0;
		for(Servizio ser:list){
			if(ser.getNome().equals("Custodia")){
				long millisDiff = ser.getDataf().getData().getTimeInMillis()-ser.getDatai().getData().getTimeInMillis();
				int days = (int) (millisDiff / 86400000);
				tot+=ser.getPrezzo()*ser.getQuantita()*days;
				System.out.println(days);
				System.out.println(ser.getQuantita());
			}
			else
				tot+=ser.getPrezzo()*ser.getQuantita();
		}
		return tot;
	}
	public void updateServizio(String id,int qta,Data datai,Data dataf){
		for(Servizio x: list){
			if(x.getNome().equals(id)){
				if(dataf.getData().compareTo(datai.getData())<1) return;
				x.setQuantita(qta);
				x.setDatai(datai);
				x.setDataf(dataf);
				return;
			}
		}
	}
	
	public void updateServizio(String id,int qta,Data datai){
		for(Servizio x: list){
			if(x.getNome().equals(id)){
				x.setQuantita(qta);
				x.setDatai(datai);
			}
		}
	}
}