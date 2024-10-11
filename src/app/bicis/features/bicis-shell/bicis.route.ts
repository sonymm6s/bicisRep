import { Routes } from "@angular/router";


export default [
    {path: '', loadComponent: () => import('../bicis-list/bicis-list.component')}

] as Routes