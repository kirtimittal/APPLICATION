using System;
using System.Data;
using System.Data.SqlClient;

public class HelloWorld
{
    public static void Main(string[] args)
    {
        string connectionString =
           "Server=10.199.175.58;" +
           "Database=AgentIpPhone;" +
           "User ID=sa;" +
           "Password=pwd4ajp@DD2018;";

        SqlConnection conn = null;
        conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "select * from tbl_user_detail where uid=2";
        //SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter ada = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds);
        string FirstName = ds.Tables[0].Rows[0]["first_name"].ToString();
        string LastName = ds.Tables[0].Rows[0]["last_name"].ToString();
        Console.WriteLine("Name: " +
             FirstName + " " + LastName);
        

        //IDbConnection dbcon;
        //using (dbcon = new SqlConnection(connectionString))
        //{
        //    dbcon.Open();
        //    using (IDbCommand dbcmd = dbcon.CreateCommand())
        //    {
        //        string sql =
        //            "select * from tbl_user_detail where uid=2";

        //        dbcmd.CommandText = sql;
        //        using (IDataReader reader = dbcmd.ExecuteReader())
        //        {
        //            while (reader.Read())
        //            {
        //                string FirstName = (string)reader["first_name"];
        //                string LastName = (string)reader["last_name"];
        //                Console.WriteLine("Name: " +
        //                     FirstName + " " + LastName);
        //            }
        //        }
        //    }
        //}
    }
}