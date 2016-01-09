
import UIKit

class BagelShop {
    
    var numberOfBagels: Int
    var totalEarnings: Double
    
    init(numberOfBagels: Int, totalEarnings: Double) {
        self.numberOfBagels = numberOfBagels
        self.totalEarnings = totalEarnings
    }
    
    convenience init() {
        self.init(numberOfBagels:5, totalEarnings: 0.0)
    }
    
    func isClosed() -> Bool {
        
//        if numberOfBagels == 0 {
//            
//            return true
//        }
//        
//        return false
        
        return numberOfBagels == 0
    }
    
    func processOrder(order:Order) {
        
        if !isClosed() && !order.isCompleted && order.numberOfBagels <= self.numberOfBagels {
            
        self.numberOfBagels -= order.numberOfBagels
            
        //Add totalPrice to self.totalEarnings
        self.totalEarnings += order.totalPrice
            
        order.isCompleted = true
            
            if isClosed() {
                
                print("Total Daily Earnings: $\(self.totalEarnings)")
            }
        
        } else if isClosed() {
            
            print("Sorry, we're closed!")
        
        } else if order.numberOfBagels > self.numberOfBagels {
            
            print("Sorry, we don't have enough bagels left to cover your order.")
        }
    }
    
    
}

class Customer {
    
    var order: Order
    
    init (order : Order) {
        
        self.order = order
    }
}

class Order {
    
    var bagels: [Bagel]
    var isCompleted: Bool
    
    var numberOfBagels: Int {
        return bagels.count
    }
    
    var totalPrice: Double {
        return bagels.reduce(0, combine: { $0 + $1.price })
    }

    init (bagels: [Bagel]) {
        
        self.bagels = bagels
        self.isCompleted = false
    }
    
//    func totalOrderPrice () -> Double {
//        
////        var totalOrderPrice = 0.0
////        
////        for bagel in self.bagels {
////            
////            totalOrderPrice += bagel.price
////        }
//        
//        // map, filter, reduce
//        
//        return bagels.reduce(0, combine: { $0 + $1.price })
//        
////        return bagels.reduce(0, combine: { (previousValue: Double, bagel: Bagel) -> Double in
////            return previousValue + bagel.price
////        })
//        
//        
//    }


}

class Bagel {
    
    let price: Double
    var description: String
    
    init(price: Double, description: String) {
        
        self.price = price
        self.description = description
    }
    
    convenience init() {
        
        self.init(price: 1.50, description: "Plain")
    }
}


// create a bagel model
//  price of each bagel is 1.50
// orders should have multiple bagels
//  have a totalPrice for order
// print out a sum of total money made after the bagelShop is closed


let bagelShop = BagelShop()

let eBagel = Bagel()
eBagel.description = "Everything"
let oBagel = Bagel()
oBagel.description = "Onion"
let pBagel = Bagel()
pBagel.description = "Poppyseed"
let bBagel = Bagel()
eBagel.description = "Blueberry"
let puBagel = Bagel()
oBagel.description = "Pumpernickel"
let cRBagel = Bagel()
pBagel.description = "Cinnamon Raisin"


let order1 = Order(bagels: [eBagel, oBagel, bBagel])
bagelShop.processOrder(order1)
bagelShop.numberOfBagels

let order2 = Order(bagels: [puBagel, cRBagel, pBagel])
bagelShop.processOrder(order2)
bagelShop.numberOfBagels

let order3 = Order(bagels: [puBagel, cRBagel])
bagelShop.processOrder(order3)
bagelShop.numberOfBagels



let i = [1, 2, 3, 4, 5].map { $0 * 2 }
print(i)

let j = [1, 2, 3, 4, 5].filter { $0 % 2 == 0 }

print(j)

let k = [1, 2, 3, 4, 5].reduce(0, combine: +)

print(k)