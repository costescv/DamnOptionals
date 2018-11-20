import UIKit

class ViewController: UIViewController {

    var firstCat: Cat?
    var secondCat: Cat?
    var thirdCat: Cat?

    @IBOutlet var secondButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    var selectedCat: Cat?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCats()
        setupButtons()
    }


    @IBAction func buttonPressed(_ sender: UIButton) {

        if sender == firstButton {
            selectedCat = firstCat
        } else if sender == secondButton {
            selectedCat = secondCat
        } else {
            selectedCat = nil
        }

        performSegue(withIdentifier: "showDetails", sender: nil)
    }

    func setupCats() {

        firstCat = Cat(name: "Fifi", age: 2, owner: nil, firstPhoto: "image1", secondPhoto: nil)

        secondCat = Cat(name: "Felix", age: nil, owner: nil, firstPhoto: nil, secondPhoto: nil)

        let address = Address(buildingNumber: "13", street: "No name street", apartmentNumber: nil)
        let thirdCatOwner = Person(firstName: "Vasi", lastName: "Vasi", address: address)
        thirdCat = Cat(name: "Kika", age: 5, owner: thirdCatOwner, firstPhoto: "kika1", secondPhoto: "kika2")
    }

    func setupButtons() {
        firstButton.setTitle(firstCat?.name, for: .normal)
        secondButton.setTitle(secondCat?.name, for: .normal)
        thirdButton.setTitle(thirdCat?.name, for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! DetailsViewController
        secondViewController.cat = selectedCat
    }
}

