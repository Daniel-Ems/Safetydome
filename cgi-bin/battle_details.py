#!/usr/bin/env python3
try:
    import cgi
    from database import get_connection

    """ Sql query to select fight details """

    sql = """
         SELECT * FROM fight one
         WHERE combatant_one =
         (SELECT id FROM combatant WHERE name = %s)
         AND combatant_two =
         (SELECT id FROM combatant WHERE name = %s)
        """
    """ remove the values of the fields passed to the cgi script """
    """  and assign them variable names """
    fields = cgi.FieldStorage()
    default = ""
    combatant_one = fields.getvalue("combatant_one", default)
    combatant_two = fields.getvalue("combatant_two", default)

    """ Connect to the database and get a handle on the cursor """
    connection = get_connection()
    cursor = connection.cursor()

    """ Execute the sql query passing the arguments passed to the scipt """
    cursor.execute(sql, (combatant_one, combatant_two))

    """ recieve information about the query and the results of the query """
    field_name = [x[0] for x in cursor.description]
    result = cursor.fetchall()

    """ close the connection so not to block up the server """
    cursor.close()
    connection.close()

    """ This is the head of the HTTP response """
    print("Content-type: text/html\n")

    """ This begins the body of the HTTP response """
    print("<html><head><title>Battle Details</title>")
    print("</head>")

    """ Place the contents of the return value in a table """
    print("<body><table border='1'>")
    print("<tr align = center>")

    """ print the titles of the return values of the query """
    for title in field_name:
        print("<th>", title, "</th>")
    print("</tr>")

    """ print the cells of the return values of the query """
    print("<tr align = center>")
    for name in result:
        for cell in name:
            print("<td width = '10%'>", cell, "</td>")

    """ Close the table, body and html """
    print("</tr>")
    print("</table>")
    print("</body>")
    print("</html>")

except:
    """ handle exceptions so the page doesn't crash """
    print("Content-type: text/html\n")
    print("<html><h1>Oops! Something went wrong.</h1></html>")
