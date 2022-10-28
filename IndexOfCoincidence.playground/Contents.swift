import UIKit

let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


var plaintext_original = "This question came from Elon Musk near the very end of a long dinner we shared at a high-end seafood restaurant in Silicon Valley. I’d gotten to the restaurant first and settled down with a gin and tonic, knowing Musk would—as ever—be late. After about fifteen minutes, Musk showed up wearing leather shoes, designer jeans, and a plaid dress shirt. Musk stands six foot one but ask anyone who knows him and they’ll confirm that he seems much bigger than that. He’s absurdly broad-shouldered, sturdy, and thick. You’d figure he would use this frame to his advantage and perform an alpha-male strut when entering a room. Instead, he tends to be almost sheepish. It’s head tilted slightly down while walking, a quick handshake hello after reaching the table, and then butt in seat. From there, Musk needs a few minutes before he warms up and looks at ease.Musk asked me to dinner for a negotiation of sorts. Eighteen months earlier, I’d informed him of my plans to write a book about him, and he’d informed me of his plans not to cooperate. His rejection stung but thrust me into dogged reporter mode. If I had to do this book without him, so be it. Plenty of people had left Musk’s companies, Tesla Motors and SpaceX, and would talk, and I already knew a lot of his friends. The interviews followed one after another, month after month, and two hundred or so people into the process, I heard from Musk once again. He called me at home and declared that things could go one of two ways: he could make my life very difficult or he could help with the project after all. He’d be willing to cooperate if he could read the book before it went to publication, and could add footnotes throughout it. He would not meddle with my text, but he wanted the chance to set the record straight in spots that he deemed factually inaccurate. I understood where this was coming from. Musk wanted a measure of control over his life’s story. He’s also wired like a scientist and suffers mental anguish at the sight of a factual error. A mistake on a printed page would gnaw at his soul—forever. While I could understand his perspective, I could not let him read the book, for professional, personal, and practical reasons. Musk has his version of the truth, and it’s not always the version of the truth that the rest of the world shares. He’s prone to verbose answers to even the simplest of questions as well, and the thought of thirty-page footnotes seemed all too real. Still, we agreed to have dinner, chat all this out, and see where it left us."

print("Plaint text: ")
print(plaintext_original)


var plaintext = "" //for string that without operator symbols
let key = "HE"

//boshtuktardy jana ashykcha simvoldordu jokko chygaruu
for i in plaintext_original{
    if i.isLetter{
        plaintext.append(i.uppercased())
    }
}



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

//  Index of coincidence method

var groupLetters = [[String]]()
var subGroupLetters = [String]()
var lengthOfVigeniereCipher = 0 //result 

var keyRange = 15 //kancha achkychka cheyin bojomoldoogo mumkun, azyryncha 15

for key in 1...keyRange{
    var tempEncTextArr = encryptedTextArr
    let k = encryptedTextArr.count % key
    let completeSymbCount = key - k
    for _ in 1...completeSymbCount{
        tempEncTextArr.append(".")
    }
    
    for i in stride(from: 0, to: tempEncTextArr.count, by: key) {
        subGroupLetters.append(String(tempEncTextArr[i]))
    }
    
    var countLetters = [Int]()
    let countOfLetter = subGroupLetters.count
    var I = 0.0
    
    
    for i in alphabetEnglish{
        let count = subGroupLetters.filter({$0 == String(i)}).count
        countLetters.append(count)
    }
    
    for i in countLetters{
        I += Double((i * (i - 1))) / Double((countOfLetter * (countOfLetter - 1)))
    }
    I = Double(floor(1000 * I) / 1000)
    
//  print("________________________________________________________________________________________")
//
//    print("Index coincidence: \(I) when key is equal: \(key)" )
    
    if I >= 0.060 && I <= 0.070{
        lengthOfVigeniereCipher = key
        break
    }

    subGroupLetters.removeAll()
}

print("key length: \(lengthOfVigeniereCipher)")



