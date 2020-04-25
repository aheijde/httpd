with Ada.Text_IO;
with Ada.Strings.Fixed;
with AWS.Config.Set;
with AWS.Server;

with HTTPd.Callbacks;

procedure HTTPd.Main is

   Web_Server : AWS.Server.HTTP;
   Web_Config : AWS.Config.Object;

begin
   -- Show header
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("  HH   HH TTTTTTT TTTTTTT PPPPPP       dd ");
   Ada.Text_IO.Put_Line("  HH   HH   TTT     TTT   P   PP       dd ");
   Ada.Text_IO.Put_Line("  HHHHHHH   TTT     TTT   PPPPPP   dddddd ");
   Ada.Text_IO.Put_Line("  HH   HH   TTT     TTT   PP      dd   dd ");
   Ada.Text_IO.Put_Line("  HH   HH   TTT     TTT   PP       dddddd ");
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Simple static Web Server made in Ada 2012");
   Ada.Text_IO.Put_Line(">> v1.0 [25/April/2020]");
   Ada.Text_IO.Put_Line(">> Made by: A.D. van der Heijde");
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Stop server by pressing Q");
   Ada.Text_IO.New_Line;

   --  Setup
   AWS.Config.Set.Server_Host (Web_Config, Host);
   AWS.Config.Set.Server_Port (Web_Config, Port);

   --  Start the server
   AWS.Server.Start (Web_Server, Callbacks.Default'Access, Web_Config);

   --  Connection to web server
   Ada.Text_IO.Put_Line("Connect to http://" & Host & ":" & Ada.Strings.Fixed.Trim(Port'Img, Ada.Strings.Left) & "/");

   --  Wait for the Q key to exit
   AWS.Server.Wait (AWS.Server.Q_Key_Pressed);

   --  Stop the server
   AWS.Server.Shutdown (Web_Server);

end HTTPd.Main;
