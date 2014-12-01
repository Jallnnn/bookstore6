$(function(){
	
	var info={}; var form;
	$(".updatePriceInfo").submit(function(){
		form=$(this);
		form.find("input").not("input[type='submit']").each(function(){
			info[this.name]=$(this).val();
		});
		
		checkIsbnByAjax(info);
		
		return false;
	});
	
	function checkIsbnByAjax(info){
	
	console.log(info)
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
			$(".updatePriceSuccess").hide();
			$(".bookNoExist").css('display', 'block');
			
       }else{
			$(".bookNoExist").hide();
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
        run: "uppdatePrice",
        isbn: info["isbn"],
        salePrice:info["salePrice"]
      },
      success: function(data) {
        console.log("uppdatePrice success: ", data);
		$(".updatePriceSuccess").show();
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
	}
	
	
});

