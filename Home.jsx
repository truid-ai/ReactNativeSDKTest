import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  useColorScheme,
  View,
  Alert,
  Button,
} from 'react-native';

import {useNavigation} from '@react-navigation/native';
import {NativeModules} from 'react-native';
const {calendarModule} = NativeModules;

import {Colors} from 'react-native/Libraries/NewAppScreen';

function Home() {
  const isDarkMode = useColorScheme() === 'dark';
  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <View
        style={{
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          width: '100%',
          height: '100%',
        }}>
        <Button
          title="Start Session"
          style={styles.button}
          onPress={async () => {
            await calendarModule.createCalendarEvent(
              '',
              'testLocation',
              async (fingerData, livenessData, error) => {
                if (error) {
                  console.error(error);
                  return;
                }

                fingerData = JSON.parse(fingerData);
                livenessData = JSON.parse(livenessData);
                console.log('Session Result:', livenessData);
                console.log('Session Result:', fingerData);

                // show an alert
                Alert.alert('Session Completed');
              },
            );
          }}
        />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  button: {
    backgroundColor: 'blue',
    color: 'white',
    padding: 10,
    borderRadius: 5,
  },
});

export default Home;
