//
//  SerialCommandRow.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct CommandRow: View {
    @State var command: ButtonCommand
    var body: some View {
        Button(command.title) {
            command.run()
        }.frame(width: 150)
    }
}

struct CommandRow_Previews: PreviewProvider {
    static var previews: some View {
        CommandRow(command: ButtonCommand(id: UUID(), title: "Start", commands: ["cmd1"]))
    }
}
