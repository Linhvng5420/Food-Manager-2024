//
//  UIRating.swift
//  FoodManager2024
//  Gap - Spacing: 8
//
//  Created by  User on 23.04.2024.
//

import UIKit

class UIRating: UIStackView {
    // MARK: Properties
    private var ratingValue=0
    private var arrRatingButton=[UIButton]()
    
    //them property vao panel attribute cua Rating Button
    @IBInspectable private var starNum:Int=5 {
        didSet {
            
            ratingSettup()
        }
    }
    
    @IBInspectable private var starSize:CGSize=CGSize(width: 50.0, height: 44.0) {
        didSet {
            ratingSettup()
        }
    }
    
    // MARK: Contructors
    /*
     * UI luon can co 2 contructer (frame & coder)
     * init phai goi super theo loai
     *
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ratingSettup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        ratingSettup()
    }
    
    // MARK: Ham xay dung doi tuong UIRating
    private func ratingSettup() {
        //reset star button
        for btn in arrRatingButton {
            btn.removeFromSuperview()
            removeArrangedSubview(btn)
        }
        arrRatingButton.removeAll()
        
        //load anh tu file
        let normal = UIImage(named: "normal")
        let pressed = UIImage(named: "pressed")
        let selected = UIImage(named: "selected")
        
        //tao button rating
        for _ in 0..<starNum {
            //tao btnRating moi
            let btnRating = UIButton()
            
            //thay doi kich thuoc mac dinh cua btnRating
            //* sau khi dat contraint(width-height) thi phai active ngay
            btnRating.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            btnRating.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            
            //            backgroundColor
            //            btnRating.backgroundColor = UIColor.red
            
            //set anh cho button
            btnRating.setImage(normal, for: .normal)
            btnRating.setImage(pressed, for: .highlighted)
            btnRating.setImage(selected, for: .selected)
            
            //bat su kien khi nhan Ngoi Sao (btnRating)
            btnRating.addAction(UIAction(handler: {action in
                //                print("Called:Tap Star")
                
                //ep kieu
                if action.sender is UIButton {
                    //lay index cua btnRating trong mang (firstIndexOf ~ IndexOf)
                    let index = self.arrRatingButton.firstIndex(of: btnRating)
                    let newValue=index!+1 //
                    
                    self.ratingValue = self.ratingValue == newValue ? newValue - 1 : newValue
                    
//                    print("New Rating: \(self.ratingValue)")
                    
                    //danh gia
                    self.updateSelectLeftStar()
                }
                
            }), for: .touchUpInside)
            
            //Quan Ly: dua btnRating vao mang arrRatingButton
            arrRatingButton.append(btnRating)
            
            //END: dua btnRating vao StackView (UIRating)
            addArrangedSubview(btnRating)
        }
        
        //cap nhat trang thai rating button
        updateSelectLeftStar()
    }
        
        
        // MARK: (Danh Gia) Active tat ca Ngoi Sao ben trai Ngoi Sao duoc chon (index)
        private func updateSelectLeftStar() {
            for (index, btn) in arrRatingButton.enumerated() {
//                if index < ratingValue {
//                    btn.isSelected = true
//                } else {
//                    btn.isSelected = false
//                }
                
                btn.isSelected = index < ratingValue ? true : false
            }
    }
}
