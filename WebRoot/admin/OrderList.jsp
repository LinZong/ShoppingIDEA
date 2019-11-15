<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.order.*, java.util.*" %>

<%!
private static final int PAGE_SIZE = 2;
%>

<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if(strPageNo != null) {
	pageNo = Integer.parseInt(strPageNo);
}
if(pageNo < 1) pageNo = 1;
%>

<%
//get all the users
List<SalesOrder> orders = new ArrayList<SalesOrder>();
int totalRecords = OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);

int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
if(pageNo > totalPages) pageNo = totalPages;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<td>ID</td>
			<td>username</td>
			<td>addr</td>
			<td>odate</td>
			<td>status</td>

			<td></td>
		</tr>
		<%
		for(Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ) {
			SalesOrder so = it.next();
		%>
			<tr>
				<td><%=so.getId() %></td>
				<td><%=so.getUser().getUsername() %></td>
				<td><%=so.getAddr() %></td>
				<td><%=so.getODate() %></td>
				<td><%=so.getStatus() %></td>
				<td>
					<a href="OrderDetailShow.jsp?id=<%=so.getId()%>" target="detail">������ϸ</a>
					&nbsp;
					<a href="OrderModify.jsp?id=<%=so.getId()%>" target="detail">�����޸�</a>
				</td>
			</tr>
		<%
		}
		%>
	</table>
	<center>
		��<%=pageNo %>ҳ
		&nbsp;
		��<%=totalPages %>ҳ
		&nbsp;
		<a href="OrderList.jsp?pageno=<%=pageNo-1 %>">��һҳ</a>
		&nbsp;
		<a href="OrderList.jsp?pageno=<%=pageNo+1 %>">��һҳ</a>
		&nbsp;
		<a href="OrderList.jsp?pageno=<%=totalPages %>">���һҳ</a>
	</center>

</body>
</html>