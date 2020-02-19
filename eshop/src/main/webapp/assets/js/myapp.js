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
	
	
	// token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if(token.length > 0 && header.length > 0) {
		
		$(document).ajaxSend(function(e, xhr, options){
		
			xhr.setRequestHeader(header, token);
			
		});
		
	}
	
	
	// ---------------
	
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
			destroy: true,
		    searching: true,
		    retrieve: true,
		    paging: true,
			
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
	
		
		$.fn.modal = false
		$.fn.BootstrapVersion = '4.0.0';
	
		$('.switch input[type="checkbox"]').on('change', function()  {
			var checkbox = $(this);
			var	checked = checkbox.prop('checked');
			var dMsg = (checked)? 'You want to activate the product? ':
								  'You want to desactivate the product? ';
			var value = checkbox.prop('value');
				bootbox.confirm({
				size: 'medium',
				title: 'Product Activation & Desactivation',
				message: dMsg,
				callback: function(confirmed) {
					if(confirmed) {
						console.log(value);
						bootbox.alert({
							size: 'medium',
							title: 'Information',
							message: 'You are going to perform operation on product '  + value
						});
					}
					else {
						checkbox.prop('checked', !checked);
					}
				}
			});
		 });
	
		
	// ------------------------
	// data table for admin
	// ------------------------
	
	var $adminProductsTable = $('#adminProductsTable');
	
	if($adminProductsTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		
		$adminProductsTable.DataTable( {
		    destroy: true,
		    searching: true,
		    retrieve: true,
		    paging: true,
			lengthMenu: [[10, 30, 50, -1], ['10 Record', '30 Records', '50 Records', 'ALL' ]],
			pageLength: 30,
			ajax: {
				url: jsonUrl,
				dataSrc: ''
			},
			columns: [	
						{
							data: 'id'
						},
						{
							data: 'code',
							bSortable: false,
							mRender: function(data, type, row) {
								
								return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableImg"/>';
								
							}
						},
						{
							data: 'name'
						},
						{
							data: 'brand'
						},
						{
							data: 'quantity',
							mRender: function(data, type, row) {
								
								if(data < 1) {
									
									return '<span style="color:red">Out to stock!</span>';
									
								}
								
								return data;
								
							}
						},
						{
							data: 'unitPrice',
							mRender: function(data, type, row) {
								
								return '&#8377; ' +data
								
							}
						},
						{
							data: 'active',
							bSortable: false,
							mRender: function(data, type, row) {
								
								var str = '';
								
								str += '<label class="switch">';
								
								if(data) {
									
									str += '<input type="checkbox" checked="checked" value="'+row.id+'" />';
									
								}
								else {
									
									str += '<input type="checkbox" value="'+row.id+'" />';
									
								}
								
								str += '<div class="slider"></div> </label>';
								
								return str;
							}
						}, 
						{
							
							data: 'id',
					 		bSortable: false,
							mRender: function(data, type, row) {
								
								var str = '';
								
								str += '<a href="' +window.contextRoot+ '/manage/' +data+ '/product" class="btn btn-warning">';
								str += '<span class="glyphicon glyphicon-pencil"> Edit</span> </a>';
								
									return str;
								
							}
							
						}

					 ],
					 
					 // activate product second part
					 
					 initComplete: function() {
						 
								  
						  var api = this.api();
							 api.$('.switch input[type="checkbox"]').on('change', function()  {							
									var checkbox = $(this);
									var	checked = checkbox.prop('checked');
									var dMsg = (checked)? 'You want to activate the product? ':
														  'You want to desactivate the product? ';								
									var value = checkbox.prop('value');								
									bootbox.confirm({							
										size: 'medium',
										title: 'Product Activation & Desactivation',
										message: dMsg,
										callback: function(confirmed) {									
											if(confirmed) {										
												console.log(value);	
												
												var activationUrl = window.contextRoot +'/manage/product/'+ value +'/activation';  										
												$.post(activationUrl, function(data) {
													
													bootbox.alert({
														size: 'medium',
														title: 'Information',
														message: data
												});										 
											});										
											}
											else {
												checkbox.prop('checked', !checked);
											}
											
										}
										
									});
									
								});
				 	
					 }

			});
		
	   }
	
	
	// Category validation
	var $categoryForm = $('#categoryForm');
	
	if($categoryForm.length) {
		
		$categoryForm.validate({
			
			rules : {
				
				name : {
					
					required: true,
					minlength: 2
				},
				description : {
					
					required: true
				}
			},
			
			messages : {
				
				name : {
					
					required: 'Please add the category name!',
					minlength: 'The category nameshould not be less than 2 characteur!'
					
				},
				
				description : {
					
					required: 'Please add the category description!'
					
				}
				
			},
			errorElement : 'em',
			errorPlacement: function(error, element) {
				
				// add the class of help-block
				error.AddClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}
			
		});
		
	}
	 
	
	
	// Login validation
	var $loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({
			
			rules : {
				
				username : {
					
					required: true,
					email: true
				},
				password : {
					
					required: true
				}
			},
			
			messages : {
				
				username : {
					
					required: 'User name!',
					minlength: 'Valide email!'
					
				},
				
				password : {
					
					required: 'Please add the password!'
					
				}
				
			},
			errorElement : 'em',
			errorPlacement: function(error, element) {
				
				// add the class of help-block
				error.AddClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}
			
		});
		
	}
	 
						
});
	



	




	
	
	
	
