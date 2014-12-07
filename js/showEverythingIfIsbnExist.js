$(function() {

  $(".CheckIfIsbnExist").click(function() {
    var formIsbn = {};
    formIsbn["isbn"] = $(".bookRegisteringInfo input[name='isbn']").val();
    console.log(formIsbn);
    showEverythingIfIsbnExist(formIsbn);
    return false;
  });

    function showEverythingIfIsbnExist(formIsbn) {
      $.ajax({
        url:"../libs/sql-ajax-json.php",
        dataType: "json",
        data: {
          sql: "sql/sql-questions.sql",
          run: "show everything",
          isbn: formIsbn["isbn"]
        },
        success: function(data) {
           if ($.isEmptyObject(data)){
          console.log("Isbn not found!");
          $(".bookFound").show();
          
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
          
         
        }
         
        },
        error: function(data) {
          console.log("Error",data);
        }
      });

    }
});