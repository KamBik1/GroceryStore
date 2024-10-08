//
//  GridCell.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 07.08.2024.
//

import SwiftUI

struct GridCell: View {
    
    @Binding var foodData: Food
    
    var body: some View {
        VStack(spacing: 0) {
            
            //top
            ZStack {
                ImageView(image: foodData.image)
                VStack (spacing: 0) {
                    HStack(alignment: .top, spacing: 0) {
                        SpecialOfferView(offerText: foodData.specialOffer, offerColor: foodData.specialOfferColor)
                        Spacer()
                        ActionButtonsView(isHeartButtonTapped: $foodData.isSelected)
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing: 0) {
                        RateView(rating: foodData.rating)
                        Spacer()
                        DiscountView(discount: foodData.discount)
                    }
                }
            }
            .frame(width: 168, height: 148)
            
            // middle
            VStack(alignment: .leading, spacing: 0) {
                FoodTitleView(title: foodData.title)
                    .padding(.horizontal, 8)
                    .padding(.top, 4)
                CountryView(country: foodData.country, countryFlag: foodData.countryFlag)
                    .padding(.horizontal, 8)
                    .padding(.top, 4)
            }
            .frame(width: 168, height: 58)
            
            VStack(alignment: .leading, spacing: 0) {
                if foodData.isBuyButtonSelected {
                    SwitchView(selectedOption: $foodData.selectedOption)
                        .padding(.horizontal, 5)
                }
            }
            .frame(width: 168, height: 28)
            
            // bottom
            HStack(spacing: 0) {
                if foodData.isBuyButtonSelected {
                    if foodData.selectedOption == "Кг" {
                        CounterKilosView(kilos: $foodData.amountInKilos, finalKiloPrice: $foodData.finalKiloPrice, isBuyButtonSelected: $foodData.isBuyButtonSelected, pricePerKilo: foodData.pricePerKilo)
                            .padding(4)
                    } else {
                        CounterAmountView(amount: $foodData.amount, finalAmountPrice: $foodData.finalAmountPrice, isBuyButtonSelected: $foodData.isBuyButtonSelected, priceForOne: foodData.priceForOne)
                            .padding(4)
                    }
                    
                } else {
                    PricesView(pricePerKilo: foodData.pricePerKilo, oldPrice: foodData.oldPrice)
                        .padding(4)
                        .padding(.leading, 2)
                    Spacer()
                    BuyButtonView(isBuyButtonSelected: $foodData.isBuyButtonSelected)
                        .padding(4)
                }
            }
            .frame(width: 168, height: 44)
        }
        .frame(width: 168, height: 278)
        .background(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 16,
                bottomLeadingRadius: 20,
                bottomTrailingRadius: 20,
                topTrailingRadius: 16
            )
        )
        .onChange(of: foodData.isBuyButtonSelected) { _, _ in
            foodData.amountInKilos = 0.0
            foodData.amount = 0
            foodData.finalKiloPrice = 0.0
            foodData.finalAmountPrice = 0.0
            foodData.selectedOption = "Кг"
        }
        .shadow(color: .shadow.opacity(0.2), radius: 8, x: 0, y: 0)
    }
}

