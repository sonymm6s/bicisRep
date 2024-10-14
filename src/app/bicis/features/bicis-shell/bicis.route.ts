import { Routes } from "@angular/router";


export default [
    {
        path: 'sing-up',
        loadComponent: () => import('../bicis-sing-up/bicis-sing-up.component')
    },
    {
        path: 'log-in',
        loadComponent: () => import('../bicis-log-in/bicis-log-in.component')
    },
    {
        path: 'bicis-list',
        loadComponent: () => import('../bicis-list/bicis-list.component')
    },
    {
        path: 'contacto',
        redirectTo: 'log-in'
    },
    {
        path: '**',
        redirectTo: 'bicis'
    }

] as Routes