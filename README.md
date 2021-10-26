# Description

This is a little [RoR](https://rubyonrails.org/) application which allows to
self host a subset of [PokeAPI](https://pokeapi.co/docs/v2) data, focusing
only on pokemons themselves and their types.

# Installation

```
git clone git@github.com:psychoslave/poke.git
cd poke
bundle install
bin/rails db:setup
bin/rails server
```

If for some reason you need to reinitialize the database, you can use
`bin/rails db:reset`. That's also the way to go to resynchronize data with
possible evolution on PokeAPI data.

# Usage

The application is more specifically intended at a JSON consultation.
So supposing that the server is running locally, the main URLs of interest are:

- http://[::1]:3000/pokemons.json which provides a list of all registered
  pokemons, with id, name and types
- http://[::1]:3000/pokemons/1.json which provide all recorded details for
  the pokemon with the requested id (here `1`)

Alternatively, you can drop the `.json` suffix to get a somewhat minimalist
HTML version of these resources.

There is also the possibility to interact with `types`, in the very same fashion.

Both actually come with all the CRUD usual views, but the only the previously
described use cases where specifficaly aimed at. Especially, entity creation
and edition through forms offer no garantee.

## Requirements

The following stack of version is known to work with this application, but
prior versions might also be compatible.

- Rails version: 6.1.4.1
- Ruby version: 2.5.9p229
- RubyGems version: 2.7.6.3
- Rack version: 2.2.3
- Database: sqlite3 3.34.1

# Architecture

The data are modeled around two main classes, `pokemons` and `types`.
Various damage relationships liking each type with each others also have their
own tables.

![Overview of the database schema](https://raw.githubusercontent.com/psychoslave/poke/main/db/schema.png)

Note that the application doesn't provide all attributes that Pokeapi document,
and most of the time flatten the model. For example `Pokemon` as a `forms_names`
direct attribute rather than a relation to a `forms` table that would hold
a name. For this kind of field, the initial word is left pluralized in the name
and data are stored as comma separated values.

The only notable exception to this flattenized policy are damage relationships
which link types to each others.


