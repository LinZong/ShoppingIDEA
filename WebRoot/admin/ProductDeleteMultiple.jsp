<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.product.*"%>

<%
String[] idArray = request.getParameterValues("id");
if(idArray == null || idArray.length == 0) {
	out.println("ID���������");
	return;
}
ProductMgr.getInstance().delete(idArray);
%>

<html>
	<head>
		<title>ɾ����Ʒ</title>
	</head>
	<center>
		ɾ���ɹ���
	</center>
	<body>
		<script type="text/javascript">	
			parent.main.location.reload();
		</script>
	</body>
</html>