import UIKit

/*
enum errorName: Error {
    case case1
    case case2
    case case3
}
 */

enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    func receiveMoney(_ money: Int) throws {
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        self.deposited += money
        print("\(money)원 받음")
    }
    
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
        
}

// 자판기 인스턴스를 생성한다.

let machine: VendingMachine = VendingMachine()

var result: String?

do {
    try machine.receiveMoney(0)
}catch VendingMachineError.invalidInput{
    print("입력이 잘못되었습니다")
}catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다.")
}catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
}

do{
    try machine.receiveMoney(300)
}catch {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds (let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알 수 없는 오류 \(error)")
    }
}

// 위와 같이 귀찮게 표현하기 싫다 하면 밑에와 같이 표현할 수 있다.
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}

do {
    result = try machine.vend(numberOfItems: 4)
}
// 오류 처리를 따로 하지 않는다.
// 위와 같은 표현마저 싫다!! 하면 다음과 같은 방법을 사용하면 된다.

// try? & try!

// try? 문
// 별도의 오류처리 결과를 통보받지 않고
// 오류가 발생했으면 결과값을 nil로 돌려받을 수 있다.
// 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다.

result = try? machine.vend(numberOfItems: 2)
result

// try!
// 오류가 발생하지 않을 것이라는 확신을 가질 때
// try! 를 사용하면 정상동작 후에 바로 결과값을 돌려받는다.
// 오류가 발생하면 런타임 오류가 발생하여 어플리케이션 동작이 중지된다.

result = try! machine.vend(numberOfItems: 1)
result


