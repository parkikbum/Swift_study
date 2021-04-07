import Foundation
let readVal = readLine()!
let valArr = readVal.components(separatedBy: " ")
if valArr.count == 2{
    if let a = Int(valArr[0]), let b = Int(valArr[1]){
        if a > b{
            print(">")
        }
        if a < b{
            print("<")
        }
        if a == b{
            print("==")
        }
    }
}
