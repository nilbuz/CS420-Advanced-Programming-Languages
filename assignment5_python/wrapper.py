import subprocess

input_array = ["1", "2", "3", "4", "5"]
prolog_input = "[" + ",".join(map(str, input_array)) + "]."

subprocess.run(["gcc", "ccode.c", "-o", "ccode"])
process = subprocess.run(["./ccode"] + input_array, capture_output=True, text=True)
output = process.stdout.strip()
print(f"C program (add 1) output: {output}")


subprocess.run(["ghc", "hcode.hs"])
process = subprocess.run(["./hcode"] + input_array, capture_output=True, text=True)
output = process.stdout.strip()
print(f"Haskell program (subtract 1) output: {output}")


process = subprocess.run(["swipl", "-q", "-g", "main", "-t", "halt", "pcode.pl"], 
                        input=prolog_input, capture_output=True, text=True)
output = process.stdout.strip()
print(f"Prolog program (reverse) output: {output}")
