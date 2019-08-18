/* global module */
module.exports = {
  "rules": {
    "no-console": [ 1 ],
    "no-trailing-spaces": [ 1 ],
    "no-unused-expressions": [
      1,
      {
        allowShortCircuit: true,
        allowTernary: true
      }
    ],
    "vars-on-top": [ 1 ],
    //   "strict" : [
    //     2,
    //     "global"
    //   ],
    "indent": [
      2,
      2,
      {
        "SwitchCase": 1
      }
    ],
    // "quotes": [
    //  1,
    //  "single"
    //],
    "linebreak-style": [
      2,
      "unix"
    ],
    "semi": [
      2,
      "always"
    ]
  },
  "globals": {
    "angular": true,
    "inject": true
  },
  "env": {
    "es6": true,
    "browser": true,
    "node": true,
    "jasmine": true,
    "protractor": true
  },
  "parserOptions": {
    "ecmaVersion": "2017"
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended"
  ]
};
