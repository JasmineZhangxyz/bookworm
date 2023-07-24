//
//  MainView.swift
//  bookworm
//
//  Created by Jasmine Zhang on 7/23/23.
//

import SwiftUI

struct MainView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: UIImage?
    @State private var showImageCaptureError: Bool = false
    @State private var showLoading: Bool = false
    
    var body: some View {
        ZStack {
            Color("backgroundGreen")
                .ignoresSafeArea()
                .navigationBarTitle(Text("Home"))
            VStack {
                Button("Take Picture") {
                    self.showImagePicker.toggle()
                }.buttonStyle(CustomButtonStyle())
                Text("Recent Searches")
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: processImage) {
            ImagePicker(image: self.$image, showImageCaptureError: self.$showImageCaptureError) // Pass the new state variable
        }
        .alert(isPresented: $showImageCaptureError) {
            Alert(title: Text("Error"), message: Text("Failed to capture image."), dismissButton: .default(Text("OK")))
        }
        .overlay(
            // Display loading page when showLoading is true
            LoadingPageView(showLoading: $showLoading)
        )
    }
    func processImage() {
        showLoading = true
        
        // Save the image here (Simulated delay using DispatchQueue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            showLoading = false // Hide loading page after processing
            
            if let image = image {
                // Convert the UIImage to Data
                if let imageData = image.jpegData(compressionQuality: 0.8) {
                    // Save the Data to UserDefaults
                    UserDefaults.standard.set(imageData, forKey: "capturedImageData")
                    print("Image saved to UserDefaults")
                } else {
                    print("Failed to convert image to Data")
                }
            } else {
                print("No image captured")
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
