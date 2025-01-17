

import Foundation
import SwiftUI

enum CategoryColor: String, CaseIterable {
    case red = "red"
    case orange = "orange"
    case yellow = "yellow"
    case green = "green"
    case mint = "mint"
    case cyan = "cyan"
    case blue = "blue"
    case indigo = "indigo"
    case pink = "pink"
    case purple = "purple"
    case brown = "brown"
    case gray = "gray"
}

extension CategoryColor {
    var color: Color {
        switch self {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        case .mint:
            return Color.mint
        case .cyan:
            return Color.cyan
        case .blue:
            return Color.blue
        case .indigo:
            return Color.indigo
        case .pink:
            return Color.pink
        case .purple:
            return Color.purple
        case .brown:
            return Color.brown
        case .gray:
            return Color.gray
        }
    }
}

extension CategoryColor {
    static func getColor(_ color: String) -> Color {
        for categoryColor in self.allCases {
            if categoryColor.rawValue == color {
                return categoryColor.color
            }
        }

        return .blue
    }
}
