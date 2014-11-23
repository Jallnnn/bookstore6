<?php

// sql-ajax-json
// Looks in an sql-file for sql-questions
// Replaces {vars} with data from ajax
// Returns the result as json (an array of objects)
//
// Nodebite 2014
// For educational purposes

// short alias for requests
$r = $_REQUEST;

// Load sql file
if(strpos($r["sql"],".sql") === false){
  $r["sql"] .= ".sql";
}

// Assume we are in a sub folder inside the project folder
$r["sql"] = $root."../".$r["sql"];

// Load the question file if it exists
if(file_exists($r["sql"])){
  $sql = file_get_contents($r["sql"]);
}
else {
  die('{error:"Can not find sql file."}');
}

// SQL file without whitespace
$nows = preg_replace("/\s/","",preg_replace("/\n/","#",$sql));

// Split nows
$snows = explode("#",$nows);

// Get connection info
$info = array("hostname" => "","username" => "","password" => "","database" => "");
foreach($snows as $line){
  $p = explode(":",$line);
  foreach($info as $key => $val){
    if($key == $p[0]){$info[$key] = $p[1];}
  }
}

// Get question to run - $do
$sql = explode("#",$sql);
$do = "";
foreach($sql as $part){
  $lines = explode("\n",$part);
  if(preg_replace("/\s/","",$r["run"]) == preg_replace("/\s/","",$lines[0])){
    array_shift($lines);
    $do = implode("",$lines);
  }
}
$do = explode(";",$do);
$do = $do[0];

if($do == ""){
   die('{error:"Can not find question to run."}');
}

// Replace variables in question
unset($r["sql"]);
unset($r["run"]);
foreach($r as $key => $val){
  $do = str_replace("{".$key."}",$val,$do);
}

if(strpos($do,"{") !== false || strpos($do,"}") !== false){
    die('{error:"Can not find variable data."}');
}

// Use PDOHelper to run the dbquery
$dbh = new PDOHelper($info["hostname"],$info["database"],$info["username"],$info["password"]);
echo($dbh -> jsonQuery($do));


// ------------------------------------------------------------------------------------------

class PDOHelper {
 
  protected function connectToDatabase($host,$dbname,$user,$pass){
 
    return new PDO(
      "mysql:host=$host;dbname=$dbname",
      $user,
      $pass,
      // detta TVINGAR MySQL att använda UTF-8
      // mycket trevligt och gör att vi inte riskerar problem 
      // med åäö (t.ex. vid konvertering till json)
      array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
    );
  }
 
  protected function fixNumerics($result){
    // PDO har den tråkiga ovanan att returnera nummer som strängar
    // låt oss fixa det, så att nummer blir nummer igen...
    foreach ($result as &$row) {
      foreach ($row as $key => &$val) {
        if (is_numeric($val)) {
          $row[$key] = (float) $val;
        }
      }
    }
    return $result;
  }
 
  public function query($sql){
    $query = $this->PDO->prepare($sql);
    $query->execute();
    // hämta bara ett resultat om vi gör en select
    if(stripos($sql,'SELECT') === 0){
      $result = $this->fixNumerics($query->fetchAll(PDO::FETCH_ASSOC));
      return $result;
    }
    // annars returnerar vi bara true
    return true;
  }
 
  public function jsonQuery($sql){
    $phpver = explode(".",phpversion());
    while(count($phpver)>2){array_pop($phpver);}
    $phpver = implode(".",$phpver) / 1;
    if($phpver >= 5.4){
      return json_encode($this -> query($sql),JSON_PRETTY_PRINT);
    }
    return json_encode($this -> query($sql));
  }
 
  // konstruktor
  public function __construct($host,$dbname,$user="root",$pass="mysql"){
    $this -> PDO = $this -> connectToDatabase($host,$dbname,$user,$pass);
  }
}