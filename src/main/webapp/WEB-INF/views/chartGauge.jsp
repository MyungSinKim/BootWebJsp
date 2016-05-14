<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Line Gauge</title>
  <script src="<c:url value="/webjars/jquery/2.2.1/jquery.min.js"/>"></script>
  <script src="<c:url value="/webjars/highcharts/4.2.3/highcharts.js"/>"></script>
  <script src="<c:url value="/webjars/highcharts/4.2.3/highcharts-more.js"/>"></script>
  <script src="<c:url value="/webjars/sockjs-client/1.0.2/sockjs.min.js"/>"></script>
  <script src="<c:url value="/webjars/stomp-websocket/2.3.3/stomp.min.js"/>"></script>
  <script src="<c:url value="/resources/js/initHighcharts.js"/>"></script>
  
<script>
$(function () {
	chartOptions = {
        chart: {
        	renderTo: 'chartGauge',
            type: 'gauge',
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: ''
        },
        pane: {
            startAngle: -150,
            endAngle: 150,
            background: [{
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#FFF'],
                        [1, '#333']
                    ]
                },
                borderWidth: 0,
                outerRadius: '109%'
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#333'],
                        [1, '#FFF']
                    ]
                },
                borderWidth: 1,
                outerRadius: '107%'
            }, {
            }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
            }]
        },
        yAxis: {
            min: 0,
            max: 200,
            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 10,
            minorTickPosition: 'inside',
            minorTickColor: '#666',
            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            labels: {
                step: 2,
                rotation: 'auto'
            },
            title: {
                text: 'km/h'
            },
            plotBands: [{
                from: 0,
                to: 120,
                color: '#55BF3B' // green
            }, {
                from: 120,
                to: 160,
                color: '#DDDF0D' // yellow
            }, {
                from: 160,
                to: 200,
                color: '#DF5353' // red
            }]
        },
        series: [{
            name: 'Speed',
            data: [0],
            tooltip: {
                valueSuffix: ' km/h'
            }
        }]
    };
    
	var chartGauge = new Highcharts.Chart(chartOptions);
	
    function redrawChart(speed) {
        var point = chartGauge.series[0].points[0];
        point.update(parseInt(speed));
    }

    function sendData() {
        var speed = Math.floor((Math.random() * 200) + 1);
        stompClient.send("/BootWebJsp/howfast", {}, JSON.stringify({'currentSpeed':speed}));
    }

    var stompClient = null;

    function connect() {
	    var socket = new SockJS('/BootWebJsp/howfast');
	    stompClient = Stomp.over(socket);            
	    stompClient.connect({}, function(frame) {
	        console.log('Connected: ' + frame);
	        setInterval(sendData, 3000);	        
	        stompClient.subscribe('/topic/yourspeedis', function(speedMeter){
                console.log('Recieved: ' + JSON.parse(speedMeter.body).currentSpeed);
                redrawChart(JSON.parse(speedMeter.body).currentSpeed);
	        });
	    });
	}

    connect();
});
</script>
</head>
<body>
<h2>Server Push : WebSocket</h2>
<div id="chartGauge" style="min-width: 310px; max-width: 400px; height: 300px; margin: 0 0"></div>
</body>
</html>

