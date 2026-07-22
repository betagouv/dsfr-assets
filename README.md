# Dsfr::Assets

Cette gem met à disposition les assets du [Système de Design de l'État (DSFR)](https://github.com/GouvernementFR/dsfr).

Le numéro de version correspond aux [versions du DSFR](https://github.com/GouvernementFR/dsfr/releases) embarquées.

## Licence et droit d'utilisation

#### ⚠️ Utilisation interdite en dehors des sites Internet de l'État

> Le code du DSFR est sous licence Etalab 2.0 (à l'exception d'éléments soumis à des conditions spécifiques, comme les fontes Marianne), mais son utilisation est encadrée par des [Modalités d'Utilisation](https://github.com/GouvernementFR/dsfr/blob/main/doc/legal/cgu.md). En raison de son rôle de marqueur d'identité visuelle de l'État, le DSFR ne doit pas être utilisé par des entités extérieures à l'administration, et limite sa réplicabilité en dehors d'un nom de domaine en .gouv.fr. En cas d'usage à des fins trompeuses ou frauduleuses, l'État se réserve le droit d'entreprendre les actions nécessaires pour y mettre un terme.

#### ⚠️ Prohibited Use Outside Government Websites

> The DSFR code is licensed under the Etalab 2.0 licence (excluding assets subject to specific conditions, such as the Marianne fonts), but its use is restricted by specific [terms of use](https://github.com/GouvernementFR/dsfr/blob/main/doc/legal/cgu.md). Given its role as a marker of the French State's visual identity, the DSFR must not be used by entities outside the public administration. It cannot be used outside a .gouv.fr domain name.

## Installation

```bash
bundle add dsfr-assets
```

```ruby
# config/application.rb

require 'dsfr/assets'
```

Après avoir lu les [Modalités d'Utilisation](https://github.com/GouvernementFR/dsfr/blob/main/doc/legal/cgu.md), déclarez votre acceptation dans un initializer :

```ruby
# config/initializers/dsfr_assets.rb

Dsfr::Assets.accept_license = "1.0.1"
```

En intégration continue, vous pouvez utiliser la variable d'environnement `DSFR_ACCEPT_LICENSE=1` à la place.

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
