var data=new Date();
var mese=""+(data.getMonth()+1);
var giorno=""+data.getDate();
mese=aggiungiZero(mese);
giorno=aggiungiZero(giorno);
var max=data.getFullYear()+"-"+mese+"-"+giorno;
document.registrazione.data_nascita.setAttribute("max",max);//setta la data odierna come data massima
//sistema la data
function aggiungiZero(a){
    if(a.length<2){
        a="0"+a;
    }
    return a;
}
//controlla il formato dell'email
function controlloFormatoEmail(email){
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!email.match(mailformat)){
        alert("formato invalido");
    }
}

//controlla l'uguaglianza di due campi a e b
function controlloUguaglianza(a,b){
    if(a==b){
        document.getElementById("img2").src="immagini/ok.png";
        return;
    }
    if(a!=b){
        document.getElementById("img2").src="immagini/errore.png";
        document.getElementById("img2").style.width="23px";
        document.getElementById("img2").style.height="23px";
        return;
    }
}
//controlla il formato di un campo di testo nome, cognome, via, città
function controlloFormatoTesto(a){
    var esp=/^[a-zA-Z]+(\s?[a-zA-Z]+)*$/;
    if(!a.match(esp)){
        alert("formato testo errato");
    }
}
//controlla il formato dei campi numerici, non  possono esserci lettere o altro
function controlloNumeri(a){
    var esp=/^[0-9]+$/;
    if(!a.match(esp)){
        alert("formato numeri errato");
    }
}