from java.util import Date
from sets import Set

from com.xebialabs.xlrelease.domain import Release
from com.xebialabs.xlrelease.domain.status import ReleaseStatus


template = Release()
template.title = 'Deploy template'
template.status = ReleaseStatus.TEMPLATE
template.scheduledStartDate = Date()
template.dueDate = Date(template.scheduledStartDate.getTime() + 3600000)
template = templateApi.createTemplate(template)


deployPhase = template.phases[0]
deployPhase.title = "Deploy"
deployPhase = phaseApi.updatePhase(deployPhase)

approveTask = taskApi.newTask('xlrelease.Task')
approveTask.title = 'Approve deployment'
taskApi.addTask(deployPhase.id, approveTask)

deployTask = taskApi.newTask('xlrelease.DeployitTask')
deployTask.title = 'Deploy to PROD'
deployTask.server = 'XL Deploy'
deployTask.deploymentPackage = '$' + '{Application}'
deployTask.environment = 'PROD'
taskApi.addTask(deployPhase.id, deployTask)

notificationTask = taskApi.newTask("xlrelease.NotificationTask")
notificationTask.addresses = Set(['hsiemelink@xebialabs.com'])
notificationTask.title = "Send email of succesful deployment"
notificationTask.subject = '$' + '{Application} has been deployed to PROD'
notificationTask.body = '$' + '{Application} has been deployed to PROD by XL Release just now.'
taskApi.addTask(deployPhase.id, notificationTask)

myFolder = folderApi.find("${teamName}", 1)
folderApi.moveTemplate( myFolder.id, template.id )

