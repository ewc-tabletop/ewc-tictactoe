Class {
	#name : #EwcCpTictactoeWebApp,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'cells'
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
	^ cells
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> initialize [
	super initialize.
	cells := (1 to: 9) collect: [ :index | EwcCpTictactoeCell withIndex: index ]
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> preferredPresenterClass [
	^ EwcCpTictactoePresenter
]
