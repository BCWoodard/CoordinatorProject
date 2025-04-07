//
//  FirstTabViewController.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import Combine

class FirstTabViewController: UIViewController {
    
    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> () = {}
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupInfoLabel()
        setupDetailButton()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        infoLabel?.text = "\(viewModel.name) with email: \(viewModel.email)"
//    }
    
    func setupDetailButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Go to Detail", for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func setupInfoLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        self.view.addSubview(infoLabel)
        self.infoLabel = infoLabel
        
        viewModel.$email.combineLatest(viewModel.$name)
            .sink { [weak self] email, name in
                if name.isEmpty && email.isEmpty {
                    self?.infoLabel?.text = nil
                }
                self?.infoLabel?.text = "\(name) with email: \(email)"
            }
            .store(in: &subscriptions)
    }
    
    @objc func buttonAction() {
        showDetailRequested()
    }
}
