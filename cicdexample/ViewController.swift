//
//  ViewController.swift
//  cicdexample
//
//  Created by Leyner Castillo on 17/05/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private(set) weak var nameTextField: UITextField!
    @IBOutlet private(set) weak var greetingLabel: UILabel!
    @IBOutlet private(set) weak var actionButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup
    private func setup() {
        setupTextField()
        resetGreeting()
        setupActionButton()
    }

    private func setupTextField() {
        nameTextField.placeholder = "Insert your name here"
        nameTextField.delegate = self
    }

    private func setupActionButton() {
        actionButton.setTitle("Reset", for: .selected)
        actionButton.setTitleColor(.blue, for: .selected)
        actionButton.setTitle("Greet me", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        resetForm()
    }

    // MARK: - Helper
    private func resetForm() {
        resetGreeting()
        nameTextField.text = ""
        nameTextField.alpha = 1
        actionButton.isEnabled = false
        updateActionButton()
    }

    private func resetGreeting() {
        greetingLabel.text = ""
        greetingLabel.alpha = 0
    }

    private func buildGreeting(name: String) {
        greetingLabel.text = "Have a nice day \(name)"
        greetingLabel.alpha = 1
        nameTextField.text = ""
        nameTextField.alpha = 0
    }

    private func updateActionButton() {
        actionButton.backgroundColor = actionButton.isSelected ? .white : actionButton.isEnabled ? .blue : .blue.withAlphaComponent(0.7)
    }

    // MARK: - Action
    @IBAction func didTapActionButton(_ sender: UIButton) {
        sender.isSelected.toggle()

        if sender.isSelected, let name = nameTextField.text {
            buildGreeting(name: name)
        } else {
            resetForm()
        }

        updateActionButton()
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    @discardableResult
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        actionButton.isEnabled = !updatedText.isEmpty
        updateActionButton()

        return true
    }
}
