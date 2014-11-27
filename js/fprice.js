$(function() {

  function registerFprice(thisForm) {

    var registerFpriceInfo = {};

    $(thisForm).find("input").not("input[type='submit']").each(function() {
      registerFpriceInfo[this.name] = $(this).val();
    });

    console.log("registerFpriceInfo: ", registerFpriceInfo);

    $.ajax({
     
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register fprice",
        isbn: registerFpriceInfo["isbn"],
        f_price: registerFpriceInfo["f_price"]
      },

      success: function(data) {
        console.log("registerFprice success: ", data);
        $(".registerFprice").show();
      },
      error: function(data) {
        console.log("Error: ", data);
        $(".cancelRegisterFprice").show();
      }
    });
  }

  $(".registerFpriceInfo").submit(function() {
    registerFprice(this);

    return false;
  });

});