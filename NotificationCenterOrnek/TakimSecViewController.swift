//
//  TakimSecViewController.swift
//  NotificationCenterOrnek
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 19.03.2023.
//

import UIKit

class TakimSecViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
    let takimlar = ["Galatasaray","Fenarbahçe","Beşiktaş","Trabzonspor"]
    var seciliTakim = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return takimlar.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return takimlar[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    seciliTakim = takimlar[row]
                 //key       value
        let dict : [String : String] = ["secilenTakimAdi" : seciliTakim] // dictionary yapısı key ve value şeklinde veri tutmamızı sağlayan array lardir.
        //broadcast yayın oluşturdum yayinin adı takimSecildiYayini
        //112 911
        print(dict)
        NotificationCenter.default.post(name : NSNotification.Name(rawValue : "takimSecildiYayini"),object : nil, userInfo: dict) // burada, pickerview da ilgili eleman seçildiğinde, takimSecildiYayini diye bir olay başlatıyoruz. NotificationCenter a bir haber olduğunun yayınını yapıyoruz
        // bu yayını kim dinliyorsa bu yayın olduğunda ben devreye girerim diyecek. telefonun şarjı bittiğide de şarjının bittiğiyle ilgili bir yayın yapılır ve bu yayından sorumlu kimse o olayı yakalıyor ve bu benimle ilgili bir problemdir diyor.  bunu da ViewController a gidip addObserver ile yaparız
        
    self.dismiss(animated: true, completion: nil) // sayfayı kapat
    }


}
