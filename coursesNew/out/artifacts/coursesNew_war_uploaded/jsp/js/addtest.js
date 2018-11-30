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

    var numb = document.createElement("input");
    numb.name = "numb_field";
    numb.setAttribute("id","number_id");
    numb.setAttribute("onchange", "add_answers();");
    numb.setAttribute("type", "number");


    var answer_div = document.createElement("div");
    answer_div.name = "ans";
    answer_div.setAttribute("id", "answer_id");
    answer_div.setAttribute("class","answer");
    answer_div.setAttribute("contenteditable","true");
    answer_div.setAttribute("data-placeholder", "Enter answer...");
    answer_div.setAttribute("role", "textbox");
    answer_div.setAttribute("aria-multiline", "false");

    new_test.appendChild(lbl);
    new_test.appendChild(numb);
    new_test.appendChild(question_div);
    new_test.appendChild(answer_div);
    new_test.appendChild(answer_div);

    p.appendChild(new_test);
} ;