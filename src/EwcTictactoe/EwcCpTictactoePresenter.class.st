Class {
	#name : #EwcCpTictactoePresenter,
	#superclass : #CpPresenter,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #rendering }
EwcCpTictactoePresenter >> renderView [
	self model cells
		do: [ :cell | self renderChildViewForModel: cell atSlotNamed: cell name ].
	self view textContent: self model playerStatus
]
