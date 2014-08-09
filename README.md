[![Build Status](https://travis-ci.org/boie0025/typekit_cli.svg?branch=master)](https://travis-ci.org/boie0025/typekit_cli)
[![Code Climate](https://codeclimate.com/github/boie0025/customer_portal/badges/gpa.svg)](https://codeclimate.com/github/boie0025/customer_portal)
[![Coverage Status](https://coveralls.io/repos/boie0025/typekit_cli/badge.png?branch=master)](https://coveralls.io/r/boie0025/typekit_cli?branch=master)

# Adobe Typekit Command Line Interface

Get information about your typekits from the command line

## Installation

* build the gem:
```rake build```
* install the gem:
```gem install /full/path/to/typekit_cli-0.0.1.gem```

OR

* install with rake:
```rake install```

---

## Configuration
* Set the environment variable for TYPEKIT_TOKEN
```export TYPEKIT_TOKEN=[your token here]```

## Usage


```typekit --list [options]```

OR

```typekit --ids [options]```

## Options
    -f, --families          Display family details for each kit.  Use with --ids
    -n, --with-names        List with kit names.  Use with --list slower, makes an extra API call for each kit.

## Note
This gem is NOT published to RubyGems.
