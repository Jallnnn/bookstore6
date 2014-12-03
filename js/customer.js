$(function() {

  $(".isbnSearch").submit(function() {

    var formInfo = {};

    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });

    // console.log(formInfo);
    // checkAuthorIfExists(formInfo);
    // checkIsbnExists(formInfo);

    showAll(formInfo);

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

  //   function checkIsbnExists(){
  
  //   $.ajax({
  //     url:"../libs/sql-ajax-json.php",
  //     dataType: "json",
  //     data: {
  //       sql: "sql/sql-questions.sql",
  //       run: "check ISBN",
  //       isbn: isbnSearch["isbn"]
  //     },
  //     success: showResult
  //   });
  
  // }




  
  function showAll(formInfo) {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "show search",
        isbn: formInfo["isbn"]
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
      article.append('<span class="searchFname">' + data[i]["fname"] + '</span>');
      article.append('<span class="searchLname">' + data[i]["lname"] + '</span>');
      article.append('<span class="searchPrice">' + data[i]["price"] + '</span>');
      // article.append('span class="searchInStock">' + data[i]["in_stock"] + '</span>');
      article.append('<span class="searchShelf">' + data[i]["shelf_id"] + '</span>');

      $('.search-listing').append(article);
    }

  }

});



