
with AWS.Response;
with AWS.Status;

package HTTPd.Callbacks is

   function Default (Request : in AWS.Status.Data) return AWS.Response.Data;

end HTTPd.Callbacks;
