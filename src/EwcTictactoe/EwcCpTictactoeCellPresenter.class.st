Class {
	#name : #EwcCpTictactoeCellPresenter,
	#superclass : #CpPresenter,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> cellClicked [
	self model changeOwner
]

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> renderView [
	self view renderValue: self model value
]

{ #category : #accessing }
EwcCpTictactoeCellPresenter >> viewCreated [
	super viewCreated.
	
	self view 
		when: EwcCpCellClicked 
		send: #cellClicked
		to: self 
]
