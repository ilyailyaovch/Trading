import SwiftUI

struct TradeView: View {

    @ObservedObject var vm: ViewModel
    @State var chosenCurrency = "EURUSD"

    var body: some View {
        NavigationStack {
            ZStack {
                Color.windowBackground
                ScrollView(showsIndicators: false) {
                    VStack {
                        Balance.padding(.horizontal, 30)
                        WebView
                        Instruments.padding(.horizontal, 30)
                    }
                    .padding(.top)
                    .onTapGesture { hideKeyboard() }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.windowBackground)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.windowBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Trade")
                        .bold()
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                }
            }

        }
    }
    var Balance: some View {
        // MARK: Balance
        HStack {
            Spacer()
            VStack(spacing: 6){
                Text("Balance")
                    .font(.system(size: 12))
                Text("\(vm.balace)")
                    .bold()
                    .font(.system(size: 27))
            }.padding(.vertical, 8)
            Spacer()
        }
        .foregroundStyle(.white)
        .background(.shapeBackground)
        .cornerRadius(12)
    }
    var WebView: some View {
        // MARK: TradeWidgetView
        TradeWidgetView(selectedCurrency: .constant(chosenCurrency))
            .frame(height: 321)
            .padding(.vertical, 16)
    }
    var Instruments: some View {
        // MARK: Instruments
        VStack {
            NavigationLink(destination: TradeCurrencyPairView(vm: vm, currency: $chosenCurrency)) {
                HStack {
                    Spacer()
                    Text(vm.currencyPair)
                        .font(.system(size: 16))
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(.trailing, 15)
                }
                .padding(.vertical, 18)
                .foregroundStyle(.white)
                .background(.shapeBackground)
                .cornerRadius(12)
            }
            TradeSettingsView(vm: vm)
            TradeButtonsView(vm: vm)
        }
    }
}

#Preview {
    TradeView(vm: ViewModel())
}
