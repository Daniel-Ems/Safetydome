#!/usr/bin/env python3
try:
    import cgi
    from database import get_connection

    """ Sql query to print combatant details """
    sql = """
             SELECT c.id, c.name, s.name species,
             s.type, base_atk, base_dfn, base_hp
             FROM combatant c, species s WHERE
             s.id = c.id AND c.name = %s
             """

    """ Recieve values passed to cgi script """
    fields = cgi.FieldStorage()
    default = ""
    fighter_name = fields.getvalue("name", default)

    """ Connect to database """
    connection = get_connection()
    cursor = connection.cursor()

    """ Execute query,fetch results and details """
    cursor.execute(sql, (fighter_name,))
    field_name = [x[0] for x in cursor.description]
    result = cursor.fetchall()

    """ Close Connection """
    cursor.close()
    connection.close()

    """ HTTP head """
    print("Content-type: text/html\n")

    """ HTTP Body """
    print("<html><head><title>Combatant Details</title>")
    print("</head>")

    """ Print the contents of the query as a table in html """
    print("<body><table border='1'>")
    print("<tr align = center>")

    """ Print the titles of the query return values """
    for title in field_name:
        print("<th>", title, "</th>")
    print("</tr>")

    """ Print the values of the query """
    print("<tr align = center>")
    for name in result:
        for cell in name:
            print("<td width = '10%'>", cell, "</td>")

    """ End tables, body, and html """
    print("</tr>")
    print("</table>")
    print("</tr>")
    print("</body>")
    print("</html>")

except:
    """ Handle exceptions so page doesn't explode """
    print("Content-type: text/html\n")
    print("<html><h1>Oops! Something went wrong.</h1><html>")
