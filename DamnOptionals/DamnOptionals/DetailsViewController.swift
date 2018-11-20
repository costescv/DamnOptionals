import UIKit

class DetailsViewController: UIViewController {

    var cat: Cat!

    @IBOutlet var catAddress: UILabel!
    @IBOutlet var ownerName: UILabel!
    @IBOutlet var catName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        catName.text = cat.name
        ownerName.text = cat.owner!.firstName

        setCatAddressValue()
    }

    func setCatAddressValue() {
        if let owner = cat.owner {
            if let address = owner.address {
                if let apartmentNumber = address.apartmentNumber {
                    catAddress.text = "\(apartmentNumber) - \(address.street) - \(address.buildingNumber)"
                } else {
                    catAddress.text = "\(address.street) - \(address.buildingNumber)"
                }
            } else {
                catAddress.text = "Unknown"
            }
        } else {
            catAddress.text = "Cat doesn't have owner"
        }
    }
}
