import { environment } from '../../../environments/environment.development';
import { createClient, SupabaseClient } from './../../../../node_modules/@supabase/supabase-js/src/index';
import { Injectable } from "@angular/core";

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