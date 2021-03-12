//
//  SerialCommand.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import Foundation

struct Command: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    let commands: [String]
    
    func run() {
        BluetoothManager.shared.send(commands)
    }
}
