<?php
function formater_jjmmaaaahhmm($date_debut)
{
	$explode_dd = explode(' ', $date_debut);
	$explode_dd2 = explode('/', $explode_dd[0]);
	$explode_dd3 = explode(':', $explode_dd[1]);
	return $explode_dd2[2].'-'.$explode_dd2[1].'-'.$explode_dd2[0].' '.$explode_dd3[0].':'.$explode_dd3[1].':00';
}

function formater_jjmmaaaa($date)
{
	$explode_dd = explode('/', $date);
	return $explode_dd[2].'-'.$explode_dd[1].'-'.$explode_dd[0];
}

function formater_heure($heure)
{
	$explode = explode(':', $heure);
	if(count($explode) == 1) //Alors, c'est séparé par h
		$explode = explode('h', $heure);
	if(count($explode) == 1) //Alors, c'est séparé par H
		$explode = explode('H', $heure);
	if(count($explode) == 1 && strlen($explode[0]) > 2) //Là, y a plus rien…
		return '00:00:00';
	if(!isset($explode[1]) || strlen($explode[1]) == 0)
	  return $explode[0].':00:00';
	else
	  return $explode[0].':'.$explode[1].':00';
}

function formater_dateheure_fr($date)
{
	$explode = explode(' ', $date);
	return formater_date_fr($explode[0]).' '.formater_heure_fr($explode[1]);
}

function formater_dateheure_iso($date)
{
	$date = new DateTime($date);
	return $date->format(DateTime::ISO8601);
}

function formater_dateheure_frus($date)
{
	$explode = explode(' ', $date);
	return formater_date_fr($explode[0]).' '.$explode[1];
}

function formater_date_fr($date)
{
	$explode = explode('-', $date);
	return $explode[2].'/'.$explode[1].'/'.$explode[0];
}

function formater_heure_fr($heure)
{
	$explode = explode(':', $heure);
	if(intval($explode[0]) >= 24) //On est dans le cas où on dépasse la fin de journée
	{
	  return faire_zero(intval($explode[0]) - 24).'h'.$explode[1].' (le lendemain)';
	} else
	  return $explode[0].'h'.$explode[1];
}

function faire_zero($nombre)
{
	if($nombre <= 9)
	  return '0'.$nombre;
	else
	  return $nombre;
}

/**
  * Le but de cette fonction est de regarder si une date contient une heure ou non, et si non, on rajoute $heure à $date
  */
function forcer_dateheure($date, $heure)
{
	if(strpos($date, ' ') === false)
		return $date.' '.$heure;
	else
		return $date;
}

function nom_type($id)
{
    switch($id)
    {
        case 1:
            return "Framapad";
            break;
        case 2:
            return "Framadate";
            break;
        case 3:
            return "Framacalc";
            break;
        case 4:
            return "Framabin";
            break;
        case 5:
            return "Lut.im";
            break;
        case 6:
            return "FramaTube";
            break;
        case 0:
        default:
            return "Autre";
    }
}

function type_lien($lien)
{
    if(!(strstr($lien, 'framapad.org') === false)) //Nolife Wiki Ajout des liens noco | Framapad Lite
        return 1;
    elseif(!(strstr($lien, 'framadate.org') === false)) //Choose a new name for poche - Framadate
        return 2;
    elseif(!(strstr($lien, 'framacalc.org') === false)) //À prendre dans l'URL…
        return 3;
    elseif(!(strstr($lien, 'framalab.org/zerobin') === false))
        return 4;
    elseif(!(strstr($lien, 'lut.im') === false))
        return 5;
    elseif(!(strstr($lien, 'framatube.org') === false))
        return 6;
    else
        return 0;
}

function traiter_titre($titre, $type_lien, $lien)
{
    switch($type_lien)
    {
        case 1:
            $ex = explode(' | ', $titre);
            if(count($ex) >= 2)
                return $ex[0];
            else //On le prend dans l'url
                return fin_url($lien);
            break;
        case 2:
            $ex = explode(' - ', $titre);
            if(count($ex) >= 2)
                return $ex[0];
            else //On le prend dans l'url
                return fin_url($lien);
            break;
        case 3:
            return fin_url($lien);
            break;
        default:
            return $titre;
            break;
    }
}

function fin_url($lien)
{
    $ex = explode('/', $lien);
    return $ex[count($ex) - 1];
}
?>