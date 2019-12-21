"
It hholds a reference to a con-tact book and it is structured around a table.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	contactBook:		<EgContactBook>
	table:		<SpTablePresenter>


    Implementation Points
"
Class {
	#name : #EgContactBookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #EgContactBook
}

{ #category : #examples }
EgContactBookPresenter class >> cowokersExample [
	<example>
	^ (self on: EgContactBook coworkers) openWithSpec
]

{ #category : #specs }
EgContactBookPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #table;
		yourself
]

{ #category : #accessing }
EgContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #accessing }
EgContactBookPresenter >> contactBook: anObject [
	contactBook := anObject
]

{ #category : #initialization }
EgContactBookPresenter >> initializePresenters [
	table := self newTable.
	table 
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name).
	table
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: #phone).
	table items: contactBook contacts
]

{ #category : #testing }
EgContactBookPresenter >> isContactSelected [
	^ table selectedItems isNotEmpty
]

{ #category : #action }
EgContactBookPresenter >> newContact [
	| rawData splitted |
	rawData := self
		request: 'Enter new contact name add phone (split by comma)'
		initialAnswer: ''
		title: 'Create new Contact'.
	splitted := rawData splitOn: $,.
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [ 
			SpInvalidUserInput
				signal: 'Please enter new contact name add phone (split by comma)' ].
	^ EgContact new
		name: splitted first;
		phone: splitted second;
		yourself 
]

{ #category : #testing }
EgContactBookPresenter >> selectedContact [
	^ table selection selectedItem
]

{ #category : #'accessing model' }
EgContactBookPresenter >> setModelBeforeInitialization: aContactBook [
	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]

{ #category : #accessing }
EgContactBookPresenter >> table [
	^ table
]

{ #category : #accessing }
EgContactBookPresenter >> table: anObject [
	table := anObject
]
