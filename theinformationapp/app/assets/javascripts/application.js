// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

window.onload = function () {
  var select_all = document.getElementById("select_all"); //select all checkbox
  var checkboxes = document.getElementsByClassName("settings_checkbox"); //checkbox items

  //select all checkboxes
  select_all.addEventListener("change", function(e){
      for (i = 0; i < checkboxes.length; i++) { 
          checkboxes[i].checked = select_all.checked;
      }
  });


  for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener('change', function(e){ //".checkbox" change 
          //uncheck "select all", if one of the listed checkbox item is unchecked
          if(this.checked == false){
              select_all.checked = false;
          }
          //check "select all" if all checkbox items are checked
          if(document.querySelectorAll('.checkbox:checked').length == checkboxes.length){
              select_all.checked = true;
          }
      });
  }
}