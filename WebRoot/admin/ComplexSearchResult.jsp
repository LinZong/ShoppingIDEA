<%@ page language="java" import="java.util.*" contentType="text/html;charset=gbk" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.product.*"%>

<jsp:useBean id="searchBean" class="com.bjsxt.shopping.product.ProductSearchFormBean">
	<jsp:setProperty name="searchBean" property="*" />
</jsp:useBean>

<!-- Data Transfer Object ��֤ -->

<jsp:getProperty name="searchBean" property="categoryId"/> &nbsp;
<jsp:getProperty name="searchBean" property="name"/> &nbsp;
<jsp:getProperty name="searchBean" property="lowNormalPrice"/> &nbsp;
<jsp:getProperty name="searchBean" property="highNormalPrice"/> &nbsp;
<jsp:getProperty name="searchBean" property="lowMemberPrice"/> &nbsp;
<jsp:getProperty name="searchBean" property="highMemberPrice"/> &nbsp;
<jsp:getProperty name="searchBean" property="startDate"/> &nbsp;
<jsp:getProperty name="searchBean" property="endDate"/> &nbsp;

<%=searchBean.getStartDate() == null %>

<%	
	final int PAGE_SIZE = 2; //ÿҳ��ʾ��������¼
	final int PAGES_PER_TIME = 10;//ÿ����ʾ���ٸ�ҳ������
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	if (pageNo <= 0)
		pageNo = 1;
%>
<%
	List<Product> products = new ArrayList<Product>();
	int totalRecords = ProductMgr.getInstance().find(products, pageNo, PAGE_SIZE, searchBean);
	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages)
		pageNo = totalPages;
%>
<html>
	<head>
		<title>��Ա�б�</title>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta name="keywords"
			content="Discuz!,Board,Comsenz,forums,bulletin board,">
		<meta name="description" content="�����̳ǻ�Ա�б�">
		<meta name="generator" content="Discuz! 4.0.0RC4 with Templates 4.0.0">
		<meta name="MSSmartTagsPreventParsing" content="TRUE">
		<meta http-equiv="MSThemeCompatible" content="Yes">

		<style type="text/css"><!--
