<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		.STYLE1 {
			color: #FFFFFF;
			font-weight: bold;
			font-size: 12px;
		}
		.STYLE2 {
			font-size: 12px;
			color: #03515d;
		}
		a:link {font-size:12px; text-decoration:none; color:#03515d;}
		a:visited{font-size:12px; text-decoration:none; color:#03515d;}
		-->
	</style>
	<link rel="StyleSheet" href="<%=path %>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/dtree.js"></script>
  </head>
  
  <body>
		<table width="156" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" valign="top">
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td height="33" background="<%=path %>/images/main_21.gif">
								&nbsp;>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top">
								<table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
										    <script type="text/javascript">
												d = new dTree('d');
										        d.add(0,-1,'功能菜单');
												
												d.add(1,0,'系统属性','#');
												d.add(11,1,'系统属性','<%=path %>/admin/index/sysPro.jsp','','I2','','','true');
												
												<c:if test="${sessionScope.userType==0}">
												d.add(2,0,'密码修改','#');
												d.add(21,2,'密码修改','<%=path %>/admin/userinfo/userPw.jsp','','I2');
												
												d.add(88,0,'系统管理员','#');
												d.add(881,88,'系统管理员','<%=path %>/admin?type=adminMana','','I2');
												
												d.add(3,0,'员工信息管理','#');
												d.add(31,3,'员工信息管理','<%=path %>/yuangong?type=yuangongMana','','I2');
												d.add(32,3,'员工信息添加','<%=path %>/admin/yuangong/yuangongAdd.jsp','','I2');
												d.add(33,3,'员工信息查询','<%=path %>/admin/yuangong/yuangongSearch.jsp','','I2');
												
												d.add(4,0,'绩效考核管理','#');
												d.add(41,4,'绩效考核管理','<%=path %>/jixiao?type=jixiaoMana','','I2');
												d.add(42,4,'绩效考核添加','<%=path %>/admin/jixiao/jixiaoAdd.jsp','','I2');
												
												
												d.add(5,0,'薪酬福利管理','#');
												d.add(51,5,'薪酬福利管理','<%=path %>/xinchou?type=xinchouMana','','I2');
												d.add(52,5,'薪酬福利添加','<%=path %>/admin/xinchou/xinchouAdd.jsp','','I2');
												</c:if>
												
												<c:if test="${sessionScope.userType==1}">
													d.add(5,0,'我的薪酬','#');
													d.add(51,5,'我的薪酬查询','<%=path %>/xinchou?type=xinchouMy&yuangongId=${sessionScope.yuangong.id}','','I2');
												</c:if>
												document.write(d);
										   </script>
											<%--
											<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr height="10">
												   <td></td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/images/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/index/sysPro.jsp' target='I2'>系统属性</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/images/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/index/sysPro.jsp' target='I2'>系统属性</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>--%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
