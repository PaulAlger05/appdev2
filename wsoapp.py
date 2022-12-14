# Requires the Bottle and MySQL libraries
# To use this app:
#   pip install mysql-connector-python
#   pip install flask
from flask import Flask, send_from_directory, request, render_template
import os.path
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

    return render_template("svcPage.html").format(tableRows)

@app.route('/serviceInfo')
def serviceInfo():
    
    # Grab specific service
    cursor.execute("""
            select * from service_view
            where service_id = %s
            """, (request.args['info'], ))

    result = cursor.fetchall()
    
    congSongs = 0
    tableRows = ""
    for row in result:
        (serviceid, datetime, themeevent, songleader, organist, pianist, seq_num, event, title, name, notes) = row

        if event == "Cong. Song":
            congSongs += 1

        tableRow = f"""
        <tr>
            <td>{seq_num}
            <td>{event}
            <td>{title}
            <td>{name}
            <td>{notes}
        </tr>
        """
        tableRows += tableRow


    # Grab list of songleaders
    cursor.execute("""
            select * from songleader_view
            """)

    result = cursor.fetchall()
    names = []
    for row in result:
        (num, name) = row
        fname, lname = name.split()
        names.append(lname + " " + fname)
    names.sort()                            # Sorting by last name
    names = list(set(names))
    songleaderRows = ""
    for name in names:
        ln, fn = name.split()
        songleaderRow = f"""<option value="{fn + " " + ln}" style="text-align: center;">{fn + " " + ln}</option>
        """
        songleaderRows += songleaderRow

    # Grab list of least used songs from view
    cursor.execute("""
            select * from songusageview
            """)
    
    result = cursor.fetchall()

    songTitles = []
    songTableRows = ""
    limit = 0
    for row in result:
        limit += 1
        (songid, songtype, title, hymnbookNum, arranger, dateTime) = row

        songTitles.append(title)

        songTableRow = f"""
        <tr>
            <td>{dateTime}
            <td>{title}
        </tr>
        """
        songTableRows += songTableRow
        if limit == 20:
            break

    # Cong Songs Picker
    congSongInputs = ""
    songTitles = list(set(songTitles))
    for i in range(0, congSongs):
        congSongInputs += "<label class='createParams'><b>Cong. Song " + str(i + 1) + ": </b></label>\n<select name='congSong" + str(i + 1) + "'>\n"
        for j in range(0, len(songTitles)):
            congSongInputs += "<option value='" + songTitles[j] + "' style='text-align: center;'>" + songTitles[j] + "</option>\n"
        congSongInputs += "</select>\n<br>\n<br>\n"
    
  
    return render_template("svcInfo.html").format(serviceid, datetime, themeevent, songleader, tableRows, songleaderRows, congSongInputs, songTableRows, congSongs)


@app.route('/createService')
def createService():
    songGrabCount = int(request.args['congSongCount'])
    songs = []
    for i in range(0 ,songGrabCount):
        songs.append(request.args['congSong' + str(i+1)])

    
    # Create the new service
    result = cursor.callproc('create_service', (request.args['serviceID'], request.args['DateTime'], "NULL" if request.args['Theme'] == "" else request.args['Theme'], "NULL" if request.args['songleader'] == "" else request.args['songleader'], 0, 0))
    
    successCode = result[4]
    

    

    if successCode == 0:
        return render_template('createFailure.html')
    else:
        cursor.execute("""
                select service_item.Service_Item_Id from service_item
                where service_item.Event_Type_Id = 5 AND service_item.Service_Id = %s
                """, (result[5],))

        result = cursor.fetchall()

        service_item_ids = []
        for row in result:
            service_item_ids.append(row[0])

        for i in range(0, len(service_item_ids)):
            # TODO: procedure that takes service_item_ids[i] and songs[i] and inserts song[i] into the service_item = service_item_ids[i] 
            cursor.callproc('add_song', (service_item_ids[i], songs[i]))

        return render_template('createSuccess.html')

    



# Launch the local web server
if __name__ == "__main__":
    app.run(host='localhost', debug=True)