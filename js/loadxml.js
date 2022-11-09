function loadXMLDoc(dname) {
	'use strict';
	var xhttp;
  var ActiveXObject;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", dname, false);
    xhttp.send("");
    return xhttp.responseXML;
}

function displayResult(source,styledoc) {
	'use strict';
  var xml;
  var xsl;
  var ex;
  var resultDocument;
    xml = loadXMLDoc(source);
    xsl = loadXMLDoc(styledoc);
    //set a &nbsp to make prevent FF to append the text by double click
    document.getElementById("music").innerHTML = "&nbsp;";
    // code for IE
    if (window.ActiveXObject) {
        ex = xml.transformNode(xsl);
        document.getElementById("music").innerHTML = ex;
    }
    // code for Mozilla, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument) {

        var xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById("music").appendChild(resultDocument);
    }
}

function collection1(){
	'use strict';
	displayResult("resources/mp3_Mycatalog.xml","theTable.xsl");
}


function init(){
	'use strict';
	document.getElementById("Btn").addEventListener("click", collection1);
}

window.onload = init;