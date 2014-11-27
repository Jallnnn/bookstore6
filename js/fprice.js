$(function() {

  var registerFpriceInfo = {};

    
  function registerFprice(thisForm) {

    console.log("registerFpriceInfo: ", registerFpriceInfo);

    $.ajax({
     
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "register fprice",
        f_price: registerFpriceInfo["f_price"]
      },

      success: mathsFprice,
      
    });
  }

  function mathsFprice(thisForm) {

    $.ajax({
     
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "calculate saleprice",
        // isbn: registerFpriceInfo["isbn"],
        salePrice: registerFprice["salePrice"]
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
    $(this).find("input").not("input[type='submit']").each(function() {
      registerFpriceInfo[this.name] = $(this).val();
    });
   

    registerFprice(this);

    return false;
  });

});