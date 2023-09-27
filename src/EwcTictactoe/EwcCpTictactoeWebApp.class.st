Class {
	#name : #EwcCpTictactoeWebApp,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'cells',
		'player'
	],
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeWebApp class >> app [
	"Текстовый идентификатор приложения, будет использован для маршрутизации веб-запрос"
	^ #tictactoe
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> applicationModel [
	^ self
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> cells [
	^ EwcTictactoeGame cellsForPlayer: self 
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> initialize [
	super initialize.
	EwcTictactoeGame register: self
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> player [
	^ player
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> player: aSymbol [
	player := aSymbol
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> preferredPresenterClass [
	^ EwcCpTictactoePresenter
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> refresh [
	self
		allPresentersDo: [ :presenter | presenter class = EwcCpTictactoePresenter ifTrue: [ presenter renderView ] ]
]
