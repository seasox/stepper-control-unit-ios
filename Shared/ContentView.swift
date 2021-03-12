//
//  ContentView.swift
//  Shared
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Hello, world!")
            .padding()
        CommandList(showsAddDialog: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

