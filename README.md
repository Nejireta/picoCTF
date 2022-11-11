# PicoCTF

Functions which might be useful in solving some picoCTF challenges.


## Example usage
Import-Module 'PathToPsd1'
$hexString = 'chr(0x33) + chr(0x39) + chr(0x63) + chr(0x65)'\
$flagPath = 'PathToEncyptedFlag'\
$encryptedString = Get-StringFromBinaryFile -Path $flagPath\
$hexArray = Convert-PicoHexStringToHexArray -HexString $hexString\
$key = Convert-HexArrayToString -HexArray $hexArray\
Invoke-BitwiseXORDecryption -String $encryptedString -Key $key