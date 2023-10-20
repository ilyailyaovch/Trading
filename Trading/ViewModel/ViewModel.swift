import Foundation

class ViewModel: ObservableObject {

    @Published var users = MockUsers()
    @Published var balace = 10000
    @Published var currencyPair = "EURUSD"
    @Published var currencyPairs = Currencies()
    @Published var investmentAmount = 0
    @Published var investmentTimer = 0
    @Published var dealResult = ""

    func updateUsers() {
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            DispatchQueue.main.async {
                if let randomIndex = self.users.top.indices.randomElement() {
                    let randomDelta = Int.random(in: 50...150)
                    self.users.top[randomIndex].deposit += randomDelta
                    self.users.top[randomIndex].profit += randomDelta
                }
            }
        }
        timer.fire()
    }

    func formattTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func makeDeal(){
        let probability = Int.random(in: 0...1)
        self.balace -= self.investmentAmount
        if probability != 0 {
            let investmentCoef = Double(investmentAmount) * 1.7
            balace += Int(investmentCoef)
        }
        investmentTimer = 0
    }
}
