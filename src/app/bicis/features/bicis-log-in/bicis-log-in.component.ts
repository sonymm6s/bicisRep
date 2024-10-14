import { Component, inject } from '@angular/core';
import { FormBuilder, FormControl, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { BicisService } from '../../data-access/bicis.service';

interface LogInForm {
  email: FormControl<null | string>;
  password: FormControl<null | string>;
}

@Component({
  selector: 'app-bicis-log-in',
  standalone: true,
  imports: [RouterLink, ReactiveFormsModule],
  templateUrl: './bicis-log-in.html' ,
  styleUrl: './bicis-log-in.component.css'
})
export default class BicisLogInComponent {

  private _formBuilder = inject(FormBuilder);
  private _authService = inject(BicisService);
  private _router = inject(Router);

  form = this._formBuilder.group<LogInForm>({
    email: this._formBuilder.control(null, [
      Validators.required,
      Validators.email,
    ]),
    password: this._formBuilder.control(null, [Validators.required]),
  });

  async submit(){
    if (this.form.invalid) return;

    try {
      const {error, data}= await this._authService.logIn({
        email: this.form.value.email ?? '',
        password: this.form.value.password ?? '',  
      });

      if (error) throw error;
      console.log(data);
      this._router.navigateByUrl('/')
    } catch (error) {
      if(error instanceof Error) {
        console.log(error);
      }  
    }

  }

}
