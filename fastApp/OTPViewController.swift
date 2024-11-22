//
//  OTPViewController.swift
//  fastApp
//
//  Created by 김익두 on 11/22/24.
//

import UIKit

class OTPViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberField: UITextField! // Text field for entering phone number
    @IBOutlet weak var timerLabel: UILabel!          // Label to show the timer countdown
    @IBOutlet weak var getOTPButton: UIButton!       // Button to request OTP
    @IBOutlet weak var otpTextField: UITextField!    // Text field to enter the OTP (initially hidden)
    @IBOutlet weak var enterButton: UIButton!
    
    var timer: Timer?
    var countdown = 30
    var currentOTP: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpTextField.isHidden = true
        enterButton.isHidden = true
        timerLabel.isHidden = true
    }
    
    // Action for the "Get OTP" button
    @IBAction func getOTPButtonTapped(_ sender: UIButton) {
        guard let phoneNumber = phoneNumberField.text, !phoneNumber.isEmpty, isPhoneNumber(phoneNumber) else {
            showAlert(message: "It should be a phone number!")
            return
        }
        
        // Generate and show the OTP after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.generateAndShowOTP()
        }
        
        // Start the timer and show the timer label
        startCountdown()
        timerLabel.isHidden = false
        
        // Make the OTP text field and Enter button visible
        otpTextField.isHidden = false
        enterButton.isHidden = false
    }
    
    // Action for the "Enter" button
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        guard let enteredOTP = otpTextField.text, !enteredOTP.isEmpty else {
            showAlert(message: "Please enter the OTP.")
            return
        }
        
        // Check if the entered OTP matches the generated OTP
        if enteredOTP == currentOTP {
            // Transition to CustomTabBarController
            if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
                navigationController?.pushViewController(tabBarVC, animated: true)
            }
        } else {
            showAlert(message: "Incorrect OTP. Please try again.")
        }
    }
    
    // basic check for digits only
    private func isPhoneNumber(_ input: String) -> Bool {
        let phoneRegex = "^[0-9]{10,15}$" // Example: 10 to 15 digits
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: input)
    }
    
    // 4 digit otp gen/show
    private func generateAndShowOTP() {
        // Generate a random 4-digit OTP
        currentOTP = String(format: "%04d", Int.random(in: 0...9999))
        
        // Simulate a text message popup
        showTextMessagePopup(sender: "Verification", message: "Your OTP is \(currentOTP)")
    }
    
    private func startCountdown() {
        countdown = 30 // Reset countdown to 30 seconds
        timer?.invalidate() // Stop any existing timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Function called every second by the timer
    @objc private func updateTimer() {
        if countdown > 0 {
            countdown -= 1
            timerLabel.text = "Time left: \(countdown)s"
        } else {
            timer?.invalidate()
            timer = nil
            timerLabel.text = "OTP expired. Please resend."
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showTextMessagePopup(sender: String, message: String) {
        let popupView = UIView(frame: CGRect(x: 10, y: -100, width: view.frame.width - 20, height: 100))
        popupView.backgroundColor = .systemGray6
        popupView.layer.cornerRadius = 10
        popupView.clipsToBounds = true
        
        let senderLabel = UILabel(frame: CGRect(x: 10, y: 10, width: popupView.frame.width - 20, height: 20))
        senderLabel.text = sender
        senderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        senderLabel.textColor = .black
        popupView.addSubview(senderLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 10, y: 40, width: popupView.frame.width - 20, height: 50))
        messageLabel.text = message
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .darkGray
        messageLabel.numberOfLines = 2
        popupView.addSubview(messageLabel)
        
        view.addSubview(popupView)
        
        UIView.animate(withDuration: 0.5, animations: {
            popupView.frame.origin.y = 40
        })
    }
}
