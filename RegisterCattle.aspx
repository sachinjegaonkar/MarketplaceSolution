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

    
    <script src="script/ThemeJS/jquery.js"></script>
    <link href="css/jquery.mobile-1.4.5.min.css" rel="stylesheet" />
    <script src="script/jquery-1.11.3.min.js"></script>
    <script src="script/ThemeJS/jquery.mobile-1.4.5.min.js"></script> 

    <script src="script/Global_Script.js"></script>
    <script src="script/jquery.cookie.js"></script>
        
    <link href="css/jquery.mobile.datepicker.css" rel="stylesheet" />
    <script src="script/jquery.ui.datepicker.js"></script>
    <script src="script/jquery.mobile.datepicker.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/web3.min.js"></script>
    <script src="js/truffle-contract.js"></script>
    <script src="js/app.js"></script>
    
    <script>
        InitBrowser("css/BrowserCss.css");

        var Get_UrL;



        function call(txt) {
            $("#Alert_text").html(txt);
            $("#popupBasic").popup();
            $("#popupBasic").popup('open');
        }


        



        function LogOut() {
            Kill_Session();
            $.removeCookie("sessionid", { path: "/" });
            $.removeCookie("UserID", { path: "/" });
            $.removeCookie("UserKey", { path: "/" });
            $.removeCookie("Master_Redirect", { path: "/" });
            
            
            window.location.href = "LogIn.aspx";
        }

        function HideShowDive(t_id) {

            if (t_id.id == "radiodaily") {
                $("#Div_Weekly").hide();
                $("#Div_Daily").show();
            }
            else {
                $("#Div_Weekly").show();
                $("#Div_Daily").hide();
            }
        }


        function Get_time(cnt) {

            Get_Server_Time(cnt);
        }
        function Get_Server_Time(cnt) {

            var checkid = "", passval = "";
            checkid = cnt.id;


            ChangeRequest = 1;
            var _tempCookies = $.cookie("sessionid");

            if (_tempCookies == "" || _tempCookies == undefined) {
                window.location.href = "LogIn.aspx";
                return false;
            }

            abt = {
                "SessionID": _tempCookies,
            };

            var _url = Get_UrL + "/CobWebService.asmx/GetServerTime";
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
                    //alert(data.d);
                    jQuery.each($.parseJSON(data.d), function (idx, obj) {
                        if (obj.responseCode == '-2') {
                            alert(obj.responseMessage);
                            $.removeCookie("sessionid", { path: "/" });
                            window.location.href = "LogIn.aspx";
                            return false;
                        }
                        if (obj.responseCode == '1') {
                            $("#DIv_User").html(obj.responseMessage);
                            $("#DIv_User").effect('bounce', 'slow');
                            return false;
                        }

                        if (obj.responseCode == '0') {
                            $("#DIv_User").html('');
                        }

                    });

                    var Customer = JSON.parse(data.d);

                    for (var x = 0; x < Customer.length; x++) {
                        var Cust = Customer[x];
                        var pn = "";
                        var comp_time = "";
                        var dt = new Date();
                        var time = dt.getHours() + ":" + dt.getMinutes();

                        var ser_time = format_time(time, ":");
                        if ($(cnt).val() != '____') {

                            if (Cust.getServerTime.length == "") {
                                alert(data.responseMessage); txtUser
                            }
                            else {
                                var CntForm = "", t_time = "";
                                var st = Cust.getServerTime;
                                t_time = st.slice(0, 2) + ":" + st.slice(2, 4);

                                if (checkid == "Next") // condition check for from which image icon control call.                                                                    
                                    CntForm = "<input name='txtUser' maxlength='4'   id='txtUser' type='time' value='" + t_time + "' style='width:68px;text-align:center;'   onblur='txt_on_blurStart(this);' />";
                                else
                                    CntForm = "<input name='txtUser' maxlength='4'   id='txtUser' type='time' value='" + t_time + "' style='width:68px;text-align:center;'  onblur='txt_on_blurEnd(this);' />";


                                //if (checkid == "Next") // condition check for from which image icon control call.
                                //    cnt.innerHTML = "<input name='txtUser' maxlength='4'   id='txtUser' type='time' value='" + currenttim + "' style='width:68px;text-align:center;' onfocusin='focusFunction(this,);' onfocusout='blurFunction(this);' onblur='txt_on_blurStart(this);' />";
                                //else
                                //    cnt.innerHTML = "<input name='txtUser' maxlength='4'   id='txtUser' type='time' value='" + Cust.getServerTime + "' style='width:68px;text-align:center;'  onblur='txt_on_blurEnd(this);' />";

                                cnt.innerHTML = CntForm;
                                //$(cnt).find('input').val(Cust.getServerTime);
                                // cnt.innerHTML = Cust.getServerTime;

                            }

                        }
                        $(cnt).children().eq(0).focus()
                        $(cnt).removeAttr('onclick');
                    }
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


        function txt_on_blurStart(btn) {
            var prev_value = $(btn).val();
            //$(btn).closest('td').empty();
            $(btn).closest('td').attr('onclick', 'return Get_time(this)');
            //  alert("value of pass=" + passval);
            if (prev_value == "") {
                // $(btn).closest('td').text("____");
                //$(btn).closest('td').remove();

                $(btn).closest('td').text("").append("<a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' ></a>");
                // $(btn).closest('td').innerHTML("<a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' >safd</a>");
            }
            else {
                $(btn).closest('td').text(prev_value);
            }
        }

        function txt_on_blurEnd(btn) {
            //var arr = [].slice.call(passval);

            var prev_value = $(btn).val();
            //$(btn).closest('td').empty();
            $(btn).closest('td').attr('onclick', 'return Get_time(this)');
            //  alert("value of pass=" + passval);
            if (prev_value == "") {
                // $(btn).closest('td').text("____");
                //$(btn).closest('td').remove();
                // $(btn).val('12:18');
                $(btn).closest('td').text("").append("<a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' ></a>");
                // $(btn).closest('td').innerHTML("<a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' >safd</a>");
            }
            else {
                //$(btn).val('12:18');
                $(btn).closest('td').text(prev_value);
            }
        }

       

        function SaveOnClick() {
            App.registerCattle();
        }

        

    </script>
    <style>
        .textbox {
            -moz-box-shadow: inset 0 0 10px #000000;
            -webkit-box-shadow: inset 0 0 10px #000000;
            box-shadow: inset 0 0 10px #000000;
            text-align: center;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div data-role="header" style="overflow: visible; background-image: url(images/Header.png); height: 40px;">
        <div style="width: 35%; height: 40px; float: left">
            <a onclick="javascript:{ window.location.href = 'HomeScreen.aspx'; }" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all ui-btn-left" href="#">&nbsp;</a>
            <img src="images/ic_CMP_logo.png" alt="" style="margin-left: 50px; width: 80px; height: 40px" />
        </div>
        <div style="width: 30%; height: 40px; float: left; line-height: 40px; text-align: center;">
            Register Cattle
        </div>
        <div style="width: 35%; height: 40px; float: left; text-align: right">
            <a class="ui-btn ui-icon-power ui-btn-icon-notext ui-corner-all ui-btn-right" href="#" onclick="LogOut();">&nbsp;</a>
            <img id="comp_logo" alt="" style="margin-right: 40px; width: 80px; height: 40px" />
        </div>
    </div>

    <br />

    <div class="ui-content" id="popupBasic" style="max-width: 280px;" data-role="popup">
        <a class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" href="#" data-rel="back">Close</a>
        <p id="Alert_text"></p>
    </div>

    <div data-role="main"  id="tabs">
        
        <div id="Div_Daily" class="ui-body-d ui-content" style="display: block">

            <p>
                <label for="txtCattleName"><b>Cattle Name</b></label>
                <input type="text" name="txtCattleName" id="txtCattleName" />
            </p>
            
             <p>
                <label for="Breed_Type"><b>Breed Type</b></label>
                <select id="Breed_Type" name="Breed_Type">
                    <option value="Jershi">Jershi</option>
                    <option value="Jafrabadi">Jafrabadi</option>
                    <option value="Pandhari">Pandhari</option>                                        
                </select>
            </p>

             <p>
                <label for="Birth_Date"><b>Birth Date</b></label>
                <input type="text" id="Birth_Date" data-role="date" readonly="readOnly" style="text-align: center" />
            </p>
            <p>
                <label for="milk_in_ltrs"><b>Milk in Ltrs</b></label>
                <input type="text" name="milk_in_ltrs" id="milk_in_ltrs" style="height: 12px;" />
            </p>

              <p>
                <label for="cattle_sex"><b>Cattle Sex</b></label>
                <select id="cattle_sex" name="cattle_sex">
                    <option value="M">Male</option>
                    <option value="F">Female</option>                                                          
                </select>
            </p>

            
            <p>
                <label for="location"><b>Location</b></label>
                <input type="text" name="location" id="location" style="height: 12px;" />
            </p>
            <p>
                <label for="last_caft_birth "><b>Last Calf Birth</b></label>
                <input type="text" name="last_caft_birth" id="last_caft_birth" style="height: 12px;" />
            </p>
            <div data-role="content">
                <table style="width: 60%;" align="center">
                    <tr>
                        <label for="txtUpdate_cattle_health."><b>Update Cattle Health</b></label>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="radio" name="radio-choice-1" id="radiodaily" value="B" checked="checked" data-inline="true" />&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">Bad</label>
                        </td>
                        <td align="center">
                            <input type="radio" name="radio-choice-1" id="radioweekly" value="G" />&nbsp;&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">Good</label>
                        </td>
                        <td align="center">
                            <input type="radio" name="radio-choice-1" id="radioweekly" value="BE" />&nbsp;&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">better</label>
                        </td>
                        <td align="center">
                            <input type="radio" name="radio-choice-1" id="radioweekly" value="BS" />&nbsp;&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">best</label>
                        </td>
                    </tr>
                </table>
            </div>
             <p>
                <label for="description"><b>Description</b></label>
                <input type="text" name="description" id="txtDescription" style="height: 12px;" />
            </p>
            
        </div>

        <div style="text-align: center" id="Add_removeeq">
            <br />
            <a id="BtnSave" onclick="return SaveOnClick(this)" class="ui-btn ui-btn-inline ui-icon-check ui-btn-icon-right ui-corner-all " href="#">Save</a>
        </div>
    </div>
    <div id="DIv_User" style="text-align: center"></div>

    <input id="Web_url" value="URL" type="hidden" />
</body>
</html>
