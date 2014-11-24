$(function() {

  function registerBooks(regForm) {

    var bookRegisteringInfo={};

    $(regForm).find("input").not("input[type='submit']").each(function() {
      bookRegisteringInfo[this.name] = $(this).val();
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
        title: JSON.stringify(bookRegisteringInfo["title"]),
        firstName: JSON.stringify(bookRegisteringInfo["firstName"]),
        lastName: JSON.stringify(bookRegisteringInfo["lastName"]),
        publisherPrice: JSON.stringify(bookRegisteringInfo["publisherPrice"]),
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

      return false;

    });
});