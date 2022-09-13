import UIKit

func conversion(num:Int, base:Int = 10) -> String {
    
    var quotients = [num]
    var digits = [Int]()


    while(quotients.last! > 1) {
        quotients += [quotients.last! / base]
    }

    for x in quotients {
        let digit = x % base
        digits.insert(digit, at: 0)
    }

    if digits[0] == 0 {
        digits.removeFirst()
    }

    let answer = digits.map { String($0) }
    let answerString = answer.joined(separator: "")
    
    return answerString
}

conversion(num:22123, base:8)

var bases: [Int] = Array(2...36)
for x in bases {
    print(x)
}


