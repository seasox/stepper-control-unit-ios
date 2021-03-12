//
//  SerialCommandList.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct CommandList: View {
    
    @EnvironmentObject var store: CommandStore
    
    @State var showsAddDialog: Bool = false
    @State var addDialogText: String = ""
    
    var body: some View {
        List {
            Button("Rescan") {
                BluetoothManager.shared.startScan()
            }
            ForEach(store.commands) { command in
                CommandRow(command: command)
            }
            Button("Add Command") {
                self.showsAddDialog = true
            }.sheet(isPresented: $showsAddDialog) {
                Text("todo")
            }
        }
    }
}

struct CommandList_Previews: PreviewProvider {
    static var previews: some View {
        CommandList(showsAddDialog: false)
    }
}
