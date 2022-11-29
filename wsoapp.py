# Requires the Bottle and MySQL libraries
# To use this app:
#   pip install mysql-connector-python
#   pip install flask


from flask import Flask, request
from datetime import datetime
import time
from mysql.connector import connect
import dbconfig

app = Flask(__name__)

@app.route('/')
def displayServices():

    # We don't close the following explicitly because they are automatically closed
    # when the variables go out of scope when hello() returns
    con = connect(user=dbconfig.DB_USER, password=dbconfig.DB_PASS, database=dbconfig.DB_NAME, host=dbconfig.DB_HOST) 
    cursor = con.cursor() 
    con.autocommit = True

    cursor.execute("""
            select Service_ID, Svc_DateTime, Theme_Event
            from service
            """)

    # cursor.execute("""
    #     select ProdId, ProdName, Quantity, ProdNextShipDate
    #     from product
    #     where Quantity < %s
    # """, (qty, ))   

    # Retrieve results
    result = cursor.fetchall()

    tableRows = ""
    for row in result:
        (serviceid, datetime, themeevent) = row
        tableRow = f"""
        <tr>
            <td>{serviceid}
            <td>{datetime}
            <td>{themeevent}
        </tr>
        """
        tableRows += tableRow

    return HTML_SVCPAGE.format(tableRows)

HTML_SVCPAGE = """<html><body>
        <table border='1'>
        <tr>
            <td>Service #
            <td>Date
            <td>Theme
        </tr>        
        {0}
        </table>
        </body></html>"""

# Launch the local web server
if __name__ == "__main__":
    app.run(host='localhost', debug=True)
    
