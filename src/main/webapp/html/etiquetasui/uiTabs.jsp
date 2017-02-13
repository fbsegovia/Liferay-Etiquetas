<%@page import="javax.portlet.ActionRequest"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<portlet:defineObjects />

<%@ include file="view.jsp" %>

<!-- En names ponemos las pestañas que tenemos -->
<liferay-ui:tabs names="tab1,tab2,tab3" refresh="false">
	<liferay-ui:section>Este sería en TAB1
		<table>
			<tr>
				<th>Columna 1</th>
			</tr>
			<tr>
				<th>Dato 1</th>
			</tr>
		</table>
	</liferay-ui:section>
	<liferay-ui:section>Este sería en TAB2</liferay-ui:section>
	<liferay-ui:section><%@ include file="jspAImportar.jsp" %></liferay-ui:section>
</liferay-ui:tabs>

