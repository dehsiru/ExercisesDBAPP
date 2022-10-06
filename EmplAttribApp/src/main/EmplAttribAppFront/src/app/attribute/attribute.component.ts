import {Component, OnInit} from '@angular/core';
import {AttributeService} from "./attribute.service";
import {HttpErrorResponse} from "@angular/common/http";
import { NgForm } from '@angular/forms';
import {v4 as uuidv4} from "uuid";
import {Attribute} from "./attribute";

@Component({
  selector: 'app-root',
  templateUrl: './attribute.component.html',
  styleUrls: ['./attribute.component.css']
})
export class AttributeComponent implements OnInit{
  public attributes: Attribute[];
  public editAttribute: Attribute;
  public deleteAttribute: Attribute;

  constructor(private attributeService: AttributeService) {}

  ngOnInit() {
    this.getAttributes();
  }

  public getAttributes():void{
    this.attributeService.getAttributes().subscribe(
      (response: Attribute[]) =>{
        this.attributes = response;
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onAddAttribute(addForm: NgForm): void {

    document.getElementById('add-attribute-form').click();

    this.attributeService.addAttribute(addForm.value).subscribe(
      (response: Attribute) => {
        console.log(response);
        this.getAttributes();
        addForm.reset();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        addForm.reset();
      }
    );
  }

  public onUpdateAttribute(attribute: Attribute): void {
    this.attributeService.updateAttribute(attribute).subscribe(
      (response: Attribute) => {
        console.log(response);
        this.getAttributes();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onDeleteAttribute(attributeId: typeof uuidv4): void {
    this.attributeService.deleteAttribute(attributeId).subscribe(
      (response: void) => {
        console.log(response);
        this.getAttributes();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public searchAttributes(key: string): void{
    const results: Attribute[] = [];
    for (const attribute of this.attributes){
      if( attribute.name.toLocaleLowerCase().indexOf(key.toLowerCase()) !== -1
        || attribute.value.toLocaleLowerCase().indexOf(key.toLowerCase()) !== -1){
        results.push(attribute);
      }
    }
    this.attributes = results;
    if(results.length === 0 || !key){
      this.getAttributes();
    }

  }

  public onOpenModal(attribute: Attribute, mode: string): void{

    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if(mode === 'add'){
      button.setAttribute('data-target', '#addAttributeModal');
    }
    if(mode === 'edit'){
      this.editAttribute = attribute;
      button.setAttribute('data-target', '#updateAttributeModal');
    }
    if(mode === 'delete'){
      this.deleteAttribute = attribute;
      button.setAttribute('data-target', '#deleteAttributeModal');
    }

    container.appendChild(button);

    button.click();

  }


}
