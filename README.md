servant-miso-html
============================

This package provides an `HTML` content type for use with [servant](https://hackage.haskell.org/packages/servant) APIs. This can be used to render [miso](https://github.com/dmjio/miso) `View` / `Component` types as HTML.

### Usage

```haskell
import Servant.Miso.Html (HTML)

type Home = "home" :> Get '[HTML] (Component model action)
type About = "about" :> Get '[HTML] (View model action)
type Contact = "contact" :> Get '[HTML] [View model action]
type API = Home :<|> About :<|> Contact
```

## Build

```shell
cabal build
```

```shell
nix develop --command bash -c 'cabal build'
```

# Develop

```shell
nix develop
```
