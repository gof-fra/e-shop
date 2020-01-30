$(function() {
	
	switch(menu) {
	
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	default:
		if(menu == "Home") break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
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
	
	
	$('.switch input[type="checkbox"]').on('change', function()  {
		
		var checkbox = $(this);
		var	checked = checkbox.prop('checked');
		var dMsg = (checked)? 'You want to activate the product? ':
							  'You want to desactivate the product? ';
		
		var value = checkbox.prop('value');
		
		confirm({
		
			size: 'medium',
			title: 'Product Activation & Desactivation',
			message: dMsg,
			callback: function(confirmed) {
				
				if(confirmed) {
					
					console.log(value);
					bootbox.alert({
						size: 'medium',
						title: 'Information',
						message: 'You are going to perform operation on product '+ value
					});
					
				}
				else {
					checkbox.prop('checked', !checked);
				}
				
			}
			
		});
		
	});
	
	
	
});
	




	
	
	
	
