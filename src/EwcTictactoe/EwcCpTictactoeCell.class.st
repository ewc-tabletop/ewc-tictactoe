Class {
	#name : #EwcCpTictactoeCell,
	#superclass : #CpModel,
	#instVars : [
		'owner',
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

{ #category : #initialization }
EwcCpTictactoeCell >> initialize [
	super initialize.
	owner := ' '
]

{ #category : #accessing }
EwcCpTictactoeCell >> name [
	^ name
]

{ #category : #accessing }
EwcCpTictactoeCell >> name: aString [
	name := aString 
]

{ #category : #presenter }
EwcCpTictactoeCell >> preferredPresenterClass [
	^ EwcCpTictactoeCellPresenter
]

{ #category : #accessing }
EwcCpTictactoeCell >> setOwner: aSymbol [
	owner := aSymbol asString.
	self valueChanged
]

{ #category : #evaluating }
EwcCpTictactoeCell >> value [
	^ owner
]
