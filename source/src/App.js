import React, { Component } from 'react';
import { createStore, applyMiddleware } from 'redux';
import createSagaMiddleware from 'redux-saga';
import { Provider } from 'react-redux';
import {
  createReduxBoundAddListener,
  createReactNavigationReduxMiddleware,
} from 'react-navigation-redux-helpers';

import reducer from './reducers';
import rootSaga from './sagas';
import AppWithNavigationState from './navigation/AppWithNavigationState';

const middleware = [];
const sagaMiddleware = createSagaMiddleware();
middleware.push(sagaMiddleware);

const navMiddleware = createReactNavigationReduxMiddleware(
  'root',
  state => state.nav,
);
middleware.push(navMiddleware);

const addListener = createReduxBoundAddListener('root');

const store = createStore(
  reducer,
  {},
  applyMiddleware(...middleware),
);
sagaMiddleware.run(rootSaga);

class App extends Component {
  componentWillMount() {

  }

  render() {
    return (
      <Provider store={store}>
        <AppWithNavigationState addListener={addListener} />
      </Provider>

    );
  }
}

export default App;
