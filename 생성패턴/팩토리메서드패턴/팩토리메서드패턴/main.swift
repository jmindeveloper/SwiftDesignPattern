//
//  main.swift
//  팩토리메서드패턴
//
//  Created by J_Min on 2023/06/04.
//

import Foundation

// 버튼 인터페이스
protocol Button {
    func tap()
}

// 구상 버튼들은 버튼 인터페이스를 채택 및 구현
class SquareButton: Button {
    func tap() {
        print("Square Button Tapped!!!")
    }
}

class CircleButton: Button {
    func tap() {
        print("Circle Button Tapped!!!")
    }
}

class RoundRectangleButton: Button {
    func tap() {
        print("RoundRectangle Button Tapped!!!")
    }
}

// 크리에이터 인터페이스
// Button 타입을 반환해야 하는 팩토리 메서드 정의
protocol Dialog {
    // 펙토리 메서드
    func createButton() -> Button
}

// 크리에이터 클래스는 일반적으로 해당 제품에 관련됭 비즈니스 로직이 있다
extension Dialog {
    func setButton() {
        let button = createButton()
        view.addSubView(button)
    }
}

// 구상 크리에이터들은 결과 Button을 반환하기 위해 팩토리 메서드를 실구현
class IPhoneDialog: Dialog {
    
    init() {
        setButton()
    }
    
    func createButton() -> Button {
        return SquareButton()
    }
}

class IPadDialog: Dialog {
    
    init() {
        setButton()
    }
    
    func createButton() -> Button {
        return SquareButton()
    }
}

class MacDialog: Dialog {
    
    init() {
        setButton()
    }
    
    func createButton() -> Button {
        return RoundRectangleButton()
    }
}

// Client
class Application {
    let dialog: Dialog
    
    init(os: String) throws {
        if os == "iPhone" {
            dialog = IPhoneDialog()
        } else if os == "iPad" {
            dialog = IPadDialog()
        } else if os == "Mac" {
            dialog = MacDialog()
        } else {
            throw NSError()
        }
    }
}
