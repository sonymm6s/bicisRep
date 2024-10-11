import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BicisLogInComponent } from './bicis-log-in.component';

describe('BicisLogInComponent', () => {
  let component: BicisLogInComponent;
  let fixture: ComponentFixture<BicisLogInComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BicisLogInComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BicisLogInComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
