import UIKit

class Person {
    var name: String?
    var age: Int?
    var home: Apartment?
    // 변수들을 옵셔널로 선언한다.
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Apartment {
    var buildingName: String?
    var roomNumber: Int?
    var security: Person?
    
    init(bName: String, rNumber: Int) {
        self.buildingName = bName
        self.roomNumber = rNumber
    }
}


let personOne: Person? = Person(name: "김리뷰", age: 19)
let securityOne: Person? = Person(name: "타코타코", age: 29)
let apart: Apartment? = Apartment(bName: "삼성빌딩", rNumber: 12)

apart?.security = securityOne
personOne?.home = apart



func checkSecurityAge(owner: Person?){
    // 만약 전달인자 값에 home이 있고 그 home에 security가 있으면 나이는 출력하고
    if let securityage = owner?.home?.security?.age{
        print("우리집 경비원의 나이는 \(securityage) 입니다")
    }else{ // 집이 없거나 경비원이 없다면 경비원의 나이를 모르기 때문에 밑에 구문을 출력한다.
        print("우리집 경비원의 나이는 몰라요")
    }
}

checkSecurityAge(owner: personOne)


// ?? 연산자 (nil 병합 연산자)

var giveAge: Int
var personTwo: Person? = Person(name: "기모딱", age: 23)

giveAge = personOne?.age ?? 23
// ?? 연산자 : personOne의 age가 있다면 23을 할당하지 않고 nil이라면 23을 할당한다.
print(giveAge)
personTwo?.age = nil
giveAge = personTwo?.age ?? 50
print(giveAge)

// 그 결과로 personOne의 age는 nil이 아니기 때문에 19가 나오고 personTwo의 age는 nil이기 때문에 50이 할당 되어서 50이 출력이 된다.
