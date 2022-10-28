import UIKit
//Frequency Analysis for Affine Cipher

func gcd(_ a: Int, _ b: Int) -> Int {
  let r = a % b
  if r != 0 {
    return gcd(b, r)
  } else {
    return b
  }
}


func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)

    return ret
}

func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
    return combos(elements: ArraySlice(elements), k: k)
}


let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var cipherText = "KYZJHLVJKZFETRDVWIFDVCFEDLJBEVRIKYVMVIPVEUFWRCFEXUZEEVINVJYRIVURKRYZXYVEUJVRWFFUIVJKRLIREKZEJZCZTFEMRCCVPZUXFKKVEKFKYVIVJKRLIREKWZIJKREUJVKKCVUUFNENZKYRXZEREUKFEZTBEFNZEXDLJBNFLCURJVMVISVCRKVRWKVIRSFLKWZWKVVEDZELKVJDLJBJYFNVULGNVRIZEXCVRKYVIJYFVJUVJZXEVIAVREJREURGCRZUUIVJJJYZIKDLJBJKREUJJZOWFFKFEVSLKRJBREPFEVNYFBEFNJYZDREUKYVPCCTFEWZIDKYRKYVJVVDJDLTYSZXXVIKYREKYRKYVJRSJLIUCPSIFRUJYFLCUVIVUJKLIUPREUKYZTBPFLUWZXLIVYVNFLCULJVKYZJWIRDVKFYZJRUMREKRXVREUGVIWFIDRERCGYRDRCVJKILKNYVEVEKVIZEXRIFFDZEJKVRUYVKVEUJKFSVRCDFJKJYVVGZJYZKJYVRUKZCKVUJCZXYKCPUFNENYZCVNRCBZEXRHLZTBYREUJYRBVYVCCFRWKVIIVRTYZEXKYVKRSCVREUKYVESLKKZEJVRKWIFDKYVIVDLJBEVVUJRWVNDZELKVJSVWFIVYVNRIDJLGREUCFFBJRKVRJVDLJBRJBVUDVKFUZEEVIWFIREVXFKZRKZFEFWJFIKJVZXYKVVEDFEKYJVRICZVIZUZEWFIDVUYZDFWDPGCREJKFNIZKVRSFFBRSFLKYZDREUYVUZEWFIDVUDVFWYZJGCREJEFKKFTFFGVIRKVYZJIVAVTKZFEJKLEXSLKKYILJKDVZEKFUFXXVUIVGFIKVIDFUVZWZYRUKFUFKYZJSFFBNZKYFLKYZDJFSVZKGCVEKPFWGVFGCVYRUCVWKDLJBJTFDGREZVJKVJCRDFKFIJREUJGRTVOREUNFLCUKRCBREUZRCIVRUPBEVNRCFKFWYZJWIZVEUJKYVZEKVIMZVNJWFCCFNVUFEVRWKVIREFKYVIDFEKYRWKVIDFEKYREUKNFYLEUIVUFIJFGVFGCVZEKFKYVGIFTVJJZYVRIUWIFDDLJBFETVRXRZEYVTRCCVUDVRKYFDVREUUVTCRIVUKYRKKYZEXJTFLCUXFFEVFWKNFNRPJYVTFLCUDRBVDPCZWVMVIPUZWWZTLCKFIYVTFLCUYVCGNZKYKYVGIFAVTKRWKVIRCCYVUSVNZCCZEXKFTFFGVIRKVZWYVTFLCUIVRUKYVSFFBSVWFIVZKNVEKKFGLSCZTRKZFEREUTFLCURUUWFFKEFKVJKYIFLXYFLKZKYVNFLCUEFKDVUUCVNZKYDPKVOKSLKYVNREKVUKYVTYRETVKFJVKKYVIVTFIUJKIRZXYKZEJGFKJKYRKYVUVVDVUWRTKLRCCPZERTTLIRKVZLEUVIJKFFUNYVIVKYZJNRJTFDZEXWIFDDLJBNREKVURDVRJLIVFWTFEKIFCFMVIYZJCZWVJJKFIPYVJRCJFNZIVUCZBVRJTZVEKZJKREUJLWWVIJDVEKRCREXLZJYRKKYVJZXYKFWRWRTKLRCVIIFIRDZJKRBVFERGIZEKVUGRXVNFLCUXERNRKYZJJFLCWFIVMVINYZCVZTFLCULEUVIJKREUYZJGVIJGVTKZMVZTFLCUEFKCVKYZDIVRUKYVSFFBWFIGIFWVJJZFERCGVIJFERCREUGIRTKZTRCIVRJFEJDLJBYRJYZJMVIJZFEFWKYVKILKYREUZKJEFKRCNRPJKYVMVIJZFEFWKYVKILKYKYRKKYVIVJKFWKYVNFICUJYRIVJYVJGIFEVKFMVISFJVREJNVIJKFVMVEKYVJZDGCVJKFWHLVJKZFEJRJNVCCREUKYVKYFLXYKFWKYZIKPGRXVWFFKEFKVJJVVDVURCCKFFIVRCJKZCCNVRXIVVUKFYRMVUZEEVITYRKRCCKYZJFLKREUJVVNYVIVZKCVWKLJ"

