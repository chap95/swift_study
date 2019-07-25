import UIKit

// 익스텐션은 여러 타입에 여러 기능을 추가할 수 있는 기능
// 사용방법

extension Int{
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // 다음과 같이 호출이 가능하다.


var someNumber: Int = 3

print(someNumber.isEven)


extension Int {
    func multiply(by n: Int) -> Int{
        return self * n
    }
}

// 다음과 같이 메소드도 추가가 가능하다.

print(someNumber.multiply(by: 3))


extension String {
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }
}

// 이니셜라이즈도 추가가 가능하다.
let someValue: String = String(intTypeNumber: 100)
print(type(of: someValue)) // 결과 값은 String!!
