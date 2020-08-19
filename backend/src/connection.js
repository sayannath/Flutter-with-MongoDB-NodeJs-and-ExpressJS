const mongoose = require("mongoose");

//Set up default mongoose connection
mongoose
  .connect("mongodb://localhost:27017/storedb", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
  })
  .then((db) => console.log("DB Connected"));
