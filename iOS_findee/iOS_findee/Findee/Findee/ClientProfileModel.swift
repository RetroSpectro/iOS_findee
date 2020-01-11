//
//  ClientProfileModel.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class ClientProfileModel: UICollectionViewCell {
        static let reuseID = "ClientProfileModel"
    
    @IBOutlet weak var addQuestion: UIButton!
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var fnameTxtbx: UITextField!
    @IBOutlet weak var lnameTxtbx: UITextField!
    @IBOutlet weak var patronTxtbx: UITextField!
    @IBOutlet weak var changeProfImgBtn: UIButton!
    @IBOutlet weak var emailTxtbx: UITextField!
    let deco = Decoration()
    var proto: ProfileImageDelegate?
   
    @IBOutlet weak var errLable: UILabel!
    @IBOutlet weak var passwrdTxtbx: UITextField!
    @IBOutlet weak var phoneTxtbx: UITextField!
    @IBOutlet weak var changeInfoBtn: UIButton!
    let networkManager = NetworkManager()
    
    func setDelegate(delegate: ProfileImageDelegate)
    {
        proto = delegate
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        if var btn = addQuestion{
            btn = deco.Btn(btn: btn)
            self.contentView.addSubview(btn)
        }
        if var img = profImg{
            img = deco.img(img: self.profImg)
            self.contentView.addSubview(img)
        }
       
        
        if var button = changeInfoBtn{
            button = deco.Btn(btn: button)
            self.contentView.addSubview(button)
        }
        if var button = changeProfImgBtn{
             button = deco.Btn(btn: button)
            self.contentView.addSubview(button)
        }
        if let txt = fnameTxtbx{
                self.contentView.addSubview(txt)
        }
        if let txt = lnameTxtbx{
              self.contentView.addSubview(txt)        }
        if let txt = patronTxtbx{
              self.contentView.addSubview(txt)        }
        if let txt = emailTxtbx{
              self.contentView.addSubview(txt)        }
        if let txt = phoneTxtbx{
              self.contentView.addSubview(txt)        }
        if let txt = passwrdTxtbx{
              self.contentView.addSubview(txt)        }
    }
    
    
    
    func fillCell(with model: ClientModel)
    {
        fnameTxtbx.text = model.fname
        lnameTxtbx.text = model.lname
        patronTxtbx.text = model.oname
        emailTxtbx.text = model.email
        phoneTxtbx.text = model.phone
        
    }
    
    @IBAction func addQuestionTapped(_ sender: Any) {
        print("tapped")
    }
    
    @IBAction func ChangePhotoTapped(_ sender: Any) {
        if proto != nil{
            self.proto?.changeImage(sender: sender as! UIView)
        }
                 var user = ClientModel(fname: fnameTxtbx.text!, lname: lnameTxtbx.text!, oname: patronTxtbx.text!, question: "", img:  profImg.image!, email: emailTxtbx.text!, type: UserState.shared.getStrType(), phone: phoneTxtbx.text!)
        networkManager.saveProfileClientChanges(email: UserState.shared.log, user: user){
            (fl) in
            
            if fl
            {
                print("okkkk")
                
            }
            else{
                print("smthing went wrong")
            }
        }
        
    }
    
    @IBAction func changesTapped(_ sender: Any) {
        print("tapped");
         var user = ClientModel(fname: fnameTxtbx.text!, lname: lnameTxtbx.text!, oname: patronTxtbx.text!, question: "", img:  profImg.image!, email: emailTxtbx.text!, type: UserState.shared.getStrType(), phone: phoneTxtbx.text!)
        print("changes tapped: \(user)")
        networkManager.saveProfileClientChanges(email: UserState.shared.log, user: user){
            (fl) in
            
            if fl
            {
                print("okkkk")
                
            }
            else{
                print("smthing went wrong")
            }
        }
    }
}


extension ClientProfileModel: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.profImg.image = image
    }
}
