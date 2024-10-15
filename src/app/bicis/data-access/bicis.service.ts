import { inject, Injectable } from "@angular/core";
import { SupabaseService } from "../../shared/data-access/supabase.service";
import { SignUpWithPasswordCredentials } from "@supabase/supabase-js/src";

@Injectable({providedIn: 'root'})
export class BicisService {
    private _supabaseClient = inject(SupabaseService).supabaseClient;


    session(){

    }

    singUp(credentials: SignUpWithPasswordCredentials){

        return this._supabaseClient.auth.signUp(credentials);

    }

    logIn(credentials: SignUpWithPasswordCredentials){

        return this._supabaseClient.auth.signInWithPassword(credentials);

    }

    SingOut (){

        return this._supabaseClient.auth.signOut();

    }

    async getBikes() {
        const { data, error } = await this._supabaseClient
          .from('bikes') 
          .select('*');
        if (error) {
          console.error('Error obteniendo datos:', error);
          return [];
        }
        
        console.log('Data', data);
        return data;
      }

      async uploadReport(bikeId: number, report: string, photo: File) {
        const { error: uploadError } = await this._supabaseClient
          .storage
          .from('report')
          .upload(`bike-${bikeId}/${photo.name}`, photo);
    
        const { data, error } = await this._supabaseClient
          .from('report')
          .insert([{ bike_id: bikeId, report, photo: photo.name }]);
    
        return { data, error: uploadError || error };
      }
}