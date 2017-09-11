<%-- 
	@author						: Brahmani
 	@module name/description	: Item Creation, Modify and Update Page
 	@created date				: 18 Feb 2017
 	@modified by				: 
 	@modified date				: 
 --%>
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item Creation</title>
<script type="text/javascript" src="../js/angular.js"></script>
<script type="text/javascript" src="../js/angular.min.js"></script>
<script type="text/javascript" src="../js/angular-cookies.js"></script>
<script type="text/javascript" src="../js/angular-resource.js"></script>
<script type="text/javascript" src="../js/angular-route.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../javaScript/FormFieldValidation.js"></script>
<script type="text/javascript" src="../javaScript/itemDetails.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-2.2.1.js" type="text/javascript"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript">
	$(function() {
		$('input:text:first').focus();
		var $inp = $('input:text');
		$inp.bind('keydown', function(e) {
			//var key = (e.keyCode ? e.keyCode : e.charCode);
			var key = e.which;
			if (key == 13) {
				e.preventDefault();
				var nxtIdx = $inp.index(this) + 1;
				$(":input:text:eq(" + nxtIdx + ")").focus();
			}
		});
	});
</script>
<style>
body{
	margin: 0 auto;

	background-repeat: no-repeat;
	background-size: 100% 720px;
}

.well{
background-color: rgb(217, 217, 217);}</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6 col-sm-12">
				<div align="center">
					<br>
						<img align="middle" height="150" width="150" alt="" src="../img/GrahakLogo.jpg">
				</div>
				<br>
				<div id="loginModal">
					<div class="well">
					<%-- <label><span class="btn-warning">Login Shoppy : <%=session.getAttribute("AdminSessionId").toString()%></span></label> --%>
					<label> <a href="../views/Logout.jsp"><button type="button" class="btn btn-default btn-sm" style="right: 10px;"><span class="glyphicon glyphicon-log-out"></span> Logout</button></a></label>
						<ul class="nav nav-tabs">
							
							<li class="active"><a href="#createItem" data-toggle="tab">Register Item</a></li>
							<li ><a href="#modifyItemList" data-toggle="tab">Modify Item</a></li>
							<li><a href="#deleteItm" data-toggle="tab">Delete Item</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div  class="tab-pane fade" id="modifyItemList">
								<form class="form-horizontal" name="addNewItem" id="addNewItem">
									<fieldset>
										<h3 align="center">Modify Items List</h3>
										<label class="control-label" for="addItemId">Item Id</label><span class="glyphicon glyphicon-search" onclick="fnItemSearch()"></span>
																
																<input class="form-control input-sm chat-input" type="text" id="addItemId" name="addItemId" placeholder="Please Enter Item Id" maxlength="30" onblur="fnItemValidation()" onkeyup="NumberValidation()"/>
										<br>
										<label class="control-label">Item Name</label><input class="form-control input-sm chat-input" type="text" id="addItemName" name="addItemName" readonly="readonly"/>
										<br>
										<label class="control-label" for="addRetailermrp">Retail MRP</label><input class="form-control input-sm chat-input" type="text" id="addRetailermrp" name="addRetailermrp" maxlength="15" placeholder="Please Enter Amount" onkeyup="DecimalValidation()"/>
										<label class="control-label" for="addWarehousemrp">Warehouse MRP</label><input class="form-control input-sm chat-input" type="text" id="addWarehousemrp" name="addWarehousemrp" maxlength="15" placeholder="Please Enter Amount" onkeyup="DecimalValidation()"/>
										<input type="hidden" id="addNewItem" name="addNewItem"/>
										<input type="hidden" id="addNewItem1" name="addNewItem1"/>
										<br>
										<div class="wrapper" align="center">
											<input type="button" class="btn btn-success" id="btAdd"	value="Modify" onclick="modifyItem()"/>
											<input type="reset" class="btn btn-danger" value="Clear"/>
											<input type="button" class="btn btn-info" id="" value="Back" onclick="window.location.href='RetailerValues.jsp'" />
										</div>
									</fieldset>
								</form>
							</div>
						
							<div  class="tab-pane active in" id="createItem">
								<form class="form-horizontal" id="regItem1" name="regItem1">
										<h3 align="center">Item Creation</h3>
										
										<label class="control-label" for="regItemname">Item Name</label> <div data-bind="nextFieldOnEnter:true"><input class="form-control input-xlarge chat-input" type="text" id="regItemname" name="regItemname" maxlength="30"	placeholder="Please Enter Item Name" onKeyUp="CheckAlphabetonly(event)" autocomplete="on" data-bv-container=".validatorMessage"/>
										<br>
										<label class="control-label" for="regRetailermrp">Item Retailer MRP</label><input class="form-control input-sm chat-input" type="text" id="regRetailermrp" name="regRetailermrp" value="0" maxlength="13" onKeyUp="DecimalValidation(event)" autocomplete="on"/>
										<br>
										<label class="control-label" for="regWarehousemrp">Item Warehouse MRP</label><input class="form-control input-sm chat-input" type="text" id="regWarehousemrp" name="regWarehousemrp" value="0" maxlength="13" onKeyUp="DecimalValidation(event)" autocomplete="on" data-bv-container=".validatorMessage"/>
										<br><div class="wrapper" align="center">
											<input type="button" class="btn btn-success" id="btSave" value="Save" onclick="regItem()"/>
											<input type="reset" class="btn btn-danger" id="" value="Clear"/>
											<input type="button" class="btn btn-info" id="" value="Back" onclick="window.location.href='RetailerValues.jsp'" />
										</div>
								</form>
							</div>
							</div>
							<div class="tab-pane fade" id="deleteItm">
								<form class="form-horizontal" id="delItem1" name="delItem1">
									<fieldset>
										<h3 align="center">Delete Item</h3>
										<label class="control-label" for="delItemId">Item Id</label><span class="glyphicon glyphicon-search" onclick="fnItemDelSearch()"></span><input class="form-control input-sm chat-input" type="text" id="delItemId" name="delItemId" placeholder="Please Enter Item Id" onblur="fnDelItemValid()" onKeyUp="NumberValidation(event)"/>
										<br>
										<label class="control-label">Item Name</label><input class="form-control input-sm chat-input" type="text" id="delItemName" name="delItemName" readonly="readonly"/>
										<br>
										<label class="control-label">Item Retailer MRP</label><input class="form-control input-sm chat-input" type="text" id="delRetailmrp" name="delRetailmrp" readonly="readonly"/>
										<br>
										<label class="control-label">Item Warehouse MRP</label><input class="form-control input-sm chat-input" type="text" id="delWarehousemrp" name="delWarehousemrp" readonly="readonly"/>
										<br>
										<div class="wrapper" align="center">
											<input type="button" class="btn btn-success" id="btDel"	value="Delete" onclick="delItem()"/>
											<input type="reset" class="btn btn-danger" value="Clear"/>
											<input type="button" class="btn btn-info" id="" value="Back" onclick="window.location.href='RetailerValues.jsp'" />
										</div>
										<br>
									</fieldset>
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>