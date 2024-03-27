import { Request, Response } from 'express';

export function palindromeHandler(req: Request, res: Response): void {
    const text = req.params.input as string;
    const cleanInput = text.toLowerCase().replace(/[^a-z]/g, '');

    const palindrome = cleanInput === cleanInput.split('').reverse().join('');
    res.json({ text, palindrome });
}
