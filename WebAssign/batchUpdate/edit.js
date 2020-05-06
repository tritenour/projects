chrome.runtime.onMessage.addListener(msgObj => {
    if (msgObj.action == "apply"){
        let field = document.getElementById(msgObj.field);

        switch (msgObj.mode){
            case "findReplace":
                let find = new RegExp(msgObj.find, "gm");
                let replace = msgObj.replace;
                field.value = field.value.replace(find, replace);
                break;
            
            case "prepend":
                let prepend = msgObj.prepend;
                field.value = prepend + field.value;
                break;
            
            case "append":
                let append = msgObj.append;
                field.value = field.value + append;
                break;
            
            case "set":
                let set = msgObj.set;
                field.value = set;
                break;
        }
        document.querySelector("button[accesskey='r']").click();
    }
    else if (msgObj.action == "save"){
        document.getElementById("qeSave").click();
    } 
    else if (msgObj.action == "figcaps"){
        let questionField = document.getElementById("question");
        let answerField = document.getElementById("answer");
        let solutionField = document.getElementById("solution");
        var i = -1;
        questionField.value = questionField.value.replace(/(<img.+? \/?>)/g, function(match, img){
            i++;
            return `<figure class='cap-btm-rit' tabindex='0' aria-describedby='<EQN \$unique[${i}]>-cap'>${img}<figcaption class='alt-cap' id='<EQN \$unique[${i}]>-cap'> <div class='desc'> <EQN \$altText${i}> </div> </figcaption> </figure>`;
        });
        answerField.value = answerField.value.replace(/(<img.+? \/?>)/g, function(match, img){
            i++;
            return `<figure class='cap-btm-rit' tabindex='0' aria-describedby='<EQN \$unique[${i}]>-cap'>${img}<figcaption class='alt-cap' id='<EQN \$unique[${i}]>-cap'> <div class='desc'> <EQN \$altText${i}> </div> </figcaption> </figure>`;
        });
        solutionField.value = solutionField.value.replace(/(<img.+? \/?>)/g, function(match, img){
            i++;
            return `<figure class='cap-btm-rit' tabindex='0' aria-describedby='<EQN \$unique[${i}]>-cap'>${img}<figcaption class='alt-cap' id='<EQN \$unique[${i}]>-cap'> <div class='desc'> <EQN \$altText${i}> </div> </figcaption> </figure>`;
        });
        document.querySelector("button[accesskey='r']").click();
    }
    else if (msgObj.action == "axisLabels"){
        let questionField = document.getElementById("question");
        let answerField = document.getElementById("answer");
        let solutionField = document.getElementById("solution");

        questionField.value = questionField.value.replace(/axislabels\s*=\s*['"](.+?),(.+?)['"]/g, function(match, x, y){
            x = x.replace(/([a-zA-Z])/g, `\\!\\($1\\"\\"\\)`);
            y = y.replace(/([a-zA-Z])/g, `\\!\\($1\\"\\"\\)`);
            return `axislabels='${x}, ${y}'`;
        });
        document.querySelector("button[accesskey='r']").click();
    }
    else if (msgObj.action == "newStyle"){
        let questionField = document.getElementById("question");
        if (!(questionField.value.match(/style\.css/))){
            questionField.value = "<link rel='stylesheet' type='text/css' href='/csstyle/style.css'/>\n" + questionField.value;
        }
        document.querySelector("button[accesskey='r']").click();
    }
    return true;
});