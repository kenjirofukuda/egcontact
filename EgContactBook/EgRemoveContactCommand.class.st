"
remove contact command.
"
Class {
	#name : #EgRemoveContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #EgContactBook
}

{ #category : #testing }
EgRemoveContactCommand >> canBeExecuted [ 
	self contactBookPresenter isContactSelected
]

{ #category : #executing }
EgRemoveContactCommand >> execute [ 
	self contactBook removeContact: self selectedContact.
	self contactBookPresenter updateView.
]

{ #category : #initialization }
EgRemoveContactCommand >> initialize [ 
	super initialize.
	self 
		name: 'Remove';
		description: 'Remove the selected contact from the contact book'
]
