import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BicisListComponent } from './bicis-list.component';

describe('BicisListComponent', () => {
  let component: BicisListComponent;
  let fixture: ComponentFixture<BicisListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BicisListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BicisListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
