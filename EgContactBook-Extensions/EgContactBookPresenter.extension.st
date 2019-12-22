Extension { #name : #EgContactBookPresenter }

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aRootCommandGroup [
	<extensionCommands>
	(aRootCommandGroup / 'Context Menu')
		register: (EgChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> extraCommandWith: presenter forRootGroup: aRootCommandGroup [
	<extensionCommands>
	aRootCommandGroup / 'Context Menu'
		register:
			((CmCommandGroup named: 'Extra') asSpecGroup
				description: 'Extra commands to help during development';
				register: ((EgInspectCommand forSpec context: [ presenter selectedContact])
				name: 'Inspect contact';
				description: 'Open an inspector on the selected contact.';
				iconName: #smallFind;
				yourself);
				register: ((EgInspectCommand forSpec context: [ presenter contactBook])
				name: 'Inspect contact book';
				description: 'Open an inspector on the contact book.';
				yourself);
				yourself)
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
