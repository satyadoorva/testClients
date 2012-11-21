<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 11/20/12
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="main"/>
  </head>
  <body>
  <g:form controller="play" action="gameInAction">

      <div style="float: left;">
           Select first player: <g:select name="player1" from="${players}" optionKey="userName" optionValue="userName" noSelection="['':'select one']" onchange="updateOtherPlayer(this.value)"/>
       </div>

      <div style="float: left;" id="otherPlayer">
           Select second player: <select disabled="disabled">
          <option>select one</option>
           </select>
       </div>
          <div style="margin: 10px;padding: 20px;">
              <input type="submit" value="Play Game">
          </div>
      </g:form>
  </body>
</html>