param($name)

if(test-path ./output) {
    gci ./output | Remove-Item
} 

dotnet restore ./SharpYaml
dotnet pack --output ./output ./SharpYaml

if($name) {
    $files = gci ./output -filter SharpYaml.*.nupkg
    $files | % { Rename-Item $_.FullName ($_.Name -replace "SharpYaml", $name) } 
}