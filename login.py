import os.path

def make_account():
    filename = ("username")
    with open(filename, "w") as f:
        f.write(input("Enter a username: "))
    filename = ("password")import os.path

    def make_account():
        filename = ("username")
        with open(filename, "w") as f:
            f.write(input("Enter a username: "))
        filename = ("password")
        with open(filename, "w") as f:
            f.write(input("Enter a password: "))
        filename = ("email")
        with open(filename, "w") as f:
            f.write(input("Enter your email address: "))
        filename = ("mobile")
        with open(filename, "w") as f:
            f.write(input("Enter your mobile number: "))
    
    def login():
        username = input("Enter your username: ")
        password = input("Enter your password: ")
        check()
    
    def check():
        if username == open("username").read() and password == open("password").read():
            print("Successful login")
        else:
            print('Incorrect')
    
    if os.path.exists("username"):
        login()
    else:
        make_account()
    
    with open(filename, "w") as f:
        f.write(input("Enter a password: "))
    filename = ("email")
    with open(filename, "w") as f:
        f.write(input("Enter your email address: "))
    filename = ("mobile")
    with open(filename, "w") as f:
        f.write(input("Enter your mobile number: "))

def login():
    username = input("Enter your username: ")
    password = input("Enter your password: ")
    check()

def check():
    if username == open("username").read() and password == open("password").read():
        print("Successful login")
    else:
        print('Incorrect')

if os.path.exists("username"):
    login()
else:
    make_account()
