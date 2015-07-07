require File.join(File.dirname(__FILE__),"../lib/icecream/parser")
require File.dirname(__FILE__) + "/spec_helper"

describe "Parser" do
  describe "Parsing a file into an array" do
    before(:all) do
      @path = File.join(File.dirname(__FILE__),"../spec/flavors/chocolate.flavor")
    end
    it "Gets the object" do
      obj = IceCream::Parser.get_flavor @path
      obj.class.should be Chocolate
    end
    it "Gets the string between two strings" do
      IceCream::Parser.slice_between_strings("/super/flavors/chocolate.flavor", "/flavors/", ".flavor")
      .should == "chocolate"
    end
    it "Gets the name of the future object" do
      IceCream::Parser.get_flavor_name(@path).should == "chocolate"
    end
    it "Returns the right type of the value" do

      # Json, should be treated as string
      IceCream::Parser.fix_value('{"apiVersion":"2.0", "data":{ "updated":"2010-01-07T19:58:42.949Z", "totalItems":800, "startIndex":1, "itemsPerPage":1, "items":[ {"id":"hYB0mn5zh2c", "uploaded":"2007-06-05T22:07:03.000Z", "updated":"2010-01-07T13:26:50.000Z", "uploader":"GoogleDeveloperDay", "category":"News", "title":"Google Developers Day US - Maps API Introduction", "description":"Google Maps API Introduction ...", "tags":[ "GDD07","GDD07US","Maps" ], "thumbnail":{ "default":"http://i.ytimg.com/vi/hYB0mn5zh2c/default.jpg", "hqDefault":"http://i.ytimg.com/vi/hYB0mn5zh2c/hqdefault.jpg" }, "player":{ "default":"http://www.youtube.com/watch?vu003dhYB0mn5zh2c" }, "content":{ "1":"rtsp://v5.cache3.c.youtube.com/CiILENy.../0/0/0/video.3gp", "5":"http://www.youtube.com/v/hYB0mn5zh2c?f...", "6":"rtsp://v1.cache1.c.youtube.com/CiILENy.../0/0/0/video.3gp" }, "duration":2840, "aspectRatio":"widescreen", "rating":4.63, "ratingCount":68, "viewCount":220101, "favoriteCount":201, "commentCount":22, "status":{ "value":"restricted", "reason":"limitedSyndication" }, "accessControl":{ "syndicate":"allowed", "commentVote":"allowed", "rate":"allowed", "list":"allowed", "comment":"allowed", "embed":"allowed", "videoRespond":"moderated" } } ] } }').should == '{"apiVersion":"2.0", "data":{ "updated":"2010-01-07T19:58:42.949Z", "totalItems":800, "startIndex":1, "itemsPerPage":1, "items":[ {"id":"hYB0mn5zh2c", "uploaded":"2007-06-05T22:07:03.000Z", "updated":"2010-01-07T13:26:50.000Z", "uploader":"GoogleDeveloperDay", "category":"News", "title":"Google Developers Day US - Maps API Introduction", "description":"Google Maps API Introduction ...", "tags":[ "GDD07","GDD07US","Maps" ], "thumbnail":{ "default":"http://i.ytimg.com/vi/hYB0mn5zh2c/default.jpg", "hqDefault":"http://i.ytimg.com/vi/hYB0mn5zh2c/hqdefault.jpg" }, "player":{ "default":"http://www.youtube.com/watch?vu003dhYB0mn5zh2c" }, "content":{ "1":"rtsp://v5.cache3.c.youtube.com/CiILENy.../0/0/0/video.3gp", "5":"http://www.youtube.com/v/hYB0mn5zh2c?f...", "6":"rtsp://v1.cache1.c.youtube.com/CiILENy.../0/0/0/video.3gp" }, "duration":2840, "aspectRatio":"widescreen", "rating":4.63, "ratingCount":68, "viewCount":220101, "favoriteCount":201, "commentCount":22, "status":{ "value":"restricted", "reason":"limitedSyndication" }, "accessControl":{ "syndicate":"allowed", "commentVote":"allowed", "rate":"allowed", "list":"allowed", "comment":"allowed", "embed":"allowed", "videoRespond":"moderated" } } ] } }'
      
      # Strings
      IceCream::Parser.fix_value("\"chocolate\"").should == "chocolate"
      IceCream::Parser.fix_value("\"15\"").should == "15"
      IceCream::Parser.fix_value("'15'").should == "15"
      
      # Symbles
      IceCream::Parser.fix_value(":i15").should == :i15

      # Float
      IceCream::Parser.fix_value("15.5").should == 15.5
      
      # Int
      IceCream::Parser.fix_value("15").should == 15

      # array
      IceCream::Parser.fix_value("['mimimi', :foo, 15, 20.5]").should == ["mimimi",:foo,15,20.5]
      
      # Invalid conversions
      IceCream::Parser.fix_value("15s").should == ""
      
    end
  end
end
