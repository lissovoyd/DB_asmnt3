from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Country(db.Model):
    __tablename__ = 'country'
    __table_args__ = {'schema': 'asmnt3'}
    cname = db.Column(db.String(50), primary_key=True)
    population = db.Column(db.BigInteger)


class User(db.Model):
    __tablename__ = 'users'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), primary_key=True)
    name = db.Column(db.String(30))
    surname = db.Column(db.String(40))
    salary = db.Column(db.Integer)
    phone = db.Column(db.String(20))
    cname = db.Column(db.String(50), db.ForeignKey('asmnt3.country.cname'))


class Patient(db.Model):
    __tablename__ = 'patients'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.users.email'), primary_key=True)


class DiseaseType(db.Model):
    __tablename__ = 'disease_type'
    __table_args__ = {'schema': 'asmnt3'}
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(140))


class Disease(db.Model):
    __tablename__ = 'disease'
    __table_args__ = {'schema': 'asmnt3'}
    disease_code = db.Column(db.String(50), primary_key=True)
    pathogen = db.Column(db.String(20))
    description = db.Column(db.String(140))
    id = db.Column(db.Integer, db.ForeignKey('asmnt3.disease_type.id'))


class Discover(db.Model):
    __tablename__ = 'discover'
    __table_args__ = {'schema': 'asmnt3'}
    cname = db.Column(db.String(50), db.ForeignKey('asmnt3.country.cname'), primary_key=True)
    disease_code = db.Column(db.String(50), db.ForeignKey('asmnt3.disease.disease_code'), primary_key=True)
    first_enc_date = db.Column(db.Date)


class PatientDisease(db.Model):
    __tablename__ = 'patient_disease'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.users.email'), primary_key=True)
    disease_code = db.Column(db.String(50), db.ForeignKey('asmnt3.disease.disease_code'), primary_key=True)


class PublicServant(db.Model):
    __tablename__ = 'public_servant'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.users.email'), primary_key=True)
    department = db.Column(db.String(50))


class Doctor(db.Model):
    __tablename__ = 'doctor'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.users.email'), primary_key=True)
    degree = db.Column(db.String(20))


class Specialize(db.Model):
    __tablename__ = 'specialize'
    __table_args__ = {'schema': 'asmnt3'}
    id = db.Column(db.Integer, db.ForeignKey('asmnt3.disease_type.id'), primary_key=True)
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.doctor.email'), primary_key=True)


class Record(db.Model):
    __tablename__ = 'record'
    __table_args__ = {'schema': 'asmnt3'}
    email = db.Column(db.String(60), db.ForeignKey('asmnt3.public_servant.email'), primary_key=True)
    cname = db.Column(db.String(50), db.ForeignKey('asmnt3.country.cname'), primary_key=True)
    disease_code = db.Column(db.String(50), db.ForeignKey('asmnt3.disease.disease_code'), primary_key=True)
    total_deaths = db.Column(db.Integer)
    total_patients = db.Column(db.Integer)
