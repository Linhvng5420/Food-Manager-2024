//
//  MealDetailController.swift
//  FoodManager2024
//
//  Created by  User on 16.04.2024.
//

import UIKit

//UY QUYEN 3 BUOC
//1. tich hop cac ham uy quyen cua uitextview vao class
class MealDetailController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: properties
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var mealImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3. Thuc Hien Uy Quyen
        mealName.delegate = self
    }
    
    // MARK: 2. dinh nghia lai cac ham duoc uy quyen (override)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TexField-called")
        print("\(mealName.text!)")
        
        //an di ban phim
        mealName.resignFirstResponder()
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) //bat animation chuyen man hinh
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("ImageSelected-Called")
        
        //su dung dictionary (info: [UIImagePickerController.InfoKey : Any])
        if let image = info[.originalImage] {
            mealImage.image = image as? UIImage
        }
        
        // Quay ve man hinh truoc
        dismiss(animated: true)
    }
    
    
    // MARK: 4.Bat su kien cho imageview de lay anh trong thu vien
    @IBAction func imagePicker(_ sender: UITapGestureRecognizer) {
        print("imagePicker-called")
        
        //an ban phim
        mealName.resignFirstResponder()
        
        //tao doi tuong UIImagePickerController
        let imagePicker = UIImagePickerController()
        
        //cau hinh cho doi tuong imagePicker
        imagePicker.sourceType = .photoLibrary
        
        //uy quyen upload imagePicker
        imagePicker.delegate = self
        
        //chuyen sang man hinh imagePicker
        present(imagePicker, animated: true)
        
        
    }
    
}

