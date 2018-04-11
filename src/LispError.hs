module LispError ( LispError (..) ) where

import Text.ParserCombinators.Parsec

import LispVal

data LispError = ParserError ParseError
               | UnboundVar String
               | BadFormError LispVal
               | NotFunction String
               | TypeMismatch String LispVal
               | NumArgError Integer [LispVal]

instance Show LispError where show = showError

showError :: LispError -> String
showError (ParserError err) = "Parser error at " ++ show err
showError (UnboundVar var) = "Unrecognized variable: " ++ var
showError (BadFormError form) = "Cannot evaluate form: " ++ show form
showError (NotFunction func) = "Unrecognized function: " ++ func
showError (TypeMismatch t v) = "Type mismatch: expected " ++ t ++ ", found " ++ show v
showError (NumArgError n args) = "Incorrect number of arguments: "
                                    ++ "expected " ++ show n 
                                    ++ ", found args " ++ (unwords $ map show args)
