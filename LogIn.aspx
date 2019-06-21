<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta charset="utf-8" />
    <meta name="msapplication-config" content="none" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE; IE=EmulateIE8" />

    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="-1" />

    <script src="script/jquery-1.4.3.min.js"></script>
    <script src="script/ThemeJS/jquery.js"></script>
    <script src="script/ThemeJS/jquery.mobile-1.4.5.min.js"></script>
    <script src="script/Global_Script.js"></script>
    <script src="script/jquery.cookie.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/web3.min.js"></script>
    <script src="js/truffle-contract.js"></script>
    <script src="js/app.js"></script>

    <link href="css/index.css" rel="stylesheet" />
    <link href="css/jquery.mobile-1.4.5.min.css" rel="stylesheet" />

    <script>

        var Get_UrL;

        //$.removeCookie("sessionid", { path: "/" });
        //$.removeCookie("UserID", { path: "/" });
        //$.removeCookie("UserKey", { path: "/" });


        $(document).ready(function () {
            //$.get("Main.xml", function (data) {
            //    var dt = $(data).find('WEBSER_CMP').text();
            //    Get_UrL = dt.replace(/(\r\n|\n|\r)/gm, "");
            //});
        });

        function call(txt) {
            $("#Alert_text").html(txt);
            $("#popupBasic").popup();
            $("#popupBasic").popup('open');
        }

        function key_Set() {

            //$("#screen").css('display', 'none');
            $("#PopUpKey").popup();
            $("#PopUpKey").popup('open');
        }

        function Default_view() {
            // alert("fire" + $('#txtKey').val());
            // $("#screen").css('display', 'block');
            // $.cookie('UserKey', $('#txtKey').val(), { path: '/' });
            // alert("Fire" + $('#txtKey').val());

            $.cookie('DB_Key', $('#txtKey').val(), { expires: 7, path: '/' })
            $("#PopUpKey").popup();
            $("#PopUpKey").popup('close');

        }

        function Create_User() {
            //alert($.cookie('DB_Key'));
           

            window.location.href = "CreateUser.aspx";

        }

        function User_Log_In() {
            //alert($.cookie('DB_Key'));
            var u_id = document.getElementById('txtUser').value;
            var pass = document.getElementById('txtpassword').value;

            if (u_id == '') {
                call("Username can not be empty");
                document.getElementById('txtUser').focus();
                return false;
            }
            if (pass == '') {
                call("Password can not be empty");
                document.getElementById('txtpassword').focus();
                return false;
            }

            window.location.href = "Home_Screen.aspx";
            //var abt = {
            //    "DeviceID": "''",
            //    "DeviceType": "''",
            //    "UserName": u_id,
            //    "Password": pass
            //};
            //alert(Get_UrL);
            //var _url = Get_UrL + "/CMPMobileLogin.asmx/GetUserLogin";
            ////alert(_url);
            //jQuery.ajax({
            //    url: _url,
            //    dataType: 'json',
            //    data: JSON.stringify(abt),
            //    type: "POST",
            //    accepts: "application/json",
            //    beforeSend: function (x) {
            //        x.setRequestHeader("Content-Type", "application/json");
            //    },
            //    success: function (data, textStatus, jqXHR) {

            //        jQuery.each($.parseJSON(data.d), function (idx, obj) {
            //        // alert(obj.responseCode)
            //            if (obj.responseCode == "-3") {
            //                $("#Kill_Session").css('display', 'block');
            //                $("#Main_Control").css('display', 'none');
            //                $("#txtpassword").val('');
            //                call("User has already logged in");
            //                return;
            //            }

            //            if (obj.responseCode == 0) {
            //                $.cookie('sessionid', obj.SessionID, { expires: 1, path: '/' });
            //                //alert($.cookie("sessionid"));

            //                $.cookie('UserID', u_id, { expires: 1, path: '/' });
            //                $.cookie('UserKey', pass, { expires: 1, path: '/' });
            //                $.cookie('Client_ID', obj.Client_ID, { expires: 1, path: '/' });

            //                $.cookie('UserInternalID', obj.USER_ID, { expires: 1, path: '/' });
            //                $.cookie('Company_ID', obj.Company_ID, { expires: 1, path: '/' });
            //                $.cookie('Location_ID', obj.Loc_ID, { expires: 1, path: '/' });
            //                $.cookie('Pr_Emp_ID', obj.PR_EMP_MST_ID, { expires: 1, path: '/' });
            //                $.cookie('Emp_No', obj.EMP_NO, { expires: 1, path: '/' });
            //                $.cookie('Special_Approval', obj.SPECIAL_APPROVAL, { expires: 1, path: '/' });

            //                window.location.href = $.cookie('Master_Redirect');
            //                var _temp_redirect = $.cookie('Master_Redirect');
            //                if (_temp_redirect == undefined) {
            //                    window.location.href = "Home_Screen.aspx";
            //                }
            //                else {
            //                    window.location.href = $.cookie('Master_Redirect');
            //                }
            //            }
            //            else {
            //                //alert("error");
            //                call(obj.responseMessage);
            //            }
            //        });
            //    },
            //    error: function (xhr, error, code) {
            //        // SOMETHING WRONG WITH YOUR CALL.

            //        $("#DIv_User").html(xhr.responseText);
            //    },
            //    //complete: function () {
            //    //    alert("Process Completed.");
            //    //}
            //});
        }


        function Kill_Session() {
            //alert($.cookie('DB_Key'));
            var u_id = document.getElementById('txtUser').value;
            var pass = document.getElementById('txtpassword').value;

            if (u_id == '') {
                call("Username Can Not Be Empty");
                document.getElementById('txtUser').focus();
                return false;
            }
            if (pass == '') {
                call("Password Can Not Be Empty");
                document.getElementById('txtpassword').focus();
                return false;
            }

            var abt = {
                "DeviceID": "''",
                "DeviceType": "''",
                "UserName": u_id,
                "Password": pass
            };

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
                        if (obj.responseCode == "1") {
                            $("#Kill_Session").css('display', 'block');
                            $("#Main_Control").css('display', 'none');
                            $("#txtpassword").val('');
                            call(obj.responseMessage);
                            return;
                        }

                        if (obj.responseCode == 0) {
                            $("#Kill_Session").css('display', 'none');
                            $("#Main_Control").css('display', 'block');
                            $("#txtpassword").val('');
                            call(obj.responseMessage);
                        }
                        else {
                            call(obj.responseMessage);
                        }
                    });
                },
                error: function (xhr, error, code) {
                    // SOMETHING WRONG WITH YOUR CALL.
                    $("#DIv_User").html(xhr.responseText);
                },
                //complete: function () {
                //    alert("Process Completed.");
                //}
            });
        }


    </script>
