<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_Screen.aspx.cs" Inherits="Home_Screen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="msapplication-config" content="none" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />

    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="-1" />

    <script src="script/jquery-1.4.3.min.js"></script>
    <script src="script/ThemeJS/jquery.js"></script>
    <script src="script/ThemeJS/jquery.mobile-1.4.5.min.js"></script>
    <script src="script/Global_Script.js"></script>
    <script src="script/jquery.cookie.js"></script>

    <link href="css/index.css" rel="stylesheet" />
    <link href="css/jquery.mobile-1.4.5.min.css" rel="stylesheet" />

    <script>
        // alert($.cookie('sessionid'));

        var ChangeRequest = 0;
        var Get_UrL;

        $(document).ready(function () {
            $.get("Main.xml", function (data) {
                var dt = $(data).find('WEBSER_RSMART').text();
                Get_UrL = dt.replace(/(\r\n|\n|\r)/gm, "");
            });
            //var _tempCookies = $.cookie('sessionid');

            //if (_tempCookies == "" || _tempCookies == undefined) {
            //    window.location.href = "LogIn.aspx";
            //}

            // checkrights(4060);
            // checkrights(4061);
            // GetCompanyLogo();
        });


        /*$(document).ready(function () {
            var _tempCookies = $.cookie('sessionid');

            if (_tempCookies == "" || _tempCookies == undefined) {
                window.location.href = "LogIn.aspx";
            }
            checkrights(4060);
        });*/
        //function checkrights(erpui_id) {

        //    //var _tempCookies = $.cookie("sessionid");

        //    ////alert("I M In rights function");

        //    //if (_tempCookies == "" || _tempCookies == undefined) {
        //    //    window.location.href = "../LogIn.aspx";
        //    //    return false;
        //    //}
        //    //var module_id = "56";

        //    //var abt = {
        //    //    "SessionID": _tempCookies,
        //    //    "erpui": erpui_id,
        //    //    "module_master_id": module_id,
        //    //};
        //    //// alert(Get_UrL);
        //    //var _url = Get_UrL + "/RsmartMobileLogin.asmx/GetCheckRights";
        //    //jQuery.ajax({
        //    //    url: _url,
        //    //    dataType: 'json',
        //    //    data: JSON.stringify(abt),
        //    //    type: "POST",
        //    //    accepts: "application/json",
        //    //    beforeSend: function (x) {
        //    //        x.setRequestHeader("Content-Type", "application/json");
        //    //    },
        //    //    success: function (data, textStatus, jqXHR) {

        //    //        jQuery.each($.parseJSON(data.d), function (idx, obj) {
        //    //            if (obj.responseCode == "-3") {
        //    //                $("#Kill_Session").css('display', 'block');
        //    //                $("#Main_Control").css('display', 'none');
        //    //                $("#txtpassword").val('');
        //    //                call("User has already logged in");
        //    //                return;
        //    //            }

        //    //            if (obj.responseCode == 0) {

        //    //                //  document.getElementById("leave").removeAttribute("onclick");
        //    //                if (erpui_id == "4060") {
        //    //                    document.getElementById("myflight").className = "not - active";
        //    //                    $("#myflight").attr("onclick", "")
        //    //                }
        //    //                if (erpui_id == "4061") {
        //    //                    document.getElementById("sdn").className = "not - active";
        //    //                    $("#sdn").attr("onclick", "")
        //    //                }

        //    //            }
        //    //            if (obj.responseCode > 0) {
        //    //                if (erpui_id == "4060")
        //    //                { $("#myflight").attr("onclick", 'callpage("Flight/Flight.aspx")') }
        //    //                if (erpui_id == "4061")
        //    //                { $("#sdn").attr("onclick", 'callpage("SDN/SDN.aspx")') }
        //    //            }
        //    //        });
        //    //    },
        //    //    error: function (xhr, error, code) {
        //    //        // SOMETHING WRONG WITH YOUR CALL.

        //    //        $("#DIv_User").html(xhr.responseText);
        //    //    },
        //    //    //complete: function () {
        //    //    //    alert("Process Completed.");
        //    //    //}
        //    //});


        //}

        function callpage(page) {

            window.location.href = page;

        }
        function LogOut() {
            //Kill_Session();

            //$.removeCookie("sessionid", { path: "/" });
            //$.removeCookie("UserID", { path: "/" });
            //$.removeCookie("UserKey", { path: "/" });
            //$.removeCookie("Master_Redirect", { path: "/" });
            //$.removeCookie("Company_Logo", { path: "/" });

            //alert($.cookie("sessionid"));
            window.location.href = "LogIn.aspx";
        }//

        //function GetCompanyLogo() {

        //    //var _tempCookies = $.cookie("sessionid");

        //    //alert("I M In rights function");

        //    if (_tempCookies == "" || _tempCookies == undefined) {
        //        window.location.href = "../LogIn.aspx";
        //        return false;
        //    }
        //    var module_id = "56";

        //    var abt = {
        //        "SessionID": _tempCookies,
        //    };
        //    // alert(Get_UrL);
        //    var _url = Get_UrL + "/RsmartMobileLogin.asmx/GetCompanyLogo";
        //    jQuery.ajax({
        //        url: _url,
        //        dataType: 'json',
        //        data: JSON.stringify(abt),
        //        type: "POST",
        //        accepts: "application/json",
        //        beforeSend: function (x) {
        //            x.setRequestHeader("Content-Type", "application/json");
        //        },
        //        success: function (data, textStatus, jqXHR) {

        //            jQuery.each($.parseJSON(data.d), function (idx, obj) {
        //                if (obj.responseCode == '-2') {
        //                    alert(obj.responseMessage);
        //                    $.removeCookie("sessionid", { path: "/" });
        //                    window.location.href = "../LogIn.aspx";
        //                    return false;
        //                }
        //                if (obj.responseCode == '1') {
        //                    $("#DIv_User").html(obj.responseMessage);
        //                    $("#DIv_User").effect('bounce', 'slow');
        //                    return false;
        //                }

        //                if (obj.responseCode == '0') {
        //                    $("#DIv_User").html('');
        //                    $.cookie('Company_Logo', obj.logoPath, { expires: 1, path: '/' });
        //                }

        //            });

        //            //var Logo_Details = JSON.parse(data.d);
        //            var tpath = $.cookie("Company_Logo");
        //            // alert(tpath);

        //            document.getElementById("comp_logo").src = tpath;// "Images/Comp_214.jpg";//$.cookie("Company_Logo");
        //            //alert($.cookie("Company_Logo"));
        //            ////alert("path = " + tpath);
        //            //var path = location.pathname;
        //            //var lock=location.href;
        //            //alert(path + " location= " + lock);
        //            //if (path[path.length - 1].indexOf('.html') > -1) {
        //            //    path.length = path.length - 1;
        //            //}
        //            //var app = path[path.length - 2]; // if you just want 'three'
        //            //// var app = path.join('/'); //  if you want the whole thing like '/one/two/three'
        //            //console.log(app);

        //        },
        //        error: function (xhr, error, code) {
        //            // SOMETHING WRONG WITH YOUR CALL.

        //            $("#DIv_User").html(xhr.responseText);
        //        },
        //        //complete: function () {
        //        //    alert("Process Completed.");
        //        //}
        //    });


        //}
    </script>
    <style type="text/css">

        .not-active {
   pointer-events: none;
   cursor: default;
}

    </style>

