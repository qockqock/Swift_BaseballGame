class View{
    var playballcount = 0
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
                    let attempts = PlayBall().startGame() // 시도 횟수를 받아옴
                    playballcount += 1
                    gameAttempts.append(attempts) // 시도 횟수를 배열에 추가
                    continue
                case "2":
                    record() // 기록 보기 함수 호출
                    continue
                case "3":
                    print("종료합니다.")
                    attainment = false
                default:
                    print("메뉴에 있는 번호를 적어주세요")
                }
            }
        }
    }
    
    func record() {
        print("<게임 기록 보기>")
        for i in 0..<gameAttempts.count {
            print("\(i + 1)번째 게임 : 시도 횟수 - \(gameAttempts[i])회")
        }
    }
}
