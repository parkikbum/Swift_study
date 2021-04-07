import Foundation
let line = readLine()!
let lineArr = line.components(separatedBy: " ")
if lineArr.count == 2{
    if let a = Int(lineArr[0]), let b = Int(lineArr[1]){
        print(a+b)
    }
}
