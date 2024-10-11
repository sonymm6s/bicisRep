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
}