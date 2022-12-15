//
//  LogView.swift
//  StepperControl (iOS)
//
//  Created by Jeremy Boy on 20.03.21.
//

import SwiftUI

struct LogView: View {
    
    @EnvironmentObject var bluetoothManager: BluetoothManager
    
    var body: some View {
        let lines = bluetoothManager.logEntries.split(whereSeparator: \.isNewline).reversed()
        List(lines, id: \.self) { line in
            Text(line)
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
