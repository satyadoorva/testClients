<%@ page import="com.damyant.Player" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${playerInstance}">
        <div class="errors">
            <g:renderErrors bean="${playerInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userName"><g:message code="player.userName.label" default="User Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'userName', 'errors')}">
                        <g:textField name="userName" value="${playerInstance?.userName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="age"><g:message code="player.age.label" default="Age"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'age', 'errors')}">
                        <g:textField name="age" value="${fieldValue(bean: playerInstance, field: 'age')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="player.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${playerInstance?.name}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
