param($name = "SharpYaml.NetStandard")

if(test-path ./artifacts) {
    gci ./artifacts | Remove-Item
} 

dotnet restore ./SharpYaml.NetStandard
dotnet pack --output ./artifacts ./SharpYaml.NetStandard