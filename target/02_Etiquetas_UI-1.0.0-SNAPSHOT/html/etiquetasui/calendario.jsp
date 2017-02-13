<%@page import="javax.portlet.ActionRequest"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ page import="java.util.Date" %>

<h1>Bienvenidos a Calendario</h1>

<%
	Object oFechaEscogida = request.getAttribute("fechaEscogida");
	int diaHoy = 0;
	int mes = 0;
	int a�o = 0;
	Calendar calendar = Calendar.getInstance();
	if(oFechaEscogida == null){
		//La clase date sirve para manejar fechas
		//Guarda un long que representa el n�mero de milisegundos que han pasado desde el a�o 1970.
		Date date = new Date();
		out.print(date.getTime());
		//Esto nos devuelve un calendario con la fecha actual
		
		//El d�a, el mes y el a�o son enteros.
		//Las fechas que se dan al usuario se corresponden con la 
		//registrada en lalocalizaci�n del servidor
		diaHoy = calendar.get(Calendar.DAY_OF_MONTH);
		mes = calendar.get(Calendar.MONTH);
		a�o = calendar.get(Calendar.YEAR);
	}else{
		Date date = (Date)oFechaEscogida;
		System.out.println(date.toString());
		calendar.setTime(date);

		diaHoy = calendar.get(Calendar.DAY_OF_MONTH);
		mes = calendar.get(Calendar.MONTH);
		a�o = calendar.get(Calendar.YEAR);
	}

%>

<liferay-ui:calendar 
	day="<%=diaHoy%>" 
	month="<%=mes%>" 
	year="<%=a�o%>"
/> <!-- Los meses empiezan en el 0; enero=0 -->


<portlet:actionURL var="viewForm">
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" value="procesarFecha"/>
</portlet:actionURL>

<aui:form action="${viewForm}" method="post" name="fechaEscogida">
	<liferay-ui:input-date name="fechaEscogida" dayValue="<%=diaHoy%>" monthValue="<%=mes%>" yearValue="<%=a�o%>"/>
	<aui:button type="submit" value="Actualizar Fecha"/>
</aui:form>
