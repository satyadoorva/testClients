<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript src='application.js'/>
    <g:javascript library="prototype"/>

    <script type="text/javascript">
     var BASE = '${grailsApplication.config.grails.serverURL}';
        jQuery(function($) {
// CONTROLLING EVENTS IN jQuery
            $(document).ready(function() {
                // CLOSING POPUP
                // Click the x event!
                $("#popupContactClose").click(function() {
                    disablePopup();
                });
                // Press Escape event!
                $(document).keypress(function(e) {
                    if (e.keyCode == 27 && popupStatus == 1) {
                        disablePopup();
                    }
                });
            });
        });
    </script>
</head>

<body>
<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir: 'images', file: 'spinner.gif')}"
         alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
</div>


<!--Popup div start here -->
<div id="popupContact" align="center">
    <div id="popupHeaderDiv"><h1 id="popupHeaderDivConetent">Title of popup!</h1><a id="popupContactClose"
                                                                                    href="#">X</a></div>

    <div id="popupContentDiv"></div>
</div>
<!--Popup div ends here -->
<div align="center">
    <g:layoutBody/>
</div>

</body>
</html>