$(function() {
$("input").click(function(){
  $("span").hide();
});
	
	var info={}; var form; 
	$(".soldBookRegisteringInfo").submit(function(){
		form=$(this);
		form.find("input").not("input[type='submit']").each(function(){
			info[this.name]=$(this).val();
		});
		
		checkIsbnByAjax(info);
		
		return false;
	});
	
	function checkIsbnByAjax(info){
		$.ajax({
      url:"../libs/sql-ajax-json.php",  
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "check ISBN",
        isbn: info.isbn
      },
      success:checkIsbnIsEmpty,
      error: function(data) {
        console.log("Error",data);
        
      }
    });
	
	}
	
	function checkIsbnIsEmpty(data){
	if ($.isEmptyObject(data))
       {
			$(".registeredSoldBooks").hide();
			$(".cancelSoldRegistering").css('display', 'block');
			
       }else{
			$(".cancelSoldRegistering").hide();
			form.find("input").not("input[type='submit']").val('');
			updatePrice(info)
			
	 }
	
	
	}

	
	function updatePrice(info){
	  $.ajax({
      url:"../libs/sql-ajax-json.php",  
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register soldbooks",
        isbn: info["isbn"],
        qty:info["qty"]
      },
      success: function(data) {
        console.log("uppdatePrice success: ", data);
		console.log(info.isbn)
		$(".registeredSoldBooks").show().text( info.qty +' book with ISBN: "' +info.isbn+ ' "have registered');
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
	}
	
	
  
});