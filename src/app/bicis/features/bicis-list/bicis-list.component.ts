import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { SupabaseService } from '../../../shared/data-access/supabase.service';
import { CommonModule } from '@angular/common';
import { BicisService } from '../../data-access/bicis.service';

@Component({
  selector: 'app-bicis-list',
  standalone: true,
  imports: [RouterLink, CommonModule],
  templateUrl: './bicis-list.component.html',
  styles: ``
})
export default class BicisListComponent implements OnInit {

  bikes: any[] = [];

  constructor(private biciservice: BicisService){}

  ngOnInit(): void {
    this.loadBikes();
  }

  async loadBikes(){
    const result = await this.biciservice.getBikes();
    console.log('Bicicletas obtenidas:', result);
    this.bikes = result || [];
  }

  

}
