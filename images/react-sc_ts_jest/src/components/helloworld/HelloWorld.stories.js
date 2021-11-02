import React from 'react';
import HelloWorld from './HelloWorld';

export default {
	title: 'Hello World',
	component: HelloWorld,
};

export const Basic = () => <HelloWorld></HelloWorld>;

export const BasicWithTextProp = () => <HelloWorld text='Custom Text'></HelloWorld>;
