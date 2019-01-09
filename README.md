# homebrew-tap
A [Homebrew tap](https://docs.brew.sh/Taps) containing [alternate versions](https://github.com/Homebrew/homebrew-cask-versions) of [casks](https://caskroom.io/).

# Background
Casks cannot be versioned.  Running `brew cask install my_app` will install whichever version of `my_app` the cask is designed to install.  You get what you get, which is often the latest available version of an application.

What happens if you need an older version of something?  Or you need a to use a different supported version of something?  Specifying an arbitrary version of an application is not possible.

However, you can create your own repo (which must be named `homebrew-*`) to contain your own set of customized casks, which will install your required versions of things.  Then you can connect to that repo with the `brew tap` command, and prioritize it ahead of the official taps with the `brew tap-pin` command.  That way, when `brew` looks for a cask named `my_app`, it will use the one from your repo.  Version control achieved!

# Usage
Add a cask to [/Casks](/Casks) which will install `my_app`.

Tap the repo, and prioritize it over the public taps:
```bash
brew tap daptiv/homebrew-tap
brew tap-pin daptiv/homebrew-tap
```

Then install the cask just like normal:
```bash
brew cask install my_app
```
