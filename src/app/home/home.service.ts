import { Injectable } from '@angular/core';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";

const BACKEND_URL = environment.backendApi;

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  constructor(private http: HttpClient) {
    
  }

  getMessage() {
    let url = BACKEND_URL +"/message"
    console.log("Sending req to: "+url)
    return this.http.get(url);
  }
}
