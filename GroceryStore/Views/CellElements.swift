//
//  CellElements.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 08.08.2024.
//

import SwiftUI

struct ImageView: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


struct SpecialOfferView: View {
    
    var offerText: String?
    var offerColor: Color?
    
    var body: some View {
        Text(offerText ?? "")
            .font(.system(size: 10))
            .foregroundColor(.white)
            .padding(.top, 2)
            .padding(.bottom, 4)
            .padding(.leading, 12)
            .padding(.trailing, 6)
            .background(offerColor ?? .white)
            .clipShape(
                .rect(
                    topLeadingRadius: 6,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 6,
                    topTrailingRadius: 6
                )
            )
    }
}


struct ActionButtonsView: View {
    
    @Binding var isHeartButtonTapped: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                //
            } label: {
                Image(systemName: "list.clipboard")
                    .resizable()
                    .frame(width: 12, height: 16)
                    .tint(.black)
                    .fontWeight(.bold)
                    .opacity(0.4)
                    .padding(.top, 8)
            }
            Spacer()
            Button {
                isHeartButtonTapped.toggle()
            } label: {
                Image(systemName: isHeartButtonTapped ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .tint(isHeartButtonTapped ? .navButtonGreen : .black)
                    .fontWeight(.bold)
                    .opacity(isHeartButtonTapped ? 1 : 0.4)
                    .padding(.bottom, 9.5)
            }
            
            
        }
        .frame(width: 32, height: 64)
        .background(Color.white)
        .opacity(0.8)
        .clipShape(
            .rect(
                topLeadingRadius: 0,
                bottomLeadingRadius: 16,
                bottomTrailingRadius: 0,
                topTrailingRadius: 0
            )
        )
    }
}


struct RateView: View {
    
    var rating: String
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(.starYellow)
                .padding(2)
                .padding(.leading, 6)
            Text(rating)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .opacity(0.8)
                .padding(.trailing, 4)
                .padding(.vertical, 4)
        }
        .background(Color.white)
        .opacity(0.85)
        .clipShape(
            .rect(
                topLeadingRadius: 0,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 8
            )
        )
    }
}


struct DiscountView: View {
    
    var discount: String?
    
    var body: some View {
        Text(discount ?? "")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(.discountRed)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background(.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 8,
                    bottomLeadingRadius: 8,
                    bottomTrailingRadius: 8,
                    topTrailingRadius: 0
                )
            )
    }
}


struct FoodTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 12))
            .lineSpacing(1)
            .foregroundColor(.foodTitleBlack)
            .opacity(0.8)
            .lineLimit(2)
            .frame(height: 30)
    }
}


struct CountryView: View {
    
    var country: String?
    var countryFlag: String?
    
    var body: some View {
        HStack(spacing: 3) {
            Text(country ?? "")
                .frame(alignment: .leading)
                .font(.system(size: 12))
                .foregroundColor(.foodTitleBlack)
                .opacity(0.6)
                .lineLimit(1)
            Text(countryFlag ?? "")
                .font(.system(size: 12))
                .foregroundColor(.foodTitleBlack)
            Spacer()
        }
    }
}


struct SwitchView: View {
    
    @Binding var selectedOption: String
    let pickerOptions = ["Шт", "Кг"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(pickerOptions, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                }) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .frame(height: 24)
                        .font(.system(size: 14))
                        .fontWeight(selectedOption == option ? .semibold : .regular)
                        .foregroundColor(.foodTitleBlack)
                        .opacity(selectedOption == option ? 1 : 0.6)
                        .background(selectedOption == option ? Color.white : Color.navButtonGray)
                        .cornerRadius(6)
                        .padding(2)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 28)
        .background(Color.navButtonGray)
        .cornerRadius(8)
    }
}


struct PricesView: View {
    
