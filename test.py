from sqlalchemy import create_engine,Column,Integer,String, update
from sqlalchemy.orm import declarative_base,sessionmaker
engine=create_engine("sqlite:///rebotica/db.sqlite")#подключение к бд,db-название файла, надо менять
Base=declarative_base()#шаблон для таблицы
class User(Base):
    __tablename__="users"
    id=Column(Integer,primary_key=True)
    chat_id=Column(Integer)
    user_name=Column(String(20))

Base.metadata.create_all(engine)

def add(dct):
    Sation=sessionmaker(bind=engine)
    s=Sation() #тоже сессия
    #user=User(id=123456789,chat_id=13478909876,user_name='Aleks')
    new_row = User(**dct)
    s.add(new_row)
    s.commit()

if __name__=="__main__":
    add({"chat_id":123456789,"user_name":"Aleks"})
