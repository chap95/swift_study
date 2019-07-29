import UIKit

// enum은 데이터 타입이므로 카멜케이스를 사용하여 이름을 정의한다.

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.sun

print(day)


switch day {
case .sun:
    print("내일은 월요일 입니다")
    // enum을 사용할 때에는 enum에 정의된 모든 속성타입들을 써주지 않는 이상
    // default를 사용해서 표현해줘야한다. 모든 속성타입을 써주면 default가 필요없다.
default:
    print("일상을 보냅니다")
}

enum Money: Int{
    case one = 1 // rawValur의 선언
    case two
    case three
    // 자동적으로 two에는 2 three에는 3이 할당된다.
}

print("rawValue의 값은 : \(Money.two.rawValue)") // 2
// rawValue란?? Money.two의 타입을 찍어보면 Money라고 나오지만
// Money.two.rawValue의 타입을 찍어보면 Int라고 나온다.

print(type(of: Money.two)) // Money
print(type(of: Money.two.rawValue))// Int

// Value Association

// 밑의 enum을 보면 서로 다른 두 타입이 존재하는데 어떠한 다른 형태의 다른 값이라도 enum의 각각의 case에
// 독립적으로 연동될 수 있다.
enum PaperSize {
    case A4(width: Int, height: Int), A5, Letter(count: Int)
    
    func desc() -> String {
        switch(self){
        case let .A4(width, height):
            return "너비는 \(width)이고 높이는 \(height)이다."
        case let .Letter(count):
            return "글자 수는 \(count)개 입니다."
        default:
            return "종료"
        }
    }
}

let paperA4 = PaperSize.A4(width: 210, height: 297)
let papaerLetter = PaperSize.Letter(count: 2)

print(papaerLetter.desc())
print(paperA4.desc())


