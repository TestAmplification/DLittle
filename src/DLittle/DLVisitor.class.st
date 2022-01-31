Class {
	#name : #DLVisitor,
	#superclass : #Object,
	#category : #'DLittle-DataStructure'
}

{ #category : #visiting }
DLVisitor >> visitHead: aPair [

	self visitPair: aPair

]

{ #category : #visiting }
DLVisitor >> visitList: aList [

	self visitHead: aList head.
	aList restIsNotEmpty  
		ifTrue: [ self visitRest: aList rest ]
]

{ #category : #visiting }
DLVisitor >> visitPair: aPair [

]

{ #category : #visiting }
DLVisitor >> visitRest: aCollectionOfPairs [

	
]
