/*
 야구게임 규칙
 사용되는 숫자는 0에서 9까지 서로 다른 숫자이다.
 첫 번째 숫자가 0이면 안 됨.
 숫자는 맞지만 위치가 틀렸을 때는 볼.
 숫자와 위치가 전부 맞으면 스트라이크.
 숫자와 위치가 전부 틀리면 아웃. "틀렸다"는 게 중요하다. 의외로 아웃이 제일 좋은 수인데, 틀린 숫자만 제끼고 남은 숫자끼리 조합하면 되므로 경우의 수가 팍팍 줄어들기 때문. 볼, 스트라이크는 숫자는 맞는 게 있으나 무슨 숫자가 맞았는지를 알 수가 없어 경우의 수를 더 생각해봐야 하지만 아웃은 틀린 숫자만 제거한 나머지만 생각해보면 어렵지 않기 때문. 2아웃이 나오면 더욱 좋다. 작정하고 숫자 예측을 이상하게 하지 않는 이상 3아웃 이상은 절대로 나오지 않는다.
 물론 무엇이 볼이고 스트라이크인지는 알려주지 않는다.
 두 숫자가 중복되면 경우의 수가 많아져서 그런지 중복 숫자는 잘 사용하지 않는다.
 */

import Foundation


    // 임의의 숫자 생성 (게임 시작)
    let target = Baseballstart()
    let SNum = target.start()
    print("야구게임 시작! 세 개의 랜덤 숫자가 생성되었습니다.")

    // 플레이어 정답 입력
    let userinput = Input()
    
    
    var life = 9
    var gameover = false
    
    repeat{
        if let PNum = userinput.userInput() {
            print("플레이어 값 입력 : \(PNum)")
            
            // 게임 실행
            let game = Explain()
            
            if PNum.count == 3{
                let result = game.Calculation(secret: SNum, player: PNum)
                
                // 첫 번째 자릿수 0 예외처리
                if PNum[0] == 0{
                    print("첫째 자릿수에는 '0'이 입력될 수 없습니다.")
                    continue
                }
                
                // 스트라이크, 볼 출력
                if result.strikes == 3 {
                    print("정답입니다!")
                    gameover = true
                }else if result.strikes != 0 || result.balls != 0 {
                    print("\(result.strikes) 스트라이크 ,\(result.balls) 볼")
                }else{
                    print("Nothing")
                }
                
                // PNum.count == 3 을 통과했을 때 마다 라이프 1개씩 차감.
                if life != 0{
                    print("기회가 한 번 소진되었습니다.")
                }else{
                    print("기회 모두 소진")
                    gameover = true
                }
                life -= 1
                
            }
        }else{
        print("잘못된 입력 값 입니다. 세 개의 숫자를 입력해주세요")
        }
    }while !gameover
    
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

    
