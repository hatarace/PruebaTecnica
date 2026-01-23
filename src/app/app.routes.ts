import { RouterModule, Routes } from '@angular/router';
import { Dashboard } from './dashboard/dashboard';
import { Cuentas } from './cuentas/cuentas';
import { Transacciones } from './transacciones/transacciones';
import { NgModule } from '@angular/core';

export const routes: Routes = [

    {path: 'dashboard', component: Dashboard},
    {path: 'cuentas', component: Cuentas},
    {path: 'transacciones', component: Transacciones}
];

@NgModule({
imports: [RouterModule.forRoot(routes)],
exports: [RouterModule]
})

export class appRoutingModule{}