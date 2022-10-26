import { api, LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_NUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import ACCOUNT_TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class AccountRecord extends LightningElement {

    @api recordId;
    @api objectApiName;

    objectName = ACCOUNT_OBJECT;
    fieldList = [ACCOUNT_NAME_FIELD, ACCOUNT_NUMBER_FIELD, ACCOUNT_TYPE_FIELD];
}