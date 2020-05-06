let button = document.getElementById("run");

button.onclick = function(){
    chrome.tabs.create({url: "batchEdit.html"});
}