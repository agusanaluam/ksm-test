import { Request, Response } from 'express';

export function fizzBuzzHandler(req: Request, res: Response): void {
    const num = parseInt(req.params.num);
    if (isNaN(num)) {
        res.status(400).json({ error: 'Invalid input. Please provide a valid number.' });
    }

    let output = '';
    if (num % 3 === 0) {
        output += 'Fizz';
    }
    if (num % 5 === 0) {
        output += 'Buzz';
    }

    if (output === '') {
        output = num.toString();
    }

    res.json({ angkat: num, output });
}
