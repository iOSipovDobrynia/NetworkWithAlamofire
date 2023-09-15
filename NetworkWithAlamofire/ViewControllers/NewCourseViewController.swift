//
//  NewCourseViewController.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 13.09.2023.
//

import UIKit

protocol NewCourseViewControllerDelegate {
    func sendPostRequest(with data: Course)
}

final class NewCourseViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var lessonsTF: UITextField!
    @IBOutlet var testsTF: UITextField!
    
    // MARK: - Public properties
    var delegate: NewCourseViewControllerDelegate!
    
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
            numberOfLessons: Int(lessonsTF.text ?? "") ?? 0,
            numberOfTests: Int(testsTF.text ?? "") ?? 0
        )
        delegate.sendPostRequest(with: course)
        dismiss(animated: true)
    }
}
