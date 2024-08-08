import pandas as pd
from sqlalchemy import create_engine, MetaData, Table, select
from sqlalchemy.orm import sessionmaker

def create_from_excel(excel_file, sheet, db_file, table_name):
    df = pd.read_excel(excel_file, sheet_name=sheet)
    engine = create_engine(f'sqlite:///{db_file}')
    df.to_sql(table_name, engine, index=False)

def get_row(articul):
    engine = create_engine('sqlite:///info.db')
    metadata = MetaData()
    table = Table('tarif', metadata, autoload_with=engine)
    Session = sessionmaker(bind=engine)
    session = Session()
    thing = session.query(table).filter(table.c['Артикул'] == articul).first()._asdict()
    return thing

def pandas_row(articul):
    df = pd.read_excel('elmex.xlsx', sheet_name='Тариф')
    return df[df['Артикул'] == articul]

if __name__ == '__main__':
    #create_from_excel('elmex.xlsx', 'Тариф', 'info.db', 'tarif')
    print(get_row(1104700000))
    print(pandas_row(1104700000))
