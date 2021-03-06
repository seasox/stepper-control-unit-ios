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
        }
        .padding(.all, 100)
    }
}

struct CommandList_Previews: PreviewProvider {
    static var previews: some View {
        VideoModeView(showsAddDialog: false)
    }
}

extension BluetoothState {
    var description: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .resetting:
            return "Resetting"
        case .unsupported:
            return "Unsupported"
        case .unauthorized:
            return "Unauthorized"
        case .poweredOff:
            return "Powered off"
        case .poweredOn:
            return "Connect"
        case .connecting:
            return "Connecting..."
        case .connected:
            return "Disconnect"
        }
    }
}
extension Color {
    init(hex: String) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        self.init(
            red:   Double((rgb & 0xFF0000) >> 16)/255.0,
            green: Double((rgb &   0xFF00) >>  8)/255.0,
            blue:  Double((rgb &     0xFF)      )/255.0)
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
