$(document).on("turbolinks:load", function() {
  var maxLength = 140;
  $("#textbox").keyup(function() {
    var length = $(this).val().length;
    var length = maxLength - length;
    $("#chars").text(length);
  });

  $("#textbox").bind("click", function() {
    $("#textbox").attr("rows", "3");
  });

  if ($("#textbox").val() == "") $("#submitButtonId").attr("disabled", true);

  $("#textbox").keyup(function() {
    if ($("#textbox").val() != "") $("#submitButtonId").attr("disabled", false);
    else $("#submitButtonId").attr("disabled", true);
  });
});