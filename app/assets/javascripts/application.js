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
//= require clipboard
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);

});

$(document).ready(function() {
  $('[data-toggle-styles]').click(function(event){
    var classes = ["bold", "normal", "italic", "bold-italic"];

    // First remove existing styles; otherwise everything trends to bold italic
    $("p").each(function(){
      $(this).removeClass("bold italic bold-italic");
    });

    // Apply styles randomly
    $("p").each(function(){
      index = Math.floor(Math.random()*(classes.length));
      $(this).addClass( classes[index] );
    });
    event.preventDefault()
  });
})
