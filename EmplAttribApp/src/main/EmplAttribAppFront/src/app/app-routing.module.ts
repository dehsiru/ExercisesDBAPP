import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {AttributeComponent} from "./attribute/attribute.component";
import {EmployeeComponent} from "./employee/employee.component";

const routes: Routes = [
  {path: 'attributes', component: AttributeComponent},
  {path: 'employees', component: EmployeeComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