a			{ text-decoration: none; color: #000000 }
a:hover			{ text-decoration: underline }
body			{ scrollbar-base-color: #F3F6FA; scrollbar-arrow-color: #4D76B3; font-size: 12px; background-color: #ffffff }
table			{ font: 12px Verdana,Tahoma; color: #000000 }
input,select,textarea	{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
select			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
.nav			{ font: 12px Verdana,Tahoma; color: #000000; font-weight: bold }
.nav a			{ color: #000000 }
.header			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: bold; background-image: url("images/green/bg01.gif") }
.header a		{ color: #FFFFFF }
.category		{ font: 11px Verdana,Tahoma; color: #000000; background-color: #EFEFEF }
.tableborder		{ background: #4D76B3; border: 0px solid #4D76B3 } 
.singleborder		{ font-size: 0px; line-height: 0px; padding: 0px; background-color: #F3F6FA }
.smalltxt		{ font: 11px Verdana,Tahoma }
.outertxt		{ font: 12px Verdana,Tahoma; color: #000000 }
.outertxt a		{ color: #000000 }
.bold			{ font-weight: bold }
.altbg1			{ background: #F3F6FA }
.altbg2			{ background: #FFFFFF }
--></style>
		<script language="JavaScript" src="images/common.js"></script>
		<style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style>
		
		
		<script type="text/javascript">
			function checkDelete() {
				var ids = document.getElementsByName("id");
				if(document.formDelete.selectAll.checked) {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="checked";
					}
				} else {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="";
					}
				}
			}
			
			function goPage(pageNo) {
				document.search.pageNo.value=pageNo;
				document.search.submit();
			}
		</script>
		
		
	</head>
	<body leftmargin="0" rightmargin="0" topmargin="0"
		onkeydown="if(event.keyCode==27) return false;">
		<div id="popLayer" style="position: absolute; z-index: 1000;"
			class="cPopText"></div>


		<table style="table-layout: fixed;" align="center" border="0"
			cellpadding="0" cellspacing="0" width="97%">
			<tbody>
				<tr>
					<td class="nav" align="left" nowrap="nowrap" width="90%">
						&nbsp;��Ʒ���� &#187; ��Ʒ�б�
					</td>
					<td align="right" width="10%">
						&nbsp;
						<a href="#bottom"><img src="../images/arrow_dw.gif"
								align="absmiddle" border="0">
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		
		<center><a href="ProductAdd.jsp" target="detail">����²�Ʒ</a></center>
		
		<form name="search" method="post" action="ComplexSearchResult.jsp">
			<input type="hidden" name="pageNo"/>
			<input type="hidden" name="name" value="<%=searchBean.getName()%>"/>
			<input type="hidden" name="categoryId" value="<%=searchBean.getCategoryId()%>"/>
			<input type="hidden" name="lowNormalPrice" value="<%=searchBean.getLowNormalPrice()%>"/>
			<input type="hidden" name="highNormalPrice" value="<%=searchBean.getHighNormalPrice()%>"/>
			<input type="hidden" name="lowMemberPrice" value="<%=searchBean.getLowMemberPrice()%>"/>
			<input type="hidden" name="highMemberPrice" value="<%=searchBean.getHighMemberPrice()%>"/>
			<input type="hidden" name="startDate" value="<%=searchBean.getStartDate()%>"/>
			<input type="hidden" name="endDate" value="<%=searchBean.getEndDate()%>"/>
		</form>
		
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			width="97%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td height="3"></td>
								</tr>
								<tr>
									<td>
										<table class="tableborder" cellpadding="2" cellspacing="1">
											<tbody>
												<tr class="smalltxt" bgcolor="#f3f6fa">
													<td class="header">
														&nbsp;<%=totalRecords %>&nbsp;
													</td>
													<td class="header">
														&nbsp;<%=pageNo %>/<%=totalPages %>&nbsp;
													</td>
													
													<%
													int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
													for(int i=start; i<start+PAGES_PER_TIME; i++) {
														if(i > totalPages) break;
														if(pageNo == i) {
													 %>
															<td bgcolor="#ffffff">&nbsp;<u><b><%=i %></b></u>&nbsp;</td>
														<%
														} else {
														 %>
															<td>&nbsp;
																<a href="javascript:goPage(<%=i%>)"><%=i%></a>&nbsp;
															</td>
													<%
														}
													}
													 %>
													<td>
														&nbsp;
														<a href="ProductList.jsp?pageNo=<%=pageNo+1%>">&gt;</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=100">&gt;<b>|</b>
														</a>&nbsp;
													</td>
													<td style="padding: 0pt;">
														<input name="custompage" size="2"
															style="border: 1px solid rgb(77, 118, 179);"
															onKeyDown="javascript: if(window.event.keyCode == 13) window.location='member.php?action=list&srchmem=&order=&admins=&page='+this.value;"
															type="text">
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td height="3"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<form action="ProductDeleteMultiple.jsp" name="formDelete" method="post" target="detail">		
		<table class="tableborder" align="center" cellpadding="4"
			cellspacing="1" width="97%">
			<tbody>
				<tr class="header">
					<td align="center" width="10%">
						ѡ��
					</td>
					<td align="center" width="9%">
						��ƷID
					</td>
					<td align="center" width="6%">
						��Ʒ����
					</td>
					<td align="center" width="16%">
						��Ʒ����
					</td>
					<td align="center" width="10%">
						�г��۸�
					</td>
					<td align="center" width="10%">
						��Ա�۸�
					</td>
					<td align="center" width="20%">
						�ϼ�ʱ��
					</td>
					<td align="center" width="10%">
						�������
					</td>
					<td align="center">
						����
					</td>
				</tr>

				<%
					for (int i = 0; i < products.size(); i++) {
						Product p = products.get(i);
				%>

				<tr>
					<td class="altbg2" align="center">
						<input type="checkbox" name="id" value="<%=p.getId()%>"/>
					</td>
					<td class="altbg1" align="center" nowrap="nowrap">
						<%=p.getId()%>
					</td>
					<td class="altbg2" align="center">
						<%=p.getName()%>
					</td>
					<td class="altbg1" align="center">
						<%=p.getDescr()%>
					</td>
					<td class="altbg1" align="center">
						<%=p.getNormalPrice()%>
					</td>
					<td class="altbg1" align="center">
						<%=p.getMemberPrice()%>
					</td>
					<td class="altbg1" align="center">
						<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(p.getPdate())%>
					</td>
					<td class="altbg1" align="center">
						<%//=CategoryService.getInstance().loadById(p.getCategoryId()).getName()%>
						<%=p.getCategory().getName()%>
					</td>
					<td class="altbg1" align="right">
						<a target="detail" href="ProductDelete.jsp?id=<%=p.getId()%>" onclick="return confirm('���Ҫɾ?')">ɾ</a>
						<a target="detail" href="ProductModify.jsp?id=<%=p.getId()%>">��</a>
					</td>
				</tr>

				<%
				}
				%>

				<tr>
					<td>
						<input name="selectAll" type="checkbox" onclick="checkDelete()"/>
						<input type="submit" value="Delete"/>
					</td>
				</tr>
			</tbody>
		</table>
		</form> <!-- end formDelete -->

		

		<a name="bottom" />
	</body>
</html>
