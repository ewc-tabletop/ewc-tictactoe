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
	^ EwcTictactoeGame cells
]

{ #category : #initialization }
EwcCpTictactoeWebApp >> initialize [
	super initialize.
	EwcTictactoeGame register: self
]

{ #category : #accessing }
EwcCpTictactoeWebApp >> preferredPresenterClass [
	^ EwcCpTictactoePresenter
]
