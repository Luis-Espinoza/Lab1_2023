//
//  SettingsView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-01-17.
//

import SwiftUI

struct SettingsView: View {
    @Binding var colour: Color
    @Binding var maxChars: Int
    let step = 10
    let range = 10...300
    var body: some View {
        VStack {
            ColorPicker("Background", selection: Binding(
                get: {
                    colour
                },
                set: {newValue in
                    colour = newValue
                    UserDefaults.standard.set(color2array(colour: colour), forKey:
                    "BackgroundColour")
            }
            )
            )
                .padding()
                .font(.title2)
                .fontWeight(.semibold)
            
                Stepper(value: Binding(
                    get: {
                        maxChars
                    },
                    set: {newValue in
                        maxChars = newValue
                        UserDefaults.standard.set(maxChars, forKey: "MaxCharacterCount")
                    }
                ),
                        in: range,
                        step: step) {
                    Text("Max Character Count: \(maxChars)")
                        .font(.title2)
                        .fontWeight(.semibold)
                }.padding(15)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var colour = Color.yellow
    @State static var maxChars = 150
    var colour: Color
    static var previews: some View {
        SettingsView(colour: $colour, maxChars: $maxChars)
    }
}

func color2array(colour: Color) -> [CGFloat] {
    let uiColor = UIColor(colour)
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return [red, green, blue, alpha]
}

func array2color(array: [CGFloat]) -> Color {
    return Color(Color.RGBColorSpace.sRGB, red: array[0], green: array[1], blue: array[2], opacity:
                    array[3])
}
