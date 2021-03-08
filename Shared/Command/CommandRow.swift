//
//  SerialCommandRow.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct CommandRow: View {
    var command: Command
    var body: some View {
        Button(command.title) {
            command.run()
        }
    }
}

struct CommandRow_Previews: PreviewProvider {
    static var previews: some View {
        CommandRow(command: Command(id: UUID(), title: "Start", commands: ["cmd1"]))
    }
}
