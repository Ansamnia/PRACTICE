﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebRole1._Default" %>
<%@ Import Namespace="System.Net" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
       <p style="color: green; font-size: 15px;">Формат ввода: координаты заполнять через запятую числами вида: -1 ; 1.0; 1.   Пределы широты: от -85 до +85 градусов. Долготы от -179 до +179</p>
       <asp:TextBox ID="Name1Tbx" runat="server"   Text="Введите имя" Width="149px" Font-Size="10pt" Height="30px"></asp:TextBox> 
       <input id="latlng" type="text"  placeholder="Широта, долгота" style="width: 151px; height: 30px; font-size: 10pt;">
      <%--<asp:TextBox ID="LatTbx" runat="server" placeholder="Широта" Width="151px" Font-Size="10pt" Height="30px" CausesValidation="True" ToolTip="Широта">0.0</asp:TextBox>--%>
        <%--<asp:TextBox ID="LngTxt" runat="server" placeholder="Долгота" Width="151px" Font-Size="10pt" Height="30px" CausesValidation="True" ToolTip="Долгота">0.0</asp:TextBox>--%>
    
          <input id="submit" type="button" value="Поиск" style="margin-top: 20px; font-size: 10pt; width: 151px; height: 30px;" >
    </div>

    
    

    <div id="map" style="width: 1172px; height: 400px;"></div>
    <script>
        function initMap() {
         
            var l3 = document.getElementById("<%= Name1Tbx.ClientID %>").value;

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: { lat: 46.28, lng: 30.43 }
            });
            var geocoder = new google.maps.Geocoder;
            var infowindow = new google.maps.InfoWindow;

            document.getElementById('submit').addEventListener('click', function () {
                geocodeLatLng(geocoder, map, infowindow);
            });
        }

        function geocodeLatLng(geocoder, map, infowindow) {
            var input = document.getElementById('latlng').value;
            var latlngStr = input.split(',', 2);
            var latlng = { lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1]) };
            geocoder.geocode({ 'location': latlng }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        map.setZoom(11);
                        var marker = new google.maps.Marker({
                            position: latlng,
                            map: map
                            
                        });
                        infowindow.setContent(results[1].formatted_address);
                        infowindow.open(map, marker);
                    } else {
                        window.alert('Нет результатов');
                    }
                } else {
                    window.alert('Адреса не найдено: ' + status);
                }
            });
        }
    </script>

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVVHD0A_3wofk8oZheY15KyElaejg-W8o&signed_in=true&callback=initMap">
    </script>

    <%--<div id="map" style="width: 1172px; height: 400px;"></div>
    <script>
        
       function initMap() {

            var l = document.getElementById("<%=LatTbx.ClientID%>").value;
            var l2 = document.getElementById("<%= LngTxt.ClientID %>").value;
            var l3 = document.getElementById("<%= Name1Tbx.ClientID %>").value;


            var mapDiv = document.getElementById('map');
            var myLatlng = new google.maps.LatLng(l, l2);
            var map = new google.maps.Map(mapDiv, {
                center: myLatlng,
                zoom: 8
            });

            
            var geocoder = new google.maps.Geocoder;
            var infowindow = new google.maps.InfoWindow;
            var contentString = l3;
            var infowindow = new google.maps.InfoWindow({
                content: contentString
           });

            var marker = new google.maps.Marker({
                position: myLatlng,
                icon: 'map_icon.png',
                map:map,
                title: "Улица,дом,квартира"
            });

            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });

         


       }
        //function initMap() {
        //    var map = new google.maps.Map(document.getElementById('map'), {
        //        zoom: 8,
        //        center: { lat: 40.731, lng: -73.997 }
        //    });
        //    var geocoder = new google.maps.Geocoder;
        //    var infowindow = new google.maps.InfoWindow;

        //    document.getElementById('submit').addEventListener('click', function () {
        //        geocodeLatLng(geocoder, map, infowindow);
        //    });
        //}

        //function geocodeLatLng(geocoder, map, infowindow) {
        //    var input = document.getElementById('latlng').value;
        //    var latlngStr = input.split(',', 2);
        //    var latlng = { lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1]) };
        //    geocoder.geocode({ 'location': latlng }, function (results, status) {
        //        if (status === google.maps.GeocoderStatus.OK) {
        //            if (results[1]) {
        //                map.setZoom(11);
        //                var marker = new google.maps.Marker({
        //                    position: latlng,
        //                    map: map
        //                });
        //                infowindow.setContent(results[1].formatted_address);
        //                infowindow.open(map, marker);
        //            } else {
        //                window.alert('No results found');
        //            }
        //        } else {
        //            window.alert('Geocoder failed due to: ' + status);
        //        }
        //    });
        //}--%>
<%--    </script>--%>
   <%-- <script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>--%>


    
     
    
    
    
</asp:Content>
