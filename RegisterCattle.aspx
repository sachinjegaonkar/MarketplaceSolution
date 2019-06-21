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

    <script>
        InitBrowser("css/BrowserCss.css");

        var Get_UrL;

        $(document).ready(function () {


            //$('#dailydatepicker').datepicker('setDate', $.now());
            //$('#dailydatepicker').datepicker('option', 'dateFormat', 'dd/M/yy');



            //$('#weekFromdt').datepicker('setDate', $.now());
            //$('#weekFromdt').datepicker('option', 'dateFormat', 'dd/M/yy');

            //$('#weekTodt').datepicker('setDate', $.now());
            //$('#weekTodt').datepicker('option', 'dateFormat', 'dd/M/yy');

            //$(".ui-datepicker").hide();
            //get_Airline_Code();
            //get_flights();
        });


        function call(txt) {
            $("#Alert_text").html(txt);
            $("#popupBasic").popup();
            $("#popupBasic").popup('open');
        }


        //function back_Date() {
        //    if ($("#datepicker").val() == "") {
        //        call("Date Can Not Be Empty");
        //        return false;
        //    }
        //    var date2 = $('#datepicker').datepicker('getDate', '+1d');
        //    date2.setDate(date2.getDate() - 1);
        //    $('#datepicker').datepicker('setDate', date2);
        //    get_flights();
        //}

        //function Next_Date() {
        //    if ($("#datepicker").val() == "") {
        //        call("Date Can Not Be Empty");
        //        return false;
        //    }
        //    var date2 = $('#datepicker').datepicker('getDate', '+1d');
        //    date2.setDate(date2.getDate() + 1);
        //    $('#datepicker').datepicker('setDate', date2);
        //   // get_flights();
        //}

        //function get_Airline_Code() {

        //    var t_logo = "../" + $.cookie("Company_Logo");
        //    document.getElementById("comp_logo").src = t_logo;

        //    // var _tempCookies = $.cookie("sessionid");
        //    ChangeRequest = 1;
        //    //var _tempCookies = $.cookie("sessionid");

        //    //if (_tempCookies == "" || _tempCookies == undefined) {
        //    //    window.location.href = "LogIn.aspx";
        //    //    return false;
        //    //}

        //    abt = {
        //        "SessionID": _tempCookies,
        //    };
        //    var _url = Get_UrL + "/CobWebService.asmx/GetAirlineCode";//"/CobWebService.asmx/GetServerTime";            
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
        //                    window.location.href = "LogIn.aspx";
        //                    return false;
        //                }
        //                if (obj.responseCode == '1') {
        //                    $("#DIv_User").html(obj.responseMessage);
        //                    $("#DIv_User").effect('bounce', 'slow');
        //                    return false;
        //                }
        //                if (obj.responseCode == '0') {
        //                    $("#DIv_User").html('');
        //                }
        //            });

        //            var Customer = JSON.parse(data.d);
        //            for (var x = 0; x < Customer.length; x++) {
        //                var Cust = Customer[x];
        //                // alert("VAlue of cust=" + Cust);
        //                $("#dailyairline_code").append($("<option></option>").val(Cust.Customer_Master_ID).html(Cust.Code));
        //                $("#dailyairline_code option:first").attr("selected", "selected");

        //                $("#weeklyairline_code").append($("<option></option>").val(Cust.Customer_Master_ID).html(Cust.Code));
        //                $("#weeklyairline_code option:first").attr("selected", "selected");

        //            }

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



        function LogOut() {
            Kill_Session();
            $.removeCookie("sessionid", { path: "/" });
            $.removeCookie("UserID", { path: "/" });
            $.removeCookie("UserKey", { path: "/" });
            $.removeCookie("Master_Redirect", { path: "/" });
            $.removeCookie("Company_Logo", { path: "/" });
            // alert($.cookie("sessionid"));
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

        function format_time(HH_MM_SS, split_sym) {
            var time = HH_MM_SS.split(split_sym)

            var ret_HH = time[0];
            if (time[0] < 10) {
                ret_HH = "";
                ret_HH = "0" + time[0];
            }

            var ret_MM = time[1];
            if (time[1] < 10) {
                ret_MM = time[1];
                ret_MM = "0" + time[1];
            }

            var ret_SS = time[2];;
            if (time[2] < 10) {
                ret_SS = "";
                ret_SS = "0" + time[2];
            }

            //return ret_HH + ":" + ret_MM + ":" + ret_SS;
            return ret_HH + ret_MM
        }

        function SaveOnClick() {
            var retVal = true;
            var _tempCookies = $.cookie("sessionid");

            if (_tempCookies == "" || _tempCookies == undefined) {
                window.location.href = "LogIn.aspx";
                return false;
            }
            $.cookie('StopRedirection', "Y", { expires: 1, path: '/' });


            var Error_flag = "1";

            if ($('#radiodaily').is(':checked')) {


                var dailyAirline_code = "", dailyAirline_txt = "";
                dailyAirline_code = $("#dailyairline_code option:selected").val();
                dailyAirline_txt = $("#dailyairline_code option:selected").text();
                //  alert("value of drop=" + dailyAirline_code + " txt= " + dailyAirline_txt);
                if (dailyAirline_code == '0') {
                    call("Select Airline Code");
                    //$('#dailyAirline_code').focus();
                    setTimeout(function () {
                        $('#dailyAirline_code').focus();
                    }, 0);

                    retVal = false;
                    return false;
                }


                var txtdailyarival = document.getElementById("txtarrival_flight_no").value;
                var txtdailydept = document.getElementById("txtDept_flight_no").value;

                if (txtdailyarival.trim() == '' && txtdailydept.trim() == '') {
                    if (txtdailyarival == '') {
                        call("Arrival Flight Or Departure Flight Can Not Be Empty");
                        $('#txtarrival_flight_no').focus();
                        retVal = false;
                        return false;
                    }
                }


                var STAtd = $('#NEXT').text();
                if (STAtd.trim() == '') {
                    call("STA Can Not Be Empty");
                    //$('#Next').focus();
                    retVal = false;
                    return false;
                }

                var STDtd = $('#STDtd').text();
                if (STDtd.trim() == '') {
                    call("STD Can Not Be Empty");
                    //$('#Next').focus();
                    retVal = false;
                    return false;
                }

                var txtair_craft_type = document.getElementById("txtair_craft_type").value;
                if (txtair_craft_type.trim() == '') {
                    call("Aircraft Type Can Not Be Empty");
                    //$('#Next').focus();
                    retVal = false;
                    return false;
                }

                var txtac_reg_no = document.getElementById("txtac_reg_no").value;
                if (txtac_reg_no.trim() == '') {
                    call("A/C Reg No. Can Not Be Empty");
                    //$('#Next').focus();
                    retVal = false;
                    return false;
                }
            }
            else {
                //alert("I am in Else");
                var Fromdt = document.getElementById("weekFromdt").value;
                var Todt = document.getElementById("weekTodt").value;

                var jdt1 = Date.parse(Fromdt);
                var jdt2 = Date.parse(Todt);

                if (jdt1 > jdt2) {
                    call("From Date Can Not be Greater Than To Date");
                    retVal = false;
                    return false;
                }

                var txtweekarri_flight_no = document.getElementById("txtweekarri_flight_no").value;
                var txtweekDept_flight_no = document.getElementById("txtweekDept_flight_no").value;

                if (txtweekDept_flight_no.trim() == '' && txtweekarri_flight_no.trim() == '') {
                    // if (txtdailyarival == '') {
                    call("Arrival Flight Or Departure Flight Can Not Be Empty");
                    $('#txtweekarri_flight_no').focus();
                    retVal = false;
                    return false;
                    // }
                }
                var txtair_craft_type = document.getElementById("txtweekair_craft_type").value;
                if (txtair_craft_type.trim() == '') {
                    call("Aircraft Type Can Not Be Empty");
                    $('#txtweekair_craft_type').focus();
                    retVal = false;
                    return false;
                }

                var MonSTA = "", MonSTD = "", TueSTA = "", TueSTD = "", WenSTA = "", WenSTD = "";
                var ThuSTA = "", ThuSTD = "", FriSTA = "", FriSTD = "", SatSTA = "", SatSTD = "", SunSTA = "", SunSTD = "";



                MonSTA = $('#monSTAtd').text().trim();
                MonSTD = $('#monSTDtd').text().trim();

                if (MonSTA.trim() == '' && MonSTD.trim() != '') {
                    call('Enter STA For Day Monday');
                    $('#monSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (MonSTA.trim() != '' && MonSTD.trim() == '') {
                    call('Enter STD For Day Monday');
                    $('#monSTAtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + MonSTA.slice(0, 2) + ":" + MonSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + MonSTD.slice(0, 2) + ":" + MonSTD.slice(3, 5));

                if (MonSTA.trim() != '' && MonSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#monSTAtd').focus();
                        retVal = false;
                        return false;
                    }
                }

                //===========End for monday==========

                TueSTA = $('#tueSTAtd').text().trim();
                TueSTD = $('#tueSTDtd').text().trim();

                if (TueSTA.trim() == '' && TueSTD.trim() != '') {
                    call('Enter STA For Day Tuesday');
                    $('#tueSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (TueSTA.trim() != '' && TueSTD.trim() == '') {
                    call('Enter STD For Day Tuesday');
                    $('#tueSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + TueSTA.slice(0, 2) + ":" + TueSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + TueSTD.slice(0, 2) + ":" + TueSTD.slice(3, 5));

                if (TueSTA.trim() != '' && TueSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#tueSTAtd').focus();
                        retVal = false;
                        return false;
                    }
                }

                //=========End For Tuesday=====

                WenSTA = $('#wenSTAtd').text().trim();
                WenSTD = $('#wenSTDtd').text().trim();

                if (WenSTA.trim() == '' && WenSTD.trim() != '') {
                    call('Enter STA For Day Wednesday');
                    $('#wenSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (WenSTA.trim() != '' && WenSTD.trim() == '') {
                    call('Enter STD For Day Wednesday');
                    $('#wenSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + WenSTA.slice(0, 2) + ":" + WenSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + WenSTD.slice(0, 2) + ":" + WenSTD.slice(3, 5));

                if (WenSTA.trim() != '' && WenSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        alert('STA should not be greater than STD');
                        $('#wenSTDtd').focus();
                        retVal = false;
                        return false;
                    }
                }

                // //=========End For Wen=====

                ThuSTA = $('#thuSTAtd').text().trim();
                ThuSTD = $('#thuSTDtd').text().trim();

                if (ThuSTA.trim() == '' && ThuSTD.trim() != '') {
                    call('Enter STA For Day Thursday');
                    $('#thuSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (ThuSTA.trim() != '' && ThuSTD.trim() == '') {
                    call('Enter STD For Day Thursday');
                    $('#thuSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + ThuSTA.slice(0, 2) + ":" + ThuSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + ThuSTD.slice(0, 2) + ":" + ThuSTD.slice(3, 5));

                if (ThuSTA.trim() != '' && ThuSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#thuSTAtd').focus();
                        retVal = false;
                        return false;
                    }
                }

                //=============End Thur============

                FriSTA = $('#friSTAtd').text().trim();
                FriSTD = $('#friSTDtd').text().trim();


                if (FriSTA.trim() == '' && FriSTD.trim() != '') {
                    call('Enter STA For Day Friday');
                    $('#friSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (FriSTA.trim() != '' && FriSTD.trim() == '') {
                    call('Enter STD For Day Friday');
                    $('#friSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + FriSTA.slice(0, 2) + ":" + FriSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + FriSTD.slice(0, 2) + ":" + FriSTD.slice(3, 5));

                if (FriSTA.trim() != '' && FriSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#friSTDtd').focus();
                        retVal = false;
                        return false;
                    }
                }
                //======End of Friday==========


                SatSTA = $('#satSTAtd').text().trim();
                SatSTD = $('#satSTDtd').text().trim();

                if (SatSTA.trim() == '' && SatSTD.trim() != '') {
                    call('Enter STA For Day Saturday');
                    $('#satSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (SatSTA.trim() != '' && SatSTD.trim() == '') {
                    call('Enter STD For Day Saturday');
                    $('#satSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + SatSTA.slice(0, 2) + ":" + SatSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + SatSTD.slice(0, 2) + ":" + SatSTD.slice(3, 5));

                if (SatSTA.trim() != '' && SatSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#satSTDtd').focus();
                        retVal = false;
                        return false;
                    }
                }
                //=======End of Saturday======

                SunSTA = $('#sunSTAtd').text().trim();
                SunSTD = $('#sunSTDtd').text().trim();

                //alert(SunSTA + " " + SunSTD);

                if (SunSTA.trim() == '' && SunSTD.trim() != '') {
                    call('Enter STA For Day Sunday');
                    $('#sunSTAtd').focus();
                    retVal = false;
                    return false;
                }
                else if (SunSTA.trim() != '' && SunSTD.trim() == '') {
                    call('Enter STD For Day Sunday');
                    $('#satSTDtd').focus();
                    retVal = false;
                    return false;
                }
                var jdt1 = Date.parse('24 Aug 2000 ' + SunSTA.slice(0, 2) + ":" + SunSTA.slice(3, 5));
                var jdt2 = Date.parse('24 Aug 2000 ' + SunSTD.slice(0, 2) + ":" + SunSTD.slice(3, 5));

                if (SunSTA.trim() != '' && SunSTD.trim() != '') {
                    if (jdt1 > jdt2) {
                        call('STA should not be greater than STD');
                        $('#sunSTAtd').focus();
                        retVal = false;
                        return false;
                    }
                }



            } //End of else

            //alert("value of" + dt1);

            return retVal;
        }

        //function txt_on_blur(btn) {

        //   // alert("i am in blur");
        //    var prev_value = $(btn).val();
        //    //$(btn).closest('td').empty();
        //    alert(prev_value);
        //    var time = $(btn).val();// $("#starttime").val();
        //    alert(time);
        //    var hours = Number(time.match(/^(\d+)/)[1]);
        //    alert("Hourse" + hours);

        //    var minutes = Number(time.match(/:(\d+)/)[1]);
        //    alert("minutes" + minutes);
        //    var takeid = btn.id;
        //    alert("ID of control=" + takeid);
        //    //24:25
        //    var valt="14" + ":" + minutes;
        //    $(btn).val(valt);
        //    // $(btn).val = hours + ":" + minutes;
        //    //document.getElementById(takeid).value = hours + ":" + minutes;
        //    //$(takeid).val(hours + ":" + minutes);
        //    //var AMPM = time.match(/\s(.*)$/)[1];
        //    //alert("AMPM=" + AMPM);
        //    //if(AMPM == "PM" && hours<12) hours = hours+12;
        //    //if(AMPM == "AM" && hours==12) hours = hours-12;
        //    //var sHours = hours.toString();
        //    //var sMinutes = minutes.toString();
        //    //if(hours<10) sHours = "0" + sHours;
        //    //if (minutes < 10) sMinutes = "0" + sMinutes;

        //    //alert(sHours + ":" + sMinutes);


        //    ////$(btn).closest('td').attr('onclick', 'return Get_time(this)');


        //    ////if (prev_value == "") {
        //    ////    $(btn).closest('td').text("____");
        //    ////}
        //    ////else {
        //    ////    $(btn).closest('td').text(prev_value);
        //    ////}


        //}

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
           <a onclick="javascript:{ window.location.href = 'Home_Screen.aspx'; }" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all ui-btn-left" href="#">&nbsp;</a>
            <img src="images/ic_rsmart_logo.png" alt="" style="margin-left: 50px; width: 80px; height: 40px" />
        </div>
        <div style="width: 30%; height: 40px; float: left; line-height: 40px; text-align: center;">
            Add Cattle
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
        <div data-role="content">
            <table style="width: 60%;" align="center">
                <tr>
                    <td align="center">
                        <input type="radio" name="radio-choice-1" id="radiodaily" value="D" checked="checked" data-inline="true" onclick="return HideShowDive(this)" />&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">Daily</label>
                    </td>
                    <td align="center">
                        <input type="radio" name="radio-choice-1" id="radioweekly" value="W" onclick="return HideShowDive(this)" />&nbsp;&nbsp;&nbsp;&nbsp;<label for="radio-choice-2">Weekly</label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="Div_Daily" class="ui-body-d ui-content" style="display: block">

            <p>
                <label for="dailydatepicker"><b>Birth Date</b></label>
                <input type="text" id="dailydatepicker" data-role="date" readonly="readOnly" style="text-align: center" />
            </p>
            <p>
                <label for="dailyairline_code"><b>Cattle Code</b></label>
                <select id="dailyairline_code" name="dailyairline_code">
                    <option value="0">Select Airline Code</option>
                </select>
            </p>
            <p>
                <label for="txtarrival_flight_no"><b>Arrival Flight No</b></label>
                <input type="text" name="txtarrival_flight_no" id="txtarrival_flight_no" />
            </p>
            <p>
                <label for="txtDept_flight_no"><b>Dept. Flight No</b></label>
                <input type="text" name="txtDept_flight_no" id="txtDept_flight_no" style="height: 12px;" />
            </p>

            <table style="width: 100%">
                <tr>
                    <td style="width: 25%"><b>STA</b></td>
                    <td style="width: 25%" id="NEXT" onclick='return Get_time(this);'><a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Start Time'></a></td>
                    <td style="width: 25%"><b>STD</b></td>
                    <td style="width: 25%" id="STDtd" onclick='return Get_time(this);' align='left' style="text-wrap: none; cursor: pointer">
                        <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Start Time'></a>
                    </td>
                </tr>
            </table>

            <p>
                <label for="txtair_craft_type"><b>Aircraft Type</b></label>
                <input type="text" name="txtair_craft_type" id="txtair_craft_type" style="height: 12px;" />
            </p>
            <p>
                <label for="txtac_reg_no"><b>A/C Reg No.</b></label>
                <input type="text" name="txtac_reg_no" id="txtac_reg_no" style="height: 12px;" />
            </p>
        </div>

        <div id="Div_Weekly" class="ui-body-d ui-content" style="display:none">

            <p>
                <label for="weekFromdt"><b>From Date</b></label>
                 <input type="text" id="weekFromdt" data-role="date" readonly="readOnly" style="text-align: center" />  
            </p>
             <p>
                <label for="weekTodt"><b>To Date</b></label>
                 <input type="text" id="weekTodt" data-role="date" readonly="readOnly" style="text-align: center" />  
            </p>
            <p>
                <label for="weeklyairline_code"><b>Airline Code</b></label>
                <select id="weeklyairline_code" name="weeklyairline_code" >  
                     <option value="0">Select Airline Code</option>
                </select>
            </p>            
             <p>
                <label for="txtweekarri_flight_no"><b>Arrival Flight No</b></label>
                 <input type="text"  name="txtweekarri_flight_no" id="txtweekarri_flight_no"  />
            </p>
              <p>
                <label for="txtweekDept_flight_no"><b>Dept. Flight No</b></label>
                <input type="text" name="txtweekDept_flight_no" id="txtweekDept_flight_no" />
            </p>
            
             <p>
                <label for="txtweekair_craft_type"><b>Aircraft Type</b></label>
                <input type="text" name="txtweekair_craft_type" id="txtweekair_craft_type"  />
            </p>
            
            <div id="DivEqInner" class="ui-body-d ui-content" style="height: 200px;" >
                <table data-role="table" id="table-Weekly-sub" style="border-spacing: 15px; align-content:center" data-mode="columntoggle:none" class="ui-responsive table-stripe ui-shadow">
                    <thead>
                        <tr style='background-color: #bababa;'>
                            <th >Day's</th>
                            <th >STA</th>
                            <th align="center" >STD</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Monday
                            </td>
                            <td id="monSTAtd" onclick='return Get_time(this);' align='center'>                               
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                            </td>
                            <td id="monSTDtd" onclick='return Get_time(this);' align='center'>                                 
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STD'></a>                         
                            </td>                            
                        </tr>
                        <tr>
                            <td>Tuesday
                            </td>
                           <td id="tueSTAtd" onclick='return Get_time(this);' align='center'>
                               <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="tueSTA" id="tueSTA" style="height: 12px;" />--%>
                            </td>
                            <td  id="tueSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="tueSTD" id="tueSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Wednesday
                            </td>
                           <td id="wenSTAtd" onclick='return Get_time(this);' align='center'>
                               <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="wenSTA" id="wenSTA" style="height: 12px;" />--%>
                            </td>
                            <td id="wenSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="wenSTD" id="wenSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Thursday
                            </td>
                            <td id="thuSTAtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="thuSTA" id="thuSTA" style="height: 12px;" />--%>
                            </td>
                            <td id="thuSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="thuSTD" id="thuSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Friday
                            </td>
                           <td id="friSTAtd" onclick='return Get_time(this);' align='center'>
                               <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="friSTA" id="friSTA" style="height: 12px;" />--%>
                            </td>
                            <td  id="friSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="friSTD" id="friSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Saturday
                            </td>
                           <td id="satSTAtd" onclick='return Get_time(this);' align='center'>
                               <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="satSTA" id="satSTA" style="height: 12px;" />--%>
                            </td>
                            <td id="satSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="satSTD" id="satSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Sunday
                            </td>
                            <td id="sunSTAtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="sunSTA" id="sunSTA" style="height: 12px;" />--%>
                            </td>
                            <td id="sunSTDtd" onclick='return Get_time(this);' align='center'>
                                <a href='#' class='ui-btn ui-icon-clock ui-btn-icon-notext ui-corner-all' title='Monday STA'></a>
                                <%--<input type="time" name="sunSTD" id="sunSTD" style="height: 12px;" />--%>                                
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
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
