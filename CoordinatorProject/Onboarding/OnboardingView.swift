//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneRequested: () -> ()
    
    var body: some View {
        TabView {
            ScaledImageView(name: "mvvmImage1")
                .tag(1)
            ScaledImageView(name: "mvvmImage2")
                .tag(2)
            ScaledImageView(name: "mvvmImage3")
                .tag(3)
            
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(.page)
        .background(Color.black)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView(doneRequested: { })
}

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .ignoresSafeArea()
    }
}
