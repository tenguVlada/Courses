function add_open(){
    var p = document.getElementById("rightcol_id");
    var new_open = document.createElement("div");
    new_open.setAttribute("id", "edit_open_id");
    new_open.setAttribute("class","edit_open");

    var question_div = document.createElement("div");
    question_div.name = "quest";
    question_div.setAttribute("id", "question_id");
    question_div.setAttribute("class","question");
    question_div.setAttribute("contenteditable","true");
    question_div.setAttribute("data-placeholder", "Enter open question...");
    question_div.setAttribute("role", "textbox");
    question_div.setAttribute("aria-multiline", "true");

    var lbl2 = document.createElement("label");
    lbl2.name = "lbl2";
    lbl2.setAttribute("class","lbl");
    lbl2.innerHTML = "Mark for question:";

    var mark = document.createElement("input");
    mark.name = "numb_field";
    mark.setAttribute("id","number_id");
    mark.setAttribute("type", "number");
    mark.setAttribute("value", "1");
    mark.setAttribute("min", "1");

    p.appendChild(new_open);
    new_open.appendChild(lbl2);
    new_open.appendChild(mark);
    new_open.appendChild(question_div);
};

function add_close() {
    var p = document.getElementById("rightcol_id");
    var new_test = document.createElement("div");
    new_test.name = "test";
    new_test.setAttribute("class", "edit_test");

    var question_div = document.createElement("div");
    question_div.name = "quest";
    question_div.setAttribute("id", "question_id");
    question_div.setAttribute("class","question");
    question_div.setAttribute("contenteditable","true");
    question_div.setAttribute("data-placeholder", "Enter question...");
    question_div.setAttribute("role", "textbox");
    question_div.setAttribute("aria-multiline", "true");

    var lbl = document.createElement("label");
    lbl.name = "lbl1";
    lbl.setAttribute("class","lbl");
    lbl.innerHTML = "Number of answers (2-10):";

    var numb = document.createElement("input");
    numb.name = "numb_field";
    numb.setAttribute("id","number_id");
    numb.setAttribute("onchange", "add_answers(this);");
    //numb.setAttribute("onclick", "add_answers(this);");
    //numb.setAttribute("onkeypress", "add_answers(this);");
    numb.setAttribute("type", "number");
    numb.setAttribute("value", "2");
    numb.setAttribute("min", "2");
    numb.setAttribute("max", "10");

    var lbl2 = document.createElement("label");
    lbl2.name = "lbl2";
    lbl2.setAttribute("class","lbl");
    lbl2.innerHTML = "Mark for question:";

    var mark = document.createElement("input");
    mark.name = "numb_field";
    mark.setAttribute("id","number_id");
    mark.setAttribute("type", "number");
    mark.setAttribute("value", "1");
    mark.setAttribute("min", "1");

    new_test.appendChild(lbl);
    new_test.appendChild(numb);
    new_test.appendChild(lbl2);
    new_test.appendChild(mark);
    new_test.appendChild(question_div);

    for (var i = 0; i < 2; i++) {
        var answer_div = document.createElement("div");
        answer_div.name = "ans";
        answer_div.setAttribute("id", "answer_id");
        answer_div.setAttribute("class", "answer");
        answer_div.setAttribute("contenteditable", "true");
        answer_div.setAttribute("data-placeholder", "Enter answer...");
        answer_div.setAttribute("role", "textbox");
        answer_div.setAttribute("aria-multiline", "false");

        var lbl2 = document.createElement("label");
        lbl2.name = "lbl2";
        lbl2.setAttribute("class","lbl");
        lbl2.innerHTML = "Mark for answer:";

        var mark = document.createElement("input");
        mark.name = "numb_field";
        mark.setAttribute("id","number_id");
        mark.setAttribute("type", "number");
        mark.setAttribute("value", "0");
        mark.setAttribute("min", "0");

        new_test.appendChild(answer_div);
        new_test.appendChild(lbl2);
        new_test.appendChild(mark);
    }

    p.appendChild(new_test);
} ;

function add_answers(elem){
    var par = elem.parentElement;
    var cnt = par.childElementCount - 4;
    var cnt_new = elem.value*3;
    var flag = true;

    var lbl = document.createElement("label");
    lbl.name = "lbl1";
    lbl.innerHTML = (cnt_new).toString() + " - " + (cnt).toString();

    //par.appendChild(lbl);

    if (cnt_new >= cnt) {
        flag = true;
        for (var i = cnt; i <= cnt_new; i=i+3) {
            if (flag == true) {
                var answer_div = document.createElement("div");
                answer_div.name = "ans";
                answer_div.setAttribute("id", "answer_id");
                answer_div.setAttribute("class", "answer");
                answer_div.setAttribute("contenteditable", "true");
                answer_div.setAttribute("data-placeholder", "Enter answer...");
                answer_div.setAttribute("role", "textbox");
                answer_div.setAttribute("aria-multiline", "false");

                var lbl2 = document.createElement("label");
                lbl2.name = "lbl2";
                lbl2.setAttribute("class","lbl");
                lbl2.innerHTML = "Mark for answer:";

                var mark = document.createElement("input");
                mark.name = "numb_field";
                mark.setAttribute("id","number_id");
                mark.setAttribute("type", "number");
                mark.setAttribute("value", "0");
                mark.setAttribute("min", "0");

                par.appendChild(answer_div);
                par.appendChild(lbl2);
                par.appendChild(mark);
            }
            else
                flag = true;
        }
    }
    else {
        for (var i = (cnt); i > (cnt_new); i--) {
            if (flag == false)
                par.children[i+3].remove();
            else
               flag = false;
        }
    }

    par.update();
};

