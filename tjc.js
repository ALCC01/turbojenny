#!/usr/bin/env node
'use strict';
const parser = require('./parser'),
    program = require('commander'),
    path = require('path'),
    chalk = require('chalk'),
    fs = require('fs'),
    packagez = require('./package.json');

let input, raw;

program
    .version(packagez.version)
    .option('-d, --debug', 'Print debug information')
    .arguments('<input>')
    .action((i) => {
        input = path.resolve(i);
    })
    .parse(process.argv);

class Function {
    constructor(statements = [], sup = {}, symbolTable = {}, args = {}) {
        this.statements = statements;
        this.symbolTable = Object.assign({}, symbolTable, args);
        this.return = undefined;
        this.sup = sup;
    }

    execute(statements = this.statements) {
        let exit = false;
        statements.forEach(statement => {
            if (!exit)
            switch(statement.type) {
                case 'create':
                    this.setSymbol(statement.identifier, this.getValue(statement.value), false);
                    break;
                case 'declare_function':
                    this.setSymbol(statement.identifier, this.getValue(statement), false);
                    break;
                case 'call_function':
                    this.getSymbol(statement.identifier).execute();
                    break;
                case 'return':
                    this.return = this.getValue(statement.value);
                    exit = true;
                    break;
                case 'assign':
                    this.setSymbol(statement.identifier, this.getValue(statement.value), true);
                    break;
                case 'print':
                    console.log(chalk.cyan(`>> ${this.getValue(statement.value)}`));
                    break;
                case 'shout':
                    console.log(chalk.red.bold(`>> ${this.getValue(statement.value)}`.toUpperCase()));
                    break;
                case 'if':
                    if (this.getValue(statement.condition) === true) this.execute(statement.statements);
                    else if (statement.else) this.execute(statement.else);
                    break;
                case 'while':
                    while(this.getValue(statement.condition) === true) this.execute(statement.statements)
            }
        });
        return this;
    }

    setSymbol(identifier, value, replace) {
        switch (identifier.type) {
            case 'identifier':
                identifier = identifier.value;
                if (!replace && this.symbolTable[identifier.value] !== undefined) {
                    console.log(chalk.red(`Cannot create symbol ${identifier} as it already exists`));
                    throw "Symbol already exists"
                }
                this.symbolTable[identifier] = value;
                break;
            case 'global':
                this.sup.setSymbol(identifier.value, value, replace);
                break;
        }
    }

    getSymbol(identifier) {
        identifier = identifier.value;
        if (this.symbolTable[identifier] === undefined) {
            console.log(chalk.red(`Cannot read symbol ${identifier} as it doesn't exist`));
            throw "Symbol doesn't exist"
        }
        return this.symbolTable[identifier];
    }

    getValue(object) {
        switch(object.type) {
            case 'identifier':
                return this.getSymbol(object);
            case 'number':
            case 'string':
            case 'boolean':
                return object.value;
            case 'negation':
                return !this.getValue(object.value);
            case 'addition':
                return this.getValue(object.left) + this.getValue(object.right);
            case 'subtraction':
                return this.getValue(object.left) - this.getValue(object.right);
            case 'multiplication':
                return this.getValue(object.left) * this.getValue(object.right);
            case 'division':
                return this.getValue(object.left) / this.getValue(object.right);
            case 'greater':
                return this.getValue(object.left) > this.getValue(object.right);
            case 'greater_equal':
                return this.getValue(object.left) >= this.getValue(object.right);
            case 'lower':
                return this.getValue(object.left) < this.getValue(object.right);
            case 'lower_equal':
                return this.getValue(object.left) <= this.getValue(object.right);
            case 'compare':
                return this.getValue(object.left) === this.getValue(object.right);
            case 'not_compare':
                return this.getValue(object.left) !== this.getValue(object.right);
            case 'declare_function':
                return (new Function(object.statements, this));
            case 'call_function':
                return this.getValue(object.identifier).execute().return;
            case 'global':
                return this.sup.getValue(object.value);
            default:
                throw `Unknown data type ${object.type}`
        }
    }
}

if (!input) {
    program.help();
}
console.log(chalk.blue('TurboJenny - The language of tomorrow, today'));
console.log(chalk.cyan(`Input file is ${input}`));

try {
    raw = fs.readFileSync(input, 'utf8');
} catch (err) {
    console.log(chalk.red(`Cannot read inpunt file ${input}`));
    return;
}
let script = parser.parse(raw);
console.log(chalk.blue(`Running program ${script.name}...`));

let root = new Function(script.statements);
let r = root.execute().return;

console.log(chalk.blue(`Program exited with value ${r}`));
if (program.debug) {
    console.dir(root, {depth: 8, colors: true})
}
console.log(chalk.blue(`End of program`));