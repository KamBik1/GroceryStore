//
//  FoodSelectionView.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 07.08.2024.
//

import SwiftUI

struct FoodSelectionView: View {
    
    @StateObject private var viewModel = FoodSelectionViewModel()
    
    @State private var showFinalPrice: Bool = false
    @State private var isGridSelected: Bool = true
    
    var body: some View {
        
        VStack(spacing: 0) {
            NavigationBarView(isGridSelected: $isGridSelected)
            Divider()
            if isGridSelected {
                FoodGrid(viewModel: viewModel)
                    .padding(.top, 9)
                    .padding(.bottom, showFinalPrice ? 80 : 0)
            } else {
                FoodList(viewModel: viewModel)
                    .padding(.bottom, showFinalPrice ? 80 : 0)
                    
            }
        }
        .overlay(alignment: .bottom) {
            if showFinalPrice {
                CartView(viewModel: viewModel)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onChange(of: viewModel.finalPrice) { _, newValue in
            withAnimation {
                if newValue != "0.0" {
                    showFinalPrice = true
                } else {
                    showFinalPrice = false
                }
            }
        }
    }
}


struct NavigationBarView: View {
    
    @Binding var isGridSelected: Bool
    
    var body: some View {
        
        HStack {
            Button {
                isGridSelected.toggle()
            } label: {
                Image(systemName: isGridSelected ? "square.grid.2x2" : "rectangle.grid.1x2")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .tint(.navButtonGreen)
                    .padding(12)
                    .background(Color.navButtonGray)
                    .cornerRadius(12)
            }
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
    }
}


struct FoodGrid: View {
    
    @ObservedObject var viewModel: FoodSelectionViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.fixed(168), spacing: 7), GridItem(.fixed(168), spacing: 7)], spacing: 8) {
                ForEach($viewModel.foodData) { $food in
                    GridCell(foodData: $food)
                }
            }
        }
    }
}

struct FoodList: View {
    
    @ObservedObject var viewModel: FoodSelectionViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach($viewModel.foodData) { $food in
                    ListCell(foodData: $food)
                    Divider()
                }
            }
        }
    }
}
