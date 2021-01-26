/* eslint-env jest */

import React from 'react';
import HelloWorld from './HelloWorld';
import { shallow } from 'enzyme';

describe('<HelloWorld/>', () => {
	it('renders correctly', () => {
		const wrapper = shallow(<HelloWorld />);
		console.log(wrapper.text());
		expect(wrapper.text()).toBe('Hello World');
		expect(wrapper).toMatchSnapshot();
		return;
	});
});
