package com.damyant

class PlayerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def create = {
        def playerInstance = new Player()
        playerInstance.properties = params
        return [playerInstance: playerInstance]
    }

    def save = {
        def playerInstance = new Player(params)
        if (playerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'player.label', default: 'Player'), playerInstance.userName])}"
            redirect(uri: '/')
        }
        else {
            flash.message = "${message(code: 'player.not.created.message', args: [message(code: 'player.label', default: 'Player'), playerInstance.id])}"
            redirect(uri: '/')
        }
    }


}
