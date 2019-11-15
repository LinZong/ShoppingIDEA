<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.user.*"%>



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
	List<User> users = new ArrayList<User>();
	int totalRecords = User.getUsers(users, pageNo, PAGE_SIZE);
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
						&nbsp;�û����� &#187; ��Ա�б�
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
																<a href="UserList.jsp?pageNo=<%=i%>"><%=i%></a>&nbsp;
															</td>
													<%
														}
													}
													 %>
													<td>
														&nbsp;
														<a href="UserList.jsp?pageNo=<%=pageNo+1%>">&gt;</a>&nbsp;
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

		<input name="formhash" value="93a2a31f" type="hidden">
		<table class="tableborder" align="center" cellpadding="4"
			cellspacing="1" width="97%">
			<tbody>
				<tr class="header">
					<td align="center" width="9%">
						�û���
					</td>
					<td align="center" width="6%">
						UID
					</td>
					<td align="center" width="16%">
						��ϵ�绰
					</td>
					<td align="center" width="20%">
						ע��ʱ��
					</td>
					<td align="center" width="20%">
						�ͻ���ַ
					</td>
					<td align="center">
						����
					</td>
				</tr>

				<%
						for (int i = 0; i < users.size(); i++) {
						User u = users.get(i);
				%>

				<tr>
					<td class="altbg1" align="center" nowrap="nowrap">
						<%=u.getUsername()%>
					</td>
					<td class="altbg2" align="center">
						<%=u.getId()%>
					</td>
					<td class="altbg1" align="center">
						<%=u.getPhone()%>
					</td>
					<td class="altbg1" align="center">
						<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(u.getRdate())%>
					</td>
					<td class="altbg1" align="center">
						<%=u.getAddr()%>
					</td>
					<td class="altbg1" align="right">
						<% String url = request.getRequestURL() + (request.getQueryString() == null ? "" : "?" + request.getQueryString()); %>
						<a target="detail" href="UserDelete.jsp?id=<%=u.getId()%>&from=<%=url%>" onclick="return confirm('���Ҫɾ��?')">ɾ��</a>
					</td>
				</tr>

				<%
				}
				%>

				<form method="post" action="member.php?action=list"></form>
				<tr>
					<td colspan="5" class="altbg2">
						����
						<input size="15" name="srchmem" type="text">
						<input value="�� &nbsp; ��" type="submit">
						&nbsp; &nbsp;
						<span class="bold">��</span> &nbsp; ����ʽ:
						<a
							href="http://bbs.allsmart.com/member.php?action=list&amp;order=credits">����</a>
						-
						<a
							href="http://bbs.allsmart.com/member.php?action=list&amp;order=username">�û���</a>
						-
						<a
							href="http://bbs.allsmart.com/member.php?action=list&amp;order=gender">�Ա�</a>
						-
						<a
							href="http://bbs.allsmart.com/member.php?action=list&amp;order=regdate">ע������</a>
						-
						<a
							href="http://bbs.allsmart.com/member.php?action=list&amp;admins=yes">����ͷ��</a>
					</td>
				</tr>
			</tbody>
		</table>

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
														&nbsp;46292&nbsp;
													</td>
													<td class="header">
														&nbsp;1/1852&nbsp;
													</td>
													<td bgcolor="#ffffff">
														&nbsp;
														<u><b>1</b>
														</u>&nbsp;
													</td>
													
													
													
													
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=6">6</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=7">7</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=8">8</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=9">9</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=10">10</a>&nbsp;
													</td>
													<td>
														&nbsp;
														<a
															href="http://bbs.allsmart.com/member.php?action=list&amp;srchmem=&amp;order=&amp;admins=&amp;page=2">&gt;</a>&nbsp;
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

		<a name="bottom" />
	</body>
</html>
