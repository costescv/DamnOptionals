struct Person {
    let firstName: String
    let lastName: String
    let address: Address?
}

struct Address {
    var buildingNumber: String
    var street: String
    var apartmentNumber: String?
}
