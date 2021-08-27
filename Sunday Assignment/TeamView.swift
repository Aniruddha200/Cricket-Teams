//
//  TeamView.swift
//  Sunday Assignment
//
//  Created by administrator on 27/08/2021.
//

import SwiftUI

struct TeamView: View {
	@State var playerList: [CountryModel]
	@State private var isActionBarShowing = false
	var body: some View {
		List{
			ForEach(playerList){player in
				
				Text("\(player.name)")
				
			}
			
		}
		.actionSheet(isPresented: $isActionBarShowing){
			ActionSheet(title: Text("Filter"), message: Text("Select the attribute to filter"), buttons: [.default(Text("Firstname"), action: {
				self.playerList.sort(by: {$0.firstName < $1.firstName})
			}),.default(Text("Surname"), action: {
				self.playerList.sort(by: {$0.lastName < $1.lastName})
			}),.cancel()])
		}
		
		.navigationBarTitle("Team View", displayMode: .inline)
		.navigationBarItems(trailing: Button(action: {
			isActionBarShowing.toggle()
		}){
			Image(systemName: "plus")
		})
	}
}
