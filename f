[1mdiff --git a/.github/workflows/app-pr.yml b/.github/workflows/app-pr.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..9348756[m
[1m--- /dev/null[m
[1m+++ b/.github/workflows/app-pr.yml[m
[36m@@ -0,0 +1,40 @@[m
[32m+[m[32mname: ReactApp[m
[32m+[m
[32m+[m[32mon:[m
[32m+[m[32m  push:[m
[32m+[m[32m    branches:[m
[32m+[m[32m      - main[m
[32m+[m[32m  pull_request:[m
[32m+[m[32m    branches:[m
[32m+[m[32m      - main[m
[32m+[m
[32m+[m[32mjobs:[m
[32m+[m[32m  eslint:[m
[32m+[m[32m    runs-on: ubuntu-latest[m
[32m+[m[32m    defaults:[m
[32m+[m[32m        run:[m
[32m+[m[32m            working-directory: ./src/native-app[m
[32m+[m[32m    steps:[m
[32m+[m[32m      - name: Checkout repository[m
[32m+[m[32m        uses: actions/checkout@v2[m
[32m+[m[32m      - name: Set up Node.js[m
[32m+[m[32m        uses: actions/setup-node@v2[m
[32m+[m[32m        with:[m
[32m+[m[32m          node-version: 18[m
[32m+[m[32m      - name: Install dependencies[m
[32m+[m[32m        run: npm install[m
[32m+[m[32m      - name: Run ESLint[m
[32m+[m[32m        run: npm run lint[m
[32m+[m[32m  check-for-changes:[m
[32m+[m[32m    runs-on: ubuntu-latest[m
[32m+[m[32m    steps:[m
[32m+[m[32m      - name: Checkout repository[m
[32m+[m[32m        uses: actions/checkout@v2[m
[32m+[m[32m      - name: Check if files changed[m
[32m+[m[32m        run: |[m
[32m+[m[32m            if [[ $(git diff --name-only ${{ github.base_ref }}...${{ github.head_ref }}) ]]; then[m
[32m+[m[32m              echo "Files have changed in the pull request."[m
[32m+[m[32m            else[m
[32m+[m[32m              echo "No files have changed in the pull request."[m
[32m+[m[32m              exit 1[m
[32m+[m[32m            fi[m
[1mdiff --git a/.github/workflows/dotnet.yml b/.github/workflows/dotnet.yml[m
[1mindex 3725433..2a7cb22 100644[m
[1m--- a/.github/workflows/dotnet.yml[m
[1m+++ b/.github/workflows/dotnet.yml[m
[36m@@ -5,9 +5,9 @@[m [mname: .NET[m
 [m
 on:[m
   push:[m
[31m-    branches: [ "master" ][m
[32m+[m[32m    branches: [ "main" ][m
   pull_request:[m
[31m-    branches: [ "master" ][m
[32m+[m[32m    branches: [ "main" ][m
 [m
 jobs:[m
   build:[m
[1mdiff --git a/Backend.sln b/Backend.sln[m
[1mindex 09a21e2..d2e11d7 100644[m
[1m--- a/Backend.sln[m
[1m+++ b/Backend.sln[m
[36m@@ -9,7 +9,12 @@[m [mProject("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "src", "src", "{5930BCA6-5F6[m
 EndProject[m
 Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "tests", "tests", "{FC3FC201-344D-40FC-9A8F-B92D1C8B786D}"[m
 EndProject[m
[31m-Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Backend.Tests", "tests\Backend.Tests\Backend.Tests.csproj", "{DB32EB3F-CB7E-4B9F-B0E5-9F7BC80FCF1C}"[m
[32m+[m[32mProject("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "Backend.Tests", "tests\Backend.Tests\Backend.Tests.csproj", "{DB32EB3F-CB7E-4B9F-B0E5-9F7BC80FCF1C}"[m
[32m+[m[32mEndProject[m
[32m+[m[32mProject("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "Solution Items", "Solution Items", "{332DAE63-9527-4929-96B5-87CE2AE69B00}"[m
[32m+[m	[32mProjectSection(SolutionItems) = preProject[m
[32m+[m		[32m.github\workflows\dotnet.yml = .github\workflows\dotnet.yml[m
[32m+[m	[32mEndProjectSection[m
 EndProject[m
 Global[m
 	GlobalSection(SolutionConfigurationPlatforms) = preSolution[m
[1mdiff --git a/src/native-app/.eslintrc.js b/src/native-app/.eslintrc.js[m
[1mnew file mode 100644[m
[1mindex 0000000..3164a8c[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/.eslintrc.js[m
[36m@@ -0,0 +1,42 @@[m
[32m+[m[32mmodule.exports = {[m
[32m+[m[32m  'env': {[m
[32m+[m[32m    'browser': true,[m
[32m+[m[32m    'es2021': true,[m
[32m+[m[32m    'react-native/react-native': true[m
[32m+[m[32m  },[m
[32m+[m[32m  'extends': [[m
[32m+[m[32m    'eslint:recommended',[m
[32m+[m[32m    'plugin:react/recommended',[m
[32m+[m[32m    'plugin:@typescript-eslint/recommended'[m
[32m+[m[32m  ],[m
[32m+[m[32m  'overrides': [[m
[32m+[m[32m  ],[m
[32m+[m[32m  'parser': '@typescript-eslint/parser',[m
[32m+[m[32m  'parserOptions': {[m
[32m+[m[32m    'ecmaVersion': 'latest',[m
[32m+[m[32m    'sourceType': 'module'[m
[32m+[m[32m  },[m
[32m+[m[32m  'plugins': [[m
[32m+[m[32m    'react',[m
[32m+[m[32m    'react-native',[m
[32m+[m[32m    '@typescript-eslint'[m
[32m+[m[32m  ],[m
[32m+[m[32m  'rules': {[m
[32m+[m[32m    'indent': [[m
[32m+[m[32m      'error',[m
[32m+[m[32m      2[m
[32m+[m[32m    ],[m
[32m+[m[32m    'linebreak-style': [[m
[32m+[m[32m      'error',[m
[32m+[m[32m      'unix'[m
[32m+[m[32m    ],[m
[32m+[m[32m    'quotes': [[m
[32m+[m[32m      'error',[m
[32m+[m[32m      'single'[m
[32m+[m[32m    ],[m
[32m+[m[32m    'semi': [[m
[32m+[m[32m      'error',[m
[32m+[m[32m      'always'[m
[32m+[m[32m    ][m
[32m+[m[32m  }[m
[32m+[m[32m};[m
[1mdiff --git a/src/native-app/.gitignore b/src/native-app/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..772ef29[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/.gitignore[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32mnode_modules/[m
[32m+[m[32m.expo/[m
[32m+[m[32mdist/[m
[32m+[m[32mnpm-debug.*[m
[32m+[m[32m*.jks[m
[32m+[m[32m*.p8[m
[32m+[m[32m*.p12[m
[32m+[m[32m*.key[m
[32m+[m[32m*.mobileprovision[m
[32m+[m[32m*.orig.*[m
[32m+[m[32mweb-build/[m
[32m+[m
[32m+[m[32m# macOS[m
[32m+[m[32m.DS_Store[m
[32m+[m
[32m+[m[32m# Temporary files created by Metro to check the health of the file watcher[m
[32m+[m[32m.metro-health-check*[m
[1mdiff --git a/src/native-app/App.tsx b/src/native-app/App.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..0bac92a[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/App.tsx[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32mimport React from 'react';[m
[32m+[m[32mimport { StatusBar } from 'expo-status-bar';[m
[32m+[m[32mimport { StyleSheet, Text, View } from 'react-native';[m
[32m+[m
[32m+[m[32mexport default function App() {[m
[32m+[m[32m  return ([m
[32m+[m[32m    <View style={styles.container}>[m
[32m+[m[32m      <Text>Open up App.tsx to start working on your app! Test</Text>[m
[32m+[m[32m      <StatusBar style="auto" />[m
[32m+[m[32m    </View>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mconst styles = StyleSheet.create({[m
[32m+[m[32m  container: {[m
[32m+[m[32m    flex: 1,[m
[32m+[m[32m    backgroundColor: '#fff',[m
[32m+[m[32m    alignItems: 'center',[m
[32m+[m[32m    justifyContent: 'center',[m
[32m+[m[32m  },[m
[32m+[m[32m});[m
[1mdiff --git a/src/native-app/app.json b/src/native-app/app.json[m
[1mnew file mode 100644[m
[1mindex 0000000..012d5f7[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/app.json[m
[36m@@ -0,0 +1,30 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "expo": {[m
[32m+[m[32m    "name": "native-app",[m
[32m+[m[32m    "slug": "native-app",[m
[32m+[m[32m    "version": "1.0.0",[m
[32m+[m[32m    "orientation": "portrait",[m
[32m+[m[32m    "icon": "./assets/icon.png",[m
[32m+[m[32m    "userInterfaceStyle": "light",[m
[32m+[m[32m    "splash": {[m
[32m+[m[32m      "image": "./assets/splash.png",[m
[32m+[m[32m      "resizeMode": "contain",[m
[32m+[m[32m      "backgroundColor": "#ffffff"[m
[32m+[m[32m    },[m
[32m+[m[32m    "assetBundlePatterns": [[m
[32m+[m[32m      "**/*"[m
[32m+[m[32m    ],[m
[32m+[m[32m    "ios": {[m
[32m+[m[32m      "supportsTablet": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "android": {[m
[32m+[m[32m      "adaptiveIcon": {[m
[32m+[m[32m        "foregroundImage": "./assets/adaptive-icon.png",[m
[32m+[m[32m        "backgroundColor": "#ffffff"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "web": {[m
[32m+[m[32m      "favicon": "./assets/favicon.png"[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[1mdiff --git a/src/native-app/assets/adaptive-icon.png b/src/native-app/assets/adaptive-icon.png[m
[1mnew file mode 100644[m
[1mindex 0000000..03d6f6b[m
Binary files /dev/null and b/src/native-app/assets/adaptive-icon.png differ
[1mdiff --git a/src/native-app/assets/favicon.png b/src/native-app/assets/favicon.png[m
[1mnew file mode 100644[m
[1mindex 0000000..e75f697[m
Binary files /dev/null and b/src/native-app/assets/favicon.png differ
[1mdiff --git a/src/native-app/assets/icon.png b/src/native-app/assets/icon.png[m
[1mnew file mode 100644[m
[1mindex 0000000..a0b1526[m
Binary files /dev/null and b/src/native-app/assets/icon.png differ
[1mdiff --git a/src/native-app/assets/splash.png b/src/native-app/assets/splash.png[m
[1mnew file mode 100644[m
[1mindex 0000000..0e89705[m
Binary files /dev/null and b/src/native-app/assets/splash.png differ
[1mdiff --git a/src/native-app/babel.config.js b/src/native-app/babel.config.js[m
[1mnew file mode 100644[m
[1mindex 0000000..2900afe[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/babel.config.js[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mmodule.exports = function(api) {[m
[32m+[m[32m  api.cache(true);[m
[32m+[m[32m  return {[m
[32m+[m[32m    presets: ['babel-preset-expo'],[m
[32m+[m[32m  };[m
[32m+[m[32m};[m
[1mdiff --git a/src/native-app/package-lock.json b/src/native-app/package-lock.json[m
[1mnew file mode 100644[m
[1mindex 0000000..1c0b3e2[m
[1m--- /dev/null[m
[1m+++ b/src/native-app/package-lock.json[m
[36m@@ -0,0 +1,15652 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "name": "native-app",[m
[32m+[m[32m  "version": "1.0.0",[m
[32m+[m[32m  "lockfileVersion": 3,[m
[32m+[m[32m  "requires": true,[m
[32m+[m[32m  "packages": {[m
[32m+[m[32m    "": {[m
[32m+[m[32m      "name": "native-app",[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "expo": "~48.0.18",[m
[32m+[m[32m        "expo-status-bar": "~1.4.4",[m
[32m+[m[32m        "react": "18.2.0",[m
[32m+[m[32m        "react-native": "0.71.8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "devDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.20.0",[m
[32m+[m[32m        "@types/react": "~18.0.14",[m
[32m+[m[32m        "@typescript-eslint/eslint-plugin": "^5.59.11",[m
[32m+[m[32m        "@typescript-eslint/parser": "^5.59.11",[m
[32m+[m[32m        "eslint": "^8.43.0",[m
[32m+[m[32m        "eslint-plugin-react": "^7.32.2",[m
[32m+[m[32m        "eslint-plugin-react-native": "^4.0.0",[m
[32m+[m[32m        "typescript": "^4.9.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ampproject/remapping": {[m
[32m+[m[32m      "version": "2.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-lFMjJTrFL3j7L9yBxwYfCq2k6qqwHyzuUl/XBnif78PWTJYyL/dfowQHWE3sp6U6ZzqWiiIZnpTMO96zhkjwtg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.0",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/code-frame": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-Xmwn266vad+6DAqEB2A6V/CcZVp62BbwVmcOJc2RPuwih1kw02TjQvWVWlcKGbBPd+8/0V5DEkOcizRGYsspYQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/highlight": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/compat-data": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-4Jc/YuIaYqKnDDz892kPIledykKg12Aw1PYX5i/TY28anJtacvM1Rrr8wbieB9GfEJwlzqT0hUEao0CxEebiDA==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/core": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/core/-/core-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-SBuTAjg91A3eKOvD+bPEz3LlhHZRNu1nFOVts9lzDJTXshHTjII0BAtDS3Y2DAkdZdDKWVZGVwkDfc4Clxn1dg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ampproject/remapping": "^2.2.0",[m
[32m+[m[32m        "@babel/code-frame": "^7.22.5",[m
[32m+[m[32m        "@babel/generator": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-compilation-targets": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-module-transforms": "^7.22.5",[m
[32m+[m[32m        "@babel/helpers": "^7.22.5",[m
[32m+[m[32m        "@babel/parser": "^7.22.5",[m
[32m+[m[32m        "@babel/template": "^7.22.5",[m
[32m+[m[32m        "@babel/traverse": "^7.22.5",[m
[32m+[m[32m        "@babel/types": "^7.22.5",[m
[32m+[m[32m        "convert-source-map": "^1.7.0",[m
[32m+[m[32m        "debug": "^4.1.0",[m
[32m+[m[32m        "gensync": "^1.0.0-beta.2",[m
[32m+[m[32m        "json5": "^2.2.2",[m
[32m+[m[32m        "semver": "^6.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/babel"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/generator": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/generator/-/generator-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-+lcUbnTRhd0jOewtFSedLyiPsD5tswKkbgcezOqqWFUVNEwoUTlpPOBmvhG7OXWLR4jMdv0czPGH5XbflnD1EA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5",[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.2",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.17",[m
[32m+[m[32m        "jsesc": "^2.5.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-annotate-as-pure": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-LvBTxu8bQSQkcyKOU+a1btnNFQ1dMAd0R6PyW3arXes06F6QLWLIrd681bxRPIXlrMGR3XYnW9JyML7dP3qgxg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-builder-binary-assignment-operator-visitor": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-m1EP3lVOPptR+2DwD125gziZNcmoNSHGmJROKoy87loWUQyJaVXDgpmruWqDARZSmtYQ+Dl25okU8+qhVzuykw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-compilation-targets": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-Ji+ywpHeuqxB8WDxraCiqR0xfhYjiDE/e6k7FuIaANnoOFxAHskHChz4vA1mJC9Lbm01s1PVAGhQY4FUKSkGZw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/compat-data": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-validator-option": "^7.22.5",[m
[32m+[m[32m        "browserslist": "^4.21.3",[m
[32m+[m[32m        "lru-cache": "^5.1.1",[m
[32m+[m[32m        "semver": "^6.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-create-class-features-plugin": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-xkb58MyOYIslxu3gKmVXmjTtUPvBU4odYzbiIQbWwLKIHCsx6UGZGX6F1IznMFVnDdirseUZopzN+ZRt8Xb33Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-annotate-as-pure": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-environment-visitor": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-function-name": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-member-expression-to-functions": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-optimise-call-expression": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-replace-supers": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-skip-transparent-expression-wrappers": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-split-export-declaration": "^7.22.5",[m
[32m+[m[32m        "semver": "^6.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-create-regexp-features-plugin": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-1VpEFOIbMRaXyDeUwUfmTIxExLwQ+zkW+Bh5zXpApA3oQedBx9v/updixWxnx/bZpKw7u8VxWjb/qWpIcmPq8A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-annotate-as-pure": "^7.22.5",[m
[32m+[m[32m        "regexpu-core": "^5.3.1",[m
[32m+[m[32m        "semver": "^6.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-define-polyfill-provider": {[m
[32m+[m[32m      "version": "0.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RnanLx5ETe6aybRi1cO/edaRH+bNYWaryCEmjDDYyNr4wnSzyOp8T0dWipmqVHKEY3AbVKUom50AKSlj1zmKbg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-compilation-targets": "^7.17.7",[m
[32m+[m[32m        "@babel/helper-plugin-utils": "^7.16.7",[m
[32m+[m[32m        "debug": "^4.1.1",[m
[32m+[m[32m        "lodash.debounce": "^4.0.8",[m
[32m+[m[32m        "resolve": "^1.14.2",[m
[32m+[m[32m        "semver": "^6.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.4.0-0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-environment-visitor": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-environment-visitor/-/helper-environment-visitor-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-XGmhECfVA/5sAt+H+xpSg0mfrHq6FzNr9Oxh7PSEBBRUb/mL7Kz3NICXb194rCqAEdxkhPT1a88teizAFyvk8Q==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-function-name": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-function-name/-/helper-function-name-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-wtHSq6jMRE3uF2otvfuD3DIvVhOsSNshQl0Qrd7qC9oQJzHvOL4qQXlQn2916+CXGywIjpGuIkoyZRRxHPiNQQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/template": "^7.22.5",[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-hoist-variables": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-hoist-variables/-/helper-hoist-variables-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-wGjk9QZVzvknA6yKIUURb8zY3grXCcOZt+/7Wcy8O2uctxhplmUPkOdlgoNhmdVee2c92JXbf1xpMtVNbfoxRw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-member-expression-to-functions": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-aBiH1NKMG0H2cGZqspNvsaBe6wNGjbJjuLy29aU+eDZjSbbN53BaxlpB02xm9v34pLTZ1nIQPFYn2qMZoa5BQQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-imports": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-8Dl6+HD/cKifutF5qGd/8ZJi84QeAKh+CEe1sBzz8UayBBGg1dAIJrdHOcOM5b2MpzWL2yuotJTtGjETq0qjXg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-transforms": {[m
[32m+[m[32m      "version": "7.22.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.22.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-+hGKDt/Ze8GFExiVHno/2dvG5IdstpzCq0y4Qc9OJ25D4q3pKfiIP/4Vp3/JvhDkLKsDK2api3q3fpIgiIF5bw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-environment-visitor": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-module-imports": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-simple-access": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-split-export-declaration": "^7.22.5",[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.22.5",[m
[32m+[m[32m        "@babel/template": "^7.22.5",[m
[32m+[m[32m        "@babel/traverse": "^7.22.5",[m
[32m+[m[32m        "@babel/types": "^7.22.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "