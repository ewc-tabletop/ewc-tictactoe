Class {
	#name : #EwcCpTictactoeCell,
	#superclass : #CpModel,
	#instVars : [
		'owners',
		'name'
	],
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeCell class >> withIndex: anIndex [
	^ self new
		name: 'cell', ((anIndex - 1) // 3 + 1) asString, ((anIndex - 1) \\ 3 + 1) asString;
		yourself 
]

{ #category : #accessing }
EwcCpTictactoeCell >> changeOwner [
	owners addLast: owners removeFirst.
	self valueChanged
]

{ #category : #accessing }
EwcCpTictactoeCell >> initialize [
	super initialize.
	owners := OrderedCollection with: ' ' with: 'X' with: 'O' 
]

{ #category : #accessing }
EwcCpTictactoeCell >> name [
	^ name
]

{ #category : #accessing }
EwcCpTictactoeCell >> name: aString [
	name := aString 
]

{ #category : #accessing }
EwcCpTictactoeCell >> preferredPresenterClass [
	^ EwcCpTictactoeCellPresenter
]

{ #category : #accessing }
EwcCpTictactoeCell >> value [
	^ owners first
]
