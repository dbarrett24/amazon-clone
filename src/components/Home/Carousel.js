import React, { Component } from 'react';
import './Carousel.css';
import Slider from 'react-slick';

class Carousel extends Component {

  render() {
    const settings = {
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      autoplay: true,
      autoplaySpeed: 3000
    }
    
    return (
      <Slider className='home-main-advertisement' {...settings}>
        <div className='home-main-advertisement car-1'></div>
        <div className='home-main-advertisement car-2'></div>
        <div className='home-main-advertisement car-3'></div>
        <div className='home-main-advertisement car-4'></div>
        <div className='home-main-advertisement car-5'></div>
        <div className='home-main-advertisement car-6'></div>
      </Slider>
    );
  }
}

export default Carousel;