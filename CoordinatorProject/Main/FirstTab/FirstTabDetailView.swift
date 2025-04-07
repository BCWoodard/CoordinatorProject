//
//  FirstTabDetailView.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import SwiftUI

struct FirstTabDetailView: View {
    
    @ObservedObject var viewModel: FirstTabViewModel
    var body: some View {
        VStack {
            Text("First Detail")
            
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct FirsttabdetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabDetailView(viewModel: FirstTabViewModel())
    }
}
