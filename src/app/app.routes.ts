import { Routes } from '@angular/router';

export const routes: Routes = [
    {
        path: 'bicis',
        loadChildren: () => import('./bicis/features/bicis-shell/bicis.route')
    },
    {
        path: '**',
        redirectTo: 'bicis'
    }
];
