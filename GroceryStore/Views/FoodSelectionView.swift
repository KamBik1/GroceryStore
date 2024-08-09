//
//  FoodSelectionView.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 07.08.2024.
//

import SwiftUI

struct FoodSelectionView: View {
    
    @StateObject private var viewModel = FoodSelectionViewModel()
    
    @State private var isGridSelected: Bool = true
    
    var body: some View {
        VStack (spacing: 0) {
            NavigationBarView(isGridSelected: $isGridSelected)
            Divider()
            if isGridSelected {
                FoodGrid(viewModel: viewModel)
                    .padding(.top, 9)
            } else {
                FoodList(viewModel: viewModel)
            }
            Spacer()
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
                ForEach($viewModel.foodData, id: \.self) { foodData in
                    GridCell(viewModel: viewModel, foodData: foodData)
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
                ForEach($viewModel.foodData, id: \.self) { foodData in
                    ListCell(viewModel: viewModel, foodData: foodData)
                    Divider()
                }
            }
        }
    }
}


//#Preview {
//    FoodSelectionView()
//}


