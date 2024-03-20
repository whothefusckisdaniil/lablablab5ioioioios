import SwiftUI

struct WalletView: View {
    @Binding var budget: Budget
    
    var body: some View {
        VStack {
            Text("Balance: \(budget.balance) KZT")
                .font(.title)
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Expenses")
                        .font(.headline)
                    ProgressBar(value: budget.expenses / (budget.expenses + budget.income))
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Income")
                        .font(.headline)
                    ProgressBar(value: budget.income / (budget.expenses + budget.income))
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}

struct ProgressBar: View {
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(self.value > 0.5 ? Color.green : Color.red)
                    .animation(.linear)
            }
        }
        .cornerRadius(5.0)
    }
}
