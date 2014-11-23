// Converts an array of objects
// (usually what we'll get from a db question with sql-ajax-json.php)
// to a table. Requires jQuery to be loaded
// 
// Nodebite 2014
// For educational purposes
//

function jsonToTable(domElement,json){
  var $ = jQuery, t = $('<table/>'), i, j;
  if(!json || !json.push || !json[0]){return;}
  var th = $('<thead/>');
  for(i in json[0]){
    th.append('<td>' + i + '</td>');
  }
  t.append(th);
  var tb = $('<tbody/>');
  for(i = 0; i < json.length; i++){
    var tr = $('<tr/>');
    for(j in json[i]){
      tr.append('<td>' + json[i][j] + '</td>');
    }
    tb.append(tr);
  }
  t.append(tb);
  $(domElement).html(t);
}