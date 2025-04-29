//
//  Song.swift
//  TableViewCellButtons
//
//  Created by alex on 17/4/2025.
//

import Foundation



class Product{
    
    let name : String
    let pricePerUnit: Double?          // For unit-based sales
    let pricePerKilogram: Double?      // For weight-based sales
    var saleType: SaleType             //By Unit / Weight
    var emoji : String
    let locale: Locale                 // 👈 Auto-detected or injected
    
    //Initialiser used for products with unit price
    init(name: String, pricePerUnit: Double, count: Int, emoji: String, locale: Locale = .current) {
        self.name = name
        self.pricePerUnit = pricePerUnit
        self.pricePerKilogram = nil
        self.saleType = .byUnit(count: count)
        self.emoji = emoji
        self.locale = locale
    }
        
    //Initialiser used for products with price per kilo
    init(name: String, pricePerKilogram: Double, weight: Measurement<UnitMass>, emoji: String, locale: Locale = .current) {
        self.name = name
        self.pricePerUnit = nil
        self.pricePerKilogram = pricePerKilogram
        self.saleType = .byWeight(weight: weight)
        self.emoji = emoji
        self.locale = locale
    }
    
    func totalPrice() -> Double {
        switch saleType {
        case .byUnit(let count):
            return (pricePerUnit ?? 0.0) * Double(count)
        case .byWeight(let weight):
            return (pricePerKilogram ?? 0.0) * weight.converted(to: .kilograms).value
        }
    }
    /**
     return a string with a short description including the price:
     Cavendish Banana @ $4.99/kg
     Watermelon @ $2.56/kg
     */
     func shortDescription() -> String {
        switch saleType {
        case .byUnit:
            return "\(name) @ \(format(pricePerUnit ?? 0))/unit"
        case .byWeight:
            return "\(name) @ \(format(pricePerKilogram ?? 0))/kg"
        }
    }
    
    /**
     return a string with only the price description per unit
     */
    func priceDescription() -> String {
        switch saleType {
        case .byUnit:
            return "\(format(pricePerUnit ?? 0))/unit"
        case .byWeight:
            return "\(format(pricePerKilogram ?? 0))/kg"
        }
    }
    
    
    func description() -> String {
            switch saleType {
            case .byUnit(let count):
                return "\(name) × \(count) @ \(format(pricePerUnit ?? 0))/unit = \(format(totalPrice()))"
            case .byWeight(let weight):
                let unitAbbr = weight.unit.symbol
                let weightValue = String(format: "%.2f", weight.value)
                return "\(name) (\(weightValue) \(unitAbbr)) @ \(format(pricePerKilogram ?? 0))/kg = \(format(totalPrice()))"
        }
    }

    /**
     Functions used to return the currency using the device locale
     */
    private func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale // 👈 Automatically uses device locale
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    /**
     Return the unit used by the product : Kg or Unit
     */
    func measurementUnitLabel() -> String? {
        switch saleType {
        case .byWeight(let weight):
            return weight.unit.symbol
        case .byUnit:
            return "unit"
        }
    }

}
