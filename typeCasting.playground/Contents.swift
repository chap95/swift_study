import UIKit




let someInt: Int  = 100
let someDouble: Double = Double(someInt)

class Person {
    var name: String = ""
    func introduce(){
        print("안녕하세요 제이름은 \(self.name) 입니다")
    }
}

class Student: Person {
    var school: String = ""
    func gotoSchool(){
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func gotoMT() {
        print("MT를 갑니다")
    }
}

var totobiyo: Person = Person()
var claireKi: Student = Student()
var inship: UniversityStudent = UniversityStudent()

// is 를 사용하여 데이터 타입을 확인한다.

var result: Bool

result = totobiyo is Person
result = totobiyo is Student
result = totobiyo is UniversityStudent


if totobiyo is UniversityStudent {
    print("totobiyo는 대학생입니다")
} else if totobiyo is Person {
    print("totobiyo는 사람입니다")
} else if totobiyo is Student {
    print("totobiyo는 학생입니다")
}


switch inship {
case is Person:
    print("inship은 사람입니다")
case is UniversityStudent:
    print("inship은 대학생입니다")
case is Student:
    print("inship은 학생입니다")
default:
    print("inship은 학생도 사람도 대학생도 아닙니다")
}


// as 를 이용하여
var x: Person = UniversityStudent() as Person
var y: Student = Student()
var z: Any = Person() // as Any 생락가능


// 조건부 다운 캐스팅 as?
// 강제 다운 캐스팅 as!

var optionalCasted: Student?

optionalCasted = x as? UniversityStudent
optionalCasted = y as? UniversityStudent // nil
optionalCasted = z as? UniversityStudent // nil

var forcedCasted: Student?

forcedCasted = x as! UniversityStudent
// forcedCasted = y as! UniversityStudent 런타임 오류 발생

func doSomething(someone: Person){
    switch someone{
    case is UniversityStudent:
        (someone as! UniversityStudent).gotoMT() // someone을 UniversityStudent 처럼 사용하기 위햐서는 as! 이런식으로 캐스팅을 해서 다시 가져와야한다. 하지만 if let을 사용하게 된다면 훨씬 편하게 캐스팅이 가능하다.
    case is Student:
        (someone as! Student).gotoSchool()
    case is Person:
        (someone as! Person).introduce()
    }
}


func doAnotherthing(someone: Person){
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.gotoMT()
    }else if let student = someone as? Student {
        student.gotoSchool()
    }else if let person = someone as? Person {
        person.introduce()
    }
}


print("==========================절취선=================================")
doSomething(someone: x as Person)
doSomething(someone: x)
doSomething(someone: y)
doSomething(someone: z as! Person)
