$(function() {

  function registerBooks(regForm) {

    var bookRegisteringInfo={};

    $(regForm).find("input").not("input[type='submit']").each(function() {
      bookRegisteringInfo[regForm.name] = $(regForm).val();
    });
    console.log(bookRegisteringInfo);

    $.ajax({
      // Use Nodebite's little black box
      url:"libs/sql-ajax-json.php",
      datatype: "json",
      data: {
        // Read SQL questions from this file
        sql: "sql/sql-questions.sql",
        run: "register books",
        isbn: JSON.stringify(bookRegisteringInfo["isbn"]),
        publisherPrice: JSON.stringify(bookRegisteringInfo["publisherPrice"]),
        date: JSON.stringify(bookRegisteringInfo["date"]),
        quantity: JSON.stringify(bookRegisteringInfo["quantity"]),
        shelf: JSON.stringify(bookRegisteringInfo["shelf"])
      },
      // When we have got an response from the server
      // run something
      success: function(data) {
        console.log("registerBooks success: ", data);
      },
    });

    }
    $(".bookRegisteringInfo").submit(function() {
      registerBooks(this);

      return false

    });
});