const defaultTheme = require("tailwindcss/defaultTheme");
module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/phx_component_helpers_demo_web.ex",
    "../lib/phx_component_helpers_demo_web/**/*.*ex",
  ],
  theme: {
    extend: {
      family: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
};
