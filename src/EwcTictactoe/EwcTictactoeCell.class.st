Class {
	#name : #EwcTictactoeCell,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'EwcTictactoe-Core'
}

{ #category : #'instance creation' }
EwcTictactoeCell class >> withIndex: anIndex [
	^ self new
		name: 'cell' , ((anIndex - 1) // 3 + 1) asString , ((anIndex - 1) \\ 3 + 1) asString;
		yourself
]

{ #category : #accessing }
EwcTictactoeCell >> name [
	^ name
]

{ #category : #private }
EwcTictactoeCell >> name: aString [
	name := aString. 
]

{ #category : #accessing }
EwcTictactoeCell >> owner [
	^ ' '
]
