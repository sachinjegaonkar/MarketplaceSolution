
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
    <script src="js/aadhar.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/web3.min.js"></script>
    <script src="js/truffle-contract.js"></script>
    <script src="js/app.js"></script>

    <script>
        InitBrowser("css/BrowserCss.css");

        var Get_UrL;

        $(document).ready(function () {

            $("#pui").show();
            $("#pli").hide();
            $("#preg").hide();

            $("#user_type").change(function () {
                var uid = $("#user_type").val();
                if (uid == 1) {
                    $("#pui").show();
                    $("#pli").hide();
                    $("#preg").hide();
                }
                else if (uid == 2) {
                    $("#pui").hide();
                    $("#pli").show();
                    $("#preg").hide();
                }
                else {
                    $("#pui").hide();
                    $("#pli").hide();
                    $("#preg").show();
                }
            });

        });


        function call(txt) {
            $("#Alert_text").html(txt);
            $("#popupBasic").popup();
            $("#popupBasic").popup('open');
        }

        function LogOut() {

            window.location.href = "LogIn.aspx";
        }


        function ValidateAadharId() {
            var aadhid = $('#txtUIDAI').val();
            var adVal = isValidNumber(aadhid);
            if (!adVal) {
                alert('Invalid Aadhar ID');
            }
            return adVal;
        }

        function SaveOnClick() {

            var vtxtfull_name = document.getElementById("txtfull_name").value;
            var retVal = true;

            if (vtxtfull_name.trim() == '') {

                call("Name can not be empty");
                $('#txtfull_name').focus();
                retVal = false;
                return false;
            }

            var txtemail_id = document.getElementById("txtemail_id").value;
            if (txtemail_id.trim() == '') {
                call("Email can not be empty");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            var txtaddress = document.getElementById("txtaddress").value;
            if (txtaddress.trim() == '') {
                call("Address can not be empty");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            var txtmobile_no = document.getElementById("txtmobile_no").value;
            if (txtmobile_no.trim() == '') {
                call("Mobile number can not be empty");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            var txtpassword = document.getElementById("txtpassword").value;
            if (txtpassword.trim() == '') {
                call("Password can not be empty");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            var txtconf_password = document.getElementById("txtconf_password").value;
            if (txtconf_password.trim() == '') {
                call("Confirm password can not be empty");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            if (txtconf_password.trim() != txtpassword.trim()) {
                call("Confirm password must match with the password.");
                //$('#Next').focus();
                retVal = false;
                return false;
            }

            var uid = $("#user_type").val();
            if (uid == 1) {
                var txtUIDAI = document.getElementById("txtUIDAI").value;
                if (txtUIDAI.trim() == '') {
                    call("Adhar number can not be empty");
                    retVal = false;
                    return false;
                }
                else {
                    if (!ValidateAadharId()) {
                        retVal = false;
                        return false;
                    }
                }
            }
            else if (uid == 2) {
                var txtLicense_No = document.getElementById("txtLicense_No").value;
                if (txtLicense_No.trim() == '') {
                    call("Veterinarian license number can not be empty. ");
                    retVal = false;
                    return false;
                }
            }
            else {
                var txtcompany_reg_no = document.getElementById("txtcompany_reg_no").value;
                if (txtcompany_reg_no.trim() == '') {
                    call("Dairy registration number can not be empty. ");
                    retVal = false;
                    return false;
                }
            }

            App.createAccount();

            return retVal;
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
            Create Account
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

    <div data-role="main" id="tabs">
        <div data-role="content">
        </div>
        <div id="Div_Daily" class="ui-body-d ui-content" style="display: block">
            <p>
                <label for="txtfull_name"><b>Full Name</b></label>
                <input type="text" name="txtfull_name" id="txtfull_name" />
            </p>
            <p>
                <label for="txtemail_id"><b>Email ID</b></label>
                <input type="text" name="txtemail_id" id="txtemail_id" />
            </p>
            <p>
                <label for="txtaddress"><b>Address</b></label>
                <input type="text" name="txtaddress" id="txtaddress" />
            </p>
            <p>
                <label for="txtmobile_no"><b>Mobile</b></label>
                <input type="text" name="txtmobile_no" id="txtmobile_no" />
            </p>
            <p>
                <label for="txtpassword"><b>Password</b></label>
                <input type="password" name="txtpassword" placeholder="password" id="txtpassword" />
            </p>
            <p>
                <label for="txtconf_password"><b>Confirm Password</b></label>
                <input type="password" name="txtconf_password" placeholder="password" id="txtconf_password" />
            </p>
            <p>
                <label for="user_type"><b>Acoount Type</b></label>
                <select id="user_type" name="user_type">
                    <option value="1">Farmer</option>
                    <option value="2">Veterinarian</option>
                    <option value="3">Dairy Company</option>
                </select>
            </p>

            <p id="pui">
                <label for="txtUIDAI"><b>UIDAI</b></label>
                <input type="text" name="txtUIDAI" id="txtUIDAI" />
            </p>

            <p id="pli">
                <label for="txtLicense_No"><b>License No.</b></label>
                <input type="text" name="txtLicense_No" id="txtLicense_No" />
            </p>

            <p id="preg">
                <label for="txtcompany_reg_no"><b>Company Reg No.</b></label>
                <input type="text" name="txtcompany_reg_no" id="txtcompany_reg_no" />
            </p>

        </div>

        <div style="text-align: center" id="Add_removeeq">
            <br />
            <a id="BtnSave" onclick="return SaveOnClick(this)" class="ui-btn ui-btn-inline ui-icon-check ui-btn-icon-right ui-corner-all " href="#">Submit</a>
        </div>

    </div>
    <div id="DIv_User" style="text-align: center"></div>

    <input id="Web_url" value="URL" type="hidden" />

</body>
</html>

