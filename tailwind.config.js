const colors = require('tailwindcss/colors')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./templates/**/*.html", "./sass/**/*.{scss, sass, css}", "./static/**/*.{html, css}"],
  theme: {
	  fontFamily: {
		  sans: ["Inter", "sans-serif"],
		  serif: ["Merriweather", "serif"]
	  },
	  extend: {
		  colors: {
			  primary: colors.orange,
			  secondary: colors.rose,
			  tertiary: colors.cyan
		  }
	  }
  },
  plugins: [],
}
