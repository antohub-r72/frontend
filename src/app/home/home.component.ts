import { Component, OnInit } from '@angular/core';
import { HomeService } from './home.service'

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  message:any
  constructor( private homeService: HomeService) {
      console.log("Home Component constructor")
   }

  ngOnInit(): void {
    console.log("Home Component ngOnInit")
    this.message = this.homeService.getMessage().subscribe(
      data => {
         this.message = data
      },
      error => {
        console.log(error)
      });
  }

}
