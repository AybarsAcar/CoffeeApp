//
//  OrderListView.swift
//  Coffee
//
//  Created by Aybars Acar on 9/12/21.
//

import SwiftUI


struct OrderListView: View {
  
  let orders: [OrderViewModel]
  
  init(orders: [OrderViewModel]) {
    self.orders = orders
  }
  
  var body: some View {
    
    List {
      ForEach(orders, id: \.id) { order in
        
        HStack {
          Image(order.coffeeName)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(16)
          
          VStack(alignment: .leading) {
            Text(order.name)
              .font(.title)
              .padding(.bottom, 10)
            
            
            HStack {
              Text(order.coffeeName)
                .padding(10)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
              
              Text(order.size)
                .font(.footnote)
                .padding()
            }
          }
          .padding(.horizontal, 16)
        }
      }
    }
  }
}



struct OrderListView_Previews: PreviewProvider {
  static var previews: some View {
    OrderListView(
      orders: [OrderViewModel(order: Order(name: "Mary", coffeeName: "Cappuccino", size: "Medium", total: 3))]
    )
  }
}
