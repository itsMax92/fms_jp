<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp"%>
<title>FMS:Requesters</title>
<%@ include file="commonParts/header.jsp"%>
<%@ include file="css/mycss.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
</head>
<body>
	<h2>~~~</h2>
	<br>
	<%@ include file="commonParts/buttons.jsp"%>
	<h3>Requesters</h3>
	<br>
	<table id="example" class="display nowrap" style="width: 100%">
		<thead>
			<tr>
				<th>S.No.</th>
				<th>Id</th>
				<th>Requester Name</th>
				<th>Email</th>
				<th>Department</th>
				<th>Phone</th>
				<th>Edit</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>S.No.</th>
				<th>Id</th>
				<th>Requester Name</th>
				<th>Email</th>
				<th>Department</th>
				<th>Phone</th>
				<th>Edit</th>
			</tr>
		</tfoot>
	</table>

	<%@ include file="commonParts/footer.jsp"%>
	<script>
$(document).ready(function() {
	var data = ${Json};
	var t = $('#example').DataTable({
	    data: data,
	    columns: [
	        { data: null },
	        { data: 'id' },
	        { data: 'requesterName' },
	        { data: 'email' },
	        { data: 'department' },
	        { data: 'phone' },
	        { data: null }
	    ],
		dom : 'Bfrtip',
		buttons : [ 'excel' ],
	 "columnDefs": [ 
		 { "searchable": false, "orderable": false, "targets": 0 },
		 { 
	          "targets": 6,
	          "data": null,
			  "defaultContent": "<button>Edit</button>"
			}
		 ],
     "order": [[ 2, 'asc' ]]
	} );
	 $('#example tbody').on( 'click', 'button', function () {
        var data = t.row( $(this).parents('tr') ).data();
        var url = "editRequester?requesterId=" + data.id;
        window.open(url);
        console.log(data);
        /* alert( "editRequester?requesterId=" + data.id ); */
    } ); 
	t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
});
</script>
</body>
</html>

