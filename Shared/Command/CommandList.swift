//
//  SerialCommandList.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct CommandList: View {
    
    @EnvironmentObject var store: CommandStore
    
    var body: some View {
        List(store.commands) { command in
            CommandRow(command: command)
        }
    }
}

struct CommandList_Previews: PreviewProvider {
    static var previews: some View {
        CommandList()
    }
}