//key = "R"

var cipherTextArr = Array(cipherText)
let orderFrequencyLetters = ["E", "T", "A", "O", "N", "I", "S", "R", "H", "L", "D", "C", "U", "P", "F", "M", "W", "Y", "B", "G", "V", "K", "Q", "X", "J", "Z"]

var dictOfFrequencyLetters = [String:Int]()
var orderingMaxFrequencedLetters = [String]()


for i in alphabetEnglish{
    let count = cipherTextArr.filter({$0 == Character(i)}).count
    dictOfFrequencyLetters[String(i)] = count
}

//print(dictOfFrequencyLetters)



for _ in dictOfFrequencyLetters{
    let maxVal = dictOfFrequencyLetters.max { $0.value < $1.value }
    
//    print(maxVal!.key, maxVal!.value)
    orderingMaxFrequencedLetters.append(String(maxVal!.key))
    dictOfFrequencyLetters[maxVal!.key] = nil
}

var combinationLetter = [[String]]()

for i in 0...orderFrequencyLetters.count-1{
    let tempArr = [orderFrequencyLetters[i],orderingMaxFrequencedLetters[i]]
    combinationLetter.append(tempArr)
}

print(combinationLetter)

//
//for i in combinationLetter{
//    let indexOfFirstLetter = alphabetEnglish.firstIndex(of: i[0])!
//    let indexOfSecondLetter = alphabetEnglish.firstIndex(of: i[1])!
//    print(indexOfFirstLetter, indexOfSecondLetter)
//}
var combItems = [Int]()

for i in 0...25{
    combItems.append(i)
}
var temp = combos(elements: combItems, k: 2)
var cleanComb = [[Int]]()

for i in temp{
    if i[0] == i[1]{
        continue
    }else{
        cleanComb.append(i)
    }
}

//print(cleanComb)
var a = 0
var b = 0

for i in cleanComb{
//    print(combinationLetter[i[0]][0],combinationLetter[i[0]][1])
//
//    let indexOfFirstLetter = alphabetEnglish.firstIndex(of: combinationLetter[i[0]][0])!
//    let indexOfSecondLetter = alphabetEnglish.firstIndex(of: combinationLetter[i[0]][1])!
//
//    print(indexOfFirstLetter, indexOfSecondLetter)
    
    var koefA1 = alphabetEnglish.firstIndex(of: combinationLetter[i[0]][0])!
    var koefA2 = alphabetEnglish.firstIndex(of: combinationLetter[i[1]][0])!
    
    var koefMod1 = alphabetEnglish.firstIndex(of: combinationLetter[i[0]][1])!
    var koefMod2 = alphabetEnglish.firstIndex(of: combinationLetter[i[1]][1])!
    
    var koefA = koefA1 - koefA2
    var koefMod = koefMod1 - koefMod2
    var productKoef = gcd(26, koefMod)
    
    var sumTemp = 26 * productKoef + koefMod
    
    if sumTemp % koefA == 0{
        a = (sumTemp / koefA) % 26
        print("a = \(a)")
        
        var productA = koefA1 * a
        var productKoef = gcd(26, koefMod1)
        
        var sumTemp = 26 * productKoef + koefMod
        b = (sumTemp - productA) % 26
        print("b = \(b)")
        break
    }
    else{
        continue
    }
}


var decryptionArr = [String]()

var sap = ""

for i in cipherTextArr{
    var c = alphabetEnglish.firstIndex(of: String(i))!
    
    var p = (c - b) % 26 / a
    
    
    sap += alphabetEnglish[p]

}
//
//print(sap)

