# Dsfr::Assets

Cette gem met à disposition les assets du [Système de Design de l'État (DSFR)](https://github.com/GouvernementFR/dsfr).

## Installation

```bash
bundle add dsfr-assets
```

## Usage

Dans votre template/layout :

```erb
<%= stylesheet_link_tag "dsfr.min", "application-turbo-track": "reload" %>
<%= javascript_include_tag "dsfr.module.min.js", type: 'module' %>
<%= javascript_include_tag "dsfr.nomodule.min.js", nomodule: true %>
```
