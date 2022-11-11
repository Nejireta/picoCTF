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