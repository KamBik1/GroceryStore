//
//  FoodSelectionViewModel.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 07.08.2024.
//
import SwiftUI

class FoodSelectionViewModel: ObservableObject {
    
    @Published var foodData: [Food] = [
        Food(title: "Сыр Ламбер 500/0 230г", image: "Food1", rating: "4.3", discount: nil, priceForOne: 345.90, amount: 0, pricePerKilo: 1020.45, amountInKilos: 0.0, oldPrice: nil, country: nil, countryFlag: nil, specialOffer: "Удар по ценам", specialOfferColor: .specialOfferRed, amountReviews: "21", finalAmountPrice: 0.0, finalKiloPrice: 0.0),
        Food(title: "Энергетический Напиток", image: "Food2", rating: "3.9", discount: "25%", priceForOne: 105.90, amount: 0, pricePerKilo: 499.99, amountInKilos: 0.0, oldPrice: "699.0", country: nil, countryFlag: nil, specialOffer: nil, specialOfferColor: nil, amountReviews: "15", finalAmountPrice: 0.0, finalKiloPrice: 0.0),
        Food(title: "Салат овощной с крабовыми палочками", image: "Food3", rating: "4.0", discount: nil, priceForOne: 155.90, amount: 0, pricePerKilo: 760.50, amountInKilos: 0.0, oldPrice: nil, country: "Франция", countryFlag: "🇫🇷", specialOffer: nil, specialOfferColor: nil, amountReviews: "33", finalAmountPrice: 0.0, finalKiloPrice: 0.0),
        Food(title: "Ролл Маленькая Япония", image: "Food4", rating: "2.9", discount: "15%", priceForOne: 175.90, amount: 0, pricePerKilo: 890.70, amountInKilos: 0.0, oldPrice: "979.9", country: nil, countryFlag: nil, specialOffer: "Цена по карте", specialOfferColor: .specialOfferGreen, amountReviews: "9", finalAmountPrice: 0.0, finalKiloPrice: 0.0),
        Food(title: "Манго Кео", image: "Food5", rating: "4.8", discount: nil, priceForOne: 190.0, amount: 0, pricePerKilo: 195.30, amountInKilos: 0.0, oldPrice: nil, country: "Египет", countryFlag: "🇪🇬", specialOffer: "Новинка", specialOfferColor: .specialOfferPurple, amountReviews: "0", finalAmountPrice: 0.0, finalKiloPrice: 0.0),
        Food(title: "Макаронные Изделия SPAR Спагетти 450г", image: "Food6", rating: "4.1", discount: nil, priceForOne: 93.5, amount: 0, pricePerKilo: 205.30, amountInKilos: 0.0, oldPrice: nil, country: nil, countryFlag: nil, specialOffer: nil, specialOfferColor: nil, amountReviews: "44", finalAmountPrice: 0.0, finalKiloPrice: 0.0)
    ] {
        didSet {
            cartSum()
        }
    }
    
    @Published var finalPrice: String = "0.0"
    
    // Метод для расчета итоговой суммы
    func cartSum() {
        var result: Double = 0.0
        for i in 0..<foodData.count {
            let sumAmoumtKilos = foodData[i].finalAmountPrice + foodData[i].finalKiloPrice
            result += sumAmoumtKilos
        }
        finalPrice = String(format: "%.1f", result)
    }
    
}
