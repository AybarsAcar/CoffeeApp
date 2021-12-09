//
//  ContentView.swift
//  Coffee
//
//  Created by Aybars Acar on 9/12/21.
//

import SwiftUI


struct ContentView: View {
  
  @ObservedObject private var orderListViewModel = OrderListViewModel()
  
  var body: some View {
    
    NavigationView {
      OrderListView(orders: orderListViewModel.orders)
        .navigationBarTitle("Coffee Orders")
    }
    
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
