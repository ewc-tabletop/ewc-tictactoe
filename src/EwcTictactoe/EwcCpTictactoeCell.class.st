Class {
	#name : #EwcCpTictactoeCell,
	#superclass : #CpModel,
	#instVars : [
		'owners',
		'name',
		'disabled'
	],
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeCell class >> disabledWithName: aName withOwner: anOwner [
	^ self new
		name: aName;
		owner: anOwner;
		disable;
		yourself. 
]

{ #category : #'instance creation' }
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

{ #category : #private }
EwcCpTictactoeCell >> disable [
	disabled := true.
]

{ #category : #accessing }
EwcCpTictactoeCell >> initialize [
	super initialize.
	owners := OrderedCollection with: ' ' with: 'X' with: 'O' 
]

{ #category : #testing }
EwcCpTictactoeCell >> isDisabled [
	^ disabled
]

{ #category : #accessing }
EwcCpTictactoeCell >> name [
	^ name
]

{ #category : #accessing }
EwcCpTictactoeCell >> name: aString [
	name := aString 
]

{ #category : #private }
EwcCpTictactoeCell >> owner: anOwner [ 
	owners := { anOwner }
]

{ #category : #accessing }
EwcCpTictactoeCell >> preferredPresenterClass [
	^ EwcCpTictactoeCellPresenter
]

{ #category : #accessing }
EwcCpTictactoeCell >> value [
	^ owners first
]
