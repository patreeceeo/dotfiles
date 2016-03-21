/* global module */
module.exports = {
  "rules": {
    "react/react-in-jsx-scope": 1,
    "react/jsx-uses-react": 1,
    "react/jsx-uses-vars": 1,
    "no-trailing-spaces": [ 1 ],
    "no-unused-expressions": [
      1,
      {
        allowShortCircuit: true,
        allowTernary: true
      }
    ],
    "vars-on-top": [ 1 ],
    "strict" : [
      2,
      "global"
    ],
    "indent": [
      2,
      2
    ],
    "quotes": [
      2,
      "double"
    ],
    "linebreak-style": [
      2,
      "unix"
    ],
    "semi": [
      2,
      "always"
    ]
  },
  "env": {
    "es6": true,
    "browser": true,
    "node": true
  },
  "extends": "eslint:recommended",
  "ecmaFeatures": {
    "jsx": true,
    "experimentalObjectRestSpread": true
  },
  "plugins": [
    "react"
  ]
};
