package supporto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
/*
 * dd-mm-aaaa formato di html            new SimpleDateFormat("dd-MM-yyyy");
 * aaaa-mm-dd formato del database       new SimpleDateFormat("yyyy-MM-dd");
 */
public class Data {
	private Calendar data;
	private static SimpleDateFormat sdf;
	
	public Data(){
		data=new GregorianCalendar();
	}
	
	public Calendar getData(){
		return data;
	}
	
	public void setData(Calendar newdata){
		data=newdata;
	}
	
	public String getDataSTR(){//ritona una stringa 
		sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(data.getTime());
	}
	
	public String reverseData(){
		sdf= new SimpleDateFormat("dd-MM-yyyy");
		return sdf.format(data.getTime());
	}
	
	public void setDay(int day) {
		data.add(Calendar.DAY_OF_MONTH, day);
	}
	
	public void setMonth(int month){
		if(month>=0 || month<=11)
			data.add(Calendar.MONTH,month);
	}
	
	public static Calendar converti(String str,String formato){//converte una stringa che ha lo stesso formato passato in un calendar
		sdf=new SimpleDateFormat(formato);
		Calendar cal;
		try {
			cal = Calendar.getInstance();       
			cal.setTime(sdf.parse(str));
			return cal;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static String dd_MM_yyyy(String datastr){
		return datastr.substring(8,10)+datastr.substring(4,8)+datastr.substring(0,4);
	}
}
