//
//  CoffeeService.swift
//  Coffee
//
//  Created by Aybars Acar on 9/12/21.
//

import Foundation

protocol CoffeeService {
  func getAllOrders(completion: @escaping ([Order]?) -> Void)
  func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void)
}


class CoffeeServiceImpl: CoffeeService {
  
  private let BASE_URL: String = "https://island-bramble.glitch.me/orders"
  
  func getAllOrders(completion: @escaping ([Order]?) -> Void) {
    
    guard let url = URL(string: BASE_URL) else {
      completion(nil)
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        
        return
      }
      
      let orders = try? JSONDecoder().decode([Order].self, from: data)
      
      DispatchQueue.main.async {
        completion(orders)
      }
      
    }.resume()
  }
  
  
  func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void) {
    
    guard let url = URL(string: BASE_URL) else {
      fatalError("Invalid URL")
    }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = try? JSONEncoder().encode(order)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
      
      DispatchQueue.main.async {
        completion(createOrderResponse)
      }
            
    }.resume()
  }
  
}
