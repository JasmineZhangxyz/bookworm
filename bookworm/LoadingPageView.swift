//
//  LoadingPageView.swift
//  bookworm
//
//  Created by Jasmine Zhang on 7/23/23.
//

import SwiftUI
import AVKit

struct LoadingPageView: View {
    @Binding var showLoading: Bool

    var body: some View {
        ZStack {
            Color("backgroundGreen")
                .ignoresSafeArea()
            VStack {
                Image("BookWorm Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                // Customize your loading view here
                Text("Finding reviews now...")
                    .font(.title)
            }
        }
        .opacity(showLoading ? 1 : 0) // Show/hide the view based on showLoading value
    }
}

struct LoadingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageView(showLoading: .constant(true))
    }
}

