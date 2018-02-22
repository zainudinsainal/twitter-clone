$(document).ready(function() {
  if ($("#textbox").val() == "") $("#submitButtonId").attr("disabled", true);

  $("#textbox").keyup(function() {
    if ($("#textbox").val() != "") $("#submitButtonId").attr("disabled", false);
    else $("#submitButtonId").attr("disabled", true);
  });
});
