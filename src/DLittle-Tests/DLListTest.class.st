Class {
	#name : #DLListTest,
	#superclass : #TestCase,
	#category : #'DLittle-Tests'
}

{ #category : #tests }
DLListTest >> testAddingAPairIsAddingThisPairLast [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	self assert: l rest first key equals:  3.
	self deny: l restIsEmpty.
	l addPairToRest: (DLPair new key: 5; value: 6).
	self assert: l rest first key equals: 3.
	self assert: l rest first key equals: 3.
	self assert: l rest last key equals: 5.


]

{ #category : #'as yet unclassified' }
DLListTest >> testAddingAPairIsAddingThisPairLast_amp_A24 [

	"SmallAmp has derived this test from `DLListTest>>#testAddingAPairIsAddingThisPairLast` by applying some transformations and regenerating its assertions.
	This test can cover this part:
	*	In `DLList>> #pairAtKey:` from 94 to 166:
		Operation: ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator
		Code snippet: `pairSequence
	detect: [ :p | p key = aKey ]
	ifNone: [ KeyNotFound signal ]`
		Dynamic state: nil
		Mutant id: ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator#DLList#pairAtKey:#94#166
"

	<madeBySmallAmp>
	| l |
	l := DLList new.
	l key: 1 value: 2.
	self should: [ l pairAtKey: 5 ] raise: KeyNotFound
]

{ #category : #tests }
DLListTest >> testCharLf [
	
	self assert: Character lf asString equals: (String streamContents: [:s | s lf ])
]

{ #category : #tests }
DLListTest >> testCharLf2 [
	"this test is special because it embedds a string that contains a lf"

	| buggyButcontainingLF | 
	self skip.
	"(String streamContents: [:s | s lf ]) to produce the string buggyButcontainingLF below"
	buggyButcontainingLF := '
'.
	self assert: (buggyButcontainingLF at: 1) equals: Character lf.
	self assert: Character lf asString equals:  '
'
]

{ #category : #tests }
DLListTest >> testCreation [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	self deny: l restIsEmpty.


]

{ #category : #tests }
DLListTest >> testCreationSimple [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	self assert: l key equals: 1.
	self assert: l value equals: 2.
	self assert: l restIsEmpty.

]

{ #category : #'as yet unclassified' }
DLListTest >> testCreationSimple_amp [

	"SmallAmp has derived this test from `DLListTest>>#testCreationSimple` by regenerating its assertions.
	This test can cover this part:
	*	In `DLList>> #head` from 8 to 13:
		Operation: RemoveCaretOperator
		Code snippet: `^ head`
		Dynamic state: nil
		Mutant id: RemoveCaretOperator#DLList#head#8#13
"

	<madeBySmallAmp>
	| l |
	l := DLList new.
	self assert: l head class equals: DLPair.
	l key: 1 value: 2
]

{ #category : #tests }
DLListTest >> testDo [
	
	| l sum |
	sum := 0. 
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 40).
	l addPairToRest: (DLPair new key: 5; value: 60).
	l do: [ :p | sum := sum + p value ].
	self assert: sum equals: 102.

]

{ #category : #tests }
DLListTest >> testKeysAndValuesDo [
	
	| l sum |
	sum := 0. 
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 40).
	l addPairToRest: (DLPair new key: 5; value: 60).
	l keysAndValuesDo: [ :k :v | sum := sum + k + v ].
	self assert: sum equals: 111.

]

{ #category : #tests }
DLListTest >> testLast [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	l addPairToRest: (DLPair new key: 5; value: 6).
	self assert: l last key equals: 5.
	


]

{ #category : #tests }
DLListTest >> testPairAtKeyIfAbsent [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	l addPairToRest: (DLPair new key: 5; value: 666).
	l addPairToRest: (DLPair new key: 7; value: 8).
	l addPairToRest: (DLPair new key: 5; value: 6).
	self assert: (l pairAtKey: 5) value equals: 666

]

{ #category : #tests }
DLListTest >> testPolymorphicCreationMessage [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: ((DLList key: 3 value: 4) addPairToRest: (DLPair key: 33 value: 44)).
	l addPairToRest: (DLPair key: 5  value: 6).
	self 
		assert: l printString 
		equals: '(1 : 2 (3 : 4 (33 : 44)) (5 : 6))' 	

]

{ #category : #tests }
DLListTest >> testPrintOn [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	l addPairToRest: (DLPair new key: 5; value: 6).
	self assert: l printString equals: '(1 : 2 (3 : 4) (5 : 6))'.
 	

]

{ #category : #tests }
DLListTest >> testPrintOnListOfList [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: ((DLList key: 3 value: 4) addPairToRest: (DLPair new key: 33; value: 44)).
	l addPairToRest: (DLPair new key: 5; value: 6).
	self 
		assert: l printString 
		equals: '(1 : 2 (3 : 4 (33 : 44)) (5 : 6))' 	

]

{ #category : #tests }
DLListTest >> testPrintOnSimpleVersion [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	self assert: l printString equals: '(1 : 2)'.
 
]

{ #category : #tests }
DLListTest >> testPrintPrettyOn [
	
	| l |
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 4).
	l addPairToRest: (DLPair new key: 5; value: 6).
	self assert: l prettyPrintString equals:'(1 : 2', Character lf asString,'(3 : 4) (5 : 6))' 
	"Pay attention that the string should contain lf and not cr"
]

{ #category : #tests }
DLListTest >> testRemoveFromRest [
	
	| l sum p |
	sum := 0. 
	l := DLList key: 1 value: 2.
	p := (DLPair new key: 5; value: 60).
	l addPairToRest: (DLPair new key: 3; value: 40).
	l addPairToRest: p.
	l removeFromRest: p. 
	self assert: l rest size equals: 1

]

{ #category : #tests }
DLListTest >> testRestDo [
	
	| l sum |
	sum := 0. 
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 40).
	l addPairToRest: (DLPair new key: 5; value: 60).
	l restDo: [ :p | sum := sum + p value ].
	self assert: sum equals: 100.

]

{ #category : #tests }
DLListTest >> testRestDo2 [
	
	| l sum |
	sum := 0. 
	l := DLList new.
	l key: 1 value: 2.
	l addPairToRest: (DLPair new key: 3; value: 40).
	l addPairToRest: (DLPair new key: 5; value: 60).
	l restDo: [ :p | sum := sum + p key ].
	self assert: sum equals: 8.

]
