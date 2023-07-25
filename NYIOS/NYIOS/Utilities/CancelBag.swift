//
//  CancelBag.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import Foundation

import Foundation
import Combine

final class CancelBag {
    var subscriptions = Set<AnyCancellable>()

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
