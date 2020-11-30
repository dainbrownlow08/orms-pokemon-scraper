require 'pry'
class Pokemon
    attr_accessor :id,:name,:type,:db

    def initialize(id = nil)
        @id = id
        @name 
        @type 
        @db
    end

    def self.save(name,type,db)
        sql = <<-SQL
        INSERT INTO pokemon(name,type)
        VALUES (?,?)
        SQL
        db.execute(sql,name,type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.new_from_db(row)
        instance = Pokemon.new
        instance.id = row[0]
        instance.name = row[1]
        instance.type = row[2]
        instance
    end

    def self.find(id,db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        SQL
        db.execute(sql).map{|row| self.new_from_db(row)}.find{|pokemon| pokemon.id == id}
    end
    
    




end
