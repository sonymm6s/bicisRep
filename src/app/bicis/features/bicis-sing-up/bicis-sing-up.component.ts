import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import {FormBuilder, FormControl, ReactiveFormsModule, Validators } from '@angular/forms';
import { BicisService } from '../../data-access/bicis.service';

interface SingUpForm {
  email: FormControl<null | string>;
  password: FormControl <null | string>;
}
@Component({
  selector: 'app-bicis-sing-up',
  standalone: true,
  imports: [RouterLink, ReactiveFormsModule],
  templateUrl: './bicis-sing-up.html',
  styleUrl: './bicis-sing-up.component.css'
})
export default class BicisSingUpComponent {

  private _formbuilder = inject(FormBuilder);
  private _authService = inject(BicisService)

  form = this._formbuilder.group<SingUpForm>({
    email: this._formbuilder.control(null, [
      Validators.required,
      Validators.email,
    ]),
    password: this._formbuilder.control(null, [Validators.required])
  })

  submit (){
    if (this.form.invalid) return;

    this._authService.singUp({
      email: this.form.value.email ?? '',
      password: this.form.value.password ?? '',
    });
   }

}
