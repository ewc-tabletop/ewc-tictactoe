Class {
	#name : #EwcCpTictactoeView,
	#superclass : #CpView,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #accessing }
EwcCpTictactoeView class >> style [
	<webResource: #css>
	^ '
	@import url("https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css");
	@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
	.board {
		max-width: 300px;
	}
	'
]

{ #category : #accessing }
EwcCpTictactoeView class >> template [
	<webResource: #html>
	^ '
	<div class="board container py-5">
	<h1 class="text-center">Smalltalk<br />Tic-Tac-Toe</h1>
	<div class="row">
		<slot name="cell11"></slot>
		<slot name="cell12"></slot>
		<slot name="cell13"></slot>
	</div>
	<div class="row">
		<slot name="cell21"></slot>
		<slot name="cell22"></slot>
		<slot name="cell23"></slot>
	</div>
	<div class="row">
		<slot name="cell31"></slot>
		<slot name="cell32"></slot>
		<slot name="cell33"></slot>
	</div>
	</div>
	</div>
	'
]
