//
//  CartView.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 09.08.2024.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: FoodSelectionViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Корзина")
                    .font(.system(size: 16))
                    .foregroundColor(.foodTitleBlack)
                    .opacity(0.8)
                Spacer()
                
                HStack(spacing: 5) {
                    Text(viewModel.finalPrice)
                        .font(.system(size: 16))
                        .foregroundColor(.foodTitleBlack)
                        .fontWeight(.bold)
                    Text("руб.")
                        .font(.system(size: 16))
                        .foregroundColor(.foodTitleBlack)
                        .fontWeight(.bold)
                }
            }
            .padding(10)
            .background(.navButtonGreen)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.top, 10)
           Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .shadow.opacity(0.2), radius: 8, x: 0, y: 0)
    }
}
