---
extends: _layouts.master
section: content
page: "/uncheck"
title: "uncheck"
---
        
<h1 class="title is-1">uncheck</h1>
<h2 class="subtitle is-4">
    Unchecks a checkbox in the current page.
</h2>

<h3 class="subtitle is-5">Arguments</h3>
<table class="table">
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Required</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="title is-5"><strong>selectorOrName</strong></td>
            <td class="title is-5">string</td>
            <td class="title is-5">true</td>
            <td class="title is-5"></td>
            <td class="title is-5">The selector or name of the checkbox to uncheck.</td>
        </tr>
    </tbody>
</table>

<h3 class="subtitle is-5">Examples</h3>

```js
it( "can uncheck a checkbox", function() {
    this.visit( "/login" )
        .check( "remember_me" )
        .uncheck( "remember_me" );
} );
```