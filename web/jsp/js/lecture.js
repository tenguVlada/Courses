function addTextDiv(text){
  var cont = document.getElementById("content");

  cont.innerHTML = text;
}

function addImgDiv(imgPath){
  var cont = document.getElementById("content");
  var newDiv = document.createElement("div");
  var newImg = document.createElement("img");

  newDiv.setAttribute("class", "lectPict");
  newImg.setAttribute("src", imgPath);
  newDiv.appendChild(newImg);
  cont.appendChild(newDiv);
}
