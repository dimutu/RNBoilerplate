import { SOMETHING_SUCCESS } from '../sagas/types';

const INITIAL_STATE = {
};

export default(state = INITIAL_STATE, action) => {
  switch (action.type) {
    case SOMETHING_SUCCESS: {
      return {
        ...state,
      };
    }
    default: {
      return {
        ...state,
      };
    }
  }
};

