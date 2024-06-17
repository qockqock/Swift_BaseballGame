import Foundation

class Baseballstart{
    
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
            return number
        }
    }
// enumerated가 뭐임?
// 배열 또는 다른 시퀀스를 열거할 때 각 요소와 그 인덱스를 함께 반환하는 메서드
class Explain{
    func Calculation(secret: [Int], player: [Int]) -> (strikes: Int, balls: Int){
        var strikes = 0
        var balls = 0
        
        for(key, value) in player.enumerated() {
            if secret.contains(value){
                if secret[key] == value{
                    strikes += 1
                }else{
                    balls += 1
                }
            }
        }
        return (strikes,balls)
    }
}

class PlayBall {
    var attempts = 0 // 시도 횟수를 저장하는 변수

    func startGame() -> Int { // 시도 횟수를 반환하도록 함수 타입 수정
        let target = Baseballstart()
        let SNum = target.start()
        print("야구게임 시작! 세 개의 랜덤 숫자가 생성되었습니다.")
        
        let userinput = Input()
        
        var life = 8
        var gameover = false
        
        repeat {
            if let PNum = userinput.userInput() {
                print("플레이어 값 입력 : \(PNum)")
                
                let game = Explain()
                
                if PNum.count == 3 {
                    // 첫 번째 자릿수 0 예외처리
                    if PNum[0] == 0 {
                        print("첫째 자릿수에는 '0'이 입력될 수 없습니다.")
                        continue
                    }
                                    
                    // 중복 체크
                    let PNumSet = Set(PNum)
                    if PNumSet.count != 3 {
                        print("잘못된 입력 값 입니다. 세 개의 숫자를 중복 없이 입력해주세요")
                        continue
                    }
                    
                    let result = game.Calculation(secret: SNum, player: PNum)
                    
                    // 스트라이크, 볼 출력
                    if result.strikes == 3 {
                        print("정답입니다!")
                        gameover = true
                    } else if result.strikes != 0 || result.balls != 0 {
                        print("\(result.strikes) 스트라이크 ,\(result.balls) 볼")
                    } else {
                        print("Nothing")
                    }
                    
                    // PNum.count == 3 을 통과했을 때마다 라이프 1씩 차감.
                    if life != 0 {
                        print("기회가 \(life)회 남았습니다.")
                    } else {
                        print("기회 모두 소진")
                        gameover = true
                    }
                    life -= 1
                }
            } else {
                print("잘못된 입력 값 입니다. 세 개의 숫자를 입력해주세요")
            }
            attempts += 1 // 시도 횟수 증가
        } while !gameover
        return attempts // 시도 횟수 반환
    }
}


// chapter 1
// 플레이어 정답 입력을 받았을 때 옵셔널로 받았기 때문에, 옵셔널 바인딩으로 값을 추출해줘야함.
// 옵셔널 바인딩? -> if let / else
// * 1차 시도 : result에 if let을 씌웠는데, 그러면 안 됐다.
// 받아온 값에 if let을 사용해야함! (강조)
// clear

// chapter 2
// 게임을 클리어 하거나 9번의 기회 소진시 게임종료
// repact / while 문으로 clear

// chapter 3
//- ex) 정답 : 456 인 경우
//- 435를 입력한 경우 → 1스트라이크 1볼
//- 357를 입력한 경우 → 1스트라이크
//- 678를 입력한 경우 → 1볼
//- 123를 입력한 경우 → Nothing

// 랜덤숫자 생성
/*
 랜덤 숫자를 생성하는 방법은 여러가지가 있지만, 일반적으로 사용되는 두 가지 방법이 사용된다
 1. arc4random_uniform
 2. Int.random(in:)
 이 중 가독성을 고려해봤을 때 2번이 더 적합하다고 생각하여 2번을 선택했다.
 ++++
 조원들의 코드를 같이 보며 Array shuffle의 기능을 발견했다.
 1부터 9까지의 난수들을 셔플하여 난수를 뽑아내었고,
 이를 삼항연산자로 풀어내 깔끔하게 코드를 풀어냈다. (가독성도 괜찮)
 이후 스터디에서 내가 짠 코드랑 효율면에서 뭐가 더 좋을지 비교해봐야겠다.
 */

/*
 1. Set은 중복된 요소를 허용하지 않는다.
 2. Set은 내부적으로 해시 테이블을 사용하므로, 특정 요소가 집합에 존재하는지 빠르게 검사 가능
 3. O(1)의 시간복잡도를 가진다.
 */
