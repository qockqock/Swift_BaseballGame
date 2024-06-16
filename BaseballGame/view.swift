//
//  view.swift
//  BaseballGame
//
//  Created by 머성이 on 6/15/24.
//

import Foundation

class View{
    func Information() {
        var attainment = true
        
        while attainment{
        print("""
                환영합니다! 원하시는 번호를 입력해주세요
                1.게임 시작하기 2.게임 기록 보기 3.종료하기
            """)
            
            if let UserSelect = readLine(){
            switch UserSelect{
                
            case "1":
                PlayBall().startGame()
                continue
            case "2":
                PlayBall().startGame()
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
}
