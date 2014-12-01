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
          // TODO add error css
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
          // TODO add error css
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
          showEverythingIfIsbnExist(formInfo);
         
        }
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
	
	}

	function registerIsbn(formInfo){
	
		$.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register isbn",
        isbn: formInfo["isbn"],
        title: JSON.stringify(formInfo["title"]),
        idAuthor: g_idAuthor,
        idShelf: JSON.stringify(g_idShelf)
      },
      success: function(data) {
        console.log("registerIsbn success: ", data);
        $(".registeredNewBook").show();
        registerDelivery(formInfo);
      },
      error: function(data) {
        console.log("great error",data);
      }
    });
	
	}

	function registerDelivery(formInfo){
	
		$.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register delivery",
        isbn: formInfo["isbn"],
        fprice: formInfo["fprice"],
        qty: formInfo["qty"]
      },
      success: function(data) {
        console.log("registerDelivery success: ", data);
        mathsFprice(formInfo);
      },
      error: function(data) {
        console.log("great error",data);
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
    formInfo["isbn"] = $(".bookRegisteringInfo input[name='isbn']").val();
    console.log(formInfo);
    checkIsbnExists(formInfo);

    });

    function showEverythingIfIsbnExist(formInfo) {
      $.ajax({
        url:"../libs/sql-ajax-json.php",
        dataType: "json",
        data: {
          sql: "sql/sql-questions.sql",
          run: "show everything",
          isbn: formIsbn["isbn"]
        },
        success: function(data) {
          console.log(data); // --> check the data you get back - do you have a title
          // if id
          $("#title").val(data.title);
          // if only name attribute is title
          $('input[name="title"]').val(data.title);
        registerDelivery(formInfo);
        },
        error: function(data) {
          console.log("Error",data);
        }
      });

    }







});
