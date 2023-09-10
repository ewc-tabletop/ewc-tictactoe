Class {
	#name : #EwcTictactoeGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'watchers',
		'cells'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'EwcTictactoe-Game'
}

{ #category : #accessing }
EwcTictactoeGame class >> cells [
	^ self uniqueInstance cells
]

{ #category : #'instance creation' }
EwcTictactoeGame class >> register: aWebApp [
	self uniqueInstance register: aWebApp
]

{ #category : #releasing }
EwcTictactoeGame class >> restart [
	uniqueInstance := nil
]

{ #category : #'instance creation' }
EwcTictactoeGame class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
EwcTictactoeGame >> cells [
	^ cells
]

{ #category : #initialization }
EwcTictactoeGame >> initialize [
	players := OrderedCollection new.
	watchers := OrderedCollection new.
	cells := (1 to: 9) collect: [ :index | EwcCpTictactoeCell withIndex: index ].
]

{ #category : #accessing }
EwcTictactoeGame >> register: aWebApp [
	players size >= 2 ifTrue: [ watchers add: aWebApp ].
	players size = 1 ifTrue: [ players add: aWebApp -> 'O' ].
	players ifEmpty: [ players add: aWebApp -> 'X' ]
]
