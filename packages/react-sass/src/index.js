//Quokka config - must be used on per-file basis
({
	babel: true,
	plugins: ['jsdom-quokka-plugin'],
});

import React from 'react';
import ReactDOM from 'react-dom';

import './style/style.scss';

import App from './components/app/App';

ReactDOM.render(<App />, document.getElementById('app'));
