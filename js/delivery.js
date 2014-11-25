$(function() {

  function registerAuthors(regForm) {

    var bookRegisteringInfo={};

    $(regForm).find("input").not("input[type='submit']").each(function() {
      bookRegisteringInfo[this.name] = $(this).val();
    });
    console.log(bookRegisteringInfo);

    $.ajax({
      // Use Nodebite's little black box
      url:"../libs/sql-ajax-json.php",
      datatype: "json",
      data: {
        // Read SQL questions from this file
        sql: "sql/sql-questions.sql",
        run: "register books",
        firstName: JSON.stringify(bookRegisteringInfo["firstName"]),
        lastName: JSON.stringify(bookRegisteringInfo["lastName"])
      },
      // When we have got an response from the server
      // run something
      success: function(data) {
        console.log("registerAuthors success: ", data);
      },
      error: function(data){
        console.log("Great error:",data)
      }
    });

    }
    $(".bookRegisteringInfo").submit(function() {
      registerAuthors(this);

      return false;

    });
});