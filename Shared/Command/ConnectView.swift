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
        Button(self.bluetoothManager.state.description, action: handleConnect)
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
