//
//  ContentView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-01-10.
//

import SwiftUI
import Photos

struct DetailView: View {
    @State private var description = ""
    @State private var favourite = false
    let defaultColor = Color.white
    let defaultFaveColor = Color.yellow
    var colour: Color
    var maxChars: Int
    
    @Binding var inventoryItem: InventoryItem
    
    @State var pickerVisible = false
    @State var showCameraAlert = false
    @State var imageSource = UIImagePickerController.SourceType.camera
    
    var body: some View {
        VStack {
            Image(systemName: inventoryItem.image)
                .resizable(resizingMode: .stretch)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .background(inventoryItem.toggle ? colour : defaultColor)
                .accessibilityIdentifier("DetailImage")
            
            Toggle(isOn: $inventoryItem.toggle) {
                Text("Favourite")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .accessibilityIdentifier("FavouriteToggle")
            }
            
            TextEditor(text: Binding(
                get: {
                    inventoryItem.description
                },
                set: {
                    newValue in
                    if newValue.count <= maxChars {
                        inventoryItem.description = newValue
                    }
                }
            )
            )
            .font(.title2)
            .fontWeight(.regular)
            .accessibilityIdentifier("DetailTextEditor")
            
            Text(String(inventoryItem.description.count) + "/" + String(maxChars))
                .font(.title2)
                .fontWeight(.semibold)
                .accessibilityIdentifier("DetailText")
        }
        .padding()
        .navigationBarItems(trailing:
                                Button(action: {
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                if response && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                    self.showCameraAlert = false
                    self.imageSource = UIImagePickerController.SourceType.camera
                    self.pickerVisible.toggle()
                } else {
                    self.showCameraAlert = true
                }
            }
        }) {
            Image(systemName: "camera")
        }
            .alert(isPresented: $showCameraAlert) {
                Alert(title: Text("Error"), message: Text("Camera not available"), dismissButton: .default(Text("OK")))
            }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var inventoryItems = InventoryItems(previewMode: true)
    static var previews: some View {
        DetailView(colour: Color.yellow, maxChars: 150, inventoryItem: $inventoryItems.entries[0])
    }
}
