function CreateFolderIfNotExists {
    param ([string]$path)
    If (!(test-path $path)) {
        Write-Host "Creating mount folder [${path}]"
        New-Item -ItemType Directory -Force -Path $path
    }
}

# Docker for Windows doesn't seem to want to create the paths even though Docker for Mac will
$tmpPath = "${pwd}/docker/data/web/tmp"
CreateFolderIfNotExists($tmpPath)

$logPath = "${pwd}/docker/data/web/log"
CreateFolderIfNotExists($logPath)

$nodeModulesPath = "${pwd}/docker/data/web/node_modules"
CreateFolderIfNotExists($nodeModulesPath)

Write-Host "args: ${args}"

Write-Host "docker run --name triptych -v ${pwd}:/triptych/ -v ${tmpPath}:/triptych/tmp -v ${logPath}:/triptych/log -v ${nodeModulesPath}:/triptych/node_modules --env-file=.env -e TZ=${Get-Date -UFormat "%Z"} --rm --interactive triptych:latest chmod bin/* 755 && ${args}"
docker run --name triptych -v ${pwd}:/triptych/ -v ${tmpPath}:/triptych/tmp -v ${logPath}:/triptych/log -v ${nodeModulesPath}:/triptych/node_modules --env-file=.env -e TZ=${Get-Date -UFormat "%Z"} --rm --interactive triptych:latest ${args}
