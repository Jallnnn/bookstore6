$(function() {

  // Global Variable
  var form;

  $("input").click(function(){
    $(".noMatch").hide();
  });

  $(".isbnSearch").submit(function() {

    var formInfo = {};
    form = $(this);

    form.find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    
    showIsbnSearch(formInfo);
    
    return false;
  });

  $(".titleSearch").submit(function() {

    var formInfo = {};
    form = $(this);

    form.find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    
    showTitleSearch(formInfo);
    
    return false;
  });

  $(".authorSearch").submit(function() {

    var formInfo = {};
    form = $(this);

    form.find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    
    showAuthorSearch(formInfo);

    return false;
  });
   
   
  function showIsbnSearch(formInfo) {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "show search-isbn",
        isbn: formInfo["isbn"]
      },
      success: function(data) {
        if ($.isEmptyObject(data)){
          // console.log("Book not found!");
          $(".noMatch").show();
        }
        else {
          form.find("input").not("input[type='submit']").val('');
          showResult(data);
        }
      },
       error: function(data) {
        // console.log("Error",data);
      }
    });
  }

  function showTitleSearch(formInfo) {
    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "show search-title",
        title:  JSON.stringify("%" + formInfo["title"] + "%")
      },
      success: function(data) {
        if ($.isEmptyObject(data)){
          // console.log("Title not found!");
          $(".noMatch").show();
        }
        else {
          form.find("input").not("input[type='submit']").val('');
          showResult(data);
        }
      },
       error: function(data) {
        // console.log("Error",data);
      }
    });
  }

  function showAuthorSearch(formInfo) {

    $.ajax({
      url:"../libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/sql-questions.sql",
        run: "show search-author",
        fname:  JSON.stringify(formInfo["fname"]),
        lname:  JSON.stringify(formInfo["lname"])
      },
      success: function(data) {
        if ($.isEmptyObject(data)){
          // console.log("Name not found!");
          $(".noMatch").show();
        }
        else {
          form.find("input").not("input[type='submit']").val('');
          showResult(data);
        }
      },
       error: function(data) {
        // console.log("Error",data);
      }
    });
  }

  function showResult(data) {

    // console.log("Please work!: ", data);

    $('.search-listing article').not('.search-column-names').remove();

    for(var i = 0; i < data.length; i++) {
     
      var article = $('<article/>');

      article.append('<span class="searchIsbn">' + data[i]["isbn"] + '</span>');
      article.append('<span class="searchTitle">' + data[i]["title"] + '</span>');
      article.append('<span class="searchFname">' + data[i]["fname"] + '</span>');
      article.append('<span class="searchLname">' + data[i]["lname"] + '</span>');
      article.append('<span class="searchPrice">' + data[i]["price_with_vat"] + '</span>');
      article.append('<span class="searchInStock">' + data[i]["in_stock"] + '</span>');
      article.append('<span class="searchShelf">' + data[i]["shelf_id"] + '</span>');

      $('.search-listing').append(article);
    }

  }

});
