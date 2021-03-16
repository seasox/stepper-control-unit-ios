//
//  SerialCommandRow.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct ButtonCommandView: View {
    @State var command: ButtonCommand
    var body: some View {
        Button(command.title) {
            command.run()
        }.frame(width: 150)
    }
}

struct CommandRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCommandView(command: ButtonCommand(id: UUID(), title: "Start", commands: ["cmd1"]))
    }
}
