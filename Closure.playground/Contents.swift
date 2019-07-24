import UIKit

// 클로저의 기본 정의
// { ( 매개변수 ) -> 반환타입 in
//  실행코드
// }


let add : (Int , Int) -> Int
add = { (a: Int , b: Int) -> Int in
    return a+b
}

let substract: (Int, Int) -> Int
substract = {(a: Int, b: Int) -> Int in
    if (a>b){
        return a-b
    }else if(b<a){
        return b-a
    }else{
        return 0
    }
}

let divide: (Int, Int) -> Int
divide = {(a: Int,b: Int) -> Int in
    return a/b
}

func calculate(a: Int, b: Int , method: (Int,Int) -> Int) -> Int {
    return method(a,b)
}
// 클로저는 callback 함수처럼 함수 뒤어 method로 전달이 가능하다!!
var result: Int

result = calculate(a: 23, b: 23, method: add)

print(result)

result = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})

// 클로져는 위와 같이 사용이 가능할 뿐만 아니라 함수를 사용하면서 method 부분을 바로 정의후 사용이 가능하다.
