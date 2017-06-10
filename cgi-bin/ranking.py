#!/usr/bin/env python3
try:
    import cgi
    from database import get_connection

    """ handles escaping quotes for passing arguments to cgi scripts """
    """ complimnets of Fricke """
    from urllib.parse import quote as wrap

    """ Sql Query to list fighters based off of fights and wins """

    sql = """
             select name, count(winner_id) wins
             from combatant, fight where
             winner_id = id group by(winner_id)
             """

    """ Establish connection to database """
    connection = get_connection()
    cursor = connection.cursor()

    """ execute the sql query and retreive results """
    cursor.execute(sql)
    result = cursor.fetchall()

    """ Close Connections """
    cursor.close()
    connection.close()

    """ Used to accurately represent the number of wins or win """
    wins = "Wins"
    win = "Win"
    win_wins = wins

    """ HTTP Head """
    print("Content-type: text/html\n")
    print("<html><head><title>Rankings</title>")
    print("</head>")

    """ HTTP Body """
    print("<body>")

    """ Print the results of the query """
    for names in result:
        """ If number of wins is singular, print win, else print wins """
        if (names[1] == 1):
            win_wins = win

        """ Print results with a link to the combatant_details page """
        """ Passing the argument clicked as a cgi argument """
        print("<h3><a href='combatant_details.py?name=", wrap(names[0]),
              "'>", names[0], " ", names[1], " ", win_wins,
              "</a></h3>", sep="")

    """ Close body and html """
    print("</body></html>")

except:
    """ Handle Exceptiosn to prevent the page from exploding """
    print("Content-type: text/html\n")
    print("<html><h3>Oops! Something went wront</h3></html>")
