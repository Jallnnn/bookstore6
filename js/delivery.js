$function() {

  function currentAuthors(formInfo) {

    $ajax({

      url:"../libs/sql-ajax-json.php",
      datatype:"json",
      data:{
        sql: "sql/sql-questions.sql",
        run: "get authors"

      },
      success: function (data) {
//if the author exists, we can export the fname and lname from here("inside "if{}"), 
//we just need to create a loop and export it to the html(possibly in "<input>").        
        if (formInfo["fname"] == data[0]["fname"] || formInfo["lname"] == data[0]["lname"]) {

        else {
          registerAuthors(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }

  function registerAuthors(formInfo) {

    $ajax({

      url:"../libs/sql-ajax-json.php",
      data:"json",
      data: {
        sql:"sql/sql-questions.sql",
        run:"register author"
        fname: JSON.stringify(bookRegisteringInfo["fname"]),
        lname: JSON.stringify(bookRegisteringInfo["lname"])

      },
      success: function(data) {
        console.log("registerAuthors success: ", data);
      },
      error: function(data){
        console.log("Great error:",data)
      }

    });

  } 

  function currentShelves(formInfo) {

    $ajax({

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

        else {
          registerShelf(formInfo);
        }
      },
      error: function(data) {
        console.log("error: ", data);
        
      }

    });

  }
  function registerShelf(formInfo) {

    $ajax({

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
  
  $(".bookRegisteringInfo").submit(function() {
    var formInfo = {};
    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    currentAuthors(formInfo);
    return false
  }); 

});