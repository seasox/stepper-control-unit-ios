//
//  ContentView.swift
//  Shared
//
//  Created by Jeremy Boy on 06.03.21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: CommandStore
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        CommandList()
        Button("add") {
            store.append(Command(title: "Foo", commands: ["Lorem", "Ipsum"]))
            store.persist()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

