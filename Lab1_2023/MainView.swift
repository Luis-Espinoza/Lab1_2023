//
//  MainView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-01-17.
//

import SwiftUI

struct MainView: View {
    @State private var showSettings = false
    @State var colour = array2color(array: UserDefaults.standard.object(forKey:
                                                                            "BackgroundColour") as? [CGFloat] ?? color2array(colour:
                                                                                                                                Color.yellow))
    @State var maxChars = UserDefaults.standard.object(forKey: "MaxCharacterCount") as? Int ?? 150
    var body: some View {
        NavigationStack() {
            VStack {
                if showSettings {
                    SettingsView(colour: $colour, maxChars: $maxChars)
                }
                else {
                    DetailView(colour: colour, maxChars: maxChars)
                }
            }
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            showSettings.toggle()
                        },
                        label: {
                            Image(systemName: showSettings ? "house" : "gear")
                        }
                    )
                    .accessibilityIdentifier("NavigationButton")
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
