#!/usr/bin/env python3
try:
    import cgi

    """ handle escaping quotes while passing arguments cgi scripts """
    """ Complements of Fricke """
    from urllib.parse import quote as wrap
    from database import get_connection

    """ Sql query to retreive the combatant list in alphabetical order """
    sql = """
             SELECT name FROM
             combatant order by(name)
             """

    """ Connect to database and get handle on cursor """
    connection = get_connection()
    cursor = connection.cursor()

    """ execute sql query and retreive the results """
    cursor.execute(sql)
    result = cursor.fetchall()

    """ Close Connections to database """
    cursor.close()
    connection.close()

    """ HTTP Head """
    print("Content-type: text/html\n")

    """ HTTP Body """
    print("<html><head><title>Combatants</title>")
    print("</head>")
    print("<body>")

    """ Print Results of query and attach link to combatant details page """
    """ Passing named clicked as argument """
    for names in result:
        print("<h3><a href='combatant_details.py?name=",
              wrap(names[0]), "'>", names[0], "</a></h3>", sep="")

    """ Clost body and html """
    print("</body></html>")

except:   
    """ handle Exceptions so page doesn't explode """
    print("Content-type: text/html\n")
    print("<html>Oops! Something went wrong</html>")
