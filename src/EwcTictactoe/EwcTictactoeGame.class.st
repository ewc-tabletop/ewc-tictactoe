Class {
	#name : #EwcTictactoeGame,
	#superclass : #Object,
	#instVars : [
		'cells',
		'players',
		'watchers'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'EwcTictactoe-Core'
}

{ #category : #accessing }
EwcTictactoeGame class >> cells [
	^ self uniqueInstance cells
]

{ #category : #accessing }
EwcTictactoeGame class >> cellsForPlayer: player [
	^ self uniqueInstance stateFor: player
]

{ #category : #accessing }
EwcTictactoeGame class >> register: aWebApp [
	self uniqueInstance register: aWebApp
]

{ #category : #'instance creation' }
EwcTictactoeGame class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
EwcTictactoeGame >> cells [
	^ cells
]

{ #category : #clearing }
EwcTictactoeGame >> emptyCells [
	^ (1 to: 9) collect: [ :index | EwcTictactoeCell withIndex: index ]
]

{ #category : #initialization }
EwcTictactoeGame >> initialize [
	super initialize.
	players := OrderedCollection new.
	watchers := OrderedCollection new.
	cells := self emptyCells
]

{ #category : #accessing }
EwcTictactoeGame >> register: aWebApp [
	players size >= 2 ifTrue: [ watchers add: aWebApp ].
	players size = 1
		ifTrue: [ players add: aWebApp -> #O.
			aWebApp player: #O ].
	players
		ifEmpty: [ players add: aWebApp -> #X.
			aWebApp player: #X ]
]

{ #category : #clearing }
EwcTictactoeGame >> reset [
	players removeAll.
	watchers removeAll.
	self emptyCells
]

{ #category : #accessing }
EwcTictactoeGame >> stateFor: aCharacter [
	^ cells collect: [ :each | EwcCpTictactoeCell disabledWithName: each name withOwner: each owner ] 
]
