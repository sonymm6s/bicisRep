import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BicisSingUpComponent } from './bicis-sing-up.component';

describe('BicisSingUpComponent', () => {
  let component: BicisSingUpComponent;
  let fixture: ComponentFixture<BicisSingUpComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BicisSingUpComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BicisSingUpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
