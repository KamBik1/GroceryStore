//
//  FoodModel.swift
//  GroceryStore
//
//  Created by Kamil Biktineyev on 07.08.2024.
//
import Foundation
import SwiftUI

struct Food: Hashable, Equatable, Identifiable {
    let id: UUID = UUID()
    let title: String
    let image: String
    let rating: String
    let discount: String?
    let priceForOne: Double
    var amount: Int
    let pricePerKilo: Double
    var amountInKilos: Double
    let oldPrice: String?
    let country: String?
    let countryFlag: String?
    let specialOffer: String?
    let specialOfferColor: Color?
    let amountReviews: String
    var finalAmountPrice: Double
    var finalKiloPrice: Double
    var isBuyButtonSelected: Bool = false
    var selectedOption: String = "Кг"
    var isSelected: Bool = false
}
