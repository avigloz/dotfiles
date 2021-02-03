# Dark Turquoise

[![Version](https://vsmarketplacebadge.apphb.com/version-short/vhood.dark-turquoise.svg?style=for-the-badge&colorA=10262e&colorB=116062)](https://marketplace.visualstudio.com/items?itemName=vhood.dark-turquoise)
[![Installs](https://vsmarketplacebadge.apphb.com/installs-short/vhood.dark-turquoise.svg?style=for-the-badge&colorA=10262e&colorB=116062)](https://marketplace.visualstudio.com/items?itemName=vhood.dark-turquoise)
[![Rating](https://vsmarketplacebadge.apphb.com/rating-star/vhood.dark-turquoise.svg?style=for-the-badge&colorA=10262e&colorB=116062)](https://marketplace.visualstudio.com/items?itemName=vhood.dark-turquoise&ssr=false#review-details)  

***

A turquoise-based theme package for [Visual Studio Code](https://code.visualstudio.com/).  
  
**Night** themes for the high brightness displays.  
**Rainbow** themes has rich color palette.  

***

## Preview

* **Dark Turquoise**
![Dark Turquoise](https://github.com/vhood/vscode-dark-turquoise/raw/master/media/dt.png)
* **Dark Turquoise ~ Night**
![Dark Turquoise ~ Night](https://github.com/vhood/vscode-dark-turquoise/raw/master/media/dtn.png)
* **Dark Turquoise ~ Rainbow**
![Dark Turquoise ~ Rainbow](https://github.com/vhood/vscode-dark-turquoise/raw/master/media/dtr.png)
* **Dark Turquoise ~ Night Rainbow**
![Dark Turquoise ~ Noght Rainbow](https://github.com/vhood/vscode-dark-turquoise/raw/master/media/dtnr.png)

## Installation

Install the theme from [here](https://marketplace.visualstudio.com/items?itemName=vhood.dark-turquoise) or follow the steps:

1. Launch [Code](https://code.visualstudio.com/).
2. Choose Extensions from the activity bar or serch command `Intall Extentions` or press `cmd+shift+X`.
3. Search for `dark turquoise`.
4. Install extention `Dark Turquoise`.
5. Choose `Preferenses: Color Theme` or press `cmd+K+T`
6. Select any `Dark Turquoise` theme and enjoy it!

`cmd` is `ctrl` in Windows.

## Configuration

To change the color of brackes match border (purple by default), add to settings.json:

```json
"workbench.colorCustomizations": {
    "[Dark Turquoise ~ THEME]": {
        "editorBracketMatch.border": "#a9a9a9"
    }
},
```

If you want more, open an issue and tell me what you'd like to change

## Best practices

### Icons

Try the **[material icons](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)** with **turquoise folders!**  

Add this to your settings  
`"material-icon-theme.folders.color": "#5ec4cd",`  
  
If you use a night theme, the color is `#00b3b3`

### UI helpers

I recommend the **[indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)** extension with these user settings

```json
"indentRainbow.colors": [
    "rgba(255,255,255,0.00)",
    "rgba(255,255,255,0.02)",
    "rgba(255,255,255,0.04)",
    "rgba(255,255,255,0.02)",
],
```
  
Colorize editor's brackets in shades of grey by **[Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)**

```json
"bracket-pair-colorizer-2.colors": [
    "#d3d3d3",
    "#c0c0c0",
    "#a9a9a9"
],
```

Colorizer also adds nice current section lines!

***

* [Release Notes](https://github.com/vhood/vscode-dark-turquoise/blob/master/CHANGELOG.md)  
* [Issues](https://github.com/vhood/vscode-dark-turquoise-theme/issues)
