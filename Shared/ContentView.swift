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
        if bluetoothManager.state == .connected {
            TabView {
                NavigationView {
                    VideoModeView(showsAddDialog: false)
                        .navigationTitle("Video")
                        .disconnectButton(text: bluetoothManager.state.description, action: bluetoothManager.disconnect)
                }
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Video")
                }
                NavigationView {
                    PhotoModeView()
                        .navigationTitle("Video")
                        .disconnectButton(text: bluetoothManager.state.description, action: bluetoothManager.disconnect)
                }
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Photo")
                }
            }
        } else {
            NavigationView {
                ConnectView()
                    .navigationTitle("Stepper Control Unit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension View {
    func disconnectButton(text: String, action: @escaping () -> ()) -> some View {
        return navigationBarItems(trailing: Button(text, action: action))
    }
}
