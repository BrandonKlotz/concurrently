// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("local-time").start()

window.Rails = Rails

$(document).on("turbolinks:load", () => {
  $('#new-message').keypress(function(e) {
    if (e && e.keyCode == 13) {
      e.preventDefault
      $(this).submit();
    }
  });
});