import {Inject, Injectable, LOCALE_ID} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Attribute} from "./attribute";
import {v4 as uuidv4} from "uuid";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class AttributeService {
  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public getAttributes(): Observable<Attribute[]>{
    return this.http.get<Attribute[]>(`${this.apiServerUrl}/attribute/all`);
  }

  public addAttribute(attribute: Attribute): Observable<Attribute>{
    return this.http.post<Attribute>(`${this.apiServerUrl}/attribute/add`, attribute);
  }

  public updateAttribute(attribute: Attribute): Observable<Attribute>{
    return this.http.put<Attribute>(`${this.apiServerUrl}/attribute/update`, attribute);
  }

  public deleteAttribute(attributeId: typeof uuidv4): Observable<void>{
    return this.http.delete<void>(`${this.apiServerUrl}/attribute/delete/${attributeId}`);
  }


}

