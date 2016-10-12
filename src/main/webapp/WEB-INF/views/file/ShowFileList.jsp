<%@page import="com.dcnetworkdisk.file.model.DcFile"%>
<%@page import="java.io.File"%>
<%@page import="com.dcnetworkdisk.common.utils.URLEncoderUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@include file="../header.jsp" %>
	<div>
	<h2>FileList</h2>
	<c:set var="token" value="${token}"/>
	<c:set var="sucess" value="${success}"></c:set>
	<c:if test="${sucess == true}">
		<dd class="list-view-item">
			<div class="div-item" style="width:60%"><a href="javascript:void(0);">File Name</a></div>
			<div class="div-item" style="width:16%"><a href="javascript:void(0);">File Size</a></div>
			<div class="div-item" style="width:12%"><a href="javascript:void(0);">Create Time</a></div>
			<div class="div-item" style="width:12%"><a href="javascript:void(0);">Modified Time</a></div>
		</dd>
		<c:forEach items="${filelist}" var="file">
			<c:set var="path" value="${file.filepath}"></c:set>
			<%
				String path = (String)pageContext.getAttribute("path");
				path = URLEncoderUtil.encode(path, "utf-8");
				pageContext.setAttribute("path", path);
				
				String filename = ((DcFile)pageContext.getAttribute("file")).getFilename();
				System.out.println(filename);
				pageContext.setAttribute("filename", filename);
			%>
			<dd class="list-view-item">
				<div class="fileicon" style="width:3%"></div>
				<div class="div-item" style="width:57%"><a href='<c:url value="/file/download/${token}/${path}/${filename}"/>'>${file.filename}</a></div>
				<div class="div-item" style="width:16%">${file.filesize} Bytes</div>
				<div class="div-item" style="width:12%">${file.create_date}</div>
				<div class="div-item" style="width:12%">${file.modified_date}</div>
			</dd>
<!--  		<p><a href='<c:url value="/file/download/${token}/${path}/${filename}"/>'>${file.filename}</a></p>
			<p>&emsp;File Size:${file.filesize} Bytes</p>
			<p>&emsp;Create Time:${file.create_date}</p>
			<p>&emsp;Modified Time:${file.create_date}</p>
-->
		</c:forEach>
	</c:if>
	<c:if test="${sucess == false}">
		<c:out value="${errorMsg}"></c:out>
	</c:if>
	</div>
</body>
</html>