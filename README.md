# HW2
Hasti Abbasi Kenarsari<br>
Professor Rick Ramirez<br>
CS 4080.03<br>
12 February 2026<br>

### Ch4
1. The lexical grammars of Python and Haskell are not regular. What does that mean, and why aren’t they?
    - In order for a language to be considered regular, the tokens must be recognized using regular expressions or finite automata. Using only finite memory, you should be able to decide what token you’re in. Python and Haskell use indentation based blocks with an unbounded quantity of indentation levels. You can’t track them using a finite automata, meaning they are not regular.
      
2. Aside from separating tokens—distinguishing print foo from printfoo—spaces aren’t used much in most languages. However, in a couple of dark corners, a space does affect how code is parsed in CoffeeScript, Ruby, and the C preprocessor. Where and what effect does it have in each of those languages?
    - In CoffeeScript, white space can also serve as syntax (not just a line break). It affects how function calls and arguments are parsed because parentheses are often omitted. In Ruby, white space can heavily affect how an expression is interpreted. It can determine whether code is parsed as a method call or as an arithmetic expression. White space is particularly influential for method calls without parentheses and for unary/binary operators. In C, spaces can change how macros are expanded and how tokens are combined during the preprocessing stage. The macro expansion and tokenization are affected before the parsing occurs.
      
3. Our scanner here, like most, discards comments and whitespace since those aren’t needed by the parser. Why might you want to write a scanner that does not discard those? What would it be useful for?
    - A scanner that doesn’t discard comments and whitespace is necessary for programming tools that need to reconstruct/understand the original source code. This is useful for implementing automatic document generators, linting tools that examine code style, IDS performing refactoring, and the developing code formatters.
      
4. Add support to Lox’s scanner for C-style /*...*/ block comments. Make sure to handle newlines in them. Consider allowing them to nest. Is adding support for nesting more work than you expected? Why?
    - [code for ch4 q4](https://github.com/CS-4080/HW2/tree/main/ch4_q4)

### Ch5
1. Earlier, I said that the |, *, and + forms we added to our grammar metasyntax were just syntactic sugar. Produce a grammar that matches the same language but does not use any of the notational sugar. Bonus: What kind of expression does this bit of grammar encode?
    - expr → atom expr_tail<br>
expr_tail → expr_fill<br>
expr_tail → expr_fill expr_tail<br>
expr_fill → “.” IDENTIFIER<br>
expr_fill → “(“ arg “)”<br>
arg → expr arg_tail<br>
arg → ε<br>
arg_tail → “,” expr arg_tail<br>
arg_tail → ε<br>
atom → IDENTIFIER<br>
atom → NUMBER<br>

Bonus: This grammar encodes the “call expression” form used in Lox. 

2. The Visitor pattern lets you emulate the functional style in an object-oriented language. Devise a complementary pattern for a functional language. It should let you bundle all of the operations on one type together and let you define new types easily. (SML or Haskell would be ideal for this exercise, but Scheme or another lisp works as well.)
    - [code for ch5 q2](https://github.com/CS-4080/HW2/blob/main/ch4_q2.hs)
  
    
3. In reverse Polish notation (RPN), the operands to an arithmetic operator are both placed before the operator, so 1 + 2 becomes 1 2 +. Evaluation proceeds from left to right. Numbers are pushed onto an implicit stack. An arithmetic operator pops the top two numbers, performs the operation, and pushes the result. Define a visitor class for our syntax tree classes that takes an expression, converts it to RPN, and returns the resulting string.

    - [code for ch5 q3](https://github.com/CS4080/HW2/blob/main/ch5_q3/RpnPrinter.java)


