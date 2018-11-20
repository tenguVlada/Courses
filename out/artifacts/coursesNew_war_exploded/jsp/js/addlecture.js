var imgs = [1, 0];

function save_lecture(){
    var elem = document.getElementsByClassName("edit_input_text");
    var str = "";

    var cnt_text = 0;
    var cnt_img = 0;
    for(var i = 0; i < imgs.length; i++)
    {
        if (imgs[i] == 0) {
            str += cnt_img + "<br>";
            cnt_img++;
        }
        else {
            str += elem[cnt_text].innerHTML + "<br>";
            cnt_text++;
        }
    }

    document.getElementById("lblValues").innerHTML = str;
    sessionStorage.setItem("text", str);
    window.location.href = "addlectureprocess.jsp";
};

function get_text(){
    var elem = document.getElementById("total_text");
    elem.innerHTML = sessionStorage.getItem("text");
};

function add_input() {
 var p = document.getElementById("rightcol_id");
 var new_input = document.createElement("div");
 new_input.name = "editable_input";

 new_input.setAttribute("id", "input_id");
 new_input.setAttribute("class","edit_input_text");
 new_input.setAttribute("contenteditable","true");
 new_input.setAttribute("data-placeholder", "Enter text...");
 new_input.setAttribute("role", "textbox");
 new_input.setAttribute("aria-multiline", "true");

 p.appendChild(new_input);

 imgs.push(1);
} ;

function add_photo() {
 var p = document.getElementById("rightcol_id");
 var new_photo = document.createElement("div");
 new_photo.name = "input_photo";
 new_photo.setAttribute("class", "input_photo");

 var btn_upload = document.createElement("input");
 btn_upload.name = "btn_upload";
 btn_upload.setAttribute("id","upload");
 btn_upload.setAttribute("onchange", "readURL(this);");
 btn_upload.setAttribute("type", "file");
 /*btn_upload.innerHTML = "+ Choose photo";*/

 var img_upload = document.createElement("img");
 img_upload.name = "img_upload";
 img_upload.src = "#";
 /*img_upload.setAttribute("src", "#");*/
 img_upload.setAttribute("alt", "image");
 img_upload.setAttribute("id", "upload-img");

 new_photo.appendChild(btn_upload);
 new_photo.appendChild(img_upload);

 p.appendChild(new_photo);

 imgs.push(0);
} ;



function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('upload-img')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

/*function readURL(e) {
    if (this.files && this.files[0]) {
        var reader = new FileReader();
        $(reader).load(function(e) {
            $('#upload-img').attr('src', e.target.result);
        });
        reader.readAsDataURL(this.files[0]);
    }
}
$("#upload").change(readURL);*/
