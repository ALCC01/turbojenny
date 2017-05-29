# The TurboJenny Programming Language

TurboJenny is a groundbreaking programming language that challenges our very notion of programming, bringing it to the next level.

Here's what a TurboJenny program looks like:

![Example program](http://i.imgur.com/z4BjbGy.png)

**Obligatory /s:** TurboJenny was born as an [inside-joke on the Minecraft ITALIA forum](https://www.minecraft-italia.it/forum/t-progetto-turbojenny-il-linguaggio-del-domani-oggi). You shouldn't use it on a production system, you should use [TurboDenny](https://www.minecraft-italia.it/forum/t-progetto-turbo-denny-parliamone) for that.

## Installation

### Using NPM
```
git clone git@github.com:ALCC01/turbojenny.git
cd turbojenny/
[sudo] npm install --local
```

### Using yarn
```
git clone git@github.com:ALCC01/turbojenny.git
[sudo] yarn global add file:<path/to/turbojenny>
```

## Usage
```
tjc --help
```

## Specification

The specification is available in the `SPEC_IT.md` file.
The original specification was written in Italian and no English translation is currently available. Please try to pick up the grammar from the `examples/` directory.

## Technology

The reference implementation uses a parser generated using a [JISON grammar](http://zaa.ch/jison/). The interpeter that goes through the generated AST has been built using Javascript and some duct tape.

## License

The project is released under a GNU GPLv3 license.

```
Copyright (C) 2017 Alberto Coscia

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```