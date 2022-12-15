//
//  ConnectView.swift
//  StepperControl
//
//  Created by Jeremy Boy on 16.03.21.
//

import SwiftUI

struct ConnectView: View {
    
    @EnvironmentObject var bluetoothManager: BluetoothManager
    
    var body: some View {
        Button(action: handleConnect) { Text(self.bluetoothManager.state.description).font(.system(size: 24)) }
            .padding()
            .disabled(self.bluetoothManager.state == .unsupported)
    }
    
    private func handleConnect() {
        if self.bluetoothManager.state == .connected {
            bluetoothManager.disconnect()
        } else {
            _ = bluetoothManager.startScan()
        }
    }
}

struct ConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectView().environmentObject(BluetoothManager.shared)
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
            return "Click to connect"
        case .connecting:
            return "Connecting..."
        case .connected:
            return "Disconnect"
        }
    }
}
