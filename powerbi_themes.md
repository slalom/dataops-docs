# [Docs](./README.md) > Power BI Themes

Power BI Theme files are stored in JSON format and allow a developer to "skin" an entire report with consistent font styles, color themes, and other formatting elements.

## How to install Power BI theme files

### Out-of-box Power BI Themes

Power BI comes out of box with many different themes. Slalom also has a set of themes which can quickly add to any new or existing report.

1. To select an installed theme: "Home" > "Switch Theme" > "Import theme..."
2. To browse the themes gallary: "Home" > "Switch Theme" > "Theme gallery"

### Custom-Branded Power BI Themes

To apply any of the below themes, first right-click the desired URL and select "copy link". Then in Power BI, select "Home" > "Switch Theme" > "Import theme..." and paste the link into the provided file selecter.

| Theme File | Sample |
|---|---|
| [Slalom Dark Theme](https://raw.githubusercontent.com/slalom-ggp/PowerBI-Themes/master/themes/Default%20-%20Dark.json) | ![dark-sample](https://raw.githubusercontent.com/slalom-ggp/PowerBI-Themes/master/themes/Default%20-%20Dark%20-%20Sample.jpg)
| [Slalom Light Theme](https://raw.githubusercontent.com/slalom-ggp/PowerBI-Themes/master/themes/Default%20-%20Light.json) | ![light-sample](https://raw.githubusercontent.com/slalom-ggp/PowerBI-Themes/master/themes/Default%20-%20Light%20-%20Sample.jpg) |

### Customizing a Power BI Theme

#### Option 1: Use the new theme editor (recommended)

To use the new theme editor, first load the theme you want to edit and then select: "Home" > "Switch Theme" > "Customize current theme"

_Note: As of the time of this publish, the Theme Editor feature is in preview. To enable the preview feature, select: "File" > "Options and Settings" > "Options" > "Preview features" > "Customize current theme"._

#### Option 2: Edit the JSON file (advanced)

The suggested tool for editting the JSON files is VS Code. The VS Code **Color Picker extension** (`lihui.vs-color-picker`) makes it easy to select new colors while editing, and the **Color Highlight extension** (`naumovs.color-highlight`) automatically highlights hex code values in json in the color that was chosen.

## See Also

* [github.com/slalom-ggp/PowerBI-Themes](https://github.com/slalom-ggp/PowerBI-Themes)
* [github.com/deldersveld/PowerBI-ThemeTemplates](https://github.com/deldersveld/PowerBI-ThemeTemplates)
