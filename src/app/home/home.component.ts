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

   }

  ngOnInit(): void {
    this.message = this.homeService.getMessage().subscribe(
      data => {
         this.message = data
      },
      error => {
        console.log(error)
      });
  }

}
