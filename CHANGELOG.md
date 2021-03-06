# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2020-06-08
### Added
- Re-implementation for:
    - `#each` method.
    - `#each_with_index` method.
    - `#select` method.
    - `#all?` method.
    - `#any?` method.
    - `#none?` method.
    - `#count` method.
    - `#my_map` method.
    - `#my_map!` method.
    - `#my_inject` method.
- `bin/console` file to start `pry` within the project context.

### Fixed
- Rubocop errors.
- `#my_all?` error when passing a fixed single value.
- `#my_any?` error when passing a fixed single value.
- `#my_inject` returning incorrect values.
- `#my_map` not returning enum if no block given.
- `#my_inject` mutating the original array.
- `#my_inject` not returning the same results as `#inject` in some cases.
### Removed
- The question mark from `#my_count?` to be `#my_count` instead."
