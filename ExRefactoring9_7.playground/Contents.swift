import UIKit

struct Product {
    var items = (0...20).map(String.init)
    
    func getItems(included: (String) -> Bool) -> [String] {
        items.filter(included)
    }
    
    /* refactoring 전 코드
    mutating func removeAndGetRemainingItem(included: (String) -> Bool) -> [String] {
        let targetItems = items.filter(included)
        targetItems.forEach { removingItem in
            self.items.removeAll(where: { $0 == removingItem })
        }
        return items
    }
     */
    
    mutating func remove(items: [String]) {
        items
            .forEach { removingItem in
                self.items.removeAll(where: { $0 == removingItem })
            }
    }
}

var product = Product()

// refactoring 전 코드
// product.removeAndGetRemainingItem(included: { Int($0)! % 2 == 0 }) // // ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19"]

let targetItems = product.getItems(included: { Int($0)! % 2 == 0 })
product.remove(items: targetItems)
print(product.items) // ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19"]
