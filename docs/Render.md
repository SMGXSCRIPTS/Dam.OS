---
title: Interactive
theme: minima
filename: Render.md
---

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Rendering</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <style>
        #interactive-element {
        padding: 10px;
        background-color: lightblue;
        cursor: pointer;
        }
    </style>
    <div id="interactive-element">Click me!</div>
    <script src="script.js"></script>
</body>
</html>
   const interactiveElement = document.getElementById('interactive-element');

   interactiveElement.addEventListener('click', function() {
       alert('You clicked the interactive element!');
   });
