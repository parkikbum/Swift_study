import Foundation
let input = readLine()!
let inputArr = input.components(separatedBy: " ")
if inputArr.count == 2{
    if let hour = Int(inputArr[0]), let min = Int(inputArr[1]){
        if min - 45 < 0{
            let min = 60 - abs(min - 45)
            if hour - 1 < 0{
                let hour = 23
                print(hour, min)
            }
            else{
                let hour = hour - 1
                print(hour, min)
            }
        }
        else{
            let min = min - 45
            print(hour, min)
        }
    }
}
