//
//  Array+Edentifiable.swift
//  memoria
//
//  Created by Rafael Rahn on 19.07.20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0
    }
}
