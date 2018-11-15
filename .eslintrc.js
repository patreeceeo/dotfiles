/* global module */
module.exports = {
  "rules": {
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
      2
    ],
    // "quotes": [
    //   2,
    //   "single"
    // ],
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
    "node": true,
    "jasmine": true,
    "angular": true
  },
  "extends": "eslint:recommended",
  "ecmaFeatures": {
  }
};
