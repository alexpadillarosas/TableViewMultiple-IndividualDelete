//
//  SaleType.swift
//  TableViewWithStepper
//
//  Created by alex on 22/4/2025.
//

import Foundation

/**
 We use the Measurement class provided by swift:  https://developer.apple.com/documentation/foundation/measurement
  
 */
enum SaleType {
    case byUnit(count: Int)
    case byWeight(weight: Measurement<UnitMass>)
}
