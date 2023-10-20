import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct TradeSettingsView: View {

    @ObservedObject var vm: ViewModel
    @State var investmentAmount = ""
    @State var timerSecondsAmount = 0

    var body: some View {
        HStack(spacing: 11) {
            // MARK: Timer
            HStack {
                Spacer()
                VStack(spacing: 6){
                    Text("Timer")
                        .font(.system(size: 12))
                    HStack {
                        // MARK: Min
                        Button(
                            action: {
                                if timerSecondsAmount > 0 {
                                    timerSecondsAmount -= 1
                                }
                            }, label: {
                                Image(systemName: "minus.circle")
                            }
                        )
                        // MARK: Time
                        Text("\(vm.formattTime(timerSecondsAmount))")
                            .padding(.horizontal)
                            .bold()
                        // MARK: Plus
                        Button(
                            action: {
                                timerSecondsAmount += 1
                            }, label: {
                                Image(systemName: "plus.circle")
                            }
                        )
                    }
                }.padding(.vertical, 10)
                Spacer()
            }
            .foregroundStyle(.white)
            .background(.shapeBackground)
            .cornerRadius(12)
            // MARK: Investment
            HStack {
                Spacer()
                VStack(spacing: 6){
                    Text("Investment").font(.system(size: 12))
                    HStack {
                        // MARK: Min
                        Button(
                            action: {
                                var intAmount = Int(investmentAmount) ?? 0
                                intAmount -= 100
                                intAmount = intAmount < 0 ? 0 : intAmount
                                vm.investmentAmount = intAmount
                                investmentAmount = String(vm.investmentAmount)
                            },
                            label: {
                                Image(systemName: "minus.circle")
                            }
                        )
                        // MARK: Amount
                        TextField(
                            "Amount",
                            text: Binding<String>(
                                get: { investmentAmount },
                                set: {
                                    if let value = Int($0) {
                                        if value <= vm.balace {
                                             vm.investmentAmount = value
                                            investmentAmount = String(value)
                                        } else {
                                            investmentAmount = String(vm.balace)
                                        }
                                    }
                                }),
                            prompt: Text("Amount").foregroundColor(.gray)
                        )
                        .bold()
                        .font(.system(size: 16))
                        .keyboardType(.numberPad)
                        // MARK: Plus
                        Button(
                            action: {
                                var intAmount = Int(investmentAmount) ?? 0
                                intAmount += 100
                                intAmount = intAmount > vm.balace ? vm.balace : intAmount
                                vm.investmentAmount = intAmount
                                investmentAmount = String(intAmount)
                            },
                            label: {
                                Image(systemName: "plus.circle")
                            }
                        )
                    }
                }.padding(.vertical, 10)
                Spacer()
            }
            .foregroundStyle(.white)
            .background(.shapeBackground)
            .cornerRadius(12)
        }
    }
}

#Preview {
    TradeSettingsView(vm: ViewModel(), investmentAmount: "0")
}
