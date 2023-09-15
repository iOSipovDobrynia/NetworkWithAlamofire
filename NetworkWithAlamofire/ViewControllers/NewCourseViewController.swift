//
//  NewCourseViewController.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 13.09.2023.
//

import UIKit

final class NewCourseViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var lessonsTF: UITextField!
    @IBOutlet var testsTF: UITextField!
    
    // MARK: - Override func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let course = Course(
            name: nameTF.text ?? "",
            imageUrl: "",
            numberOfLessons: Int(lessonsTF.text ?? "") ?? 00,
            numberOfTests: Int(testsTF.text ?? "") ?? 00
        )
        dismiss(animated: true)
    }
}
