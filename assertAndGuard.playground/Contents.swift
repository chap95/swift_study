import UIKit


var someInt: Int = 0

assert(someInt == 0, "someInt != 0")

// assert는 디버깅 모드에서만 사용이가능하며 배포모드에서는 사용이 불가능하다.
// 조건이 맞으면 그냥 지나가고 그렇지 않으면 두번째 인자로 전달된 값이 실행이 된다.

func functionWithAssert(age: Int?) {
    assert(age != nil, "age is nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다.")
    print("당신의 나이는 \(age!)세 입니다!")
}


functionWithAssert(age: 50)

// assert와는 달리 guard 구문은 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료한다.
// 디버깅모드 뿐만 아니라 어떤 조건에서도 동작한다.

func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
            print("나이값 입력이 잘못되었습니다")
            return
    }
    print("당신의 나이는 \(unwrappedAge) 입니다.")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]) {
    //dictionary에서 name이라는 키값을 가져와서 nil 존재해서 String으로 캐스팅이 가능하다면
    // name이라는 변수에 저장을 하고 그렇지 않다면 함수를 종료한다.
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": 10])

