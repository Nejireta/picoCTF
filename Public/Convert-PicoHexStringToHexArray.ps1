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