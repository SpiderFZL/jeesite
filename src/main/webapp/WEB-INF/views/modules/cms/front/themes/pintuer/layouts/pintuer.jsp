<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By JeeSite</title> 
 	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>拼图跨屏响应式布局前端开发CSS框架-综合示例</title>
    <link rel="stylesheet" href="${ctxStatic}/pintuer/css/pintuer.css">
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/pintuer/js/pintuer.js"></script>
    <script src="${ctxStatic}/pintuer/js/respond.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/pintuer/css/main.css">
    <link type="image/x-icon" href="http://www.pintuer.com/favicon.ico" rel="shortcut icon" />
    <link href="http://www.pintuer.com/favicon.ico" rel="bookmark icon" />
    
    <style>
		.demo-nav.fixed.fixed-top{z-index:8;background:#fff;width:100%;padding:0;border-bottom:solid 3px #0a8;-webkit-box-shadow:0 3px 6px rgba(0, 0, 0, .175);box-shadow:0 3px 6px rgba(0, 0, 0, .175);}
    </style>
	
	<sitemesh:head/>
	
	
</head>
<body>



<!--顶部-->
<!--     <div class="layout bg-black bg-inverse">
      <div class="container height-large">
        <span class="float-right text-small text-gray hidden-l">
          <a class="text-main" href="http://www.pintuer.com">注册</a><span> | </span><a class="text-main" href="http://www.pintuer.com">登录</a><span> | </span><a class="text-main" href="http://www.pintuer.com">积分兑换</a><span> | </span><a class="text-main" href="http://www.pintuer.com">帮助中心</a>
        </span>
        欢迎使用拼图<a href="http://www.pintuer.com">CSS框架</a>
      </div>
    </div> -->

	<!--导航-->
    <div class="demo-nav padding-top padding-bottom fixed">
    <div class="container padding-top">
    
      <div class="line">

        	
        	<c:choose>
   			<c:when test="${not empty site.logo}">
   			  <div class="xl12 xs3 xm3 xb2">
        		<button class="button icon-navicon float-right" data-target="#header-demo"></button>
   				<a target="_blank" href="http://www.pintuer.com">
   				<img alt="${site.title}" src="${site.logo}"  />
   				</a>
   				</div>
   			</c:when>
   			<c:otherwise>
   				<div class="xl12 xs3 xm3 xb2 margin-bottom">
                    <div id="logo-title">${site.title} 
                    </div>
                    <div id="logo-subtitle">简单、实用、精悍</div>
                </div>
<%--    			<a class="brand" href="${ctx}/index-${site.id}${fns:getUrlSuffix()}">${site.title}</a> --%>
   			</c:otherwise>
   		  </c:choose>
<%--         		<img src="${ctxStatic}/pintuer/images/logo.png" alt="前端CCS框架" /> --%>
        	 
        <div class=" xl12 xs9 xm9 xb10 nav-navicon" id="header-demo">
    
          <div class="xs8 xm6 xb5 padding-small">
            <ul class="nav nav-menu nav-inline nav-big">
              <li class="${not empty isIndex && isIndex ? 'active' : ''}"><a href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a></li>
              <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
                 <c:if test="${status.index lt 2}">
                    <c:set var="menuCategoryId" value=",${category.id},"/>
		    		<li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
		    	</c:if>
		    	 <c:if test="${status.index eq 2}">
		    		<li><a href="http://www.pintuer.com">更多<span class="arrow"></span></a>
                	<ul class="drop-menu">
                </c:if>
                <c:if test="${status.index gt 2}">
                  <li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
                </c:if> 
                <c:if test="${status.index gt 2 and status.last eq true}">
                	</ul>
                	</li>
                </c:if> 
              
		      </c:forEach>
             <!--  <li><a href="http://www.pintuer.com">CSS</a></li>
              <li class="active"><a href="http://www.pintuer.com">元件<span class="arrow"></span></a>
                <ul class="drop-menu">
                  <li><a href="http://www.pintuer.com">概述</a></li>
                  <li><a href="http://www.pintuer.com">网格系统<span class="arrow"></span></a>
                <ul><li><a href="http://www.pintuer.com">响应式布局</a></li><li><a href="http://www.pintuer.com">非响应式布局</a></li></ul>
                  </li>
                  <li><a href="http://www.pintuer.com">图标</a></li>
                </ul>
              </li>
              <li><a href="http://www.pintuer.com">更多<span class="arrow"></span></a>
                <ul class="drop-menu">
                  <li><a href="http://www.pintuer.com">组件</a></li>
                  <li><a href="http://www.pintuer.com">模块<span class="arrow"></span></a>
                    <ul><li><a href="http://www.pintuer.com">头部</a></li><li><a href="http://www.pintuer.com">导航</a></li><li><a href="http://www.pintuer.com">底部</a></li></ul>
                  </li>
                </ul>
              </li> -->
            </ul>
          </div>
          <div class="xs4 xm3 xb3">
           <form class="navbar-form pull-right" action="${ctx}/search" method="get">
              <div class="input-group padding-little-top">
                <input type="text" class="input border-main" name="keywords" size="30" placeholder="关键词" value="${q}"/>
                <span class="addbtn"><button type="button" class="button bg-main icon-search"></button></span>
              </div>
            </form>
          </div>
          <div class="hidden-l hidden-s xm3 xb2">
            <div class="text-red text-big icon-phone height-large text-right"> 热线 400 1234567</div>
          </div>
    
        </div>
    
      </div>
    
    </div>
    
    </div>
    <%--填充页面内容 --%>
    <sitemesh:body/>
  

    <div class="layout bg-black bg-inverse">
      <div class="container">
        <div class="navbar">
          <div class="navbar-head"><button class="button bg-gray icon-navicon" data-target="#navbar-footer"></button><a href="http://www.pintuer.com" target="_blank"><img class="logo" src="${ctxStatic}/pintuer/images/24-white.png" alt="拼图前端CSS框架" /></a></div>
          <div class="navbar-body nav-navicon" id="navbar-footer">
            <div class="navbar-text navbar-left hidden-s hidden-l">版权所有 &copy; <a href="http://www.pintuer.com" target="_blank">Pintuer.com</a> All Rights Reserved，图ICP备：380959609</div>
            <ul class="nav nav-inline navbar-right"><li><a href="http://www.pintuer.com">首页</a></li><li><a href="http://www.pintuer.com">CSS</a></li><li><a href="http://www.pintuer.com">元件</a></li><li><a href="http://www.pintuer.com">更多</a></li></ul>
          </div>
        </div>
      </div>
    </div>
    <div class="hidden"><script src="http://s4.cnzz.com/stat.php?id=5952475&web_id=5952475" language="JavaScript"></script></div>
    
<!-- 结束 -->
	<%-- <div class="navbar navbar-fixed-top" style="position:static;margin-bottom:10px;">
      <div class="navbar-inner">
        <div class="container">
          <c:choose>
   			<c:when test="${not empty site.logo}">
   				<img alt="${site.title}" src="${site.logo}" class="container" onclick="location='${ctx}/index-${site.id}${fns:getUrlSuffix()}'">
   			</c:when>
   			<c:otherwise><a class="brand" href="${ctx}/index-${site.id}${fns:getUrlSuffix()}">${site.title}</a></c:otherwise>
   		  </c:choose>
          <div class="nav-collapse">
            <ul id="main_nav" class="nav nav-pills">
             	<li class="${not empty isIndex && isIndex ? 'active' : ''}"><a href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a></li>
				<c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				<c:if test="${status.index lt 6}">
                    <c:set var="menuCategoryId" value=",${category.id},"/>
		    		<li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
		    	</c:if>
		    	</c:forEach>
			    <li id="siteSwitch" class="dropdown">
			       	<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="站点"><i class="icon-retweet"></i></a>
					<ul class="dropdown-menu">
					  <c:forEach items="${fnc:getSiteList()}" var="site"><li><a href="#" onclick="location='${ctx}/index-${site.id}${urlSuffix}'">${site.title}</a></li></c:forEach>
					</ul>
				</li>
		    	<li id="themeSwitch" class="dropdown">
			       	<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="主题切换"><i class="icon-th-large"></i></a>
				    <ul class="dropdown-menu">
				      <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
				    </ul>
				    <!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
			    </li>
            </ul>
            <form class="navbar-form pull-right" action="${ctx}/search" method="get">
              	<input type="text" name="q" maxlength="20" style="width:65px;" placeholder="全站搜索..." value="${q}">
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
	<div class="container">
		<div class="content">
			<sitemesh:body/>
		</div>
		<hr style="margin:20px 0 10px;">
		<footer>
			<div class="footer_nav"><a href="${ctx}/guestbook" target="_blank">公共留言</a> | <a href="${ctx}/search" target="_blank">全站搜索</a> | <a href="${ctx}/map-${site.id}${fns:getUrlSuffix()}" target="_blank">站点地图</a> | <a href="mailto:thinkgem@163.com">技术支持</a> | <a href="${pageContext.request.contextPath}${fns:getAdminPath()}" target="_blank">后台管理</a></div>
			<div class="pull-right">${fns:getDate('yyyy年MM月dd日 E')}</div><div class="copyright">${site.copyright}</div>
      	</footer>
    </div> --%> <!-- /container -->
</body>
</html>