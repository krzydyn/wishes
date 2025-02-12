<?php
require_once("config.php");
require_once($config["lib"]."php/modules.php");
require_once($config["lib"]."php/application.php");

class App extends Application{
	var $db;
	function initialize() {
		$db=DB::connectDefault();
		$this->db=$db;
		$tabs=$db->tables();
		$reqtabs=array(
			"wishes"=>"name char(20) primary key,updatetm int,value text"
		);
		if ($tabs===false){
			$this->addval("error","DB:".$db->errmsg());
			return false;
		}
		foreach ($reqtabs as $t => $v) {
			if (in_array($t,$tabs)) continue;
			$r=$db->tabcreate($t,$v);
			if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		}
		if ($this->getval("req.theme") == "dark") {
			$this->setval("theme", "dark");
			setcookie("theme", "dark");
		}
		else {
			$this->setval("theme", "bright");
			setcookie("theme", "", -1);
		}
	}
	function process(){
		$this->setval("refresh",600);
		$this->setval("sitetitle","Lista życzeń");
		parent::process();
	}
	function defaultAction(){
		$this->listAction();
	}
	function editAction(){
		$id=$this->getval("req.id");
		if (!empty($id)){
			$r=$this->db->tabfind("wishes","name,value","where name=#name",array("name"=>$id));
			if ($r===false) {
				$this->addval("error","DB:".$this->db->errmsg());
				$this->listAction();
				return ;
			}
			if (sizeof($r)==0) {
				$this->listAction();
				return ;
			}
			$item=$r[0];
		}
		else $item=array("name"=>"","value"=>"");
		$this->setval("refresh",0);
		$this->setval("item",$item);
		$this->setval("view","ankietaitem");
	}
	function delAction(){
		$id=$this->getval("req.id");
		$r=$this->db->tabdelete("wishes","where name=#name",array("name"=>$id));
		if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
		$this->listAction();
	}
	function saveAction(){
		$this->setval("refresh",5);
		$id=$this->getval("req.id");
		$item=$this->getval("req.item");
		foreach ($item as $f => $v)
			$item[$f]=trim($item[$f]);

		if (empty($item["name"])) {
			$this->addval("error","Nazwa nie może być pusta");
			$this->listAction();
			return ;
		}
		$item["updatetm"]=time();
		logstr("item=".print_r($item, true));
		if (empty($id)){
			$r=$this->db->tabinsert("wishes",$item);
			if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
			else $this->addval("info","dodano");
		}
		else {
			$r=$this->db->tabupdate("wishes",$item,"where name=#name",array("name"=>$id));
			if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
			else $this->addval("info","zaktualizowano");
		}
		$this->listAction();
	}
	function listAction(){
		$items=array();
		$this->listItems($items);
		$tm=0;
		for ($i=0; $i<sizeof($items); ++$i)
			if ($tm<$items[$i]["updatetm"])$tm=$items[$i]["updatetm"];
		$this->setval("lastupdate",$tm);
		$this->setval("items",$items);
		$this->setval("view","ankietalist");
	}
	function listItems(&$items){
		$r=$this->db->tabfind("wishes","name,updatetm,value","order by updatetm desc");
		if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
		else {
			for ($i=0; $i<sizeof($r); ++$i){
				$item=$r[$i];
				$item["value"]=nl2br(html_fromBB($item["value"]));
				$items[]=$item;
			}
		}
		$item=array();
		$item["name"]="";
		$item["updatetm"]="";
		$item["value"]="";
		$items[]=$item;
	}
}
$a=new App();
$a->initialize();
$a->process();
unset($a);
$t=new TemplateEngine();
$t->load("ankieta.tpl");
?>
