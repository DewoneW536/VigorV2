//
//  SignUpViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/2/21.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIGraphicsBeginImageContext(self.view.frame.size);
        UIImage(named: "signInBackgroundImage")?.draw(in: self.view.bounds);
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext();
            self.view.backgroundColor = UIColor(patternImage: image);
        }
        else{
            UIGraphicsEndImageContext();
            print("Image unavailable!");
        }
        setUpElements();
    }
    func setUpElements(){
        //Hiding the error label
        errorLabel.alpha = 0;
        
        
        Utilities.styleTextField(firstNameTextField);
        Utilities.styleTextField(lastNameTextField);
        Utilities.styleTextField(emailTextField);
        Utilities.styleTextField(passwordTextField);
        Utilities.styleFilledButton(signUpButton);
        
    }
    //Function will check fields and validate data. If everything is correct, method returns nil else return error message.
    func validateFields()->String? {
        //Check if all fields are filled in.
        if(firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            return "Please fill in the details"
        }
        //Check that password is secure:
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
        if(Utilities.isPasswordValid(cleanPassword) == false){
            //Password doesn't have enough security
            return "Password must contain at least 8 characters, including a special character and a number"
        }
        return nil;
    }
    @IBAction func signUpTapped(_ sender: Any) {
        //Here we will validate fields and create user account
        //Next, we will transition to the home screen (MKMapKit using Google Places API)
        let error = validateFields();
        if(error != nil){
            //Found an error in one of the fields
            //will show error message here:
            showError(error!);
        }
        else{
            //Create clean version of info:
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            //GoTo home screen
            Auth.auth().createUser(withEmail: email, password: password){ (result, err) in
                if(err != nil){
                    //There was an error creating user
                    self.showError("Error creating user account")
                }
                else{
                    //User made successfully; store first name and last name
                    let db = Firestore.firestore();
                    db.collection("users").addDocument(data: ["firstname":firstName,
                                                              "lastName":lastName, "uid": result!.user.uid]){ (error) in
                        if(error != nil){
                            self.showError("Error saving user data!")
                        }
                    }
                    //Transition to home screen:
                    self.transitionToHome();
                    
                    
                    
                }
                
            }
            
        }
        
    }
    func showError(_ message: String){
        errorLabel.text = message;
        errorLabel.alpha = 1;
    }
    func transitionToHome(){
        let tabBarViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? TabBarViewController
        
        view.window?.rootViewController = tabBarViewController;
        view.window?.makeKeyAndVisible()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
