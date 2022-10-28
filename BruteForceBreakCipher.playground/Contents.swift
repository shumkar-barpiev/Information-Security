import UIKit

let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

let orderFrequencyLetters = ["E", "T", "A", "O", "N", "I", "S", "R", "H", "L", "D", "C", "U", "P", "F", "M", "W", "Y", "B", "G", "V", "K", "Q", "X", "J", "Z"]

var encryptedText = "ALPWXYLWAMVRJETIMVVQLPVRTYZOUIHVALLZLVFIUHVJHPVRNHPRUIYALWOEYIKEAEOMNLLRKWLEMSVHYIZXHYYEUXPRZMSMJSUZHPSIFMKKVXAIUXVXOIYIZXHYYEUXMMYWAEUHZIAXSIKHVAUAPXOENMUEUHASUMJOUSDMUKTYZODSBPKEZICIYFLPHXLEMXLVHFVYAJPJAILRTMUYAIZQBWRWOSDIKYWALEYMUKSIHXOIYWOSLWKIZMNRLVQIHRZEUHHTSEPHKVLWZWOMYXTYZOZXHRKWZMEJVSASUIIYAEZOHRFSUIDLVOUSDWOMTEUHALLCSPJSUJPVTXOEALLWLITWTYJLIMNKLVALHRALHXOIZEIWBVKPFFYSHHZLVYSHLVLHZXBVKCHRKXOMJOFSBHMMNYYIOIDSBPKYZIALPWMVHQLXVLPWHHCEUXHKLEUHWIYJVVTEUESTOETESIZXYYAAOIUIUXLVPRNEYSVQPRZXLEKLLXLRKWASIIHPTSZXZLLIWMZLPXZLLEKXPPAIKWSMNLAPFHVAUAOMSIDESOPRNEXYPGRLHRKWOERIOISPVEMXLVYIHGOMUKALLXHFSIHRKXOIUFBXAMUWLEAJYSTXOIYITYZOUILHZEMIDQPRBXLWIIMSYIOIDEYQZYWEUHSSVOZEAIHWLQBWREZOLHTIASKMURLVMSYEUINSAMHXPSUSMWVVAWLMNLAILRTSUXOWLEYPPIYMKMUJVVTIKLPQVJTCWPHRZXVAYMAIHFVSREISBXOMTEUHOIKMUJVVTIKQLSMLPWWPHRZRVXASJSVTLVHXLLPWYIQIJXPSUWAYUKIYAXOVBWAQLMUXVHVKNIKVLTVVAIYQVHLMMMOEKXVHVXOMZFVSRAPXOSBXOMTWVFLMATSIUXFSMTLSWPLLHHSIMXTYZOZGVQWEUMLWAIZPHQVXVVZEUHZTHGLBHRKAVYSHAESOHRKMHPYIHHFOUIDESSASMLPWMVPIUHZXOIPRAIYZPIDWMSSPVALHVRLEMXLVHRVXOIYQVRALHJAIYQVRALHRKXDSOYUHYIKSYWVTLSWPLMUXVXOIWVVGLWZMOIHVKJYSTQBWRSUGLENEPROIJESPLHTIHXOSTIHRKHLGSEYIKXOEAXOMUKZGVYSHNSVRLSMXDSDEFWOIJSBPKQHOLQFPPJLZLVFHPJMMJYSXVVOIJSBPKLLPWAPXOXOIWVVNLGAEMXLVHPSLLHIIDMSPPRNXVGVSWIYEAIPJOIJSBPKVLEKXOIISVOIIMSYIPXDIUXASWYIPPGHXPSUEUHJSBPKEKHMSVXUSAIZXOVVYNLVYAMALLAVYSHUSAQLHKPLAPXOQFXLBAFBXOIDEUXLHALLGOEUGLXVWLXALLVLGVVKWAVHMNLAMUWWSAWALHXOIKILQLHMEJXBESPFMUEJGBVHXLMBRKIYWASVHDLLVLXOMZAHWJSTMUKMVVQTYZODEUXLHHQLEZYYIVJJSUXYSSSCIYLPWSMMIZWASYCOIZESWVAPVLHSMRIHWJMLRAMZXHRKWBJMIYWTIUXHPHRNYPWOEAXOIZMNLASMEMEJXBESIYVVVHQPWAERIVRHTYMUXLHWENIDSBPKKUEDEALPWZSBPMSYICIYAOMSIPGVYSHBRKIYWAEUHOMZTLVZTLGAMCIPGVYSHUSAPLXOMTVLEKXOIISVOMSYTYSMIZWPSUESTLVZSUESEUHWVHGAMJESVLEZSUWTYZOOEZLPWCIYWPSUSMXOIAVBXOEUHPXZRVXHPDEFWALLZLVZMVRVJALLXYYALALHXALLVLWASMXOIDSYPKWOEYIZLLWWVVRLXVZLVISZIHRZALVZXVICIUXOIZMTTSIZXVJXYLWAMVRZEZALPSEUHALLXOSBKOXVJALPVACWENIMSVXUSAIZWLITIKESPASVVLESWAMSPDIHKYILHASOECIKMURLVJLHXHPSXOMZSBXHRKWLIDLLVLMAPLJAYZ"



func getKeyLetter(_ cipherText: String) -> String{
    
    
    
    return ""
}

func findKeyLength(_ encryptedTextArr: [Character]) -> Int{
    
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

//    print("key length: \(lengthOfVigeniereCipher)")
    
    return lengthOfVigeniereCipher
}

func findKeyWord(_ arr: [[String]]) -> String{
    let ans = ""
    var items = [String]()
//    for i in arr{
//        let letter = getKeyLetter(i)
//        items.append(letter)
//    }
//    
//    for i in items{
//        ans += i
    
    
    
    
    return ans
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
//    print(subGroupLetters)
      groupLetters.append(String(subGroupLetters))
//    print(getKeyLetter(subGroupLetters))
//    print(String(subGroupLetters))
    subGroupLetters.removeAll()
}



for i in 0...groupLetters.count - 1{
    groupLetters[i] = groupLetters[i].replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
}

for i in groupLetters{
    let cipherTextArr = Array(i)
    
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
        var maxVal = 0
        var maxkey = 0
        for i in 0...orderingMaxFrequencedLetters.count - 1{
            if orderFrequencyLetters[i] == orderingMaxFrequencedLetters[i]{
    //            print(orderFrequencyLetters[i], orderingMaxFrequencedLetters[i])
                counter += 1
            }
            if counter > maxVal{
                maxVal = counter
                maxkey = key
            }
        }
        
        if maxVal >= 4{
            print(counter)
            print("key is :", alphabetEnglish[maxkey])
            break
        }
    }
}














