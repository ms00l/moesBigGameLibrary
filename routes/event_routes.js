const express = require('express')
const passport = require('passport')

const customErrors = require('../lib/custom_errors')
const handle404 = customErrors.handle404
const requireOwnership = customErrors.requireOwnership
const removeBlanks = require('../lib/remove_blank_fields')

const router = express.Router()

// const User = require('../models/user')
const Game = require('../models/game')

const requireToken = passport.authenticate('bearer', { session: false })

// add a game
router.post('/games', requireToken, (req, res, next) => {
  const game = req.body.game
  game.owner = req.user.id
  Game.create(game)
    .then(game => {
      res.status(201).json({ game: game.toObject() })
    })
    .catch(next)
})

// delete a game
router.delete('/games/:id', requireToken, (req, res, next) => {
  const id = req.params.id
  Game.findById(id)
    .then(handle404)
    .then((game) => requireOwnership(req, game))
    .then((game) => game.deleteOne())
    .then(() => res.sendStatus(204))
    .catch(next)
})

// INDEX
// GET /games
router.get('/games', requireToken, (req, res, next) => {
  Game.find({ owner: req.user.id })
    .populate('owner')
    .then((game) => res.json({ game: game }))
    .catch(next)
})

// SHOW
// GET /games/:id
router.get('/games/:id', requireToken, (req, res, next) => {
  const id = req.params.id
  Game.findById(id)
    .populate('owner')
    .then(handle404)
    .then((game) => requireOwnership(req, game))
    .then((game) => res.json({ game: game }))
    .catch(next)
})

// UPDATE
// PATCH /games/:id
router.patch('/games/:id', requireToken, removeBlanks, (req, res, next) => {
  const id = req.params.id
  const gameData = req.body.game
  Game.findById(id)
    .then((game) => {
      console.log(game)
      return game
    })
    .then(handle404)
    .then(game => requireOwnership(req, game))
    .then((game) => {
      Object.assign(game, gameData)
      return game.save()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

module.exports = router
