<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title>Stock Prices</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <meta http-equiv="Content-Script-Type" content="text/javascript" />
  <link rel="shortcut icon" href="/images/favicon.ico" />
  <link rel="stylesheet" type="text/css" href="/css/style.css" media="all" />
  <script type="text/javascript" src="/js/util.js"></script>
  <style type="text/css">
  /*<![CDATA[*/

body {
    color: #333333;
    line-height: 150%;
}

thead {
    font-weight: bold;
    background-color: #CCCCCC;
}

.odd {
    background-color: #FFCCCC;
}

.even {
    background-color: #CCCCFF;
}

.minus {
    color: #FF0000;
}

  /*]]>*/
  </style>

 </head>

 <body>

  <h1>Stock Prices</h1>

  <table>
   <thead>
    <tr>
     <th>#</th><th>symbol</th><th>name</th><th>price</th><th>change</th><th>ratio</th>
    </tr>
   </thead>
   <tbody>
<c:forEach var="item" items="${items}" varStatus="loop">
    <tr class="${fn:escapeXml(loop.count % 2 == 1 ? 'odd' : 'even')}">
     <td style="text-align: center">${fn:escapeXml(loop.count)}</td>
     <td>
      <a href="/stocks/${fn:escapeXml(item.symbol)}">${fn:escapeXml(item.symbol)}</a>
     </td>
     <td>
      <a href="${fn:escapeXml(item.url)}">${fn:escapeXml(item.name)}</a>
     </td>
     <td>
      <strong>${fn:escapeXml(item.price)}</strong>
     </td>
<c:choose>
<c:when test="${fn:escapeXml(item.change < 0.0)}">
     <td class="minus">${fn:escapeXml(item.change)}</td>
     <td class="minus">${fn:escapeXml(item.ratio)}</td>
</c:when>
<c:otherwise>
     <td>${fn:escapeXml(item.change)}</td>
     <td>${fn:escapeXml(item.ratio)}</td>
</c:otherwise>
</c:choose>
    </tr>
</c:forEach>
   </tbody>
  </table>

 </body>
</html>
