# DLittle

A little nice description language freely inspired from S-list and not be forced to use YAML.

## Power to lisp-like syntax!

```
(a:b 
	(c:d (e:f) (g:h))
	(z:k (r:t) (p:q)))
```
Hand written to feel the pain. 

```
(author : Aldiss / Brian 
  (serie : helliconia  
  	(title: Le printemps d''helliconia (read: no)  (style: SF) (price: 1))
  	(title: Helliconia, l''ete (read: no)  (style: SF) (price: 1))
 	(title: L''hiver d''helliconia (read: no)  (style: SF) (price: 1))
  (books : individual
    	(title: L''instant de l''eclipse (read: no)  (style: fantaisie) (price: 1))
 ```     
      
## Installation

To install the packages of DLittle, go to the Playground (Ctrl+OW) in your Pharo image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'DLittle';
  repository: 'github://Ducasse/DLittle/'
```

## If you want to depend on it

```
spec 
   baseline: 'DLittle' 
   with: [ spec repository: 'github://Ducasse/DLittle/' ].
```

----
The best way to predict the future is to do it.
Talking less doing more. stephane.ducasse@inria.fr

