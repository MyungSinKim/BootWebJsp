Highcharts.theme = {
	global : {
		useUTC : false
	},
	lang : {
		thousandsSep: ','
	},
	xAxis : {
		dateTimeLabelFormats : {
			millisecond : '%H:%M:%S.%L',
			second : '%H:%M:%S',
			minute : '%H:%M',
			hour : '%H:%M',
			day : '%m-%d',
			week : '%m-%d',
			month : '%Y-%m',
			year : '%Y'
		},
		labels : {
			style : {
				color : '#000',
				font : '10px 맑은 고딕, Trebuchet MS, Verdana, sans-serif'
			}
		},
		title : {
			style : {
				color : '#333',
				fontWeight : 'bold',
				fontSize : '11px',
				fontFamily : '맑은 고딕, Trebuchet MS, Verdana, sans-serif'

			}
		}
	},
	yAxis : {
		minorTickInterval : 'auto',
		dateTimeLabelFormats : {
			millisecond : '%H:%M:%S.%L',
			second : '%H:%M:%S',
			minute : '%H:%M',
			hour : '%H:%M',
			day : '%m-%d',
			week : '%m-%d',
			month : '%Y-%m',
			year : '%Y'
		},
		labels : {
			style : {
				color : '#000',
				font : '10px 맑은 고딕, Trebuchet MS, Verdana, sans-serif'
			}
		},
		title : {
			style : {
				color : '#333',
				fontWeight : 'bold',
				fontSize : '11px',
				fontFamily : '맑은 고딕, Trebuchet MS, Verdana, sans-serif'
			}
		}		
	}
};
Highcharts.setOptions(Highcharts.theme);