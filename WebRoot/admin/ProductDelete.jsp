<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.product.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductMgr.getInstance().delete(id);
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