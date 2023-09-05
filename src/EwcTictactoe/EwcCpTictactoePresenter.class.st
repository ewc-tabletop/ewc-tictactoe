Class {
	#name : #EwcCpTictactoePresenter,
	#superclass : #CpPresenter,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoePresenter >> renderView [
	self model cells do: [ :cell | self renderChildViewForModel: cell atSlotNamed: cell name ]
]
