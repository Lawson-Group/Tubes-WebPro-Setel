<template>
  <v-container fluid>
    <v-row justify="left" class="px-9">
      <v-col cols="24" sm="14" md="10" lg="8">
        <h1 class="mb-5 display-1 font-weight-bold;">Feedback</h1>
        <div class="feedback-list">
          <div class="feedback-item" v-for="feedback in feedbacks" :key="feedback.id">
            <div class="feedback-profile">
              <v-avatar class="profile-icon mx-4" size="50" color="#A32929">
                <v-icon size="x-large">
                  mdi-account-circle-outline
                </v-icon>
              </v-avatar>
              <div class="profile-info" style="padding-right: 10%;">
                <div class="profile-nim-name" style="font-size: 18px; color: #A32929; margin-bottom: 5px;">
                  {{ feedback.nim }} - {{ feedback.username }}
                </div>
                <div class="time-ago" style="font-size: 15px; color: #AE5C5C; margin-bottom: 5px;">
                  {{ getTimeAgo(feedback.timestamp) }}
                </div>
                <div class="separator">
                  <div class="separator-line"></div>
                </div>
                <div class="feedback-text" style="font-size: 16px;">
                  {{ feedback.text }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      feedbacks: [
        {
          id: 1,
          nim: '1302213000',
          username: 'Aerichanie',
          timestamp: new Date('2023-10-31T15:03:19'),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        },

        {
          id: 2,
          nim: '1204190002',
          username: 'Karinater Yoo',
          timestamp: new Date('2023-10-29T14:00:00'),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
        },

        {
          id: 3,
          nim: '16531733018',
          username: 'Ningningguang',
          timestamp: new Date('2023-10-28T17:04:11'),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        },

        {
          id: 4,
          nim: '1282303218',
          username: 'Huangre',
          timestamp: new Date('2023-10-27T12:57:34'),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
        },

        {
          id: 5,
          nim: '1281999216',
          username: 'Mark',
          timestamp: new Date('2023-10-25T10:00:00'),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        },
      ],
    };
  },
  methods: {
    getTimeAgo(timestamp) {
      const now = new Date();
      const diff = now - new Date(timestamp);
      const seconds = Math.floor(diff / 1000);
      if (seconds < 60) {
        return `${seconds} detik yang lalu`;
      }
      const minutes = Math.floor(seconds / 60);
      if (minutes < 60) {
        return `${minutes} menit yang lalu`;
      }
      const hours = Math.floor(minutes / 60);
      if (hours < 24) {
        return `${hours} jam yang lalu`;
      }
      const days = Math.floor(hours / 24);
      return `${days} hari yang lalu`;
    },
  },
};
</script>

<style scoped>
.feedback-list {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
}

.feedback-item {
  border: 1px solid #000;
  margin: 10px 0;
  padding: 10px;
  border-radius: 10px;
  display: flex;
  flex-direction: row;
  width: 100%;
}

.feedback-profile {
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
  margin-bottom: 10px;
}

.profile-icon {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.profile-info {
  flex-direction: column;
}

.profile-nim-name {
  margin-bottom: 10px;
  font-size: 18px;
  font-weight: bold;
}

time-ago {
  margin-bottom: 10px;
  font-size: 15px;
  font-weight: bold;
}

.separator {
  text-align: left;
  margin-top: 10px;
  margin-bottom: 10px;
}

.separator-line {
  border-bottom: 1px solid #000;
  width: 100%;
}

.feedback-text {
  font-size: 16px;
  text-align: left;
}
</style>