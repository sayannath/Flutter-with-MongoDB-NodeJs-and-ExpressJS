const app = require('./app')
require('./connection');

async function init() {
    app.listen(3000, () => {
        console.log(`Server started on port`);
    });
}

init()