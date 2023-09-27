Class {
	#name : #EwcCpTictactoeCellView,
	#superclass : #CpView,
	#category : #'EwcTictactoe-Web-App'
}

{ #category : #'web resources' }
EwcCpTictactoeCellView class >> style [
	<webResource: #css>
	^ '
	@import url("https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css");
	@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
	.btn-square {
	  width: 80px;
	  height: 80px;
	  font-size: 3rem;
	  line-height: 80px;
	}
	'
]

{ #category : #'web resources' }
EwcCpTictactoeCellView class >> template [
	<webResource: #html>
	^ '
	<div class="col-sm-4">
		<button id="btn-cell" type="button" class="btn btn-light btn-block m-2 text-center btn-square">
		<slot></slot>
		</button>
	</div>'
]

{ #category : #accessing }
EwcCpTictactoeCellView >> cellClasses [
	^ Dictionary 
		with: ' ' -> 'btn-light'
		with: 'X' -> 'btn-primary'
		with: 'O' -> 'btn-danger'
]

{ #category : #accessing }
EwcCpTictactoeCellView >> handleClickEvent: anEvent [
	self serverAnnounce: EwcCpCellClicked
]

{ #category : #accessing }
EwcCpTictactoeCellView >> initialize [
	super initialize.
	
	self shadowRoot 
		when: CpClickEvent basicPrimary
		send: #handleClickEvent:
		to: self
]

{ #category : #accessing }
EwcCpTictactoeCellView >> renderValue: aValue disabled: isDisabled [
	| button |
	button := self shadowedElementWithId: 'btn-cell'.
	button textContent: aValue.
	
	button removeClasses: {'btn-light' . 'btn-primary' . 'btn-danger'}.
	button addClass: (self cellClasses at: aValue ).
	
	isDisabled ifTrue: [ button attributeAdd:  #disabled] ifFalse: [ button removeAttributeAt: #disabled ]
]
