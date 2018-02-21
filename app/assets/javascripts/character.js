$(function() {
  var maxLength = 140;
  $("#textbox").keyup(function() {
    var length = $(this).val().length;
    var length = maxLength - length;
    $("#chars").text(length);
  });
});


