import React, { Component } from 'react';
import { View } from 'react-native';
import { connect } from 'react-redux';
import { ACTION_SOMETHING } from '../../sagas/types';

class HomeScreen extends Component {
  componentWillMount() {
    // trigger saga action
    this.props.someAction();
  }

  render() {
    return (
      <View />
    );
  }
}

const mapStateToProps = state => state;

const mapDispatchToProps = dispatch => ({
  someAction: () => dispatch({ type: ACTION_SOMETHING, payload: {} }),
});

export default connect(mapStateToProps, mapDispatchToProps)(HomeScreen);
