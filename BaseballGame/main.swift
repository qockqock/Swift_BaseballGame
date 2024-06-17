/*
 야구게임 규칙
 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임이다.
 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받는다. (숫자는 맞지만 위치가 틀렸을 때는 볼숫자와 위치가 전부 맞으면 스트라이크)
 기회는 총 9번이며, 사용되는 숫자에 포함되지 않는 것은 카운팅 되지 않는다.
 사용되는 숫자는 0에서 9까지 서로 다른 숫자이고, 단 첫 번째 숫자가 0이면 안 된다.
 - ex) 정답 : 456 인 경우
     - 435를 입력한 경우 → 1스트라이크 1볼
     - 357를 입력한 경우 → 1스트라이크
     - 678를 입력한 경우 → 1볼
     - 123를 입력한 경우 → Nothing
 */

import Foundation

let GameStart = View()
GameStart.Information()

class View{
    var gameAttempts: [Int] = [] // 시도 횟수를 저장하는 배열
    func Information() {
        var attainment = true
        
        while attainment {
            print("""
                환영합니다! 원하시는 번호를 입력해주세요
                1.게임 시작하기 2.게임 기록 보기 3.종료하기
            """)
            
            if let UserSelect = readLine() {
                switch UserSelect {
                case "1":
                    start()
                    continue
                case "2":
                    record() // 기록 보기 함수 호출
                    continue
                case "3":
                    finish()
                    attainment = false
                default:
                    print("메뉴에 있는 번호를 적어주세요")
                }
            }
        }
    }
    
    func start(){
        Message().startMessage()
        let attempts = PlayBall().startGame() // 시도 횟수를 받아옴
        gameAttempts.append(attempts) // 시도 횟수를 배열에 추가
    }
    
    func record() {
        Message().recordMessage()
        print("<게임 기록 보기>")
        for i in 0..<gameAttempts.count {
            print("\(i + 1)번째 게임 : 시도 횟수 - \(gameAttempts[i])회")
        }
    }
    
    func finish(){
        Message().finishMessage()
        print("종료합니다.")
    }
}
