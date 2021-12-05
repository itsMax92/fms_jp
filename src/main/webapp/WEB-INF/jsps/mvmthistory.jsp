<html>
  <head>
  	<title>Person Information</title>
  	<meta charset="UTF-8">	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function(){
    	/*  var baseurl = "http://localhost:9090/fms"; */
    	 var baseurl = "http://172.16.112.83:9090/fms";
    	 var xmlhttp = new XMLHttpRequest();
    	 xmlhttp.open("GET",baseurl+"/showMvmtHistory",true);
    	 xmlhttp.onreadystatechange = function(){
    		 if(xmlhttp.readyState==4 && xmlhttp.status ==200){
    			 var allRequests = JSON.parse(xmlhttp.responseText);
    			 $("#example").DataTable({
    				data:allRequests,
    				"columns":[
    					{"data":"file.unitName"},
    					{"data":"file.customerName"},
    					{"data":"file.fileType"},
    					{"data":"requester.requesterName"},
    					{"data":"requester.email"},
    					{"data":"requester.department"},
    					{"data":"requester.phone"},
    					{"data":"approvedBy"},
    					{"data":"remarks"},
    					{"data":"through"},
    					{"data":"issuedBy"},
    					{"data":"issuedDate"},
    					{"data":"dueDate"},
    					{"data":"status"},
    					{"data":"receivedDate"},
    				]
    			 });
    		 }
    	 };
    	 xmlhttp.send();
      });
    </script>  
  </head>
  <body>
    <table id="example" class="display" style="width:100%">
    <thead>
	    <tr>
	      <th>Unit Name</th>
			<th>Customer Name</th>
			<th>File Type</th>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
			<th>Approved By</th>
			<th>Purpose</th>
			<th>Through</th>
			<th>Issued By</th>
			<th>Issued Date</th>
			<th>Due Date</th>
			<th>Status</th>
			<th>Received Date</th>
	    </tr>
    </thead>
    <tfoot>
	    <tr>
	       <th>Unit Name</th>
			<th>Customer Name</th>
			<th>File Type</th>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
			<th>Approved By</th>
			<th>Purpose</th>
			<th>Through</th>
			<th>Issued By</th>
			<th>Issued Date</th>
			<th>Due Date</th>
			<th>Status</th>
			<th>Received Date</th>
	    </tr>
    </tfoot>
    </table>
  </body>
</html>