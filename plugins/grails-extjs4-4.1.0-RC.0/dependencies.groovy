grails.project.work.dir = 'target'

grails.project.dependency.resolution = {
    inherits("global") {
    }
    
    log "warn"

    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
    }

    dependencies {
    }

    plugins {
        build(":release:1.0.1") { export = false }
    }
}
