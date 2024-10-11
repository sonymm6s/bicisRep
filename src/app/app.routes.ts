import { Routes } from '@angular/router';

export const routes: Routes = [
    {
        path: '',
        loadChildren: () => import('./bicis/features/bicis-shell/bicis.route')
    }
];