    var pricePerKilo: Double
    var oldPrice: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Text(firstPartOfDoubleToString(number: pricePerKilo))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.foodTitleBlack)
                Text(secondPartOfDoubleToString(number: pricePerKilo))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.foodTitleBlack)
                    .padding(.horizontal, 2)
                    .padding(.top, 1)
                ZStack {
                    Text("/")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.foodTitleBlack)
                        .rotationEffect(.degrees(32))
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Text(" ₽")
                                .font(.system(size: 9))
                                .fontWeight(.semibold)
                                .foregroundColor(.foodTitleBlack)
                            Spacer()
                        }
                        .frame(width: 10)
                        VStack(spacing: 0) {
                            Spacer()
                            Text("кг")
                                .font(.system(size: 9))
                                .fontWeight(.semibold)
                                .foregroundColor(.foodTitleBlack)
                        }
                        .frame(width: 10)
                    }
                    .frame(width: 20, height: 20)
                }
            }
            Text(oldPrice ?? "")
                .font(.system(size: 12))
                .foregroundColor(.foodTitleBlack)
                .opacity(0.6)
                .strikethrough()
        }
    }
    
    // Преобразуем часть Double до запятой в String
    func firstPartOfDoubleToString(number: Double) -> String {
        return String(Int(number))
    }
    
    // Преобразуем часть Double после запятой в String
    func secondPartOfDoubleToString(number: Double) -> String {
        let fraction = number - floor(number)
        let fractionAsInt = Int(fraction * 100)
        return String(fractionAsInt)
    }
    
}


struct BuyButtonView: View {
    
    @Binding var isBuyButtonSelected: Bool
    
    var body: some View {
        Button {
            isBuyButtonSelected = true
        } label: {
            Image(systemName: "basket.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .tint(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.navButtonGreen)
                .cornerRadius(40)
        }
    }
}


struct CounterKilosView: View {
    
    @Binding var kilos: Double
    @Binding var finalKiloPrice: Double
    @Binding var isBuyButtonSelected: Bool
    var pricePerKilo: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .foregroundColor(.navButtonGreen)
                .cornerRadius(40)
            HStack(spacing: 0) {
                Button(action: {
                    if kilos < 0.1 {
                        kilos = 0.0
                        finalKiloPrice = 0.0
                        isBuyButtonSelected = false
                    } else {
                        kilos -= 0.1
                        finalKiloPrice = kilos * pricePerKilo
                    }
                }) {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 16, height: 2)
                        .tint(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                }
                Spacer()
                Button(action: {
                    kilos += 0.1
                    finalKiloPrice = kilos * pricePerKilo
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .tint(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                }
            }
            VStack(spacing: 0) {
                HStack(spacing: 3) {
                    Text(String(format: "%.1f", kilos))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("кг")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                HStack(spacing: 3) {
                    Text(String(format: "%.1f", finalKiloPrice))
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .opacity(0.8)
                        .foregroundColor(.white)
                    Text("₽")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .opacity(0.8)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct CounterAmountView: View {
    
    @Binding var amount: Int
    @Binding var finalAmountPrice: Double
    @Binding var isBuyButtonSelected: Bool
    var priceForOne: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .foregroundColor(.navButtonGreen)
                .cornerRadius(40)
            HStack(spacing: 0) {
                Button(action: {
                    if amount < 1 {
                        amount = 0
                        finalAmountPrice = 0.0
                        isBuyButtonSelected = false
                    } else {
                        amount -= 1
                        finalAmountPrice = Double(amount) * priceForOne
                    }
                }) {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 16, height: 2)
                        .tint(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                }
                Spacer()
                Button(action: {
                    amount += 1
                    finalAmountPrice = Double(amount) * priceForOne
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .tint(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                }
            }
            VStack(spacing: 0) {
                HStack(spacing: 3) {
                    Text(String(amount))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("шт")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                HStack(spacing: 3) {
                    Text(String(format: "%.1f", finalAmountPrice))
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .opacity(0.8)
                        .foregroundColor(.white)
                    Text("₽")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .opacity(0.8)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct RateAndReviewView: View {
    
    var rating: String
    var amountReviews: String
    
    var body: some View {
        
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(.starYellow)
                .padding(.vertical, 4)
            Text(rating)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .opacity(0.8)
                .padding(.vertical, 2)
            
            Image(systemName: "line.diagonal")
                .frame(width: 2)
                .foregroundColor(.foodTitleBlack)
                .opacity(0.6)
                .rotationEffect(.degrees(-45))
            Text("\(amountReviews) отзывов")
                .font(.system(size: 12))
                .opacity(0.6)
                .foregroundColor(.foodTitleBlack)
            Spacer()
        }
        .frame(height: 20)
    }
}

