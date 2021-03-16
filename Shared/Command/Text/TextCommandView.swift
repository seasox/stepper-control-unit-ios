//
//  TextCommandView.swift
//  StepperControl
//
//  Created by Jeremy Boy on 16.03.21.
//

import SwiftUI

struct TextCommandView: View {
    @State var command: TextCommand
    var body: some View {
        TextField(command.title, text: $command.state, onCommit: command.run)
        .frame(maxWidth: .infinity)
        .border(Color.red)
    }
}

struct TextCommandView_Previews: PreviewProvider {
    static var previews: some View {
        TextCommandView(command: TextCommand(title: "Title", state: "State", commands: []))
    }
}
