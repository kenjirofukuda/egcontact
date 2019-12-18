"
ContactBook Entity Model

Internal Representation and Key Implementation Points.

    Instance Variables
	name:		<String>
	phone:		<String>


    Implementation Points
"
Class {
	#name : #EgContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #EgContactBook
}

{ #category : #'instance creation' }
EgContact class >> name: aNameString phone: aPhoneString [
	^ self new name: aNameString; phone: aPhoneString; yourself 
]

{ #category : #testing }
EgContact >> hasMatchingText: aString [
	^ name includesSubstring: aString caseSensitive: false
]

{ #category : #accessing }
EgContact >> name [
	^ name
]

{ #category : #accessing }
EgContact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EgContact >> phone [
	^ phone
]

{ #category : #accessing }
EgContact >> phone: anObject [
	phone := anObject
]

{ #category : #printing }
EgContact >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: name.
	aStream nextPut: $).
	
]
