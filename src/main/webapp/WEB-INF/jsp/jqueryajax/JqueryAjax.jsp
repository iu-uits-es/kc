<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>
<%@ page language="java" %> 
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Jquery Ajax</title>

</head>

<body>
<html:form styleId="kualiForm" method="post"
    action="/jqueryAjax.do" enctype=""
    onsubmit="return hasFormAlreadyBeenSubmitted();"> 
<value>
		${KualiForm.returnVal}
</value>



</html:form>
</body>
</html>
