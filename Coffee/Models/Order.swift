//
//  Order.swift
//  Coffee
//
//  Created by Aybars Acar on 9/12/21.
//

import Foundation


struct Order: Codable {
  let name: String
  let coffeeName: String
  let size: String
  let total: Double
}
