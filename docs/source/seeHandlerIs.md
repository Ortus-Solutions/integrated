---
extends: _layouts.master
section: content
page: "/seeHandlerIs"
title: "seeHandlerIs"
---
        
<h1 class="title is-1">seeHandlerIs</h1>
<h2 class="subtitle is-4">
    Verifies the framework handler of the current page.
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
            <td class="title is-5"><strong>handler</strong></td>
            <td class="title is-5">string</td>
            <td class="title is-5">true</td>
            <td class="title is-5"></td>
            <td class="title is-5">The expected handler</td>
        </tr>
    </tbody>
</table>

<h3 class="subtitle is-5">Examples</h3>

```js
it( "can verify a framework handler", function() {
    this.visit( "/" )
        .seeHandlerIs( "Main" );
} );
```