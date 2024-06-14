import Foundation

class input{
    func Userinput() -> [Int]?{
        print("세 개의 숫자를 입력하세요 : ", terminator: "")
        guard let input = readLine() else { return nil }
        
        let inputNumber = input.split(separator: " ").compactMap{ Int($0) }
        return inputNumber.count == 3 ? inputNumber : nil
    }
}
