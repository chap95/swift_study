import UIKit

// 고차함수
// 스위프트 문법은 아니지만 유용한 기능

// 스위프트에 구현되어 있는 고차함수들
// map, filter, reduce

// map
// 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너 생성

let numbers: [Int] = [0,1,2,3,4]
var doubleNumbers: [Int]
var strings: [String]

doubleNumbers = [Int]()
strings = [String]()

// for 문을 사용
for number in numbers {
    doubleNumbers.append(number*2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)


// 위와 같이 for문을 사용하면 되지만 너무 구찮다
// 그러면 map 메소드를 사용한다
// map 이 오면 closure 가 온다.
doubleNumbers = numbers.map({(number: Int) -> Int in
    return number * 2
})

strings = numbers.map({(number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)

doubleNumbers = numbers.map { $0 * 2 }
// 위와 같이 깔끔한 모습도 가능하다.

// filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    // return 타입이 bool 이다. bool이 true 일 때만 반환한다.
    return number % 2 == 0
}

print(evenNumbers)

let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}

print(oddNumbers)

// reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합

let someNumbers: [Int] = [2,8,15]

let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})

print(sum)

let sum2 = someNumbers.reduce(3) {$0 + $1}

print(sum2)
