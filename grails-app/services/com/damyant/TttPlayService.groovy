package com.damyant

class TttPlayService {

    static transactional = true

    def serviceMethod() {

    }



    def updatePlayerWonData(player,session){
        def playerInstance=Player.findByUserName(session[player].userName)
        playerInstance.gamesPlayed=playerInstance.gamesPlayed+1
        playerInstance.gamesWon=playerInstance.gamesWon+1
        playerInstance.save(Flushable:true)
        println "----w----"+playerInstance.errors

    }

    def updatePlayerlossData(player,session){
        def playerInstance=Player.findByUserName(session[player].userName)
        playerInstance.gamesPlayed=playerInstance.gamesPlayed+1
        playerInstance.gamesLoss=playerInstance.gamesLoss+1
        playerInstance.save(Flushable:true)
        println "---l-----"+playerInstance.errors

    }

    def updatePlayerDrawData(session){
        def player1Instance=Player.findByUserName(session['Player1'].userName)
        if(session.Player2.userName!='comp'){
           def player2Instance=Player.findByUserName(session['Player2'].userName)
             player2Instance.gamesPlayed=player2Instance.gamesPlayed+1
             player2Instance.gamesD=player2Instance.gamesD+1
             player2Instance.save(Flushable:true)
             println "-d2--l-----"+player2Instance.errors
        }

        player1Instance.gamesPlayed=player1Instance.gamesPlayed+1
        player1Instance.gamesD=player1Instance.gamesD+1

        player1Instance.save(Flushable:true)

        println "--d2-l-----"+player1Instance.errors


    }

    def getComputerMove(session){
       def move1=session.Player1SelectedCell
       def move2=session.Player2SelectedCell

       def moves=[], leftMoves=[] ,nextMove=null
         move1.each{m1->
                moves.add(m1)
            }
            move2.each{m2->
                moves.add(m2)
            }
        println"----------moves-------"+moves
        for(def i=0;i<9;i++){
            def add=true
            moves.each{m->
                if(i==Integer.parseInt(m)){
                  add=false
                }
            }
            if(add)leftMoves.add(i)
        }
        println"~~~~~~~~~~~~~:" +leftMoves
        Random randomGenerator = new Random()
        if(leftMoves.size()>0)
        nextMove=leftMoves[randomGenerator.nextInt(leftMoves.size())]
        println "@@@@@@@@@@@@@@@@@@@@@@"+nextMove
        return nextMove

    }

}
