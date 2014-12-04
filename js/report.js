$(function() {

	$(".earningsForDate").click(function() {
    var formTitle = {};
    formTitle["title"] = $(".bookRegisteringInfo input[name='title']").val();
    formTitle["startingdate"] = $(".bookRegisteringInfo input[name='startingdate']").val();
    formTitle["endingdate"] = $(".bookRegisteringInfo input[name='endingdate']").val();
    console.log(formTitle);
    showEarningsForTheTitle(formTitle);
    return false;
  });
	function showEarningsForTheTitle(formTitle) {

     $.ajax({
        url:"../libs/sql-ajax-json.php",
        dataType: "json",
        data: {
        sql: "sql/sql-questions.sql",
		run: "show earnings",
		title: JSON.stringify(formTitle["title"]),
		//need to check if we need to stringify the "date" as a form??? 
		startingdate: JSON.stringify(formTitle["startingdate"]),
		endingdate: JSON.stringify(formTitle["endingdate"])
        },
        success: function(data) {
        //need to create if sats: if there is a title in the database as the one the owner entered,we loop the earnings 
        //for the particular dates the owner entered(sql question???)
        //else: if there is not a title , loop all the earnings for the dates the owner entered
          console.log("showEarningsForTheTitle",data);
        },
        error: function(data) {
          console.log("Error",data);
        }
      });



	}

});