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

# Create cursor
con = connect(user=dbconfig.DB_USER, password=dbconfig.DB_PASS, database=dbconfig.DB_NAME, host=dbconfig.DB_HOST) 
cursor = con.cursor() 
con.autocommit = True

@app.route('/')
def displayServices():

    # Select all services
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
            <td>
                <form action="/serviceInfo" method="get">
                    <button name="info" type="submit" formaction="/serviceInfo" value="{serviceid}"> 
                        Info
                    </button>
                </form>
            </td>
        </tr>
        """
        tableRows += tableRow

    return HTML_SVCPAGE.format(tableRows)

@app.route('/serviceInfo')
def serviceInfo():
    
    # Grab specific service
    cursor.execute("""
            select * from service_view
            where service_id = %s
            """, (request.args['info'], ))

    result = cursor.fetchall()
    
    tableRows = ""
    for row in result:
        (serviceid, datetime, themeevent, songleader, organist, pianist, seq_num, event, title, name, notes) = row
        tableRow = f"""
        <tr>
            <td>{serviceid}
            <td>{datetime}
            <td>{themeevent}
            <td>{songleader}
            <td>{organist}
            <td>{pianist}
            <td>{seq_num}
            <td>{event}
            <td>{title}
            <td>{name}
            <td>{notes}
        </tr>
        """
        tableRows += tableRow
        
    return HTML_SVCINFO.format(tableRows)





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
        
HTML_SVCINFO = """<html><body>
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