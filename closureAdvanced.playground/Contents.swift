import UIKit

// 후행 클로저
// 반환타입 생략
// 단축 인자이름
// 암시적 반환 표현

// 후행클로저


func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}
// return 으로 함수가 전달된다.
var result: Int


result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

// 반환 타입 생략
// 위의 calculate의 정의 부분에서 method의 반환 타입이 Int이기 때문에 이 부분에서 굳이
// 명시해 주지 않아도 된다.
result = calculate(a: 10, b: 12, method: { (left: Int, right: Int) in
    return left + right
})

print(result)

result = calculate(a: 20, b: 23) { (left: Int, right: Int) in
    return left + right
}
// 후행 클로져로 사용해도 반환 타입을 생략가능하다.
print(result)


// 단축인자 이름
// 솔직히 method에 인자를 전달해 줄 때 left와 right가 필요할까?? 업다!!

result = calculate(a: 100, b: 1000, method:{
    return $0 + $1
})

print(result)

// 암시적 반환 표현
result = calculate(a: 11, b: 1313313){
    $0 + $1 // 당연히 이 부분에서는 return 이 오기 때문에 컴파일러가 알아서 컴파일 할 때 표현된 것처럼 컴파일 한다.
    // 클로저 표현은 생략이 무지무지 많이 가능하고 표현이 워낙 많기 때문에 유지보수나 협업을 위해서
    // 클로저 표현을 적당히 하는 것이 중요하다.
}

print(result)

// 축약과 비축약의 길이비교
result = calculate(a: 1, b: 2, method: { (left: Int, right: Int) -> Int in
    return left + right
})

print("축약을 사용하지 않고 결과값을 도출 했습니다 : \(result)")

result = calculate(a: 55, b: 1515){ $0 + $1 }
// 여기서 사용된 클로져 표현은 3 가지
// 1. 후행 클로져
// 2. 반환 타입 생략
// 3. 암묵적 반환 (return의 생략)
print("축약으로 사용해서 결과값을 도출 했습니다 : \(result)")
