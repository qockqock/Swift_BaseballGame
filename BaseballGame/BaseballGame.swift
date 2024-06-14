import Foundation

class baseballgame{

    // 랜덤숫자 생성
    /*
     랜덤 숫자를 생성하는 방법은 여러가지가 있지만, 일반적으로 사용되는 두 가지 방법이 사용된다
     1. arc4random_uniform
     2. Int.random(in:)
     이 중 가독성을 고려해봤을 때 2번이 더 적합하다고 생각하여 2번을 선택했다.
     */
    
    /*
     1. Set은 중복된 요소를 허용하지 않는다.
     2. Set은 내부적으로 해시 테이블을 사용하므로, 특정 요소가 집합에 존재하는지 빠르게 검사 가능
     3. O(1)의 시간복잡도를 가진다.
     */
    
    // 0빼기 3항 연산자 고려해볼 것
    
    
    func start() -> [Int] {
            var number: [Int] = []
            
            // 규칙 : 첫 자리는 0이 아닌수를 뽑아내야 함.
            number.append(Int.random(in: 1..<10))
            
            // 두 번째 자리와 세 번째 자리는 0에서 9까지 무작위 난수
            while number.count < 3 {
                let nextNum = Int.random(in: 0..<10)
                    if !number.contains(nextNum){
                        number.append(nextNum)
                    }
            }
            print(number)
            return number
        }
    }
