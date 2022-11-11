function Invoke-BitwiseXORDecryption {
    <#
    .SYNOPSIS
        Bitwise XOR decryption
    .DESCRIPTION
        Uses Bitwise XOR to decrypt a string with a key
    .PARAMETER String
        [string[]]
        The encrypted string
    .PARAMETER Key
        [string]
        The key to decrypt the string with
    .OUTPUTS
        [string]
    .EXAMPLE
        Invoke-BitwiseXORDecryption -String $encryptedString -Key $decryptionKey
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $String,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Key
    )
    begin {
        $stringBuilder = [System.Text.StringBuilder]::new()
    }
    process {
        for ($i = 0; $i -lt $String.Length; $i++) {
            [uint32]$charCode = $String[$i]
            [int]$keyPosition = $i % $Key.Length # Modulus - returns the remainder of a division operation
            [uint32]$keyCode = $Key[$keyPosition]
            [char]$combinedChar = $charCode -bxor $keyCode # Bitwise XOR - performs the logical exclusive OR operation on each pair of corresponding bits
            [void]$stringBuilder.Append($combinedChar)
        }
        return $stringBuilder.ToString()
    }
    end {
        [void]$stringBuilder.Clear()
    }
}

function Convert-PicoHexStringToHexArray {
     <#
    .SYNOPSIS
        Converts a string to array
    .DESCRIPTION
        Converts a string containing hexadecimal values to a hexadecimal array
    .PARAMETER HexString
        [string]
        The string to convert to hexadecimal array
    .OUTPUTS
        [object[]]
    .EXAMPLE
        Convert-PicoHexStringToHexArray -HexString $hexString
        Convert-PicoHexStringToHexArray -HexString 'chr(0x30) + chr(0x31) + chr(0x32) + chr(0x33)'
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $HexString
    )
    begin {}
    process {
        return $HexString.TrimStart('chr(').Split(')', [System.StringSplitOptions]::RemoveEmptyEntries).Replace(' + chr(', '')
    }
    end {}
}

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
