from flask import Flask, render_template, request, redirect, url_for
from db_model import db

app = Flask(__name__)

# Configuration directly in app.py
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+pg8000://postgres:12345@localhost/assignment3'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)


# Home route to display all tables and their columns
@app.route('/')
def home():
    tables = {}
    inspector = db.inspect(db.engine)
    table_names = inspector.get_table_names(schema='asmnt3')

    for t in table_names:
        columns = []
        pr_keys = inspector.get_pk_constraint(t, schema='asmnt3').get('constrained_columns', [])

        for col in inspector.get_columns(t, schema='asmnt3'):
            column_info = {
                "name": col['name'],
                "type": col['type'],
                "primary_key": col['name'] in pr_keys
            }
            columns.append(column_info)

        tables[t] = columns

    return render_template('home.html', tables=tables)




def get_full_table_name(table_name):
    return 'asmnt3.' + table_name.lower()




@app.route('/view/<table_name>')
def read_entries(table_name):
    fullname = get_full_table_name(table_name)
    table = db.Model.metadata.tables.get(fullname)

    if table is None:
        return f"Table '{table_name}' does not exist."

    query = db.session.query(table)
    rows = query.all()
    columns = [c.name for c in table.columns]

    return render_template('table_view.html', table_name=table_name.capitalize(), rows=rows, columns=columns)




@app.route('/create/<table_name>', methods=['GET', 'POST'])
def create_entry(table_name):
    fullname = get_full_table_name(table_name)
    table = db.Model.metadata.tables.get(fullname)

    if table is None:
        return f"Table '{table_name}' does not exist."

    if request.method == 'POST':
        new_entry = {}
        for c in table.columns:
            if c.name in request.form:
                new_entry[c.name] = request.form[c.name]
        db.session.execute(table.insert(), new_entry)
        db.session.commit()
        return redirect(url_for('read_entries', table_name=table_name))

    columns = [c.name for c in table.columns]
    return render_template('create_entry.html', table_name=table_name.capitalize(), columns=columns)




@app.route('/delete/<table_name>/<pk>', methods=['POST'])
def delete_entry(table_name, pk):
    return


if __name__ == "__main__":
    app.run(debug=True)
