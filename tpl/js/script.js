function simpleXhrSentinel(xhr, callback) {
    return function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200)
            {
                callback();
            }
            else
                alert("XMLHttpRequest error: " + xhr.status);
        }
    }
}

function cb_deco()
{
    /*document.getElementById('nav_connexion').style.display = 'block';
    document.getElementById('nav_deconnexion').style.display = 'none';*/
    //alert('deconnecté !');
    /*if(utilisateur != '')
        window.location.reload();*/
}

function se_connecter(assertion)
{
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "connexion.php", true);
    var param = "assert="+assertion;
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("Content-length", param.length);
    xhr.setRequestHeader("Connection", "close");
    xhr.send(param); // for verification by your backend
    xhr.onreadystatechange = simpleXhrSentinel(xhr, cb_co);
}

function cb_co()
{
    /*document.getElementById('nav_connexion').style.display = 'none';
    document.getElementById('nav_deconnexion').style.display = 'block';*/
    //alert('connecté !');
    /*if(utilisateur == '')
        window.location.reload();*/
}

function se_deconnecter()
{
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "deconnexion.php", true);
    xhr.send(null);
    xhr.onreadystatechange = simpleXhrSentinel(xhr, cb_deco);
}