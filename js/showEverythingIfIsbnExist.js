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
          registerIsbn(formInfo);
        }
        else {
         console.log( "showEverythingIfIsbnExist",data);
          $("#title").val(data.title);
          // if only name attribute is title
          $('input[name="title"]').val(data.title);
        
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