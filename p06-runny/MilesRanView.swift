//
//  MilesRanView.swift
//  p06-runny
//
//  Created by Bailey Van Wormer on 3/8/22.
//

import SwiftUI

struct MilesRanView: View {
    
    @StateObject var viewModel: MilesRanViewModel = MilesRanViewModel()
    
    var body: some View {
        VStack {
            Text("RUNNYYYYYYYYY")
                .font(.title)
                .bold()
            Text("\(viewModel.milesRan, specifier: "%.2f")")
                .padding()
                .font(.title)
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.increment(amount: 0.5)
                } label: {
                    Image(systemName: "chevron.up")
                        .foregroundColor(.primary)
            }
                Spacer()
                
                Button {
                    viewModel.decrement(amount: 0.5)
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.primary)
                    
                }
                Spacer()
        }
        

        }

    }
}

struct MilesRanView_Previews: PreviewProvider {
    static var previews: some View {
        MilesRanView()
    }
}
