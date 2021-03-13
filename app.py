from flask import Flask, make_response

app = Flask(__name__)


@app.route("/")
def hello():
    res = make_response("Hello Kefir", 201)
    res.headers['Content-type'] = 'text/plain'
    return res


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)