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
    let sid: Int
    let cmd: String
    
    // FIXME: I miss you TCP :'(
    mutating func update() {
        let getter = "sid=\(sid);cmd=get;\(cmd);\r"
        BluetoothManager.shared.send(getter)
        state = BluetoothManager.shared
            .logEntries
            .split(whereSeparator: \.isNewline)
            .map(String.init)
            .last(where: { $0.starts(with: cmd + "=") })?.split(separator: "=")
            .map(String.init)
            .last ?? ""
    }
    
    func run() {
        let setter = "sid=\(sid);cmd=set;\(cmd)=\(state);\r"
        BluetoothManager.shared.send(setter)
    }
}

extension TextCommand {
    static let speed = TextCommand(title: "Set Speed", state: "", sid: 0, cmd: "speed")
    static let exposure = TextCommand(title: "Exposure", state: "", sid: 0, cmd: "exposure_time_ms")
    static let offset = TextCommand(title: "Offset", state: "", sid: 0, cmd: "exposure_time_offset_ms")
    static let runtime = TextCommand(title: "Runtime", state: "", sid: 0, cmd: "sms_pictures_amount")
}
