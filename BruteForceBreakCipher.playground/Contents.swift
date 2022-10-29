import UIKit

let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

let orderFrequencyLetters = ["E", "T", "A", "O", "N", "I", "S", "R", "H", "L", "D", "C", "U", "P", "F", "M", "W", "Y", "B", "G", "V", "K", "Q", "X", "J", "Z"]

var encryptedText = "LZAKIMWKLAGFUSEWXJGEWDGFEMKCFWSJLZWNWJQWFVGXSDGFYVAFFWJOWKZSJWVSLSZAYZWFVKWSXGGVJWKLSMJSFLAFKADAUGFNSDDWQAVYGLLWFLGLZWJWKLSMJSFLXAJKLSFVKWLLDWVVGOFOALZSYAFSFVLGFAUCFGOAFYEMKCOGMDVSKWNWJTWDSLWSXLWJSTGMLXAXLWWFEAFMLWKEMKCKZGOWVMHOWSJAFYDWSLZWJKZGWKVWKAYFWJBWSFKSFVSHDSAVVJWKKKZAJLEMKCKLSFVKKAPXGGLGFWTMLSKCSFQGFWOZGCFGOKZAESFVLZWQDDUGFXAJELZSLZWKWWEKEMUZTAYYWJLZSFLZSLZWKSTKMJVDQTJGSVKZGMDVWJWVKLMJVQSFVLZAUCQGMVXAYMJWZWOGMDVMKWLZAKXJSEWLGZAKSVNSFLSYWSFVHWJXGJESFSDHZSESDWKLJMLOZWFWFLWJAFYSJGGEAFKLWSVZWLWFVKLGTWSDEGKLKZWWHAKZALKZWSVLADLWVKDAYZLDQVGOFOZADWOSDCAFYSIMAUCZSFVKZSCWZWDDGSXLWJJWSUZAFYLZWLSTDWSFVLZWFTMLLAFKWSLXJGELZWJWEMKCFWWVKSXWOEAFMLWKTWXGJWZWOSJEKMHSFVDGGCKSLWSKWEMKCSKCWVEWLGVAFFWJXGJSFWYGLASLAGFGXKGJLKWAYZLWWFEGFLZKWSJDAWJAVAFXGJEWVZAEGXEQHDSFKLGOJALWSTGGCSTGMLZAESFVZWVAFXGJEWVEWGXZAKHDSFKFGLLGUGGHWJSLWZAKJWBWULAGFKLMFYTMLLZJMKLEWAFLGVGYYWVJWHGJLWJEGVWAXAZSVLGVGLZAKTGGCOALZGMLZAEKGTWALHDWFLQGXHWGHDWZSVDWXLEMKCKUGEHSFAWKLWKDSEGLGJKSFVKHSUWPSFVOGMDVLSDCSFVASDJWSVQCFWOSDGLGXZAKXJAWFVK"

//MARK: - Find key length method
func findKeyLength(_ encryptedTextArr: [Character]) -> Int{
    
    var subGroupLetters = [String]()
    var lengthOfVigeniereCipher = 0 //result

    let keyRange = 15 //kancha achkychka cheyin bojomoldoogo mumkun, azyryncha 15

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
        
        if I >= 0.060 && I <= 0.070{
            lengthOfVigeniereCipher = key
            break
        }

        subGroupLetters.removeAll()
    }
    
    return lengthOfVigeniereCipher
}

var encryptedTextArr = Array(encryptedText)
var key = findKeyLength(encryptedTextArr)

var groupLetters = [String]()
var subGroupLetters = [Character]()

var tempEncTextArr = encryptedTextArr
let k = encryptedTextArr.count % key
let completeSymbCount = key - k
for _ in 1...completeSymbCount{
    tempEncTextArr.append(".")
}


for i in 0...key-1{
    for j in stride(from: -key+i, to: tempEncTextArr.count-key, by: key) {
        subGroupLetters.append(Character(extendedGraphemeClusterLiteral: tempEncTextArr[j+key]))
        
    }
    groupLetters.append(String(subGroupLetters))
    subGroupLetters.removeAll()
}



for i in 0...groupLetters.count - 1{
    groupLetters[i] = groupLetters[i].replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
}

var keyWord = ""

for i in groupLetters{
    let cipherTextArr = Array(i)
    var dictionaryKeyWord = [String:Int]()
    
    for key in 0...25{
        var decrypTextArr =  [Character]()

        for i in Range(0...cipherTextArr.count-1){
            let c = alphabetEnglish.firstIndex(of: String(cipherTextArr[i]))!
            let k = alphabetEnglish.firstIndex(of: String(alphabetEnglish[key]))!
            var D = (c-k)%26
            
            if D < 0{ //if D is negative
                D += 26
            }
            
            decrypTextArr.append(contentsOf: alphabetEnglish[D])
        }
        
    //    print(String(decrypTextArr))
        
        var dictOfFrequencyLetters = [String:Int]()
        var orderingMaxFrequencedLetters = [String]()

        for i in alphabetEnglish{
            let count = decrypTextArr.filter({$0 == Character(i)}).count
            dictOfFrequencyLetters[String(i)] = count
        }
        
        for _ in 0...dictOfFrequencyLetters.count - 1{
            let maxVal = dictOfFrequencyLetters.max { $0.value < $1.value }
            
//            print(maxVal!.key, maxVal!.value)
            orderingMaxFrequencedLetters.append(String(maxVal!.key))
            dictOfFrequencyLetters[maxVal!.key] = nil
        }
//        print(orderingMaxFrequencedLetters)
        
        var counter = 0
        
        for i in 0...orderingMaxFrequencedLetters.count - 1{
            if orderFrequencyLetters[i] == orderingMaxFrequencedLetters[i]{
                counter += 1
            }
        }
        dictionaryKeyWord[alphabetEnglish[key]] = counter
    }
    let maximumKey = dictionaryKeyWord.max{ $0.value < $1.value }
    keyWord += maximumKey!.key
//    print(dictionaryKeyWord)
}


print("Key word is: ", keyWord)

let lengthKey = key
let lengthPlaintext = encryptedText.count
let num = lengthPlaintext/lengthKey //type is integer butun san
let num1 = lengthPlaintext%lengthKey //type is integer kaldyk san

var arrLetters = Array(keyWord) // keyword letters
var vigenereKey = ""


for _ in Range(1...num){
    vigenereKey += keyWord
}

if num1 >= 1{
    for i in Range(0...num1-1){
        vigenereKey += String(arrLetters[i])
    }
}

var charVigenereKey = Array(vigenereKey)


var decrypTextArr1 =  [Character]()

for i in Range(0...encryptedTextArr.count-1){
    let c = alphabetEnglish.firstIndex(of: String(encryptedTextArr[i]))!
    let k = alphabetEnglish.firstIndex(of: String(charVigenereKey[i]))!
    var D = (c-k)%26
    
    if D < 0{ //if D is negative
        D += 26
    }
    
    decrypTextArr1.append(contentsOf: alphabetEnglish[D])
}

var decrypText1 = String(decrypTextArr1) //getting string from character array

print("\n\nDecryption Result :")
print(decrypText1)

