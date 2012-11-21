/*
 Tic-Tac-Toe Application
 Author: Damyant

 */

Ext.application({
    name: 'DemoTicTacToe',
    launch: function() {
    var lastkeypressed  // Global  variable to maintain last character pressed
    
 var k =  Ext.create('Ext.panel.Panel', {
        title: 'Tic Tac Toe',
        width: 300,
        height: 300,
    layout: {
            type: 'table',
            //3 by 3 Grid
            columns: 3
        },
        defaults: {
            // applied to each contained panel
            bodyStyle:'padding:20px',
            listeners: {
                afterRender: function(p) {
                    p.body.on('click', function() { // Function tapping clicks on Panel
                      updateCell();
                    if(p.getTargetEl().dom.innerHTML.length ==72 ) // Till here innerHTML is automatically rendered by ext.js
                    { 
                    	if(lastkeypressed=='0')     // Key check to ensure same key is not pressed subsequently
                    	{   
                    		k ='X';
                    		k = k + p.getTargetEl().dom.innerHTML;
                    		p.update(k);
				doC(p.id,k);               // Result Check function
                    		lastkeypressed='X';
                    	} 
                    	else 
                    	{   
                    		k='0';
                    		k = k + p.getTargetEl().dom.innerHTML;
                    		p.update(k);
				doC(p.id,k);
                    		lastkeypressed='0';
                    	}
                    }
                    });
                }
            }
        }
    ,
        items: [{         // Blank Panels so html is ''
            html: ' '
        },{
            html: ' '
        },{
            html: ' '
        },{
            html: ' '
        },
    {
            html: ' '
        },
    {
            html: ' '
        },
    {
            html: ' '
        },
    {
            html: ' '
        },
    {
            html: ' '
        },
        ],
        renderTo: document.getElementById('tttMainView'), // Panel will be rendered in ttMainView element
	bbar: ['->', 'Count X:0 Count O:0'] // Using internal status bar of Panel
   });
}

});

function doC(i,j)
{
	var panelId = i 
	var cellD = j.substring(0,1)
	var counterDraw = 5
    var tic = 'X'

    var toe = 'O'

    //Variables to keep hold of current tic and toe counts
    var curTicCounter = parseInt(document.getElementById('tbtext-1021').innerHTML.trim().substring(8,9)) // tbtext-1021 is the id of panel's internal status bar

    var curToeCounter = parseInt(document.getElementById('tbtext-1021').innerHTML.trim().substring(18,19))

    //variables to get text of all cells

	var tl=document.getElementById('panel-1010-body').innerText.substring(0,1)
        var tm=document.getElementById('panel-1011-body').innerText.substring(0,1)
        var ttr=document.getElementById('panel-1012-body').innerText.substring(0,1)
        var ml=document.getElementById('panel-1013-body').innerText.substring(0,1)
        var mim=document.getElementById('panel-1014-body').innerText.substring(0,1)
        var mr=document.getElementById('panel-1015-body').innerText.substring(0,1)
        var bl=document.getElementById('panel-1016-body').innerText.substring(0,1)
        var bm=document.getElementById('panel-1017-body').innerText.substring(0,1)
        var bre=document.getElementById('panel-1018-body').innerText.substring(0,1)
	
	if(cellD == tic)
	{
		curTicCounter = curTicCounter + 1;
	}		
	else
	{
		curToeCounter = curToeCounter + 1;
	}

	var tmpStatusBarText = 'Count X:'+ curTicCounter + ' Count O:'+ curToeCounter;


    {
    document.getElementById('tbtext-1021').innerHTML = tmpStatusBarText

       /*             1010   | 1011   | 1012
        *             -------|--------|------------
        *                    |        |
        *             1013   | 1014   | 1015
        *              ------|--------|------------
        *             1016   | 1017   | 1018
        *                    |        |
        *

         */

	switch(panelId)
	{
		case 'panel-1010':
			if((cellD === mim && cellD === bre) || (cellD == tm && cellD == ttr) || (cellD == ml && cellD == bl))
			{
                checkGameOver(cellD);
			}
			break;
		case 'panel-1011':
                        if((cellD === tl && cellD === ttr) || (cellD == mim && cellD == bm))
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1012':
                        if((cellD === tl && cellD === tm) || (cellD == mim && cellD == bl) || (cellD == bm && cellD == bre))
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1013':
                        if((cellD === tl && cellD === bl) || (cellD == mim && cellD == mr) )
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1014':
                        if((cellD === tl && cellD === bre) || (cellD == ttr && cellD == bl) || (cellD == ml && cellD == mr))
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1015':
                        if((cellD === ttr && cellD === bre) || (cellD == ml && cellD == mim) )
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1016':
                        if((cellD === tl && cellD === ml) || (cellD == mim && cellD == ttr) || (cellD == bm && cellD == bre))
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1017':
                        if((cellD === bl && cellD === bre) || (cellD == tm && cellD == mim) )
                        {
                            checkGameOver(cellD);
                        }
                        break;
		case 'panel-1018':
                        if((cellD === tl && cellD === mim) || (cellD == bl && cellD == bm) || (cellD == ttr && cellD == mr))
                        {
                            checkGameOver(cellD);
                        }
                        break;

	}
    }
    if(curTicCounter == counterDraw || curToeCounter ==counterDraw ) // Draw Condition
    {
        document.getElementById('tbtext-1021').innerHTML = tmpStatusBarText
        matchDraw();
        checkGameDrawn('D');
    }
}


