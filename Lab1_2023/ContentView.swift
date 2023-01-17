//
//  ContentView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var description = ""
    @State private var favourite = false
    var body: some View {
        VStack {
            Image(systemName: "tortoise.fill")
                .resizable(resizingMode: .stretch)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .background(favourite ? Color.yellow : Color.white)
            Toggle(isOn: $favourite) {
                Text("Favourite")
            }
            TextEditor(text: $description)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
