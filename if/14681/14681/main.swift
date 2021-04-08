import Foundation
let input_x = readLine() ?? ""
let input_y = readLine() ?? ""
var x = Int(input_x) ?? 0
var y = Int(input_y) ?? 0
if x < 0 {
    if y < 0{
        print(3)
    }
    else{
        print(2)
    }
}
else{
    if y < 0{
        print(4)
    }
    else{
        print(1)
    }
}

