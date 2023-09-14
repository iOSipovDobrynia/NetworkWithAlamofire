//
//  NewCourseViewController.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 13.09.2023.
//

import UIKit

final class NewCourseViewController: UIViewController {
    
    // MARK: - Override func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
