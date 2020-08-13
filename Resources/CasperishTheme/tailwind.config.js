module.exports = {
  purge: {
    enabled: true,
    content: ['../../Sources/**/Theme*.swift'],
  },
  theme: {
    extend: {
        colors: {
          'casper-blue': '#3eb0ef',
        },
        height: {
          'cover': '75vh',
        }
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/typography')
  ],
}
