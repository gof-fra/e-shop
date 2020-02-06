<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "../shared/flow-header.jsp" %>

		<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Register</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<sf:form 
						action="#" 
						method="POST"
						class="form-horizontal"
						id="registerForm"
						modelAttribute="user"
						>
							<div class="form-group">
								<label class="col-form-label">First Name</label> 
									<sf:input type="text" path="firstName" class="form-control" placeholder="First Name"/>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Last Name</label> 
									<sf:input type="text" path="lastName" class="form-control" placeholder="Last Name"/>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Email </label> 
									<sf:input type="text" path="email" class="form-control" placeholder="Email"/>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Phone number</label> 
									<sf:input type="text" path="contactNumber" class="form-control" placeholder="contact number"/>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Password</label> 
									<sf:input type="password" path="password" class="form-control" placeholder="Password"/>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Select role</label> 
									<div class="col-md-8">
										<label class="radio-inline">
											<sf:radiobutton path="role" value="USER" checked="checked"/> User
										</label>
										<label class="radio-inline">
											<sf:radiobutton path="role" value="SUPPLIER" /> SUPPLIER
										</label>
									</div>
							</div>
							
							<div class="right-w3l">
								<input type="submit" class="form-control" value="Register" name="_eventId_billing">
							</div>
							<div class="sub-w3l">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input"
										id="customControlAutosizing2"> <label
										class="custom-control-label" for="customControlAutosizing2">I
										Accept to the Terms & Conditions</label>
								</div>
							</div>
						</sf:form>
					</div>
				</div>
			</div>
		</div>
	
	<br><br><br><br><br><br>
<%@ include file = "../shared/flow-footer.jsp" %>