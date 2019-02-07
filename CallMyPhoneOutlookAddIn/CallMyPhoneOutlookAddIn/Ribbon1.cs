using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using Office = Microsoft.Office.Core;

// TODO:  Выполните эти шаги, чтобы активировать элемент XML ленты:

// 1: Скопируйте следующий блок кода в класс ThisAddin, ThisWorkbook или ThisDocument.

//  protected override Microsoft.Office.Core.IRibbonExtensibility CreateRibbonExtensibilityObject()
//  {
//      return new Ribbon1();
//  }

// 2. Создайте методы обратного вызова в области "Обратные вызовы ленты" этого класса, чтобы обрабатывать действия
//    пользователя, например нажатие кнопки. Примечание: если эта лента экспортирована из конструктора ленты,
//    переместите свой код из обработчиков событий в методы обратного вызова и модифицируйте этот код, чтобы работать с
//    моделью программирования расширения ленты (RibbonX).

// 3. Назначьте атрибуты тегам элементов управления в XML-файле ленты, чтобы идентифицировать соответствующие методы обратного вызова в своем коде.  

// Дополнительные сведения можно найти в XML-документации для ленты в справке набора средств Visual Studio для Office.


namespace CallMyPhoneOutlookAddIn
{
    [ComVisible(true)]
    public class Ribbon1 : Office.IRibbonExtensibility
    {
        private Office.IRibbonUI ribbon;

        public Ribbon1()
        {
        }

        public void OnMyButtonClick(Office.IRibbonControl control)
        {


            if (control.Context is Microsoft.Office.Interop.Outlook.Selection)
            {

                Microsoft.Office.Interop.Outlook.Selection sel = control.Context as Microsoft.Office.Interop.Outlook.Selection;
                Microsoft.Office.Interop.Outlook.ContactItem cnt = sel[1];
                System.Diagnostics.Process.Start(System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CallMyPhone", "CallMyPhone.exe"), "\"" + control.Tag + "\"" + " \"" + cnt.FullName.ToString() + "\"");
            }
        }

        public string CallbackGetContent(Office.IRibbonControl control)
        {

            StringBuilder xmlString = new StringBuilder(@"<menu xmlns=""http://schemas.microsoft.com/office/2009/07/customui"" >");

            if (control.Context is Microsoft.Office.Interop.Outlook.Selection)

            {

                Microsoft.Office.Interop.Outlook.Selection selection = control.Context as Microsoft.Office.Interop.Outlook.Selection;
                if (selection.Count == 1)

                {
                    Microsoft.Office.Interop.Outlook.ContactItem contact1 = selection[1] as Microsoft.Office.Interop.Outlook.ContactItem;

                    if (contact1.MobileTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='MobileTelephoneNumber' tag='" + contact1.MobileTelephoneNumber + "' label='Мобильный: " + contact1.MobileTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.BusinessTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='BusinessTelephoneNumber' tag='" + contact1.BusinessTelephoneNumber + "' label='Рабочий: " + contact1.BusinessTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.AssistantTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='AssistantTelephoneNumber' tag='" + contact1.AssistantTelephoneNumber + "' label='Помощник: " + contact1.AssistantTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.Business2TelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='Business2TelephoneNumber' tag='" + contact1.Business2TelephoneNumber + "' label='Рабочий 2: " + contact1.Business2TelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.BusinessFaxNumber != null)
                    {
                        xmlString.Append(@"<button id='BusinessFaxNumber' tag='" + contact1.BusinessFaxNumber + "' label='Факс (рабочий): " + contact1.BusinessFaxNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.CallbackTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='CallbackTelephoneNumber' tag='" + contact1.CallbackTelephoneNumber + "' label='Ответ на звонок: " + contact1.CallbackTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.CarTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='CarTelephoneNumber' tag='" + contact1.CarTelephoneNumber + "' label='Автомобиль: " + contact1.CarTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.CompanyMainTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='CompanyMainTelephoneNumber' tag='" + contact1.CompanyMainTelephoneNumber + "' label='Организация: " + contact1.CompanyMainTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.Home2TelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='Home2TelephoneNumber' tag='" + contact1.Home2TelephoneNumber + "' label='Домашний 2: " + contact1.Home2TelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.HomeFaxNumber != null)
                    {
                        xmlString.Append(@"<button id='HomeFaxNumber' tag='" + contact1.HomeFaxNumber + "' label='Факс дом.: " + contact1.HomeFaxNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.HomeTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='HomeTelephoneNumber' tag='" + contact1.HomeTelephoneNumber + "' label='Домашний: " + contact1.HomeTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.OtherTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='OtherTelephoneNumber' tag='" + contact1.OtherTelephoneNumber + "' label='Другой: " + contact1.OtherTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }
                    if (contact1.RadioTelephoneNumber != null)
                    {
                        xmlString.Append(@"<button id='RadioTelephoneNumber' tag='" + contact1.RadioTelephoneNumber + "' label='Радио: " + contact1.RadioTelephoneNumber + "' onAction='OnMyButtonClick'/>");
                    }

                }

            }

            xmlString.Append(@"</menu>");

            return xmlString.ToString();
        }

        #region Элементы IRibbonExtensibility

        public string GetCustomUI(string ribbonID)
        {
            return GetResourceText("CallMyPhoneOutlookAddIn.Ribbon1.xml");
        }

        #endregion

        #region Обратные вызовы ленты
        //Информацию о методах создания обратного вызова см. здесь. Дополнительные сведения о методах добавления обратного вызова см. по ссылке https://go.microsoft.com/fwlink/?LinkID=271226

        public void Ribbon_Load(Office.IRibbonUI ribbonUI)
        {
            this.ribbon = ribbonUI;
        }

        #endregion

        #region Вспомогательные методы

        private static string GetResourceText(string resourceName)
        {
            Assembly asm = Assembly.GetExecutingAssembly();
            string[] resourceNames = asm.GetManifestResourceNames();
            for (int i = 0; i < resourceNames.Length; ++i)
            {
                if (string.Compare(resourceName, resourceNames[i], StringComparison.OrdinalIgnoreCase) == 0)
                {
                    using (StreamReader resourceReader = new StreamReader(asm.GetManifestResourceStream(resourceNames[i])))
                    {
                        if (resourceReader != null)
                        {
                            return resourceReader.ReadToEnd();
                        }
                    }
                }
            }
            return null;
        }

        #endregion
    }
}
