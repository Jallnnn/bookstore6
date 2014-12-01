$(function() {

  $(".customerInfo").submit(function() {

    var formInfo = {};

    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });

    console.log(formInfo);
    checkAuthorIfExists(formInfo);
    checkIsbnExists(formInfo);

    return false;
  });
   
 function checkAuthorIfExists(formInfo){
  
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
        }
        else {
        console.log("Author already exists: ", data);
        }
      },
       error: function(data) {
        console.log("Error",data);
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
        }
        else {
          console.log("Isbn already exists");
          $(".bookFound").show();
        }
      },
      error: function(data) {
        console.log("Error",data);
      }
    });
  
  }


});



