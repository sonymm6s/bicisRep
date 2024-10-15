import { environment } from '../../../environments/environment.development';
import {SupabaseClient } from '@supabase/supabase-js';
import { Injectable } from "@angular/core";
import {createClient } from '@supabase/supabase-js';

@Injectable({providedIn: 'root'})
export class SupabaseService {
    supabaseClient: SupabaseClient;

    constructor(){
        this.supabaseClient = createClient(
            environment.SUPABASE_URL,
            environment.SUPABASE_KEY
        );
    }

    

      

}