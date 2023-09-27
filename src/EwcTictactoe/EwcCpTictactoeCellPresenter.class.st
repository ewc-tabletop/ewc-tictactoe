Class {
	#name : #EwcCpTictactoeCellPresenter,
	#superclass : #CpPresenter,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> cellClicked [
	| name player|
	name := self model name.
	player := self application player.
	EwcTictactoeGame uniqueInstance setOwner: player toCell: name.
]

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> renderView [
	self view renderValue: self model value disabled: self model isDisabled
]

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> viewCreated [
	super viewCreated.
	
	self view 
		when: EwcCpCellClicked 
		send: #cellClicked
		to: self 
]
