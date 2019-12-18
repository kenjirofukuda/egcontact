"
Holds EgContact instances
 
Internal Representation and Key Implementation Points.

    Instance Variables
	contacts:		<Array<EgContact>>
"
Class {
	#name : #EgContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #EgContactBook
}

{ #category : #adding }
EgContactBook >> add: aContactName phone: phone [
	| contact |
	contact := EgContact name: aContactName phone: phone.
	self addContact: contact.
	^ contact
]

{ #category : #adding }
EgContactBook >> addContact: aContact [
	contacts add: aContact
]

{ #category : #adding }
EgContactBook >> addContact: newContact after: contactAfter [
	contacts add: newContact after: contactAfter
]

{ #category : #accessing }
EgContactBook >> contacts [
	^ contacts
]

{ #category : #accessing }
EgContactBook >> contacts: aColl [
	contacts := aColl
]

{ #category : #'finding/searching' }
EgContactBook >> findContactsWithText: aText [
	^ contacts select: [ :e | e hasMatchingText: aText ]
]

{ #category : #testing }
EgContactBook >> includesContact: aContact [
	^ contacts includes: aContact
	
]

{ #category : #initialization }
EgContactBook >> initialize [ 
	super initialize.
	contacts := OrderedCollection new.
]

{ #category : #adding }
EgContactBook >> removeContact: aContact [
	contacts remove: aContact
]

{ #category : #accessing }
EgContactBook >> size [
	^ contacts size
]
