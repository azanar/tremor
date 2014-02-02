require File.expand_path('../../../../test_helper', __FILE__)

require 'set'

require 'ingestion/poller/usgs'

class Tremor::Ingestion::Poller::USGS::Test < Test::Unit::TestCase
  test "#poll" do
    mock_csv_ingestor = mock
    Tremor::Ingestion::Poller::CSV.expects(:new).returns(mock_csv_ingestor)

    data = CSV.parse(DATA)

    mock_csv_ingestor.expects(:poll).returns(data)

    mock_quakes = 19.times.map do 
      mock_tremor = mock
      Tremor::Ingestion::Quake.expects(:new).returns(mock_tremor)
      mock_tremor
    end

    usgs = Tremor::Ingestion::Poller::USGS.new

    result = usgs.poll

    assert_equal Set.new(mock_quakes), Set.new(result)

  end

  DATA = <<-EOF
  ,,,,,,,,,,,,,,,
  2014-02-02T07:04:28.100Z,33.343,-116.3638,20.7,1.3,Ml,16,104.4,0.08983153,0.41,ci,ci11420082,2014-02-02T07:06:47.928Z,"9km N of Borrego Springs, California",earthquake
  2014-02-02T06:34:59.600Z,38.8373,-122.829,2.7,1.5,Md,,54,0.00898315,0.02,nc,nc72154126,2014-02-02T06:36:37.052Z,"9km W of Cobb, California",earthquake
  2014-02-02T06:34:14.300Z,38.8107,-122.8242,2.5,1.6,Md,,93.6,0,0.03,nc,nc72154121,2014-02-02T07:03:05.912Z,"6km WNW of The Geysers, California",earthquake
  2014-02-02T06:33:45.039Z,39.8322,-120.6716,12,0.94,ml,6,155.54,0.159,,nn,nn00436973,2014-02-02T06:35:13.000Z,"17km W of Portola, California",earthquake
  2014-02-02T06:11:24.400Z,34.5488,-119.7212,0.3,1.8,Ml,11,82.8,0.10779783,0.29,ci,ci11420066,2014-02-02T06:14:42.179Z,"10km N of Mission Canyon, California",earthquake
  2014-02-02T06:05:41.130Z,27.8382,128.7813,63.76,4.9,mb,,74,1.096,0.76,us,usc000mfkr,2014-02-02T06:30:04.000Z,"90km SW of Naze, Japan",earthquake
  2014-02-02T06:04:28.300Z,32.9403,-116.2795,11.2,1.3,Ml,15,104.4,0.03593261,0.21,ci,ci11420050,2014-02-02T06:06:42.589Z,"26km ENE of Pine Valley, California",earthquake
  2014-02-02T05:41:15.810Z,-25.2032,-177.5179,119.13,5,mb,,121,4.042,0.93,us,usc000mfkl,2014-02-02T05:59:08.490Z,"South of the Fiji Islands",earthquake
  2014-02-02T05:31:52.500Z,38.8223,-122.8455,2.6,0.6,Md,,79.2,0.00898315,0.02,nc,nc72154081,2014-02-02T05:53:07.794Z,"9km WNW of The Geysers, California",earthquake
  2014-02-02T05:27:36.900Z,38.8188,-122.7627,2.5,1.4,Md,,46.8,0.00898315,0.03,nc,nc72154076,2014-02-02T06:04:04.056Z,"3km W of Cobb, California",earthquake
  2014-02-02T05:19:10.600Z,33.5185,-116.4822,10.8,1.3,Ml,12,172.8,0.04491576,0.07,ci,ci11420042,2014-02-02T05:21:37.356Z,"18km ESE of Anza, California",earthquake
  2014-02-02T04:59:08.800Z,19.399,-155.263,13.1,1.7,Md,,43.2,0,0.15,hv,hv60634521,2014-02-02T05:02:13.914Z,"4km SW of Volcano, Hawaii",earthquake
  2014-02-02T04:55:36.200Z,43.9483,-72.0015,5,2.3,ml,38,35.9999971200002,0.1527136,0.49,ld,ld60059826,2014-02-02T06:39:21.368Z,"10km SSE of Haverhill, New Hampshire",earthquake
  2014-02-02T04:40:39.600Z,38.7837,-122.7612,2.9,0.5,Md,,90,0.01796631,0.05,nc,nc72154061,2014-02-02T05:22:09.211Z,"0km NNW of The Geysers, California",earthquake
  2014-02-02T04:40:06.500Z,37.47,-118.7845,7.1,2.3,Md,,72,0.11678099,0.05,nc,nc72154051,2014-02-02T05:42:06.514Z,"22km ESE of Mammoth Lakes, California",earthquake
  2014-02-02T04:19:18.000Z,61.5563,-141.146,0,1.4,ml,,,,0.68,ak,ak11152291,2014-02-02T04:28:58.218Z,"175km E of Chitina, Alaska",earthquake
  2014-02-02T04:14:30.000Z,63.6169,-147.4042,90.5,1.3,ml,,,,0.27,ak,ak11152278,2014-02-02T04:23:54.004Z,"81km ESE of Healy, Alaska",earthquake
  2014-02-02T04:11:26.800Z,38.7923,-122.757,2.1,0.8,Md,,75.6,0.01796631,0.02,nc,nc72154036,2014-02-02T05:02:06.900Z,"1km N of The Geysers, California",earthquake
  2014-02-02T04:10:06.300Z,19.3612,-155.5375,25.6,1.7,Md,,54,0.05389892,0.14,hv,hv60634511,2014-02-02T04:13:18.310Z,"18km NNW of Pahala, Hawaii",earthquake
  EOF
end

