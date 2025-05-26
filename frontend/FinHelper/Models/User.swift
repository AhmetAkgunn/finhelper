import Foundation

// Kullanıcı modelini tanımlayan yapı
struct User: Identifiable {
    let id = UUID()
    var name: String
    var username: String
    var email: String
    var profileImage: String?
    var password: String
    var phoneNumber: String
    var birthDate: Date
    var gender: Gender
    
    // Cinsiyet enum'ı
    enum Gender: String, CaseIterable {
        case male = "Erkek"
        case female = "Kadın"
        case other = "Diğer"
    }
    
    // Misafir kullanıcı oluşturmak için static fonksiyon
    static func guestUser() -> User {
        User(
            name: "Suhan Dusunceli",
            username: "Suhan",
            email: "suhan@example.com",
            profileImage: nil,
            password: "",
            phoneNumber: "+90 555 555 55 55",
            birthDate: Calendar.current.date(from: DateComponents(year: 1990, month: 1, day: 1)) ?? Date(),
            gender: .male
        )
    }
    
    // Demo kullanıcı
    static let demoUser = User(
        name: "Demo User",
        username: "suhan",
        email: "suhan@example.com",
        profileImage: nil,
        password: "suhan",
        phoneNumber: "+90 555 555 55 55",
        birthDate: Calendar.current.date(from: DateComponents(year: 1990, month: 1, day: 1)) ?? Date(),
        gender: .male
    )
    
    // Kullanıcı doğrulama
    static func validateUser(username: String, password: String) -> Bool {
        return username.lowercased() == demoUser.username && 
               password == demoUser.password
    }
    
    // Kullanıcı bilgilerini güncelleme
    mutating func update(
        name: String? = nil,
        username: String? = nil,
        email: String? = nil,
        profileImage: String? = nil,
        password: String? = nil,
        phoneNumber: String? = nil,
        birthDate: Date? = nil,
        gender: Gender? = nil
    ) {
        if let name = name { self.name = name }
        if let username = username { self.username = username }
        if let email = email { self.email = email }
        if let profileImage = profileImage { self.profileImage = profileImage }
        if let password = password { self.password = password }
        if let phoneNumber = phoneNumber { self.phoneNumber = phoneNumber }
        if let birthDate = birthDate { self.birthDate = birthDate }
        if let gender = gender { self.gender = gender }
    }
} 
