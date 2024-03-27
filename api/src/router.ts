import express from 'express';
import { fizzBuzzHandler } from './controllers/fizzbuzzController';
import { palindromeHandler } from './controllers/palindromeController';

const router = express.Router();

// Route untuk melakukan FizzBuzz
router.get('/fizzbuzz/:num', fizzBuzzHandler);
router.get('/palindrome/:input', palindromeHandler);


export default router;
