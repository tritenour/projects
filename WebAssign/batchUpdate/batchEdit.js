/* Helper Functions */
function escapeRegExp(string) {
    return string.replace(/[.*+?^${}()|[\]\\"]/g, '\\$&');
}

function hideDivs(){
    divFindReplace.style.display = "none";
    divPrepend.style.display = "none";
    divAppend.style.display = "none";
    divSet.style.display = "none";
}

/* Radio */
let radioFindReplace = document.getElementById("modeChoiceFindReplace");
let radioPrepend = document.getElementById("modeChoicePrepend");
let radioAppend = document.getElementById("modeChoiceAppend");
let radioSet = document.getElementById("modeChoiceSet");

let divFindReplace = document.getElementById("findReplace");
let divPrepend = document.getElementById("prepend");
let divAppend = document.getElementById("append");
let divSet = document.getElementById("set");

radioFindReplace.onclick = function(){
    hideDivs();
    divFindReplace.style.display="block";
}

radioPrepend.onclick = function(){
    hideDivs();
    divPrepend.style.display="block";
}

radioAppend.onclick = function(){
    hideDivs();
    divAppend.style.display="block";
}

radioSet.onclick = function(){
    hideDivs();
    divSet.style.display="block";
}

/* Buttons */
let buttonOpen = document.getElementById("open");
let buttonApply = document.getElementById("apply");
let buttonSave = document.getElementById("save");
let buttonFigcaps = document.getElementById("figcaps");
let buttonAxisLabels = document.getElementById("axisLabels");
let buttonNewStyle = document.getElementById("newStyle");

let useRegex = document.getElementById("regex");

buttonOpen.onclick = function(){
    let qidList = document.getElementById("qidList").value;

    qidList = qidList.replace(/[ \t]/g, "");
    let qids = undefined;


    if (qidList.includes(",")){
        qids = qidList.split(",");
    }
    else{
        qids = qidList.split(/\r?\n/);
    }

    if (qids.length > 25){
        window.alert("A maximum of 25 qids should be opened at once.");
    }
    else{
        chrome.windows.create({state: "minimized", focused: false, url: "http://www.editorial.webassign.net/v4cgi/faculty.pl?action=questions/edit&qid=" + qids[0]}, function (window) {
            for (i = 1; i < qids.length; i++) {
            chrome.tabs.create({windowId: window.id, url: "http://www.editorial.webassign.net/v4cgi/faculty.pl?action=questions/edit&qid=" + qids[i]}, function (newTab) {
            });
            }
        });
    }
}

buttonApply.onclick = function(){
    let mode = document.querySelector('input[name="mode"]:checked').value;
    let find;

    if (useRegex.checked){
        find = document.getElementById("findText").value;
    }
    else{
        find = escapeRegExp(document.getElementById("findText").value);
    }

    let replace = document.getElementById("replaceText").value;
    let prepend = document.getElementById("prependText").value;
    let append = document.getElementById("appendText").value;
    let set = document.getElementById("setText").value;
    let field = document.getElementById("field").value;

    chrome.tabs.query({}, function (tabs){
        for (i = 0; i < tabs.length; i++){
            chrome.tabs.sendMessage(tabs[i].id, {action : "apply", field : field, mode: mode, find : find, replace : replace, prepend : prepend, append : append, set : set});
        }
    });
}

buttonSave.onclick = function(){
    if (confirm("Are you sure?")){
        chrome.tabs.query({}, function (tabs){
            for (let i = 0; i < tabs.length; i++){
                setTimeout( function timer(){
                    chrome.tabs.sendMessage(tabs[i].id, {action : "save"});
                }, i*500 );
                        
            }
        });
    }
}

buttonFigcaps.onclick = function(){
    chrome.tabs.query({}, function (tabs){
        for (i = 0; i < tabs.length; i++){
            chrome.tabs.sendMessage(tabs[i].id, {action : "figcaps"});
        }
    });
}

buttonAxisLabels.onclick = function(){
    chrome.tabs.query({}, function (tabs){
        for (i = 0; i < tabs.length; i++){
            chrome.tabs.sendMessage(tabs[i].id, {action : "axisLabels"});
        }
    });
}

buttonNewStyle.onclick = function(){
    chrome.tabs.query({}, function (tabs){
        for (i = 0; i < tabs.length; i++){
            chrome.tabs.sendMessage(tabs[i].id, {action : "newStyle"});
        }
    });
}
/* Initialization */
hideDivs();
radioFindReplace.click();