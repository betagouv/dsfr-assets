# Dsfr::Assets

Cette gem met à disposition les assets du [Système de Design de l'État (DSFR)](https://github.com/GouvernementFR/dsfr).

Le numéro de version correspond aux [versions du DSFR](https://github.com/GouvernementFR/dsfr/releases) embarquées.

## Installation

```bash
bundle add dsfr-assets
```

```ruby
# config/application.rb

require 'dsfr/assets'
```
## Usage

Dans votre template/layout :

```erb
<%= stylesheet_link_tag "dsfr.min", "application-turbo-track": "reload" %>
<%= javascript_include_tag "dsfr.module.min.js", type: 'module' %>
<%= javascript_include_tag "dsfr.nomodule.min.js", nomodule: true %>
```

Si vous utilisez les icônes/pictogrammes, rajoutez :

```erb
<%= stylesheet_link_tag "utility/dsfr-utility.min", "application-turbo-track": "reload" %>
```

## Déploiement

Pour déployer il suffit de mettre la bonne version dans `version.rb`
puis d'utiliser `bundle exec rake release`.
