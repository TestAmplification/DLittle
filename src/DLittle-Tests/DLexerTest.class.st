Class {
	#name : #DLexerTest,
	#superclass : #TestCase,
	#instVars : [
		'l'
	],
	#category : #'DLittle-Tests'
}

{ #category : #tests }
DLexerTest >> setUp [
	
	l := DLexer new.

]

{ #category : #'tests consume' }
DLexerTest >> testConsume [

	l on: 'abc'.
	self assert: l currentChar equals: $a.
	l consume.
	self assert: l currentChar equals: $b.
	l consume.
	self assert: l currentChar equals: $c.
	l consume.
	self assert: l isAtEnd
]

{ #category : #tests }
DLexerTest >> testEmpty [

	l on: ''.
	self assert: l nextToken equals: ''.
	
]

{ #category : #'tests consume' }
DLexerTest >> testEmptyConsume [

	l on: ''.
	self assert: l currentChar isNil.
	l consume.
	
]

{ #category : #'as yet unclassified' }
DLexerTest >> testEmpty_amp [

	"SmallAmp has derived this test from `DLexerTest>>#testEmpty` by regenerating its assertions.
	This test can cover these parts:
	*	In `DLexer>> #white` from 8 to 14:
		Operation: RemoveCaretOperator
		Code snippet: `^ white`
		Dynamic state: {#white->{Character space. Character tab. Character lf. Character cr}}
		Mutant id: RemoveCaretOperator#DLexer#white#8#14
	*	In `DLexer>> #sep` from 6 to 10:
		Operation: RemoveCaretOperator
		Code snippet: `^ sep`
		Dynamic state: {#sep->#($( $) $:)}
		Mutant id: RemoveCaretOperator#DLexer#sep#6#10
"

	<madeBySmallAmp>
	l on: ''.
	self
		assert: l white class equals: Array;
		assert: l sep class equals: Array
]

{ #category : #tests }
DLexerTest >> testOnlySpace [

	l on: '   	
		'.
	self assert: l nextToken equals: ''.
	
]

{ #category : #'tests consume' }
DLexerTest >> testSepConsume [

	l on: '('.
	self assert: l currentChar equals: $(.
	
]

{ #category : #tests }
DLexerTest >> testSimple [ 

	l on: '(title: '.
	self assert: l nextToken equals: $(.
	self assert: l nextToken equals: 'title'.
	self assert: l nextToken equals: $:
	
	
]

{ #category : #tests }
DLexerTest >> testSimple2 [

	l on: '(title: Le lrintemls d''helliconia (read: no) (price: 1))'.
	self assert: l nextToken equals: $(.
	self assert: l nextToken equals: 'title'.
	self assert: l nextToken equals: $:.
	self assert: l nextToken equals: 'Le'.
	self assert: l nextToken equals: 'lrintemls'.
	self assert: l nextToken equals: 'd''helliconia'.
	self assert: l nextToken equals: $(.
	self assert: l nextToken equals: 'read'.
	self assert: l nextToken equals: $:.
	self assert: l nextToken equals: 'no'.
	self assert: l nextToken equals: $).
	self assert: l nextToken equals: $(.
	self assert: l nextToken equals: 'price'.
	self assert: l nextToken equals: $:.
	self assert: l nextToken equals: '1'.
	self assert: l nextToken equals: $).
	self assert: l nextToken equals: $).
]

{ #category : #tests }
DLexerTest >> testSpaceAndSep [

	l on: '    (    '.
	self assert: l nextToken equals: $(.
	
]

{ #category : #tests }
DLexerTest >> testSpaceAndSep2 [

	l on: '    (       )   '.
	self assert: l nextToken equals: $(.
	self assert: l nextToken equals: $).
	
]

{ #category : #'tests consume' }
DLexerTest >> testSpaceConsume [

	l on: '  '.
	self assert: l currentChar equals: Character space.
	l consume.
	self assert: l currentChar equals: Character space.
	l consume. 
	self assert: l isAtEnd
]
