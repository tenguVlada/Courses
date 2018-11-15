function showAddForm(){
    var addingForm = document.getElementById("createuserform");
    var currentState = addingForm.style.display;
    if (currentState == "none" || currentState == ""){
        var delForm = document.getElementById("deleteuserform");
        var editForm_1 = document.getElementById("searchform");
        var editForm_2 = document.getElementById("editeuserform");
        delForm.style.display = "none";
        editForm_1.style.display = "none";
        editForm_2.style.display = "none";
        addingForm.style.display = "inline";
    }
    else{
        addingForm.style.display = "none";
    }
}

function showDelForm(){
    var delForm = document.getElementById("deleteuserform");
    var currentState = delForm.style.display;
    if (currentState == "none" || currentState == ""){
        var addingForm = document.getElementById("createuserform");
        var editForm_1 = document.getElementById("searchuserform");
        var editForm_2 = document.getElementById("editeuserform");
        addingForm.style.display = "none";
        editForm_1.style.display = "none";
        editForm_2.style.display = "none";
        delForm.style.display = "inline";
    }
    else{
        delForm.style.display = "none";
    }
}

function showEditForm(){
    var editForm_1 = document.getElementById("searchuserform");
    var editForm_2 = document.getElementById("editeuserform");
    var currentState = editForm_1.style.display;
    if (currentState == "none" || currentState == ""){
        var addingForm = document.getElementById("createuserform");
        var delForm = document.getElementById("deleteuserform");
        addingForm.style.display = "none";
        delForm.style.display = "none";
        editForm_1.style.display = "inline";
        editForm_2.style.display = "inline";
    }
    else{
        editForm_1.style.display = "none";
        editForm_2.style.display = "none";
    }
}

function closePopUp(){
    var backPopUp = document.getElementById("popupcont");
    var popUp = document.getElementById("popup");
    backPopUp.style.display = "none";
    popUp.style.display = "none";
}

function openPopUp(){
    var backPopUp = document.getElementById("popupcont");
    var popUp = document.getElementById("popup");
    backPopUp.style.display = "inline";
    popUp.style.display = "inline";
}