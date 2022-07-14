const mongoose = require('mongoose');
const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: function (value) {
                const re = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                return value.match(re);
            },
            message: "Please provide a valid email address"
        }
    },
    password: {
        type: String,
        required: true,
        minlength: 8
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: "user",
    }
    //Cart
});

const User = mongoose.model('User', userSchema);
module.exports = User;