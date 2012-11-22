<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 11/20/12
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="application.name" default="Tic-tac-toe"/></title>
    <meta name="layout" content="main"/>
    <g:javascript src='popup.js'/>
    <script type="text/javascript">
        function updateOtherPlayer(data) {
            new Ajax.Updater('otherPlayer', './play/otherPlayer?player=' + data, {
                        method : "post",
                        evalScripts : true
                    });
        }
        function validateForm(formData) {
            if (formData.player1.value == '') {
                document.getElementById('velidationMsg').innerHTML = 'Please Select Player 1 !';
                return false;
            } else if (formData.player2.value == '') {
                document.getElementById('velidationMsg').innerHTML = 'Please Select Player 2 !';
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<div style="width:1000px;height: 700px;margin: 50px;">
    <div class="header">
        <g:message code="application.name" default="Tic-tac-toe"/>
    </div>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="innerBody">
        <div class="leftPane">
            <div class="leftPaneMenu" onclick="openPopup('Create Player', './player/create', '350', '215');">
                Create Player
            </div>


            <div class="leftPaneMenu" onclick="openPopup('Multi Player', './play/multiPlayerGames', '350', '200');">
                Play New Game
            </div>

            %{--<div class="leftPaneMenu" onclick="openPopup('View Statistics', './play/multiPlayerGames', '300', '100');">
                View Statistics
            </div>--}%
        </div>

        <div class="rightPane">
            <img src="images/Tic_Tac_Toe.gif" alt="" width="95%" height="95%">
        </div>
    </div>

</div>
</body>
</html>