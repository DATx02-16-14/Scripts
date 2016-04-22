
var page = require('webpage').create();

var canChangeGameName = false;

page.onPrompt = function(msg, defaultVal) {
  //console.log("prompt");
  return "PhantomJS " + Math.floor(Math.random()*1000);
};

page.open('http://hastings.se', function(status) {
  //console.log("Status " + status);
});

setTimeout(function() {
  page.evaluate(function() {
    document.getElementById('create-game-btn').click();
    canChangeGameName = true;
  });
}, 1500);

setTimeout(function () {
  while (!canChangeGameName) {
    page.evaluate(function() {
      document.getElementById('game-name-field').value = "Best game " + Math.floor(Math.random()*1000);
      document.getElementById('game-name-btn').click()
    });
  }
}, 4000);

setTimeout(function() {
  page.close();
  phantom.exit();
}, 10000);