</head>
<body id="Main_Body">

    <div class="ui-content" id="popupBasic" style="max-width: 280px;" data-role="popup">
        <a class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" data-rel="back">Close</a>
        <p id="Alert_text"></p>
    </div>

     <div class="header_FX" data-role="header" style="overflow: visible;background-image: url(images/Header.png)">
        <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all ui-btn-left" href="#" onclick="javascript:{ window.location.href = 'Master_Screen.aspx'; }">No text</a>
        <h1>Log In</h1>
        <div data-role="navbar">
        </div>
    </div>

    <table id="screen" style="width: 100%">

        <tr>
            <td>
                <div data-role="content">
                    <div style="text-align: center">
                        <img src="images/ic_CMP_logo.png" alt="" width="130px" height="80px" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 30px;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">

                <table style="width: 100%;" role="main" class="ui-content">
                    <tr>
                        <td style="width: 30%">
                            <label for="text-1">Email :</label>
                        </td>
                        <td style="width: 60%">
                            <input name="txtUser" id="txtUser" type="text" value="" width="50" /></td>
                    </tr>
                    <tr>
                        <td style="width: 30%">
                            <label for="text-1">Password :</label></td>
                        <td style="width: 60%">
                            <input type="password" data-clear-btn="false" name="txtpassword" id="txtpassword" autocomplete="off" value="" width="50" /></td>
                    </tr>
                    <tr>
                        <td style="width: 30%">
                            <label for="text-1">2 Steps Verification Code :</label></td>
                        <td style="width: 60%">
                            <input type="password" data-clear-btn="false" name="txtpassword" id="txtpassword" autocomplete="off" value="" width="50" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr></tr>
    </table>

    <div id="PopUpKey" class="ui-content" id="positionWindow" data-role="popup" data-theme="a">
        <p><b>Key</b></p>
        <p>
            <input type="text" data-clear-btn="false" name="txtKey" id="txtKey" value="" autocomplete="off" />
        </p>
        <div style="text-align: center"><a class="ui-btn ui-btn-inline ui-icon-lock ui-btn-icon-left" href="#" onclick="Default_view();">Set</a></div>
    </div>


    <div style="text-align: center" id="Main_Control">
        <a class="ui-btn ui-btn-inline ui-icon-lock ui-btn-icon-left" href="#" onclick="return User_Log_In();">Secure Login</a>
        <a class="ui-btn ui-btn-inline ui-icon-user ui-btn-icon-left" href="#" onclick="return Create_User();">Create User</a>
    </div>   

    <div style="text-align: center; display: none" id="Kill_Session">
        <a class="ui-btn ui-btn-inline ui-icon-action ui-btn-icon-left" href="#" onclick="return Kill_Session();">Kill_Session</a>
    </div>

    <div id="DIv_User"></div>
    <input id="Web_url" value="URL" type="hidden" />
</body>
</html>
