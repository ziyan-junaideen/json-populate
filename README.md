
# json-populate

Its may not be common to update a select list from a JSON feed, and its its not a difficult task. 
If you are wondering why, I believe it not only saves lines of code, but makes things more clear
for another who is looking at it.

Although not final, the use of the plugin is simple. You could simply fill the select list item with the data attribute `url` and call  the function. It will do the rest.

## Usage

1. Include jQuery:

	```html
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	```

2. Include plugin's code:

	```html
	<script src="dist/jquery.json-populate.min.js"></script>
	```

3. Call the plugin:

	```javascript
	$("#element").jsonPopulate({src: 'load.php', default: 1})
	```

Still puzzled? Look at this example https://github.com/ziyan-junaideen/json-populate/blob/master/demo/index.html

And thats it.

Feel free to drop in an issue, let it be a bug or kind of a feature request. You could also contact me via mail: jdeen-solutions@outlook.com