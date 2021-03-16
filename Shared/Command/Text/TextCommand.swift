//
//  ArgCommand.swift
//  StepperControl
//
//  Created by Jeremy Boy on 16.03.21.
//

import Foundation

struct TextCommand: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    var state: String
    let commands: [String]
    
    func run() {
        BluetoothManager.shared.send(commands.map { cmd in cmd.replacingOccurrences(of: "%s", with: state) })
    }
}
