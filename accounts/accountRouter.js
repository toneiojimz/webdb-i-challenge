const express = require('express');
const account = require('./accountModel');

const router = express.Router();

router.get('/', (req, res) => {
    account.get()
    .then(response => {
        return res.status(200).json(response);
    })
    .catch(err => {
        console.log(err);
        return res.status(500).json({ error: 'Something not working, try again' })
    })
})

router.get('/:id', (req, res) => {
    if (req.params.id) {
        const { id } = req.params;
        account.getByID(id)
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(err => {
            console.log(err);
            return res.status(500).json({ error: "Something not working, try again" })
        })
    }
})

router.delete('/:id', (req, res) => {
    account.remove(req.params.id)
    .then(response => {
        return res.status(200).json({ message: "account deleted" })
    })
    .catch(err => {
        console.log(err);
        return res.status(500).json({ error: "Something not working, try again" })
    })
})

router.post('/', (req, res) => {
    account.insert(req.body)
    .then(response => {
        return res.status(201).json(response);
    })
    .catch(err => {
        console.log(err);
        return res.status(500).json({ error: "error adding account" })
    })
})

router.put('/:id', (req, res) => {
    if (req.params.id) {
        const { id } = req.params;
        account.update(id, req.body)
        .then(response => {
            return res.status(200).json(response);
        })
        .catch(err => {
            console.log(err);
            return res.status(500).json({ error: "error editing account" })
        })
    }
})

module.exports = router;