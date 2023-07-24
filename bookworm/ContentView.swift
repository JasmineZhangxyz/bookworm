//
//  ContentView.swift
//  bookworm
//
//  Created by Jasmine Zhang on 7/23/23.
//

import SwiftUI
// import UIKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundGreen")
                    .ignoresSafeArea()
                VStack {
                    Image("BookWorm")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all)
                    HStack {
                        // Button to navigate to mainView
                        NavigationLink(destination: MainView()) {
                            Text("Go to main page")
                        }.buttonStyle(CustomButtonStyle())
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
