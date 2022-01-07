import sqlite3
from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/animals/<idx>')
def animals(idx):
    con = sqlite3.connect('animal.db')

    cursor = con.cursor()
    query = f"""
        SELECT * from animals_fin
        left join outcomes on outcomes.animal_id=animal_id
        WHERE animals_fin.id={idx}
    """

    cursor.execute(query)
    result = cursor.fetchall()
    con.close()

    if len(result) == 1:
        line = result[0]
        result_dict = {
            "1": line[0],
            "2": line[1],
            "3": line[2],
        }
    else:
        result_dict = {}
    return jsonify(result_dict)


app.run(debug=True, port=5000)
