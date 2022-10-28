import UIKit

let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var plaintext_original = "Here you can find activities to practise your reading skills. Reading will help you to improve your understanding of the language and build your vocabulary."

print("Plaint text: ")
print(plaintext_original)


var plaintext = "" //for string that without operator symbols
let key = "RITOCHKINA"

//boshtuktardy jana ashykcha simvoldordu jokko chygaruu
for i in plaintext_original{
    if i.isLetter{
        plaintext.append(i.uppercased())
    }
}

// print(plaintext) //plain text after removing operator symbols


let lengthKey = key.count
let lengthPlaintext = plaintext.count
let num = lengthPlaintext/lengthKey //type is integer butun san
let num1 = lengthPlaintext%lengthKey //type is integer kaldyk san

var arrLetters = Array(key) // keyword letters
var vigenereKey = ""


for _ in Range(1...num){
    vigenereKey += key
}

if num1 >= 1{
    for i in Range(0...num1-1){
        vigenereKey += String(arrLetters[i])
    }
}

var encryptedTextArr =  [Character]()

var charVigenereKey = Array(vigenereKey)
var charPlaintext = Array(plaintext)
//print(charVigenereKey)
//print(charPlaintext)


for i in Range(0...plaintext.count-1){
    let p = alphabetEnglish.firstIndex(of: String(charPlaintext[i]))!
    let k = alphabetEnglish.firstIndex(of: String(charVigenereKey[i]))!
    let E = (p+k)%26
    //print("p = \(p), k = \(k), E = \(E)")
    
    encryptedTextArr.append(contentsOf: alphabetEnglish[E])
}

//print(encryptedTextArr) //letters of encrypted text

var encText = String(encryptedTextArr) //getting string from character array


print("\n\nEncryption Result :")
print(encText)

//decryption the encrypted text

var decrypTextArr =  [Character]()

for i in Range(0...plaintext.count-1){
    let c = alphabetEnglish.firstIndex(of: String(encryptedTextArr[i]))!
    let k = alphabetEnglish.firstIndex(of: String(charVigenereKey[i]))!
    var D = (c-k)%26
    
    if D < 0{ //if D is negative
        D += 26
    }
    
    
    decrypTextArr.append(contentsOf: alphabetEnglish[D])
}

//print(encryptedTextArr) //letters of encrypted text

var decrypText = String(decrypTextArr) //getting string from character array


print("\n\nDecryption Result :")
print(decrypText)
