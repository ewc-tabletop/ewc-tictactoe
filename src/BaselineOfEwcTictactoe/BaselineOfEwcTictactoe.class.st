Class {
	#name : #BaselineOfEwcTictactoe,
	#superclass : #BaselineOf,
	#category : #BaselineOfEwcTictactoe
}

{ #category : #baseline }
BaselineOfEwcTictactoe >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'EwcTictactoe'
		]
]
