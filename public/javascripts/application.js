// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
   $(".ops a").button();
   
   $("#homework_deadline").datepicker({dateFormat: $.datepicker.ISO_8601});
 });
 