//
//  Product.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 16.06.2024.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let count: Int
    let imageName: String
}
