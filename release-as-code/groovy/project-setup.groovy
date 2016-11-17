def shards = loadFromRest('https://example.org/api/load/shards')

release('Maintenance') {
    phases[
        phase('Preparation') {
            color 'red'
            tasks: {
                manualTask('Prepare deploy') {
                    description "Check all stuff"
                }
            }
        }
        phase('Deploy') {
            color 'green'
            tasks: {
                shards.each(it){
                    xlDeployTask('Shard deploy $it.name') {
                        server it.server
                        environment 'stage' 
                        package 'app'
                })
            }
        }]
}
