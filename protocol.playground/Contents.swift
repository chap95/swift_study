import UIKit

// 프로토콜은 특정 역할은 수행하기 위한 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의합니다.
// 구조체, 클래스, 열거형은 프로토골을 채택해서 프로토콜의 요구사항을 실제로 구현할 수 있다.
// 어떤 프로토골의 요구사항을 모두 따르는 타입은 그 프로토콜을 준수한다고 표시한다.
// 프로토콜의 요구사항을 충족

/*
protocol 프로토콜 이름 {
    // 정의
}
*/

protocol Talkable {
    var topic: String { get set } // get set을 모두 명시하면 읽기 쓰기 모두 가능하다는 뜻이다.
    var language: String { get } // get 은 읽기만 해도 상관없다는 뜻
    
    func talk()
//     프로토콜은 이런 것들이 필요하다만 정의해주고 실제로 구현은 해놓지 않는다.
    init(topic: String, language: String)
}


struct Person: Talkable {
//    var topic: String
//    let language: String // 읽기만 가능하기 때문에 let으로 표현해야 한다.
    
    var language: String { get {  return  "한국어" } }
    // 읽기 전용 프로퍼티도 연산 프로퍼티로 대체할 수 있다.
    
    var subject: String = ""
    var topic: String {
        set {
            self.subject = newValue
        } get {
            return self.subject
        }
        
        init(topic: String, language: String) {
        self.topic = topic
        self.la
        }
}
