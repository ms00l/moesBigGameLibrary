const mongoose = require('mongoose')

const gameSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    console: {
      type: String,
      required: true
    },
    rating: {
      type: Number,
      required: true
    },
    review: {
      type: String
    },
    status: {
      type: Boolean,
      required: true
    },
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User'
    }
  },
  {
    timestamps: true
  }
)

module.exports = mongoose.model('Game', gameSchema)
