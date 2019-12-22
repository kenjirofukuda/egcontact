Extension { #name : #EgContactBookPresenter }

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aRootCommandGroup [
	<extensionCommands>
	(aRootCommandGroup / 'Context Menu')
		register: (EgChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter >> newPhone [ 
	| phone |
	phone := self request: 'New phone for the contact' initialAnswer: self selectedContact phone title: 'Set new phone for contact'.
	(phone matchesRegex: '\d\d\d\s\d\d\d')
		ifFalse: [ 
			SpInvalidUserInput 
				signal: 'The phome is not well formated.
				Shoud match "\d\d\d\s\d\d\d"' ] .
	^ phone
]
