function initDatePickers(){
	// datepicker Korean option
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		duration:200,
		showAnim:'show',
		showMonthAfterYear: true,
		yearSuffix:'년'
	};
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$('#schDate').datepicker({
		changeMonth: false,
		changeYear: false,
		defaultDate:$('#schDate').val()
	});
	
	// monthpicker and year selector start/end year (10 year ago)
	var currentYear = (new Date()).getFullYear();
	var startYear = currentYear-10;
	
	var options = {
			startYear: startYear,
			finalYear: currentYear,
			pattern: 'yyyy-mm',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	};
	
	$('#schMonth').monthpicker(options);
	
	// make year selector 
	for (var i = currentYear; i >= startYear; i--) {
		if ($("#schYear").attr("pathValue") == i) {
			$("#schYear").append("<option value='"+i+"' selected>"+i+"</option>");
		} else {
			$('#schYear').append("<option value='"+i+"'>"+i+"</option>");
		}
	}
}
