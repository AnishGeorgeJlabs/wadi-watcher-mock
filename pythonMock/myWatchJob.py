# Simple job class for watcher

from pydispatch import dispatcher
import schedule
import time

SIG = 'Job here'

def log(sender, event):
    print("Event campaign " + event['campaign'])

class WatchJob(object):

    def __init__(self, conf):
        self.type = conf['type']
        self.campaign = conf['campaign']
        self.triggerObj = {
            "campaign": self.campaign,
            "info": 'blah'
        }
        if self.type == 'test':
            schedule.every(2).seconds.do(self._emit)

    def _emit(self):
        dispatcher.send( signal=SIG, event=self.triggerObj )


dispatcher.connect( log, signal=SIG, sender=dispatcher.Any )

wj = WatchJob({ "type": "test", "campaign": "HelloCamp" })

while True:
    schedule.run_pending()
    time.sleep(1)
