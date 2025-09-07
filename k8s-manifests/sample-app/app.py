from flask import Flask, request
app = Flask(__name__)

def fib(n):
    if n < 2:
        return n
    a, b = 0, 1
    for _ in range(n-1):
        a, b = b, a + b
    return b

@app.route("/fib")
def get_fib():
    n = int(request.args.get("n", "30"))
    return {"n": n, "fib": fib(n)}

@app.route("/")
def index():
    return "fib demo"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
