package com.damyant

import grails.converters.JSON

class PlayController {

    def tttPlayService

    def index = {

    }


    def newGame={
        redirect(uri: '/')
    }



    def multiPlayerGames={
        def playerList=Player.list()

        [players:playerList]
    }

    def otherPlayer={
        println"------------"+params
         def players=[]

        Player.list().each{p->
            println"--"+p.userName+"--"+params.player
            if(p.userName!=params.player){
                players.add(p)
            }
        }

        [otherPlayers:players]
    }
    def gameInAction={
        def player1=null,player2=null
        player1=Player.findByUserName(params.player1)
        session.Player1=player1

        if(params.player2){
         player2=Player.findByUserName(params.player2)
         session.Player2=player2
        }
        [player1:player1,player2:player2]
    }

    def gameOver={
        def player

        if(params.player=='D'){
           tttPlayService.updatePlayerDrawData(session)
        }else if(params.player=='0'){
            player=session['Player1'].name
            tttPlayService.updatePlayerWonData('Player1',session)
            tttPlayService.updatePlayerlossData('Player2',session)
        }else{
           player=session['Player2'].name
            tttPlayService.updatePlayerWonData('Player2',session)
            tttPlayService.updatePlayerlossData('Player1',session)
        }

        [player:player]
    }

    def gameDrawn={
         tttPlayService.updatePlayerDrawData(session)

    }



}
