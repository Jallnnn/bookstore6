$(function() {


/*
 

  function currentShelves(formInfo) {

    $.ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data:{
        sql: "sql/sql-questions.sql",
        run: "get shelves"

      },
      success: function (data) {
//if the shelf exists, we can export the shelf from here("inside "if{}"), 
//we just need to create a loop and export it to the html(possibly in "<input>").        
        if (formInfo["shelf"] == data[0]["shelf"]) {
          formInfo.shelfData = data;
          registerTittle(formInfo);

        } else {
          registerShelf(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }
  function registerShelf(formInfo) {

    $.ajax({

      url:"../libs/sql-ajax-json.php",
      data:"json",
      data: {
        sql:"sql/sql-questions.sql",
        run:"register shelf"
        shelf: JSON.stringify(bookRegisteringInfo["shelf"]),
        

      },
      success: function(data) {
        console.log("registerShelf success: ", data);
      },
      error: function(data){
        console.log("Great error:",data)
      }

    });

  } 
  function currentTittles(formInfo) {

    $.ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data:{
        sql: "sql/sql-questions.sql",
        run: "get tittles"

      },
      success: function (data) {
//if the tittle exists, we can export the tittle from here("inside "if{}"), 
//we just need to create a loop and export it to the html(possibly in "<input>").        
        if (formInfo["tittle"] == data[0]["tittle"]) {
          return;

        else {
          registerTittle(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }
  function registerTittle(formInfo) {

    $ajax({

      url:"../libs/sql-ajax-json.php",
      data:"json",
      data: {
        sql:"sql/sql-questions.sql",
        run:"register tittle"
        tittle: JSON.stringify(bookRegisteringInfo["tittle"]),
        

      },
      success: function(data) {
        console.log("registerTittle success: ", data);
      },
      error: function(data){
        console.log("Great error:",data)
      }

    });

  } 
  */
  function currentIsbns(formInfo) {

    $.ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data:{
        sql: "sql/sql-questions.sql",
        run: "get all isbn"

      },
      success: function (data) {
        var foundIsbn = false;
          if (formInfo["isbn"] == data[0]["isbn"]) {
          foundIsbn=true;
        }
        if (foundIsbn) {
          return;
        }else {
          currentAuthors(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }

  function currentAuthors(formInfo) {
     console.log("function info", formInfo);
    $.ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data:{
        sql: "sql/sql-questions.sql",
        run: "get authors"

      },
      success: function (data) {
        console.log("founddata", data);
        var foundAuthor = false;
        for (var i = 0; i < data.length; i++) {
          if (formInfo["fname"] != data[i]["fname"] || formInfo["lname"] != data[i]["lname"]) {
            formInfo.authorsData = data;
            registerAuthors(formInfo);
            
//            registerShelf(formInfo);
            foundAuthor = true;

          }
        }

        if (foundAuthor) {

          return;
        } else {
          registerShelf(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }

  function registerAuthors(formInfo) {

      $.ajax({

        url:"../libs/sql-ajax-json.php",
        dataType:"json",
        data: {
          sql:"sql/sql-questions.sql",
          run:"register author",
          fname: JSON.stringify(formInfo["fname"]),
          lname: JSON.stringify(formInfo["lname"])
        },
        success: function(data) {
          
          console.log("registerAuthors success: ", data);
        },
        error: function(data){
          console.log("Great error:",data);
        }

      });

  }
/*
  function registerISBN(formInfo) {
    console.log()

    $.ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data: {
        sql:"sql/sql-questions.sql",
        run:"register isbn",
        isbn: JSON.stringify(formInfo["isbn"])

      },
      success: function(data) {
        console.log("registerAuthors success: ", data);

      },
      error: function(data){
        console.log("Great error:",data);
      }

    });

  }
*/
  $(".CheckIfIsbnExist").click(function() {
    var formInfo = {};
    formInfo["isbn"] = $(".bookRegisteringInfo input[name='isbn']").val();
    console.log(formInfo);
    currentIsbns(formInfo);

  });

  
  $(".bookRegisteringInfo").submit(function() {
    var formInfo = {};
    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    currentIsbns(formInfo);
    
    return false;
  });

});