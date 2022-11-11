function Get-StringFromBinaryFile {
    <#
    .SYNOPSIS
        Gets a string from a binary file
    .DESCRIPTION
        Reads the bytes of a file and converts it to a string with UTF8 encoding
    .PARAMETER Path
        [string]
        Path to file
    .OUTPUTS
        [string]
    .EXAMPLE
        Get-StringFromBinaryFile -Path $pathToBinaryFile
        Get-StringFromBinaryFile -Path '<pathToBinaryFile>'
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path
    )
    begin {}
    process {
        return [System.Text.Encoding]::UTF8.GetString([System.IO.File]::ReadAllBytes($Path))
    }
    end {}
}