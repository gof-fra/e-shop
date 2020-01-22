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
	
	
	var $table = $('#productListTable');
	
	if($table.length) {
		
		var JsonUrl = '';
		if(window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		}
		else {
			jsonUrl = window.contextRoot + '/json/data/category/' +window.categoryId+ '/products';
		}
		
		
		$table.DataTable( {
			
			lengthMenu: [[3, 5, 7,-1], ['3 Records', '5 Records', '7 Records' ,'ALL']],
			pageLength: 5,
			ajax: {
				url: jsonUrl,
				dataSrc: ''
			},
			columns: [
					{
						data: 'code',
						mRender: function(data, type, row) {
							
							return '<img src="'+window.contextRoot+ '/resources/images/' +data+ '.jpg" class="dataTableImg" />';
							
						}
					},
					{
						data: 'name'
					},
					{
						data: 'brand'
					},
					{
						data: 'unitPrice',
						mRender: function(data, type, row) {
							return '&#8377;' + data
						}
						
					},
					{
						data: 'quantity',
						mRender: function(data, row, type) {
							
							if(data < 1) {
								
								return '<span style="color:red">Out of Stock!</span>';
								
							}
							return data;
						}
					},
					{
						data: 'id',
						bSortable: false,
						mRender: function(data, type, row) {
							
							var str = '';
							
							str += '<a href="'+window.contextRoot+ '/show/'+data+'/product" class="btn btn-primary"> View</a> &#160;';
							
							if(row.quantity < 1) {
								
								str += '<a href="javascript:void(0)" class="btn btn-success disabled"> Cart</a>';
								
							}
							else {
								
								str += '<a href="'+window.contextRoot+ '/cart/add/'+data+'/product" class="btn btn-success"> Cart</a>';
								
							}
							
							return str;
							
						}
					}
				]
			
		});
		
	}
	
	var $alert = $('.alert');
	
	if($alert.length) {
		
		setTimeout(function(){
			$alert.fadeOut('slow');
		}, 3000)
		
	}
		
	
});