folder("Whanos base images") {
    description("Base images for Whanos")
}

folder("Projects") {
    description("Projects")
}

def languages = ["befunge", "c", "java", "javascript", "python"]

languages.each { lang ->
    freeStyleJob("Whanos base images/whanos-$lang") {
        steps {
            shell("docker build /var/jenkins_home/images/$lang -t whanos-$lang -f /var/jenkins_home/images/$lang/Dockerfile.base")
        }
    }
}

freeStyleJob("Whanos base images/Build all base images") {
    description("Build all base images in a beautiful fashion")
    publishers {
        downstream(languages.collect{"whanos-$it"})
    }
}

freeStyleJob("link-project") {
    parameters {
        stringParam('GIT_NAME', null, 'Git repository owner/repo_name (e.g.: "https://git.sr.ht/~hollow/Homelab")')
        stringParam('DISPLAY_NAME', null, 'Display name for the job')
        credentialsParam('CREDENTIALS') {
            description('If you hide things from sight with some credentials imput them here :D')
            required(false)
        }
    }
    steps {
        dsl{
            text('''freeStyleJob("Projects/${DISPLAY_NAME}") {
                |  scm {
                |   git {
                |    remote {
                |       credentials("${CREDENTIALS}")
                |       name("origin")
                |       url("${GIT_NAME}")
                |    }
                |   }
                |  }
                |  triggers {
                |    scm("* * * * *")
                |  }
                |  wrappers {
                |    preBuildCleanup {
                |      includePattern('*')
                |      deleteDirectories()
                |    }
                |  }
                |  steps {
                |       shell("/var/jenkins_home/link-project.sh \\"$DISPLAY_NAME\\"")
                |    }
                }'''.stripMargin())
        }
    }
}