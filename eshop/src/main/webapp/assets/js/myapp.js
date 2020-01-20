$(function() {
	
	switch(menu) {
	
	case 'About US':
		 $('#about').addClass('active');
		 break;
	case 'Contact US':
		 $('#contact').addClass('active');
		 break;
	default:
		$('#home').addClass('active');
		break;
	}
	
	
	
	var products = [
		
			
			['1', 'NAH'],
			['2', 'JBA'],
			['3', 'KJB'],
			['4', 'HJS'],
			['5', 'OKS'],
			['6', 'LSS']
			
			
		];
	
	var $table = $('#productListTable');
	
	if($table.length) {
		
		//console.log('Inside the table');
		
		
		$table.DataTable( {
			
			lengthMenu: [[3,5,10,-1], ['3 records', '5 records', '10 records' ,'ALL']],
			pageLength: 5,
			data: products
			
		});
		
	}
		
	
});