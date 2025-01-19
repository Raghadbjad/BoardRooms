//
//  Item.swift
//  BoardRooms
//
//  Created by Raghad on 19/07/1446 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
