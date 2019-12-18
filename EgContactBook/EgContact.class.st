Class {
	#name : #EgContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #EgContactBook
}

{ #category : #printing }
EgContact >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: name.
	aStream nextPut: $).
	
]
