//
//  FirstTabViewModel.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 3/18/25.
//

import Foundation

class FirstTabViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
}
