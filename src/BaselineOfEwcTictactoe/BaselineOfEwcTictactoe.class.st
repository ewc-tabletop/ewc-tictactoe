Class {
	#name : #BaselineOfEwcTictactoe,
	#superclass : #BaselineOf,
	#category : #BaselineOfEwcTictactoe
}

{ #category : #baselines }
BaselineOfEwcTictactoe >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [ self codeParadise: spec.

			spec package: 'EwcTictactoe' ]
]

{ #category : #dependencies }
BaselineOfEwcTictactoe >> codeParadise: spec [
	spec
		baseline: 'CodeParadise'
		with: [ spec repository: 'github://ErikOnBike/CodeParadise' ]
]

{ #category : #accessing }
BaselineOfEwcTictactoe >> projectClass [
	^ MetacelloCypressBaselineProject
]
