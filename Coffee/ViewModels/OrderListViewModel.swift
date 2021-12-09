//
//  OrderListViewModel.swift
//  Coffee
//
//  Created by Aybars Acar on 9/12/21.
//

import Foundation


///
/// List screen in our application
///
class OrderListViewModel: ObservableObject {
  
  @Published  var orders = [OrderViewModel]()
  
  
  init() {
    fetchOrders()
  }
  
  
  func fetchOrders() {
    CoffeeServiceImpl().getAllOrders { orders in
      
      if let orders = orders {
        self.orders = orders.map(OrderViewModel.init)
      }
    }
  }
  
}


class OrderViewModel {
  
  let id = UUID()
  
  var order: Order
  
  init(order: Order) {
    self.order = order
  }
  
  var name: String { return order.name }
  var size: String { return order.size }
  var coffeeName: String { return order.coffeeName }
  var total: Double { return order.total }
}
