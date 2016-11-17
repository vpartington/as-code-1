for branch in range ('5.0.x-maintenance', '5.1.x-maintenance', '5.5.x-maintenance', '6.0.x-maintenance'):
    t = templateApi.createTemplate('Release %s' % branch)

    buildPhase = phaseApi.newPhase('Build')
    buildPhase = phaseApi.addPhase(t.id, buildPhase)
    buildBackendTask = taskApi.newTask('jenkins.Build')
    buildBackendTask.title = 'Build backend'
    buildBackendTask.jobName = 'backend/%' % branch
    taskApi.addTask(buildPhase.id, buildBackendTask)

    buildFrontendTask = taskApi.newTask('jenkins.Build')
    buildFrontendTask.title = 'Build frontend'
    buildFrontendTask.jobName = 'frontend/%' % branch
    taskApi.addTask(buildPhase.id, buildFrontendTask)

    testPhase = phaseApi.newPhase('Test')
    testPhase = phaseApi.addPhase(t.id, testPhase)

    deployTask = taskApi.newTask('xlrelease.DeployitTask')
    deployTask.title = 'Deploy to QA'
    deployTask.server = 'XL Deploy'
    deployTask.deploymentPackage = 'app/1.0'
    deployTask.environment = 'QA'
    taskApi.addTask(testPhase.id, deployTask)

    testTask = taskApi.newTask('jmeter.Run')
    testTask.testPlan = 'http://example.com/git/testplan.jmeter'
    taskApi.addTask(testPhase.id, testTask)
