//function printName(name) { return name }

function fn() {
	return {
		printName: function() { return "Hello India" },
		dyn_string: function(s) {
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for (var i = 0; i < s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
			return text;
		}
	}
}
