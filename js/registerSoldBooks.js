$(function() {

  function registerSoldBooks(thisForm) {

    var soldBookRegisteringInfo = {};

    $(thisForm).find("input").not("input[type='submit']").each(function() {
      soldBookRegisteringInfo[this.name] = $(this).val();

    });


   $.ajax({
   
      url:"libs/sql-ajax-json.php",
   
      dataType: "json",
      data: {
      sql: "sql-questions.sql",
      
      run: "register sold books",
      
      isbn: JSON.stringify(soldBookRegisteringInfo["isbn"]),
      amount: JSON.stringify(soldBookRegisteringInfo["amount"])
 
      },
      success: function(data) {
        console.log("registerSoldBooks success: ", data);
      }
    });
  }

  $(".soldBookRegisteringInfo").submit(function() {
    registerSoldBooks(this);

    return false;
  });
});