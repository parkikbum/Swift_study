import Foundation
let firstLine = readLine() ?? ""
let secondLine = readLine() ?? ""
var a = Int(firstLine) ?? 0
var b = Int(secondLine) ?? 0

print(a * (b%10))
print(a * ((b%100)/10))
print(a*(b/100))
print(a*b)

