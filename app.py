from flask import Flask, render_template, request, redirect, url_for
from db_model import db
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://lissovoyd:oGDdJnaCcipQuMfAii3VD9vs6g6WH1Lk@dpg-cssvl8d6l47c73egpmkg-a.frankfurt-postgres.render.com/assignment3_yjnt'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)


@app.route('/')
def main():
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

    return render_template('main.html', tables=tables)




def get_fullname(table_name):
    return 'asmnt3.' + table_name.lower()



@app.route('/view/<table_name>')
def read(table_name):
    fullname = get_fullname(table_name)
    table = db.Model.metadata.tables.get(fullname)

    query = db.session.query(table)
    rows = query.all()
    columns = [c.name for c in table.columns]

    return render_template('tables.html', table_name=table_name.capitalize(), rows=rows, columns=columns)




@app.route('/create/<table_name>', methods=['GET', 'POST'])
def create(table_name):
    fullname = get_fullname(table_name)
    table = db.Model.metadata.tables.get(fullname) #getting table info

    if request.method == 'POST':  #actuallcreating of entry
        form = {}
        for c in table.columns:
            if c.name in request.form:
                form[c.name] = request.form[c.name]

        db.session.execute(table.insert(), form)
        db.session.commit()
        return redirect(url_for('read', table_name=table_name))


    elif request.method == 'GET': # to properly show what columns to fill for creation
        columns = []
        if len(table.columns) > 0:
            for c in table.columns:
                columns.append(c.name)

        return render_template('create.html', table_name=table_name.capitalize(), columns=columns)



@app.route('/delete/<table_name>/<pk>', methods=['GET', 'POST'])
def delete(table_name, pk):
    fullname = get_fullname(table_name)
    table = db.Model.metadata.tables.get(fullname)  # getting table info

    pk_col = table.primary_key.columns.keys()[0]  # getting primary key

    db.session.execute(table.delete().where(getattr(table.c, pk_col) == pk))
    db.session.commit()
    return redirect(url_for('read', table_name=table_name))



if __name__ == "__main__":
    app.run(debug=True)
