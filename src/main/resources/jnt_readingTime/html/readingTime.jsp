<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="javascript" resources="jquery.min.js,readingtime.min.js" />
<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:choose>
    <c:when test="${bindedComponent.path eq renderContext.mainResource.node.path}">
        <c:set var="readingtime" value="body"/>
    </c:when>
    <c:otherwise>
        <c:set var="readingtime" value="div#readingtime_${currentNode.identifier}"/>
    </c:otherwise>

</c:choose>

<c:set var="currentLang" value="${fn:toLowerCase(renderContext.mainResourceLocale.language)}"/>
<c:choose>
  <c:when test="${fn:startsWith(currentLang, 'fr')}"><c:set var="lang" value="fr"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'de')}"><c:set var="lang" value="de"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'es')}"><c:set var="lang" value="es"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'nl')}"><c:set var="lang" value="nl"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'sk')}"><c:set var="lang" value="sk"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'cz')}"><c:set var="lang" value="cz"/></c:when>
  <c:when test="${fn:startsWith(currentLang, 'ru')}"><c:set var="lang" value="ru"/></c:when>
  <c:otherwise><c:set var="lang" value="en"/></c:otherwise>

</c:choose>

<div id="eta-${currentNode.identifier}" class="eta"></div>
<script>
	$('${readingtime}').readingTime({
        lang: '${lang}',
		remoteTarget : '#eta-${currentNode.identifier}'
	});
</script>