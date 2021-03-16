//
//  SerialCommand.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import Foundation

struct ButtonCommand: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    let commands: [String]
    
    func run() {
        BluetoothManager.shared.send(commands)
    }
}

extension ButtonCommand {
    static let left = ButtonCommand(title: "<", commands: [ "sid=0;cmd=set;direction=0;", "sid=0;cmd=set;mode=0;" ])
    static let right = ButtonCommand(title: ">", commands: [ "sid=0;cmd=set;direction=1;", "sid=0;cmd=set;mode=0;" ])
    static let stop = ButtonCommand(title: "Stop", commands: [ "sid=0;cmd=set;mode=1;" ])
    static let setStart = ButtonCommand(title: "Set Start", commands: [ "sid=0;cmd=set;startpoint;" ])
    static let travel =  ButtonCommand(title: "Travel", commands: [ "sid=0;cmd=set;mode=2;" ])
    static let setEnd = ButtonCommand(title: "Set End", commands: [ "sid=0;cmd=set;endpoint;" ])
    static let runSMS = ButtonCommand(title: "Run SMS", commands: [ "sid=0;cmd=set;runSMS=1;" ])
    static let stopSMS = ButtonCommand(title: "Stop SMS", commands: [ "sid=0;cmd=set;runSMS=0;" ])
}
