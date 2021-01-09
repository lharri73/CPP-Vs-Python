
## Script based on script in 
## https://realpython.com/cpython-source-code-guide/#part-2-the-python-interpreter-process
import symbol
import token
import parser
import sys
from pprint import pprint

def lex(string):
    symbols = {v: k for k,v in symbol.__dict__.items() if isinstance(v,int)}
    tokens = {v: k for k,v in token.__dict__.items() if isinstance(v,int)}
    lexicon = {**symbols, **tokens}


    st = parser.expr(string)
    st_list = parser.st2list(st)

    def replace(l: list):
        r = []
        for i in l:
            if isinstance(i, list):
                r.append(replace(i))
            else:
                if i in lexicon:
                    r.append(lexicon[i])
                else:
                    r.append(i)
        return r
    return replace(st_list)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print('usage {} "[expression]"'.format(sys.argv[0]))
        exit(1)
    else:
        pprint(lex(sys.argv[1])) 
