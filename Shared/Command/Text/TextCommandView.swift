//
//  TextCommandView.swift
//  StepperControl
//
//  Created by Jeremy Boy on 16.03.21.
//

import SwiftUI

struct TextCommandView: View {
    let withLabel: Bool
    @State var command: TextCommand
    var body: some View {
        HStack {
            if withLabel {
                Text(command.title)
            }
            TextField(command.title, text: $command.state, onCommit: command.run)
            .frame(maxWidth: .infinity)
            .border(Color.red)
        }
    }
    
    init(withLabel l: Bool = false, command c: TextCommand) {
        withLabel = l
        _command = State(initialValue: c)
    }
}

struct TextCommandView_Previews: PreviewProvider {
    static var previews: some View {
        TextCommandView(command: TextCommand(title: "Title", state: "State", commands: []))
    }
}
