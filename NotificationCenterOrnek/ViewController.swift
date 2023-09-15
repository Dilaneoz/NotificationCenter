//
//  ViewController.swift
//  NotificationCenterOrnek
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSecilenTakim: UILabel!
    
    
    @IBAction func btnTakimSecAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TakimSecViewControllerID") as! TakimSecViewController
        self.present(viewController,animated : true,completion: nil)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector : #selector(self.changeTeamName(_:)),
                                               name: NSNotification.Name(rawValue: "takimSecildiYayini"), object: nil)// NotificationCenter a ben bu olaya aboneyim diyoruz observer olarak. takimSecildiYayini diye bir yayın olduğunda ben devreye giricem ve bu yayın olduğunda changeTeamName değişkenini aktif hale getiricem
    }
    
    @objc func changeTeamName(_ notification : NSNotification) // changeTeamName fonksiyonu NSNotification tipinde bir parametre alır. bunun içinde de key value şeklinde tanımlanan bir array var. o array in içerisinde secilenTakimAdi key ine karşılık seçmiş olduğum takımın ismi gelir.
    {
        if let seciliTakim = notification.userInfo?["secilenTakimAdi" ] as? String {
            self.lblSecilenTakim.text = seciliTakim
        }
    }


}