</head>

<body>

    <div data-role="header" style="overflow: visible;background-image: url(images/Header.png);height:40px;">
      <div style="width:40%;height:40px;float:left">
            <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all ui-btn-left" href="#" onclick="javascript:{  window.location.href = 'Master_Screen.aspx'; }">&nbsp;</a>
            <img  src="images/ic_rsmart_logo.png" alt="" style="margin-left:50px;width: 80px; height: 40px" />
   </div>
        <div style="width:20%;height:40px;float:left;line-height:40px;text-align:center;">
        Cattle Market
        </div>
      <div style="width:40%;height:40px;float:left;text-align:right">
        <a class="ui-btn ui-icon-power ui-btn-icon-notext ui-corner-all ui-btn-right" href="#" onclick="LogOut();">&nbsp;</a>
           <img id="comp_logo"    alt="" style="margin-right:40px; width: 80px; height: 40px" />
          </div>
       <%-- <div data-role="navbar">
        </div>--%>
    </div>
    <br />
    <div data-role="content">
        <center>
        <table style="width:80%">
            <tr>
                <td align="center">
                   <div is="icon" style="width:150px; height:140px; position:relative">
      <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
      <a href="#" id="myflight" onclick="javascript:{callpage('AddCattle/RegisterCattle.aspx')}" class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/Buy_Cattle.png); background-size: 50% 50%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"></a>
      <div style="text-align:center;">Buy Cattle</div>
    </div>
                   
                </td>
                <td align="center">
                  
                     <div is="icon" style="width:150px; height:140px; position:relative">
      <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
      <a href="#" id="leave" onclick="javascript:{  window.location.href = 'Leave/Leave.aspx'; }" class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/Leave.png); background-size: 95% 80%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"></a>
      <div style="text-align:center;">Register My Cattle</div>
    </div>

                </td>
            </tr>

             <tr>
                <td align="center">
                   <div is="icon" style="width:150px; height:140px; position:relative">
      <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
      <a href="#" id="action" onclick="javascript:{ window.location.href = 'Notification/Notification.aspx'; }" class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/Notify.png); background-size: 95% 80%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"></a>
      <div style="text-align:center;">Sell Cattle</div>
    </div>
                   
                </td>
                <td align="center">
                  
                     <div is="icon" style="width:150px; height:140px; position:relative">
      <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
      <a href="#" id="roster" onclick="javascript:{ window.location.href = 'Roster/Roster.aspx'; }"   class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/Roster.png); background-size: 95% 80%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"></a>
      <div style="text-align:center;">Sell Milk</div>
    </div>

                </td>
            </tr>

            <tr>
                <td align="center">
                    <div is="icon" style="width:150px; height:140px; position:relative">
                        <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
                        <a href="#" id="sdn"  class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/SDN.png); background-size: 95% 80%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;">
                        <span class="ui-icon ui-icon-locked ui-btn-left"></span>
                        </a>
                        <div style="text-align:center;">Live Auction</div>
                    </div>
                </td>
                <td align="center" >
                    <div is="icon" style="width:150px; height:140px; position:relative">
                        <span class="ui-li-count" style="position:absolute; display:none; z-index:1; right:0; top:6px;"></span>
                        <a href="#" id="AddFlight" onclick="javascript:{ window.location.href = 'AddFlight/AddFlight.aspx'; }" class="ui-btn ui-mini ui-corner-all ui-shadow" style="display:block;margin:5px;height:50%;width:50%;background-image: url(images/SDN.png); background-size: 95% 80%; background-position: 50% 50%; background-repeat: no-repeat no-repeat;">
                        <span class="ui-icon ui-icon-locked ui-btn-left"></span>
                        </a>
                        <div style="text-align:center;">Add XYZ</div>
                    </div>
                </td>
            </tr>

        </table>
            <div id="DIv_User" style="color:red;" align="center"></div>
            </center>
    </div>


</body>
</html>
