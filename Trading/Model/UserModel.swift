import Foundation

// MARK: User
struct UserModel: Identifiable, Codable{
    let id: String
    let position: Int
    let country: String
    let name: String
    var deposit: Int
    var profit: Int

    init(id: String = UUID().uuidString,
         position: Int,
         country: String,
         name: String,
         deposit: Int,
         profit: Int) {
        self.id = id
        self.position = position
        self.country = country
        self.name = name
        self.deposit = deposit
        self.profit = profit
    }
}

// MARK: Mock users
struct MockUsers {
    var top = [
        UserModel(position: 1, country: "🇺🇸", name: "Oliver", deposit: 2000, profit: 1000),
        UserModel(position: 2, country: "🇨🇦", name: "Jack", deposit: 1600, profit: 912),
        UserModel(position: 3, country: "🇧🇷", name: "Henry", deposit: 1500, profit: 864),
        UserModel(position: 4, country: "🇰🇷", name: "Jacob", deposit: 1100, profit: 752),
        UserModel(position: 5, country: "🇩🇪", name: "Susan", deposit: 1000, profit: 724),
        UserModel(position: 6, country: "🇧🇷", name: "George", deposit: 900, profit: 546),
        UserModel(position: 7, country: "🇺🇸", name: "Tom", deposit: 860, profit: 478),
        UserModel(position: 8, country: "🇷🇺", name: "Nick", deposit: 720, profit: 648),
        UserModel(position: 9, country: "🇮🇳", name: "Oscar", deposit: 600, profit: 654),
        UserModel(position: 10, country: "🇺🇸", name: "William", deposit: 533, profit: 444)
    ]
}

// MARK: Mock currency pairs
struct Currencies {
    var pairs = [
        "EURUSD",
        "GBPUSD",
        "USDJPY",
        "AUDUSD",
        "USDCAD",
        "USDCHF",
        "EURGBP",
        "EURCHF"
    ]
}
