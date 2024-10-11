import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BicisDetailComponent } from './bicis-detail.component';

describe('BicisDetailComponent', () => {
  let component: BicisDetailComponent;
  let fixture: ComponentFixture<BicisDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BicisDetailComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BicisDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
