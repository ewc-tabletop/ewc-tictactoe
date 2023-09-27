Class {
	#name : #EwcTictactoeGame,
	#superclass : #Object,
	#instVars : [
		'cells',
		'players',
		'watchers',
		'announcer'
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
EwcTictactoeGame class >> cellsForPlayer: webApp [
	^ self uniqueInstance stateFor: webApp
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

{ #category : #accessing }
EwcTictactoeGame >> currentPlayer [
	^ players size = 2 ifTrue: [ players first value] ifFalse: [ nil ]
]

{ #category : #clearing }
EwcTictactoeGame >> emptyCells [
	^ (1 to: 9) collect: [ :index | EwcTictactoeCell withIndex: index ]
]

{ #category : #initialization }
EwcTictactoeGame >> initialize [
	super initialize.
	announcer := Announcer new.
	players := OrderedCollection new.
	watchers := OrderedCollection new.
	cells := self emptyCells
]

{ #category : #accessing }
EwcTictactoeGame >> register: aWebApp [
	players size >= 2 ifTrue: [ watchers add: aWebApp ].
	players size = 1
		ifTrue: [ players add: aWebApp -> #O.
			aWebApp player: #O.
			announcer announce: EwcStateChanged ].
	players
		ifEmpty: [ players add: aWebApp -> #X.
			aWebApp player: #X ].
	announcer
		when: EwcStateChanged
		send: #refresh
		to: aWebApp
]

{ #category : #clearing }
EwcTictactoeGame >> reset [
	announcer
		ifNotNil: [ announcer subscriptions reset ]
		ifNil: [ announcer := Announcer new ].
	players removeAll.
	watchers removeAll.
	cells := self emptyCells
]

{ #category : #accessing }
EwcTictactoeGame >> setOwner: aPlayer toCell: aCellName [
	self currentPlayer = aPlayer
		ifTrue: [ cells
				select: [ :each | each name = aCellName ]
				thenDo: [ :each | each owner: aPlayer ].
			players addLast: players removeFirst.
			announcer announce: EwcStateChanged ]
]

{ #category : #accessing }
EwcTictactoeGame >> stateFor: webApp [
	| playerSymbol foundPlayers |
	foundPlayers := players
			select: [ :each | each key = webApp ]
			thenCollect: [ :each | each value ].
	playerSymbol := foundPlayers
			ifEmpty: [ 'none' ]
			ifNotEmpty: [ foundPlayers first ].
	^ cells
		collect: [ :each | 
			playerSymbol = self currentPlayer
				ifTrue: [ EwcCpTictactoeCell enabledWithName: each name withOwner: each owner ]
				ifFalse: [ EwcCpTictactoeCell disabledWithName: each name withOwner: each owner ] ]
]
