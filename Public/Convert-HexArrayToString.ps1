function Convert-HexArrayToString {
    <#
    .SYNOPSIS
        Converts an array to string
    .DESCRIPTION
        Converts an array of hexadecimal values to a string
    .PARAMETER HexArray
        [string[]]
        The hexadecimal array to convert
    .OUTPUTS
        [string]
    .EXAMPLE
        Convert-HexArrayToString -HexArray $hexArray
        Convert-HexArrayToString -HexArray @('0x30', '0x31', '0x32', '0x33')
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $HexArray
    )
    begin {
        $stringBuilder = [System.Text.StringBuilder]::new()
    }
    process {
        foreach ($hexCharacter in $HexArray) {
            [void]$stringBuilder.Append([char][byte]$hexCharacter)
        }

        return $stringBuilder.ToString()
    }
    end {
        [void]$stringBuilder.Clear()
    }
}