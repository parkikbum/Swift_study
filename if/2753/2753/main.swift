import Foundation
let input = readLine() ?? ""
var year = Int(input) ?? 0

if year % 4 == 0 {
    if year % 100 > 0{
        print(1)
    }
    else if year % 400 == 0{
        print(1)
    }
    else{
        print(0)
    }
}
else{
    print(0)
}
