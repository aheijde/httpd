with Ada.Text_IO;
with AWS.Messages;
with AWS.MIME;
with GNAT.OS_Lib;

package body HTTPd.Callbacks is

   -------------
   -- Default --
   -------------
   function Default (Request : in AWS.Status.Data) return AWS.Response.Data is
      URI                    : constant String := AWS.Status.URI (Request);
      Filename               : constant String := URI (2 .. URI'Last);
   begin
      if GNAT.OS_Lib.Is_Regular_File (Filename) then
         -- Print which file is requested
         Ada.Text_IO.Put_Line(":> " & Filename);
         return AWS.Response.File
           (Content_Type => AWS.MIME.Content_Type (Filename),
            Filename => Filename);
      else
         -- Print which file is requested but does not exist
         Ada.Text_IO.Put_Line("!> " & Filename);
         return AWS.Response.Acknowledge
           (AWS.Messages.S404, "<p>Page '" & URI & "' Not found.");
      end if;
   end Default;

end HTTPd.Callbacks;
