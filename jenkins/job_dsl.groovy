folder("Whanos base images") {
    description("Base images for Whanos")
}

folder("Projects") {
    description("Projects")
}


freeStyleJob("Whanos base images/whanos-befunge") {
    steps {
        shell('echo whanos-befunge')
    }
}

freeStyleJob("Whanos base images/whanos-c") {
    steps {
        shell('echo whanos-c')
    }
}

freeStyleJob("Whanos base images/whanos-java") {
    steps {
        shell('echo whanos-java')
    }
}

freeStyleJob("Whanos base images/whanos-javascript") {
    steps {
        shell('echo whanos-javascript')
    }
}

freeStyleJob("Whanos base images/whanos-python") {
    steps {
        shell('echo whanos-python')
    }
}
