//
//  TradeButtonsView.swift
//  Trading
//
//  Created by Ilya Ovchinnikov on 20.10.2023.
//

import SwiftUI

struct TradeButtonsView: View {

    @ObservedObject var vm: ViewModel
    @State var showDealAlert = false

    var body: some View {
        HStack(spacing: 11){
            // MARK: SellButton
            Button(
                action: {
                    vm.makeDeal()
                    showDealAlert = true
                    hideKeyboard()
                },
                label: {
                    HStack {
                        Text("Sell")
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .padding(.leading, 20)
                    .background(.customRed)
                    .cornerRadius(12)
                })
            // MARK: BuyButton
            Button(
                action: {
                    vm.makeDeal()
                    showDealAlert = true
                    hideKeyboard()
                },
                label: {
                    HStack{
                        Text("Buy")
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .padding(.leading, 20)
                    .disabled(vm.balace <= 0)
                    .background(.customGreen)
                    .cornerRadius(12)
                })

        }
        .bold()
        .font(.system(size: 24))
        .foregroundStyle(.white)
        .alert(isPresented: $showDealAlert) {
            Alert(
                title: Text("Successfully"),
                message: Text(""),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    TradeButtonsView(vm: ViewModel())
}
