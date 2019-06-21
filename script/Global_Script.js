
$.ajaxSetup({
    async: false
});

//Added by bipeen Patil
var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));
if (mobile) {
    //alert("MOBILE DEVICE DETECTED");
    //document.write("<b>------------------------------------------<br>")
    //document.write("<b>" + navigator.userAgent + "<br>")
    //document.write("<b>------------------------------------------<br>")
    //var userAgent = navigator.userAgent.toLowerCase();
    //if ((userAgent.search("android") > -1) && (userAgent.search("mobile") > -1))
    //    document.write("<b> ANDROID MOBILE <br>")
    //else if ((userAgent.search("android") > -1) && !(userAgent.search("mobile") > -1))
    //    document.write("<b> ANDROID TABLET <br>")
    //else if ((userAgent.search("blackberry") > -1))
    //    document.write("<b> BLACKBERRY DEVICE <br>")
    //else if ((userAgent.search("iphone") > -1))
    //    document.write("<b> IPHONE DEVICE <br>")
    //else if ((userAgent.search("ipod") > -1))
    //    document.write("<b> IPOD DEVICE <br>")
    //else if ((userAgent.search("ipad") > -1))
    //    document.write("<b> IPAD DEVICE <br>")
    //else
    //    document.write("<b> UNKNOWN DEVICE <br>")
}
else {
   // alert("NO MOBILE DEVICE DETECTED");
    var cssScript = document.createElement("link");
    cssScript.setAttribute("rel", "stylesheet");
    cssScript.setAttribute("type", "text/css");
    cssScript.setAttribute("href", "css/BrowserCss.css");
    document.getElementsByTagName("head")[0].appendChild(cssScript);

}


//Added by Vaibhav Patil
function date_Add(date,days)
{
    var joindate = new Date(date);
    joindate.setDate(joindate.getDate() + days);
    return joindate;
}

function date_Sub(date, days) {
    var joindate = new Date(date);
    joindate.setDate(joindate.getDate() - days);
    return joindate;
}

$(document).ready(function () {
    //alert("fire");
    $('body').attr('oncontextmenu', 'return false');
});


function InitBrowser(_url)
{
   
      var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));

    var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));
    if (mobile) {
        //alert("MOBILE DEVICE DETECTED");
        //document.write("<b>------------------------------------------<br>")
        //document.write("<b>" + navigator.userAgent + "<br>")
        //document.write("<b>------------------------------------------<br>")
        //var userAgent = navigator.userAgent.toLowerCase();
        //if ((userAgent.search("android") > -1) && (userAgent.search("mobile") > -1))
        //    document.write("<b> ANDROID MOBILE <br>")
        //else if ((userAgent.search("android") > -1) && !(userAgent.search("mobile") > -1))
        //    document.write("<b> ANDROID TABLET <br>")
        //else if ((userAgent.search("blackberry") > -1))
        //    document.write("<b> BLACKBERRY DEVICE <br>")
        //else if ((userAgent.search("iphone") > -1))
        //    document.write("<b> IPHONE DEVICE <br>")
        //else if ((userAgent.search("ipod") > -1))
        //    document.write("<b> IPOD DEVICE <br>")
        //else if ((userAgent.search("ipad") > -1))
        //    document.write("<b> IPAD DEVICE <br>")
        //else
        //    document.write("<b> UNKNOWN DEVICE <br>")
    }
    else {
        // alert("NO MOBILE DEVICE DETECTED");
        var cssScript = document.createElement("link");
        cssScript.setAttribute("rel", "stylesheet");
        cssScript.setAttribute("type", "text/css");
        cssScript.setAttribute("href", _url);
        document.getElementsByTagName("head")[0].appendChild(cssScript);

    }


}

function Kill_Session() {
    var u_id =  $.cookie('UserID');
    var pass = $.cookie('UserKey');

    var abt = {
        "DeviceID": "''",
        "DeviceType": "''",
        "UserName": u_id,
        "Password": pass
    };

    var Get_UrL;

    $.get("../Main.xml", function (data) {
        var dt = $(data).find('WEBSER_CMP').text();
        Get_UrL = dt.replace(/(\r\n|\n|\r)/gm, "");
    });


    var _url = Get_UrL + "/CMPMobileLogin.asmx/Kill_Session";
    jQuery.ajax({
        url: _url,
        dataType: 'json',
        data: JSON.stringify(abt),
        type: "POST",
        accepts: "application/json",
        beforeSend: function (x) {
            x.setRequestHeader("Content-Type", "application/json");
        },
        success: function (data, textStatus, jqXHR) {

            jQuery.each($.parseJSON(data.d), function (idx, obj) {
                if (obj.responseCode == 0) {
                    $.cookie('RetMessage', obj.responseMessage, { expires: 7, path: '/' });
                    
                }
                
            });
        },
        error: function (xhr, error, code) {
            // SOMETHING WRONG WITH YOUR CALL.
           // $("#DIv_User").html(xhr.responseText);
        },
    });

    return $.cookie('RetMessage');
}



