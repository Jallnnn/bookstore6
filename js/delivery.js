$(function() {

	// Global variables
	var g_idAuthor;
	var g_idShelf;

  	$(".bookRegisteringInfo").submit(function() {

		var formInfo = {};

		$(this).find("input").not("input[type='submit']").each(function() {
			formInfo[this.name] = $(this).val();
		});

		console.log(formInfo);
		checkAuthorExists(formInfo);

		return false;
	});


	function checkAuthorExists(formInfo){
	
		$.ajax({
			url:"../libs/sql-ajax-json.php",
			dataType: "json",
			data: {
				sql: "sql/sql-questions.sql",
				run: "check author",
				fname: JSON.stringify(formInfo["fname"]),
				lname: JSON.stringify(formInfo["lname"])
			},
			success: function(data) {
				if ($.isEmptyObject(data)){
					console.log("Author not found!");
					registerAuthor(formInfo);
				}
				else {
				console.log("Author already exists: ", data);
					g_idAuthor = data[0]["authorId"];
          checkShelfExists(formInfo);
        }
      },
       error: function(data) {
        console.log("Error",data);
      }
    });
	
	}

	function registerAuthor(formInfo) {

      $.ajax({

        url:"../libs/sql-ajax-json.php",
        dataType:"json",
        data: {
          sql:"sql/sql-questions.sql",
          run:"register author",
          fname: JSON.stringify(formInfo["fname"]),
          lname: JSON.stringify(formInfo["lname"])
        },
        success: function(data) {
          console.log("registerAuthor success: ", data);
          checkAuthorExists(formInfo);
        },
        error: function(data){
          console.log("Great error:",data);
        }
      });

    }

  function checkShelfExists(formInfo){
	
		$.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "check shelf",
        shelf_id: JSON.stringify(formInfo["shelf_id"])
      },
      success: function(data) {
        if ($.isEmptyObject(data)){
          console.log("Shelf not found!");
          registerShelf(formInfo);
        }
        else {
          console.log("Shelf already exists: ", data);
          g_idShelf = data[0]["shelf_id"];
          checkIsbnExists(formInfo);
        }
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
	
	}

	function registerShelf(formInfo) {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType:"json",
      data: {
        sql:"sql/sql-questions.sql",
        run:"register shelf",
        shelf_id: JSON.stringify(formInfo["shelf_id"])
      },
      success: function(data) {
        console.log("registerShelf success: ", data);
        checkShelfExists(formInfo);
      },
      error: function(data){
        console.log("Great error:",data);
      }
    });

  }

	function checkIsbnExists(formInfo){
	
		$.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "check ISBN",
        isbn: formInfo["isbn"]
      },
      success: function(data) {
        if ($.isEmptyObject(data)){
          console.log("Isbn not found!");
          registerIsbn(formInfo);
        }
        else {
          console.log("Isbn already exists");
          $(".bookFound").show();
          registerDelivery(formInfo);
         
        }
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
	
	}

  function mathsFprice(formInfo) {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register saleprice",
        salePrice: formInfo["fprice"] * 1.8,
        isbn: formInfo["isbn"]
      },
      success: function(data) {
        console.log("mathsFprice success: ", data);
       
      },
      error: function(data) {
        console.log("Error: ", data);
      }
    });
  }

  $(".CheckIfIsbnExist").click(function() {
   var formInfo = {};
   var $inputs = $('.bookRegisteringInfo :input');
 
    $inputs.each(function() {
      formInfo[this.name] = $(this).val();
   
    });
 
    showEverythingIfIsbnExist(formInfo);
    return false;
  });

    function showEverythingIfIsbnExist(formInfo) {
      $.ajax({
        url:"../libs/sql-ajax-json.php",
        dataType: "json",
        data: {
          sql: "sql/sql-questions.sql",
          run: "show everything",
          isbn: formInfo["isbn"]
        },
        success: function(data) {
           if ($.isEmptyObject(data)){
          console.log("Isbn not found!");
          registerIsbn(formInfo);
          
        }
        else {
         console.log( "showEverythingIfIsbnExist",data);
         
         for (var i = 0; i < data.length; i++) {
          $("#title").val(data[i].title);
          $("#fname").val(data[i].fname);
          $("#lname").val(data[i].lname);
          $("#fprice").val(data[i].publisher_price);
          $("#shelf_id").val(data[i].shelf_id);
          $(".touchless").attr('disabled','disabled');
         }
          console.log("Isbn already exists");
          $(".bookFound").show();
          registerDelivery(formInfo);
        }
         
        },
        error: function(data) {
          console.log("Error",data);
        }
      });

    }

 
});
