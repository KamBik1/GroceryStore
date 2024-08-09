//
//  ListCell.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 09.08.2024.
//

import SwiftUI

struct ListCell: View {
    
    @State private var selectedOption: String = "Кг"
    @State private var isBuyButtonSelected: Bool = false
    @ObservedObject var viewModel: FoodSelectionViewModel
    @Binding var foodData: Food
    
    var body: some View {
        HStack(spacing: 0) {
            
            //left
            ZStack {
                ImageView(image: foodData.image)
                VStack (spacing: 0) {
                    HStack(alignment: .top, spacing: 0) {
                        SpecialOfferView(offerText: foodData.specialOffer, offerColor: foodData.specialOfferColor)
                        Spacer()
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing: 0) {
                        Spacer()
                        DiscountView(discount: foodData.discount)
                    }
                }
            }
            .frame(width: 144, height: 144)
            .padding(.vertical, 16)
            .padding(.leading, 16)
            
            Spacer()
            
            // right
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        RateAndReviewView(rating: foodData.rating, amountReviews: foodData.amountReviews)
                            .padding(.leading, 6)
                            .padding(.trailing, 40)
                        FoodTitleView(title: foodData.title)
                            .padding(.leading, 8)
                            .padding(.trailing, 40)
                        CountryView(country: foodData.country, countryFlag: foodData.countryFlag)
                            .padding(.leading, 8)
                            .padding(.trailing, 40)
                            .padding(.top, 4)
                    }
                    .frame(height: 72)
                    
                    VStack {
                        if isBuyButtonSelected {
                            SwitchView(selectedOption: $selectedOption)
                                .padding(.horizontal, 5)
                        }
                    }
                    .frame(height: 28)
                    
                    HStack(spacing: 0) {
                        if isBuyButtonSelected {
                            if selectedOption == "Кг" {
                                CounterKilosView(isBuyButtonSelected: $isBuyButtonSelected, pricePerKilo: foodData.pricePerKilo)
                                    .padding(4)
                            } else {
                                CounterAmountView(isBuyButtonSelected: $isBuyButtonSelected, priceForOne: foodData.priceForOne)
                                    .padding(4)
                            }
                            
                        } else {
                            PricesView(pricePerKilo: foodData.pricePerKilo, oldPrice: foodData.oldPrice)
                                .padding(4)
                                .padding(.leading, 4)
                            Spacer()
                            BuyButtonView(isBuyButtonSelected: $isBuyButtonSelected)
                                .padding(4)
                        }
                    }
                    .frame(height: 44)
                }
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        ActionButtonsView()
                    }
                    Spacer()
                }
            }
            .frame(width: 199, height: 144)
            .padding(.vertical, 16)
            .padding(.trailing, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 176)
        .background(.white)
    }
}
