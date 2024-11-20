<?php
$config=array(); // fresh config
$config["appname"]="Wishes";

ini_set("magic_quotes_runtime", 0);

$_SERVER["HTTP_HOST"]="localhost";

if ($_SERVER["HTTP_HOST"]=="localhost"){
	error_reporting(E_ALL);
	ini_set('display_errors','On');
	ini_set('error_log','cache/error.log');
}
else {
	error_reporting(E_ALL&~E_NOTICE);
	ini_set('display_errors','Off');
	ini_set('error_log','cache/error.log');
}

// paths setup
$config["rootdir"]=strtr(dirname(__FILE__),"\\","/")."/"; //path to the site files

$config["lib"]=$config["rootdir"]."wwwlib/";

$config["cachedir"]="cache/"; //relative to rootdir(no / at bg)
$config["templatedir"]=array($config["rootdir"]."templates/",$config["lib"]."../templates/");
$config["templateexpired"]="modtime"; //force|modtime

// db setup
$config["dbtype"]="pdo";
$config["dbname"]="sqlite:db/wish.db";

$config["lang"]="pl";
?>
