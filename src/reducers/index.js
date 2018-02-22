import { combineReducers } from 'redux';
import NavigationReducer from './NavigationReducer';
import DataReducer from './DataReducer';

export default combineReducers({
  nav: NavigationReducer,
  data: DataReducer,
});
