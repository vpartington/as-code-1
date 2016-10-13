This is a mockup for the Xfile and xl-cli implementation that we want to show on Friday October 14th.

It consists of simple bash scripts, and two Xfiles.

Just a quick demo-mockup-thing.

#Preparation:
- Clone the repository
- In the directory, run `source set_aliases.sh`
- Run `xl prepare`

#Usage:
- Run `xl preview` to show the preview of what the Xfile will do
- Run `xl deploy` to deploy MyApp to the Development environment
- Run `xl list` to show which versions of MyApp are deployed on the XLD server
- Run `git commit` to commit the changes
- Run `git push` to push the changes to git
- Run `xl list` to show that the push has automatically triggered Jenkins and has deployed the build on Test (also see the screenshot)
- Run `xl deploy MyApp Acceptance` to deploy MyApp to Acceptance (also see the screenshot of deployment screen)
- Run `xl list` to show that MyApp has been updated to the latest version (also see the screenshot of repository screen)
- Rejoice!