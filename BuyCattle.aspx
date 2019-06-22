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
    <link href="css/jquery.mobile.datepicker.css" rel="stylesheet" />
    <script src="script/jquery.ui.datepicker.js"></script>
    <script src="script/jquery.mobile.datepicker.js"></script>
    <script src="script/jquery-ui.js"></script>
    
    <script>


        InitBrowser("css/BrowserCss.css");

        var Get_UrL;

        $(document).ready(function () {
            $.get("Main.xml", function (data) {
                var dt = $(data).find('WEBSER_RSMART').text();
                Get_UrL = dt.replace(/(\r\n|\n|\r)/gm, "");
            });

            get_flights_details();
        });



        function get_flights_details() {

            // var _tempCookies = $.cookie("sessionid");

            //if (_tempCookies == "" || _tempCookies == undefined) {
            //    window.location.href = "LogIn.aspx";
            //    return false;
            //}


            var abt = {
                "SessionID": _tempCookies,   // _tempCookies,
                "MyFlightDRFID": $.cookie("DRFID")
            };

            var _url = Get_UrL + "/DRPWebService.asmx/GetFlightSkillEmpDetails";
            //alert(_url);
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
                    // alert(data.d);
                    jQuery.each($.parseJSON(data.d), function (idx, obj) {
                        if (obj.responseCode == '-2') {
                            alert(obj.responseMessage);
                            window.location.href = "LogIn.aspx";
                            return false;
                        }
                    });
                    $("#DIV_Load").css('display', 'none');

                    $("#TBL_details").append("<table style='width: 100%;'><tr><td>" + $.cookie('Flight_Date') + "</td><td style='text-align: right'>" + $.cookie("Flight_Name") + "</td> </tr></table>");

                    jQuery.each($.parseJSON(data.d), function (idx, obj) {

                        var tbl = "<table style='width: 100%;'>" +
                                   "<tr><td style='width:20%'>&nbsp;</td><td>&nbsp;</td></tr>" +
                                   " <tr> " +
                                   "  <td colspan='2' style='font-weight:bold;background-color:lightgray'>" + obj.FlightServiceSkill + "</td> " +
                                   " </tr> " +
                                   " <tr> " +
                                   "     <td colspan='2' style='font-weight:bold;text-align:center'>" + obj.FlightServiceTime + "</td> " +
                                   " </tr> "
                        var EmpName = obj.FlightServiceEmpName
                        var sp_EmpName = EmpName.split("@~@");
                        for (var i = 0; i < sp_EmpName.length; i++) {
                            tbl = tbl + " <tr> " +
                                         "     <td></td> " +
                                         "     <td>" + sp_EmpName[i] + "</td> " +
                                         " </tr> "
                        }
                        $("#TBL_details").append(tbl + "</table>");
                    });

                },
                error: function (xhr, error, code) {
                    // SOMETHING WRONG WITH YOUR CALL.
                    $("#DIv_User").html(xhr.responseText);
                    $("#DIV_Load").css('display', 'none');
                },
                //complete: function () {
                //    alert("Process Completed.");
                //}
            });
        }

        function LogOut() {
            Kill_Session();
            $.removeCookie("sessionid", { path: "/" });
            $.removeCookie("UserID", { path: "/" });
            $.removeCookie("UserKey", { path: "/" });
            $.removeCookie("Master_Redirect", { path: "/" });
            // alert($.cookie("sessionid"));
            window.location.href = "LogIn.aspx";
        }
    </script>

</head>

<body>
    <div data-role="header" style="overflow: visible;background-image: url(images/Header.png)">
        <div style="width: 35%; height: 40px; float: left">
            <a onclick="javascript:{ window.location.href = 'HomeScreen.aspx'; }" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all ui-btn-left" href="#">&nbsp;</a>
            <img src="images/ic_CMP_logo.png" alt="" style="margin-left: 50px; width: 80px; height: 40px" />
        </div>
        <h1>Search Cattle</h1>
        <a onclick="javascript:{ window.location.href = 'HomeScreen.aspx'; }" class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all ui-btn-left" href="#">&nbsp;</a>
        <a class="ui-btn ui-icon-power ui-btn-icon-notext ui-corner-all ui-btn-right" href="#" onclick="LogOut();">&nbsp;</a>
        <div data-role="navbar">
        </div>
    </div>
    <div id="DIV_Load" style="width:100%;height:50px;text-align:center;padding-top:10px;font-weight:bold">Loading....</div>
    <div data-role="content">

        <div id="TBL_details" style="width: 100%;">
        </div>
    </div>
     <input id="Web_url" value="URL" type="hidden" />
</body>
</html>
