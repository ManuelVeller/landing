const fs = require('fs');
const path = require('path');

const envPath = path.join(__dirname, '.env');
const templatePath = path.join(__dirname, 'config.template.js');
const outputPath = path.join(__dirname, 'config.js');

if (!fs.existsSync(envPath)) {
    console.error('.env file not found! Please create it or copy from .env.example');
    process.exit(1);
}

if (!fs.existsSync(templatePath)) {
    console.error('config.template.js not found!');
    process.exit(1);
}

const envContent = fs.readFileSync(envPath, 'utf8');
const envVars = {};

envContent.split(/\r?\n/).forEach(line => {
    line = line.trim();
    if (!line || line.startsWith('#')) return;
    const firstEquals = line.indexOf('=');
    if (firstEquals === -1) return;
    const key = line.substring(0, firstEquals).trim();
    let val = line.substring(firstEquals + 1).trim();
    // Strip quotes if any
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) {
        val = val.substring(1, val.length - 1);
    }
    envVars[key] = val;
});

let templateContent = fs.readFileSync(templatePath, 'utf8');

// Replace ${VAR} or $VAR with envVars[VAR]
const replacedContent = templateContent.replace(/\${(\w+)}|\$(\w+)/g, (match, p1, p2) => {
    const key = p1 || p2;
    return envVars[key] !== undefined ? envVars[key] : match;
});

fs.writeFileSync(outputPath, replacedContent, 'utf8');
console.log('Successfully generated config.js from .env');
process.exit(0);
