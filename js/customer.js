$(function() {

  $(".customerInfo").submit(function() {

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
        }
        else {
        console.log("Author already exists: ", data);
          g_idAuthor = data[0]["authorId"];
         
        }
      },
       error: function(data) {
        console.log("Error",data);
      }
    });
  
  }


});



