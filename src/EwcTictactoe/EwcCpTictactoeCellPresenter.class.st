Class {
	#name : #EwcCpTictactoeCellPresenter,
	#superclass : #CpPresenter,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #'event handling' }
EwcCpTictactoeCellPresenter >> cellClicked [
	self application player
		ifNotNil: [ self model setOwner: self application player ]
]

{ #category : #rendering }
EwcCpTictactoeCellPresenter >> renderView [
	self view renderValue: self model value
]

{ #category : #view }
EwcCpTictactoeCellPresenter >> viewCreated [
	super viewCreated.
	
	self view 
		when: EwcCpCellClicked 
		send: #cellClicked
		to: self 
]
