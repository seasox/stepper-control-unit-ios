//
//  ContentView.swift
//  Shared
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var bluetoothManager: BluetoothManager
    
    var body: some View {
        TabView {
            CommandList(showsAddDialog: false)
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Video")
                }
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Camera")
                }
        }
        //.isHidden(self.bluetoothManager.state == .unsupported)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

