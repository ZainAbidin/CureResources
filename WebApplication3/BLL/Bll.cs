using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
namespace BLL
{
    


    public class Bll
    {
        Dal DllObj = new Dal();
        //Employee EmployeeObj = new Employee();

        public int logIn (string username, string passwrod)
        {
            int message = DllObj.logIn(username,passwrod);
            return message;
        }

        public int signUp(string username, string confirmPassword, string Fname, string Lname, string city, string country, string employeeCode, int Age)
        {
            int returnvar = DllObj.signUp(username, confirmPassword, Fname, Lname, city, country, employeeCode, Age);

            return returnvar;
        }

        public void adminPageBroadcast(string broadCast)
        {
            DllObj.adminPageBroadcast(broadCast);
        }

        public DataTable viewAll()
        {
            return DllObj.viewAll();
        }

        public DataTable searchEmployee(string SearchInput)
        {
            return DllObj.searchEmployee(SearchInput);
        }

        public DataTable spChangeEmployeeStatus(string username)
        {
            return DllObj.spChangeEmployeeStatus(username);
        }

        public void spMessageToEmployee(string username, string message)
        {
            DllObj.spMessageToEmployee(username, message);

        }

        public string EmployeeIssueItem(string username, string item)
        {
            return DllObj.EmployeeIssueItem(username, item);
        }

        public DataTable getUserByUsername(string username)
        {
            return DllObj.getUserByUsername(username);

        }

        public string getMessageForEmployee(string username)
        {
            return DllObj.getMessageForEmployee(username);
        }

        public void clearmessagesByEmployee(string username)
        {
            DllObj.clearmessagesByEmployee(username);
        }

        public int EmployeeUpdate(string EmployeeCode, string Fname, string Lname, string City, string Country, string Username, string AGE)
        {
            return DllObj.EmployeeUpdate(EmployeeCode, Fname, Lname, City, Country, Username, AGE);
        }
    }
}
