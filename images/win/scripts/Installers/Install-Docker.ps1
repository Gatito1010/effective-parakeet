################################################################################
##  File:  Install-Docker.ps1
##  Desc:  Install Docker.
##         Must be an independent step becuase it requires a restart before we
##         can continue.
################################################################################

Write-Host "Install-Package Docker"
Install-Package -Name docker -ProviderName DockerMsftProvider -Force
Start-Service docker

Write-Host "Install-Package Docker-Compose"
Choco-Install -PackageName docker-compose

Invoke-PesterTests -TestFile "Docker" -TestName "Docker"