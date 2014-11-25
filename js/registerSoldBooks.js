$(function() {

  function registerSoldBooks(thisForm) {

    var soldBookRegisteringInfo = {};

    $(thisForm).find("input").not("input[type='submit']").each(function() {
      soldBookRegisteringInfo[this.name] = $(this).val();

    });
      console.log(soldBookRegisteringInfo); 

   $.ajax({
   
      url:"libs/sql-ajax-json.php",
   
      dataType: "json",
      data: {
      sql: "sql/sql-questions.sql",
      run: "register soldbooks",
      
      isbn: JSON.stringify(soldBookRegisteringInfo["isbn"]),
      amout: JSON.stringify(soldBookRegisteringInfo["amout"])
 
      },
      success: function(data) {
        console.log("registerSoldBooks success: ", data);
      },
      error: function(data) {
        console.log("great success",data);
      }
    });
  }

  $(".soldBookRegisteringInfo").submit(function() {
    registerSoldBooks(this);

    return false;
  });
});