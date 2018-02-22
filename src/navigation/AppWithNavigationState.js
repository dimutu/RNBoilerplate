import React, { Component } from 'react';
import {
  StyleSheet,
  View,
} from 'react-native';
import { addNavigationHelpers } from 'react-navigation';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';

import AppNavigator from './AppNavigator';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

class AppWithNavigationState extends Component {
  componentWillMount() {
  }

  componentWillUnmount() {
  }


  render() {
    return (
      <View style={styles.container}>
        <AppNavigator
          navigation={addNavigationHelpers({
            dispatch: this.props.dispatch,
            state: this.props.nav,
            addListener: this.props.addListener,
          })}
        />
      </View>
    );
  }
}

AppWithNavigationState.propTypes = {
  dispatch: PropTypes.func.isRequired,
  nav: PropTypes.shape({}).isRequired,
  addListener: PropTypes.func.isRequired,
};

const mapStateToProps = state => ({
  nav: state.nav,
});


export default connect(mapStateToProps)(AppWithNavigationState);
