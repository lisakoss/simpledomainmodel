//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String

    // convert currencies
    public func convert(_ to: String) -> Money {
        var newMoney = Money(amount: amount, currency: to)

        switch self.currency {
        case "USD":
            switch to {
            case "GBP":
                newMoney.amount = Int(Double(amount) * 0.5)
            case "EUR":
                newMoney.amount = Int(Double(amount) * 1.5)
            case "CAN":
                newMoney.amount = Int(Double(amount) * 1.25)
            default:
                break
            }
        case "GBP":
            switch to {
            case "USD":
                newMoney.amount = Int(Double(amount) * 2)
            case "EUR":
                newMoney.amount = Int(Double(amount) * 3)
            case "CAN":
                newMoney.amount = Int(Double(amount) * 2.5)
            default:
                break
            }
        case "EUR":
            switch to {
            case "USD":
                newMoney.amount = Int(Double(amount) * (2.0 / 3.0))
            case "GBP":
                newMoney.amount = Int(Double(amount) * (2.0 / 5.0))
            case "CAN":
                newMoney.amount = Int(Double(amount) * (6.0 / 5.0))
            default:
                break
            }
        case "CAN":
            switch to {
            case "USD":
                newMoney.amount = Int(Double(amount) * (4.0 / 5.0))
            case "GBP":
                newMoney.amount = Int(Double(amount) / (2.0 / 5.0))
            case "EUR":
                newMoney.amount = Int(Double(amount) * (6.0 / 5.0))
            default:
                break
            }
        default:
            break
        }
        
        return newMoney
    }
    
  // add currencies
  public func add(_ to: Money) -> Money {
    let initialMoney = Money(amount: amount, currency: currency).convert(to.currency)
    return Money(amount: initialMoney.amount + to.amount, currency: to.currency)
  }
    
  // subtract currencies
  public func subtract(_ from: Money) -> Money {
    let initialMoney = Money(amount: amount, currency: currency).convert(from.currency)
    return Money(amount: initialMoney.amount - from.amount, currency: from.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  // calculate hourly or salary income
  open func calculateIncome(_ hours: Int) -> Int {
    switch type {
    case .Hourly(let wage):
        return Int(wage * Double(hours))
    case .Salary(let wage):
        return wage
    }
  }
  
  // raise income by amount
  open func raise(_ amt : Double) {
    switch type {
    case .Hourly(let wage):
        type = JobType.Hourly(wage + amt)
    case .Salary(let wage):
        type = JobType.Salary(Int(Double(wage) + amt))
    }
  }
}

/*////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}*/





