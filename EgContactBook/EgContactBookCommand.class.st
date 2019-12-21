"
to all the commands of the contact book application.
"
Class {
	#name : #EgContactBookCommand,
	#superclass : #CmCommand,
	#category : #EgContactBook
}

{ #category : #accessing }
EgContactBookCommand >> contactBook [
	^ self contactBookPresenter contactBook
]

{ #category : #accessing }
EgContactBookCommand >> contactBookPresenter [ 
	^ self context
]

{ #category : #testing }
EgContactBookCommand >> hasSelectedContact [ 
	^ self contactBookPresenter isContactSelected
]

{ #category : #accessing }
EgContactBookCommand >> selectedContact [
	^ self contactBookPresenter selectedContact
]
