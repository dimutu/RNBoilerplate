import {
  takeLatest,
  all,
  put,
} from 'redux-saga/effects';
import { ACTION_SOMETHING, SOMETHING_SUCCESS, SOMETHING_FAILURE } from './types';

function* someAction() {
  try {
    yield put({
      type: SOMETHING_SUCCESS,
      payload: { },
    });
  } catch (error) {
    yield put({
      type: SOMETHING_FAILURE,
      payload: error,
    });
  }
}


export default function* rootSaga() {
  yield all([
    takeLatest(ACTION_SOMETHING, someAction),
  ]);
}

