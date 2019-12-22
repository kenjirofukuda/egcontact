"
add a contact command.
"
Class {
	#name : #EgAddContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #EgContactBook
}

{ #category : #converting }
EgAddContactCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #changeAdd;
		shortcutKey: $n meta;
		yourself 
]

{ #category : #executing }
EgAddContactCommand >> execute [
	| contact |
	contact := self contactBookPresenter newContact.
	self hasSelectedContact 
		ifTrue: [ 
			self contactBook addContact: contact after: self selectedContact  ] 
		ifFalse: [ 
			self contactBook addContact: contact ].
	self contactBookPresenter updateView.
]

{ #category : #initialization }
EgAddContactCommand >> initialize [
	super initialize.
	self
		name: 'New contact';
		description: 'Creates a new contact and add it to the contact book.'
]
