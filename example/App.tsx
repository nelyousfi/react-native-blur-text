import React from 'react';
import {View, StyleSheet} from 'react-native';
// @ts-ignore
import BlurText from 'blur-text';

const App = () => {
  return (
    <View style={styles.container}>
      <BlurText style={styles.view} text="Blurred Text" />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'lavenderblush',
  },
  view: {
    width: 200,
    height: 200,
  },
});

export default App;
