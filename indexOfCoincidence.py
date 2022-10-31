import operator
alphabetEnglish = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

plaintext_original = "This question came from Elon Musk near the very end of a long dinner we shared at a high-end seafood restaurant in Silicon Valley. I’d gotten to the restaurant " \
                     "first and settled down with a gin and tonic, knowing Musk would—as ever—be late. After about fifteen minutes, Musk showed up wearing leather shoes, designer jeans, and a plaid dress shirt." \
                     " Musk stands six foot one but ask anyone who knows him and they’ll confirm that he seems much bigger than that. He’s absurdly broad-shouldered, sturdy, and thick. You’d figure he would use this " \
                     "frame to his advantage and perform an alpha-male strut when entering a room. Instead, he tends to be almost sheepish. It’s head tilted slightly down while walking, a quick handshake hello after " \
                     "reaching the table, and then butt in seat. From there, Musk needs a few minutes before he warms up and looks at ease.Musk asked me to dinner for a negotiation of sorts. Eighteen months earlier, " \
                     "I’d informed him of my plans to write a book about him, and he’d informed me of his plans not to cooperate. His rejection stung but thrust me into dogged reporter mode. If I had to do this book " \
                     "without him, so be it. Plenty of people had left Musk’s companies, Tesla Motors and SpaceX, and would talk, and I already knew a lot of his friends. This question came from Elon Musk near the very " \
                     "end of a long dinner we shared at a high-end seafood restaurant in Silicon Valley. I’d gotten to the restaurant first and settled down with a gin and tonic, knowing Musk would—as ever—be late. After " \
                     "about fifteen minutes, Musk showed up wearing leather shoes, designer jeans, and a plaid dress shirt. Musk stands six foot one but ask anyone who knows him and they’ll confirm that he seems much bigger " \
                     "than that. He’s absurdly broad-shouldered, sturdy, and thick. You’d figure he would use this frame to his advantage and perform an alpha-male strut when entering a room. Instead, he tends to be almost sheepish. " \
                     "It’s head tilted slightly down while walking, a quick handshake hello after reaching the table, and then butt in seat. From there, Musk needs a few minutes before he warms up and looks at ease.Musk asked me to " \
                     "dinner for a negotiation of sorts. Eighteen months earlier, I’d informed him of my plans to write a book about him, and he’d informed me of his plans not to cooperate. His rejection stung but thrust me into dogged " \
                     "reporter mode. If I had to do this book without him, so be it. Plenty of people had left Musk’s companies, Tesla Motors and SpaceX, and would talk, and I already knew a lot of his friends.This question came from Elon Musk near the very end of a long dinner we shared at a high-end seafood restaurant in Silicon Valley. I’d gotten to the restaurant " \
                     "first and settled down with a gin and tonic, knowing Musk would—as ever—be late. After about fifteen minutes, Musk showed up wearing leather shoes, designer jeans, and a plaid dress shirt." \
                     " Musk stands six foot one but ask anyone who knows him and they’ll confirm that he seems much bigger than that. He’s absurdly broad-shouldered, sturdy, and thick. You’d figure he would use this " \
                     "frame to his advantage and perform an alpha-male strut when entering a room. Instead, he tends to be almost sheepish. It’s head tilted slightly down while walking, a quick handshake hello after " \
                     "reaching the table, and then butt in seat. From there, Musk needs a few minutes before he warms up and looks at ease.Musk asked me to dinner for a negotiation of sorts. Eighteen months earlier, " \
                     "I’d informed him of my plans to write a book about him, and he’d informed me of his plans not to cooperate. His rejection stung but thrust me into dogged reporter mode. If I had to do this book " \
                     "without him, so be it. Plenty of people had left Musk’s companies, Tesla Motors and SpaceX, and would talk, and I already knew a lot of his friends. This question came from Elon Musk near the very " \
                     "end of a long dinner we shared at a high-end seafood restaurant in Silicon Valley. I’d gotten to the restaurant first and settled down with a gin and tonic, knowing Musk would—as ever—be late. After " \
                     "about fifteen minutes, Musk showed up wearing leather shoes, designer jeans, and a plaid dress shirt. Musk stands six foot one but ask anyone who knows him and they’ll confirm that he seems much bigger " \
                     "than that. He’s absurdly broad-shouldered, sturdy, and thick. You’d figure he would use this frame to his advantage and perform an alpha-male strut when entering a room. Instead, he tends to be almost sheepish. " \
                     "It’s head tilted slightly down while walking, a quick handshake hello after reaching the table, and then butt in seat. From there, Musk needs a few minutes before he warms up and looks at ease.Musk asked me to " \
                     "dinner for a negotiation of sorts. Eighteen months earlier, I’d informed him of my plans to write a book about him, and he’d informed me of his plans not to cooperate. His rejection stung but thrust me into dogged " \
                     "reporter mode. If I had to do this book without him, so be it. Plenty of people had left Musk’s companies,"
print(plaintext_original)

plaintext = "" #for string that without operator symbols
key = "LUCK"

for i in plaintext_original:
    if i.isalpha():
        plaintext += i.upper()

lengthKey = len(key)
lengthPlaintext = len(plaintext)
num = int(lengthPlaintext/lengthKey) #type is integer butun san
num1 = lengthPlaintext%lengthKey #type is integer kaldyk san

arrLetters = [*key] #keyword letters
vigenereKey = ""


for i in range(0, num):
    vigenereKey += key

if num1 >= 1:
    for i in range(0,num1):
        vigenereKey += str(arrLetters[i])

encryptedTextArr = []

charVigenereKey = [*vigenereKey]
charPlaintext = [*plaintext]

for i in range(0, len(plaintext)):
    p = alphabetEnglish.index(charPlaintext[i])
    k = alphabetEnglish.index(charVigenereKey[i])
    E = (p + k) % 26

    encryptedTextArr.append(alphabetEnglish[E])

encText = "".join(map(str, encryptedTextArr))

print(encText)

