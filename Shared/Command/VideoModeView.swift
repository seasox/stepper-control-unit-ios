//
//  SerialCommandList.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct VideoModeView: View {
    
    @EnvironmentObject var bluetoothManager: BluetoothManager
    
    @State var showsAddDialog: Bool = false
    @State var addDialogText: String = ""
    
    @State var speed: String = ""
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    ButtonCommandView(command: .left)
                        .frame(maxWidth: .infinity)
                        .border(Color.red)
                    TextCommandView(command: .speed)
                    ButtonCommandView(command: .right)
                        .frame(maxWidth: .infinity)
                        .border(Color.red)
                }
                ButtonCommandView(command: .stop)
                HStack {
                    ButtonCommandView(command: .setStart)
                    ButtonCommandView(command: .travel)
                    ButtonCommandView(command: .setEnd)
                }
            }
            .disabled(self.bluetoothManager.state != .connected)
            LogView()
        }
    }
}

struct CommandList_Previews: PreviewProvider {
    static var previews: some View {
        VideoModeView(showsAddDialog: false).environmentObject(BluetoothManager.shared)
    }
}
