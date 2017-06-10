#!/usr/bin/env python3
try:
    import cgi
    from database import get_connection

    """ Hangle escaping quotes for passing arguments to cgi scripts """
    """ Compliments of Fricke """
    from urllib.parse import quote as wrap

    """ Sql Query to print the name of combatant's in every fight """
    sql = """
            SELECT one.name, two.name FROM
            combatant one, combatant two,
            fight WHERE one.id = combatant_one
            AND two.id = combatant_two
            """

    """ Connect to the database and get a handle on the cursor """
    connection = get_connection()
    cursor = connection.cursor()

    """ Execute the sql query, gain information, and results  """
    cursor.execute(sql)
    fields = [x[0] for x in cursor.description]
    result = cursor.fetchall()

    """ Close Connection to not hold up server """
    cursor.close()
    connection.close()

    """ HTTP head """
    print("Content-type: text/html\n")

    print("<html><head><title>Battles</title>")

    """ HTTP body """
    """ Link to battle_details, and print combatant one vs. combatant two """
    for name in result:
        print("<h3><a href='battle_details.py?combatant_one=",
              wrap(name[0]), "&combatant_two=", wrap(name[1]),
              "'>", name[0], " vs ", name[1], "</a></h3>", sep="")

        """ Add a space between fight listinings """
        print("<br/>")

    """ End body and html """
    print("</body></html>")

except:
    """ handle Exceptions so page Doesn't explode """
    print("Content-type: text/html\n")
    print("<html><h3>Oops! Something Went Wrong</h3></html>")
