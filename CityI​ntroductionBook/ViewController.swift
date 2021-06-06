//
//  ViewController.swift
//  CityI​ntroductionBook
//
//  Created by Harun on 6.06.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cityArray = [City]()
    var selectedCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let istanbul = City(
            cityName: "Istanbul",
            cityRegion: "Marmara Bolgesi",
            cityDescription: "İstanbul, Türkiye'de Marmara Bölgesi'nde yer alan şehir ve Türkiye Cumhuriyeti Devletinin 81 ilinden biridir. Ülkenin nüfus bakımından en çok göç alan ve en kalabalık ilidir. Ekonomik, tarihi ve sosyo-kültürel açıdan önde gelen şehirlerden biridir. Şehir, iktisadi büyüklük açısından dünyada 34. sırada yer alır. ",
            cityImageName: "istanbul")
        let ankara = City(
            cityName: "Ankara",
            cityRegion: "Ic Anadolu Bolgesi",
            cityDescription: "Ankara, Türkiye'nin başkenti ve en kalabalık ikinci ilidir. Nüfusu 2020 itibarıyla 5.663.322 kişidir. Bu nüfus; 25 ilçe ve bu ilçelere bağlı 1425 mahallede yaşamaktadır. İl genelinde nüfus yoğunluğu 215'tir.",
            cityImageName: "ankara")
        let izmir = City(
            cityName: "Izmir",
            cityRegion: "Ege Bolgesi",
            cityDescription: "İzmir, Türkiye'nin bir ili ve en kalabalık üçüncü şehridir. Nüfusu 2020 itibarıyla 4.394.694 kişidir. Bu nüfus; 30 ilçe ve bu ilçelere bağlı 1.297 mahallede yaşamaktadır. İl genelinde nüfus yoğunluğu 369,5'tir. Coğrafi olarak Türkiye'nin batısında bulunur ve ilin tamamı Ege Bölgesi'nde yer alır. ",
            cityImageName: "izmir")
        let diyarbakir = City(
            cityName: "Diyarbakir",
            cityRegion: "Guneydogu Anadolu Bolgesi",
            cityDescription: "Diyarbakır, Türkiye'nin bir ili ve en kalabalık on ikinci şehri. TÜİK ADNKS verilerine göre 2020 sonu itibarıyla 1.783.431 kişilik nüfusa sahiptir. İlin yüz ölçümü 15.272 km²'dir. Valiliğin denizden yüksekliği 674 m'dir. Diyarbakır kent merkezi yaklaşık 9000 yıllık bir geçmişe sahiptir.",
            cityImageName: "diyarbakir")
        let antalya = City(
            cityName: "Antalya",
            cityRegion: "Akdeniz Bölgesi",
            cityDescription: "Antalya, Türkiye'nin bir ili ve en kalabalık beşinci şehridir. 2020 sonu itibarıyla il nüfusu 2.548.308'dır. Türkiye'de 'turizmin başkenti' olarak görülmektedir. Şehrin yüz ölçümü 20.177 km²dir. İlde km²ye 115 kişi düşmektedir. En kalabalık ilçesi 2019 yılı itibarıyla 556.033 kişiyle Kepez ilçesidir.",
            cityImageName: "antalya")
        let trabzon = City(
            cityName: "Trabzon",
            cityRegion: "Karadeniz Bölgesi",
            cityDescription: "Trabzon, Türkiye'nin bir ili ve en kalabalık yirmi yedinci şehridir. TÜİK verilerine göre ise Trabzon’un 2020 nüfusu 811.901 oldu. Erkeklerin nüfusu 402 Bin 224, kadınların nüfusu ise 409 Bin 677 oldu. Karadeniz Bölgesi'nin Doğu Karadeniz Bölümü'nde yer alan ilin Karadeniz'e kıyısı bulunur.",
            cityImageName: "trabzon")
        let erzurum = City(
            cityName: "Erzurum",
            cityRegion: "Dogu Anadolu Bolgesi Bölgesi",
            cityDescription: "Erzurum, Türkiye'de yer alan şehir ve ülkenin 81 ilinden biridir. Erzurum ovasının güneydoğu kenarında, bu ova ile Palandöken dağının temas sahasında kurulmuş olan Erzurum şehri, 758.279 nüfusu ile Doğu Anadolu Bölgesi'nin en büyük üçüncü ilidir.",
            cityImageName: "erzurum")
        
        cityArray.append(istanbul)
        cityArray.append(ankara)
        cityArray.append(izmir)
        cityArray.append(diyarbakir)
        cityArray.append(antalya)
        cityArray.append(trabzon)
        cityArray.append(erzurum)
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "City Indruction Book"
        default:
            return "Section \(section)"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cityArray[indexPath.row].cityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = cityArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.city = selectedCity
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cityArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    


}

