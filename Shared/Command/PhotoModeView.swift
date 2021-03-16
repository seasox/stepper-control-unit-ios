//
//  PhotoModeView.swift
//  StepperControl
//
//  Created by Jeremy Boy on 16.03.21.
//

import SwiftUI

struct PhotoModeView: View {
    var body: some View {
        VStack {
            TextCommandView(withLabel: true, command: .exposure)
            TextCommandView(withLabel: true, command: .offset)
            TextCommandView(withLabel: true, command: .runtime)
            HStack {
                ButtonCommandView(command: .runSMS)
                ButtonCommandView(command: .stopSMS)
            }
        }
    }
}

struct PhotoModeView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoModeView()
    }
}
