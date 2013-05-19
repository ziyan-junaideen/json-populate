# Note that when compiling with coffeescript, the plugin is wrapped in another
# anonymous function. We do not need to pass in undefined as well, since
# coffeescript uses (void 0) instead.
do ($ = jQuery, window, document) ->

	# window and document are passed through as local variable rather than global
	# as this (slightly) quickens the resolution process and can be more efficiently
	# minified (especially when both are regularly referenced in your plugin).

	# Create the defaults once
	pluginName = "jsonPopulate"
	defaults =
		property: "value"

	# The actual plugin constructor
	class Plugin
		constructor: (@element, options) ->
			# jQuery has an extend method which merges the contents of two or
			# more objects, storing the result in the first object. The first object
			# is generally empty as we don't want to alter the default options for
			# future instances of the plugin
			@options = $.extend {}, defaults, options
			@_defaults = defaults
			@_name = pluginName
			@init()
			return this

		init: ->
			# Place initialization logic here
			# You already have access to the DOM element and the options via the instance,
			# e.g., @element and @options
			#console.log("JSON Populate")
			# src  = @getSrc()
			data = @getData(@options.url)
			#console.log data
			return

		getData: (src) ->
			t 	= this
			sd 	= @setData
			$.ajax
				async: false,
				url: "#{src}"
				dataType: "json",
				data: {},
				success: (data) ->
					sd t, data
					return
			return

		# Given JSON Array of Data it will create select options values 
		# and insert them to the div
		setData: (t, data) ->

			# initilising the string to empty
			str = ""

			for key, value of data

				# We need to check if it is an array
				if t.options.default instanceof Array
					# default variable is an array
					
					###
					if console.log 
						console.log 'Found Array'
						console.log t.options.default
					###

					# variable to record it the current item was found
					found = false

					# iterating through the defaults to see if the given
					# item matches any o the default variables
					for key, item of t.options.default
						# console.log "#{item} - #{value.id}"
						# checking for equality - simply using == seemd to have issues.
						if item - value.id == 0
							found = true

					# dealing with the response		
					if found == true
						# Adding the element as a selected option
						str = "#{str}<option value=\"#{value.id}\" selected=\"selected\">#{value.description}</option>"		
					else
						# Adding teh element as an ordinary option
						str = "#{str}<option value=\"#{value.id}\">#{value.description}</option>"

				else
					# The defaults instance is not an array
					# We can work as usual
					if value.id - t.options.default == 0
						str = "#{str}<option value=\"#{value.id}\" selected=\"selected\">#{value.description}</option>"	
					else
						str = "#{str}<option value=\"#{value.id}\">#{value.description}</option>"
			$(t.element).html str
			return

	# A really lightweight plugin wrapper around the constructor,
	# preventing against multiple instantiations
	$.fn[pluginName] = (options) ->
		@each ->
			if !$.data(@, "plugin_#{pluginName}")
				$.data(@, "plugin_#{pluginName}", new Plugin(@, options))
