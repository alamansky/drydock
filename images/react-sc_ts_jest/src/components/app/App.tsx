import React, { Component } from 'react';
import HelloWorld from '../helloworld/HelloWorld';
import Feed from '../Feed/Feed';

export default class App extends Component {
	render() {
		return (
			<div>
				<Feed endpoint='http://jsonplaceholder.typicode.com/posts?userId=1' feedTitle={<HelloWorld text='Feed' />} />
			</div>
		);
	}
}
