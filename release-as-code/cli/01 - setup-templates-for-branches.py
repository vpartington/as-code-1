for branch in range ('5.0.x-maintenance', '5.1.x-maintenance', '5.5.x-maintenance', '6.0.x-maintenance'):
    template = {
        'type': 'xlrelease.Release',
        'title': 'Pipeline for app %s' % branch,
        'phases': [
            {
                'title': 'Build',
                'tasks': [
                    jenkins_Build(title = "Build backend", jobName = 'backend/%' % branch),
                    jenkins_Build(title = "Build frontend", jobName = 'frontend/%' % branch),
                    xldeploy_createAndUploadPackage(title = "Create and upload package", manifest = "git@github.com/app/deployit-manifest.xml")
                ],
            }
            {
                'title': 'Test',
                'tasks': [

                    xldeploy_deploy(title = "Deploy to QA", server = 'XLD-1', deploymentPackage = 'app/1.0', environment = 'QA')
                    jmeter_run(testPlan = 'http://example.com/git/testplan.jmeter')
                ]
            }
        ],
        'variables': [
            xlDeployPackageVariable{'Application', True, True)
        ]
    }

    templateApi.createTemplate(template)
