// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * https://raw.githubusercontent.com/phoenixframework/phoenix_html/v2.3.0/priv/static/phoenix_html.js

$(document).ready(function(){
  var update = null;
  $("#ethereum_value").on("keyup", function(){
      clearTimeout(update);
    update = setTimeout(function(){
      $("#ethereum").submit();
    }, 1000);
  });
});
