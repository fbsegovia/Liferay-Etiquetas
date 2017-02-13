package com.Portlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class EtiquetasUIPortlet
 */
public class EtiquetasUIPortlet extends MVCPortlet {
 
	
		public void pruebaMensajes(ActionRequest actionRequest, ActionResponse actionResponse)
				throws IOException, PortletException {
			String parametro = ParamUtil.get(actionRequest, "parametro", "");
			if(parametro.equals("")){
				SessionErrors.add(actionRequest, "errorParametroVacio");
			}else{
				SessionMessages.add(actionRequest, "parametroRelleno");
			}
		}

		public void procesarFecha(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
			String fechaEscogida = ParamUtil.get(actionRequest, "fechaEscogida", "");
			System.out.println(fechaEscogida);
			Locale locale = actionRequest.getLocale();
			System.out.println(locale.toString());
			SimpleDateFormat sdf = null;
			if(locale.toString().equals("en_US")){
				sdf = new SimpleDateFormat("MM/dd/yyyy");
			}else if(locale.toString().equals("es_ES")){
				sdf = new SimpleDateFormat("dd/MM/yyyy");
			}
						
			try {
				Date date = sdf.parse(fechaEscogida);
				System.out.println(date.toString());
				actionRequest.setAttribute("fechaEscogida", date);
				actionResponse.setRenderParameter("mvcPath", "/html/etiquetasui/calendario.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
		
		
}
