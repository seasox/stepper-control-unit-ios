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

extension TextCommand {
    static let speed = TextCommand(title: "Set Speed", state: "1000", commands: [ "sid=0;cmd=set;speed=%s;" ])
    static let exposure = TextCommand(title: "Exposure", state: "1000", commands: [ "sid=0;cmd=set;exposure_time_ms=%s;" ])
    static let offset = TextCommand(title: "Offset", state: "1000", commands: [ "sid=0;cmd=set;exposure_time_offset_ms=%s;" ])
    static let runtime = TextCommand(title: "Runtime", state: "1000", commands: [ "sid=0;cmd=set;sms_pictures_amount=%s;" ])
}
