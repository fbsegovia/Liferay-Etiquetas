<%@page import="javax.portlet.ActionRequest"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<portlet:defineObjects />
<theme:defineObjects/>
<!-- Con esta etiqueta uno de los elementos m�s importantes que se nos definen
es el de USER que contiene informaci�n relativa al usuario -->

<!-- Podemos declarar los errores mediante la etiqueta liferay-ui -->
<liferay-ui:error message="El parametro no puede estar vacio" key="errorParametroVacio"/>

<!-- Tambien podemos declarar exitos -->
<liferay-ui:success message="El parametro esta correctamente informado"	key="parametroRelleno"/>

<liferay-ui:message key="title"/>

<portlet:actionURL var="pruebaMensajesURL" >
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" value="pruebaMensajes"/>
</portlet:actionURL>

<aui:form action="${pruebaMensajesURL}" method="post" name="name">
	<aui:input name="parametro"></aui:input>
	<aui:button type="submit" value="button.send"></aui:button>
</aui:form>

<portlet:actionURL var="vamosTabs">
	<portlet:param name="mvcPath" value="/html/etiquetasui/uiTabs.jsp"/>
</portlet:actionURL>

<a href="${vamosTabs}">Enlace</a>

<p>Usuario</p> 
<p>Nombre: <%= user.getFirstName()%></p>
<p>Nombre: <%= user.getLastName()%></p>
<p>Nombre: <%= user.getRoles()%></p>
<!-- Otro objeto podr�a ser el de compa�ia o company, que tiene
informaci�n acerca de la empresa que tiene liferay -->
<p>Compa�ia</p>
<p>Nombre: <%= company.getName() %></p>
<p>Zona Horaria</p>
<p>Zona Horaria: <%= timeZone.getDisplayName()%></p>







