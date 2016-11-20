param($name = "SharpYaml.NetStandard")

if(test-path ./artifacts) {
    gci ./artifacts | Remove-Item
} 

dotnet restore ./SharpYaml
dotnet pack --output ./artifacts ./SharpYaml

if($name) {
    $files = gci ./artifacts -filter SharpYaml.*.nupkg
    $files | % { Rename-Item $_.FullName ($_.Name -replace "SharpYaml", $name) } 
}