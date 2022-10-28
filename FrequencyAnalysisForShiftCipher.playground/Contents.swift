import UIKit
import Darwin
//Frequency Analysis for Affine Cipher







let alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var cipherText = "FCFORQYZFQZMSZQDFSPRDMZEOMKAZTEDRFEXAUSZZZZEGEDMRMFFYFGTPQZMDQEQMZXPEDEMEAZFMZAIYFXZYFQYNQMMEGKMAQEPPOGSTGEUMAMZQBAZTXDTZUDUQQPNYEBUQUPSKZXXSUMTTAQMZQXPZFQDTYZEIGNDIEZAFQWQFZRZFURFSQZQUPAPABEDMWGYTZYQUMAOQQDOZZFGQASQFARPAEWTTAFZRBMREAZFMAZMMAFMMMZXRRZTFURAARMTAMDFPTDDQQABQTPYWQUOQMYPXPFZASQIKOPQUQUOAOPBTBQRMQIUABFTGQTARUZBUUZGPAFTSFQXFPUKFTZFTQQQAFSZFMPQOXZGQPFIQEOZAEZMEAZXDXEDEAQWOFMGDZMUFEFRGDMFADQSGZFERHTUXPFTQQHAZQYPNRDEZQZZMOQZEEHURFTUAIFQAFDFFQRIPDQAANMQAZEXAQAEXFTTFFSAFQPFQFIDFHZOMTGPIQQE"

//key = "R"

var cipherTextArr = Array(cipherText)
let orderFrequencyLetters = ["E", "T", "A", "O", "N", "I", "S", "R", "H", "L", "D", "C", "U", "P", "F", "M", "W", "Y", "B", "G", "V", "K", "Q", "X", "J", "Z"]


for key in 0...25{
    var decrypTextArr =  [Character]()

    for i in Range(0...cipherText.count-1){
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
    
    for _ in 0...dictOfFrequencyLetters.count-1{
        let maxVal = dictOfFrequencyLetters.max { $0.value < $1.value }
        
    //  print(maxVal!.key, maxVal!.value)
        orderingMaxFrequencedLetters.append(String(maxVal!.key))
        dictOfFrequencyLetters[maxVal!.key] = nil
    }
//    print(orderingMaxFrequencedLetters)
    
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
    
    if counter >= 3{
        print("key is :", alphabetEnglish[maxkey])
        break
    }
    
}


