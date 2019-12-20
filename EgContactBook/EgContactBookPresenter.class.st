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
