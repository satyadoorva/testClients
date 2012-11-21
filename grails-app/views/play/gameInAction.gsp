<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 11/20/12
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="ext"/>
      <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/></>
<g:javascript src='popup.js'/>
<g:javascript library="application"/>
<g:javascript src='application.js'/>
<g:javascript library="prototype"/>
<script type="text/javascript">
    var player = 'Player1';
    var playerSine = 'X';

    function updateCell() {
        if (player == 'Player1') {
            player = 'Player2';
        } else {
            player = 'Player1';
        }
        document.getElementById('playersMove').innerHTML=player + '  move';
    }
    function matchDraw(){
       document.getElementById('playersMove').innerHTML='Match Draw';
    }

    function checkGameOver(data) {
        new Ajax.Updater('playersMove', './gameOver?player=' + data, {
                    method : "post",
                    evalScripts : true
                });
    }
    function checkGameDrawn(data) {
        new Ajax.Updater('playersMove1', './gameDrawn?player=' + data, {
                    method : "post",
                    evalScripts : true
                });
    }
</script>
<g:javascript src='app.js'/>
</head>
<body>
<div align="center">

    <div class="header">
        <g:message code="application.name" default="Tic-tac-toe"/>
    </div>

    <div class="tttMain">
        <div class="tttMainLeft">
            <div class="playerDetails">
                <div style="font-size: 16px;text-decoration: underline;">Player1</div>

                <div id="player1Details">
                    <g:render template="playerDetails" model="[player:player1]"/>
                </div>

            </div>
            <g:if test="${player2!=null}">
                <div class="playerDetails">
                    <div style="font-size: 16px;text-decoration: underline;">Player2</div>

                    <div id="player2Details">
                        <g:render template="playerDetails" model="[player:player2]"/>
                    </div>
                </div>
            </g:if>

            <g:link action="newGame">
                <div class="newGame">
                    Play New Game
                </div>
            </g:link>

        </div>

        <div class="tttMainRight">
            <div class="tttMainView" id="tttMainView">
                %{--<g:each in="${0..8}" var="no">
                    <div class="tttCell" id="cell${no}" onclick="updateCell(${no})">

                    </div>
                </g:each>--}%
            </div>

            <div class="playersMove" id="playersMove">
                Player1  move
            </div>
        </div>

    </div>

</div>

</body>
</html>