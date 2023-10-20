import SwiftUI

struct TradeCurrencyPairView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: ViewModel
    @Binding var currency: String

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.windowBackground
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.currencyPairs.pairs, id: \.self) { pair in
                            Button(
                                action: {
                                    vm.currencyPair = pair
                                    currency = pair
                                    dismiss()
                                },
                                label: {
                                    Text(pair)
                                        .padding(.vertical, 18)
                                        .padding(.horizontal, 30)
                                        .foregroundStyle(.white)
                                        .background(.shapeBackground)
                                        .cornerRadius(12)

                                }).disabled(pair == vm.currencyPair)
                        }
                    }.padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .background(.windowBackground)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.windowBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Currency pair")
                        .bold()
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                }
            }
        }
    }
}

#Preview {
    // TradeCurrencyPairView(vm: ViewModel())
    TradeCurrencyPairView(vm: ViewModel(), currency: .constant("EURUSD"))
}
