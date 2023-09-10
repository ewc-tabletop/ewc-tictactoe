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
	^ EwcTictactoeGame cells
]

{ #category : #initialization }
EwcCpTictactoeWebApp >> initialize [
	super initialize.
	EwcTictactoeGame register: self
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> player: aSymbol [
	player := aSymbol
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> playerStatus [
	^ ((player ifNil: [ 'Watcher ' ] ifNotNil: [ 'Player: ' , player asString ])
		, '; id: ' , self environment id) asString
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> preferredPresenterClass [
	^ EwcCpTictactoePresenter
]
