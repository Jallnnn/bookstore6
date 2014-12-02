$(function() {

  $(".customerInfo").submit(function() {

    var formInfo = {};

    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });

    console.log(formInfo);
    checkAuthorIfExists(formInfo);
    checkIsbnExists(formInfo);

    showAll();

    return false;
  });
   
 function checkAuthorIfExists(formInfo){
  
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
        }
      },
       error: function(data) {
        console.log("Error",data);
      }
    });
  
  }

    function checkIsbnExists(formInfo){
  
    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "check ISBN",
        isbn: formInfo["isbn"]
      },
      success: showResult
    });
  
  }




  
  function showAll() {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "show search",
      },
      success: showResult
    });
  }

  function showResult(data) {

console.log("Please work: ", data);

    $('.search-listing article').not('.search-column-names').remove();

    for(var i = 0; i < data.length; i++) {
     
      var article = $('<article/>');

      article.append('<span class="searchIsbn">' + data[i]["isbn"] + '</span>');
      article.append('<span class="searchTitle">' + data[i]["title"] + '</span>');

      $('.search-listing').append(article);
    }

  }

});



