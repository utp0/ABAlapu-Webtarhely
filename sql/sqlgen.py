import os
import sys

if len(sys.argv) != 2:
    exit()
root = sys.argv[1]

files = []
def rec(path='', depth=1):
    global files
    total_size = 0
    for file in os.listdir(root + path):
        fstat = os.stat(f'{root}/{path}/{file}')
        isdir = (fstat.st_mode & 0xf000) == 0x4000

        if isdir and file.startswith('.'):
            continue

        size = rec(f'{path}/{file}', depth+1) if isdir else fstat.st_size
        total_size += size
        files.append((depth, file, isdir, size, path if path else '/'))
    return total_size

files.append((0, '/', True, rec(), ''))
files.sort()#(key=lambda x: x[0])

for id, (_, file, isdir, size, path) in enumerate(files):
    print(f"INSERT INTO Fajlok VALUES ({id}, '{file}', {int(isdir)}, {size}, '{path}')")

