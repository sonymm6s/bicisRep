import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormBuilder, FormControl, ReactiveFormsModule, Validators } from '@angular/forms';
import { BicisService } from '../../data-access/bicis.service';

interface SigUpForm {
  email: FormControl<null | string>;
  password: FormControl<null | string>;
}

@Component({
  selector: 'app-bicis-sing-up',
  standalone: true,
  imports: [RouterLink, ReactiveFormsModule],
  templateUrl: './bicis-sing-up.html',
  styleUrl: './bicis-sing-up.component.css'
})
export default class BicisSingUpComponent {

  private _formBuilder = inject(FormBuilder);
  private _authService = inject(BicisService);

  form = this._formBuilder.group<SigUpForm>({
    email: this._formBuilder.control(null, [
      Validators.required,
      Validators.email,
    ]),
    password: this._formBuilder.control(null, [Validators.required]),
  });

  async submit(){
    if (this.form.invalid) return;

    try {
      const aunthResponse = await this._authService.singUp({
        email: this.form.value.email ?? '',
        password: this.form.value.password ?? '',
      });

      if(aunthResponse.error) throw aunthResponse.error

      alert('Revisa tu email!');
  
    } catch (error) {
      console.error(error);
    }
  }

}
