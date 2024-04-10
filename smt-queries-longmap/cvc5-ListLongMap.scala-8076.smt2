; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99322 () Bool)

(assert start!99322)

(declare-fun b_free!24901 () Bool)

(declare-fun b_next!24901 () Bool)

(assert (=> start!99322 (= b_free!24901 (not b_next!24901))))

(declare-fun tp!87417 () Bool)

(declare-fun b_and!40669 () Bool)

(assert (=> start!99322 (= tp!87417 b_and!40669)))

(declare-fun b!1170720 () Bool)

(declare-fun e!665422 () Bool)

(declare-fun tp_is_empty!29431 () Bool)

(assert (=> b!1170720 (= e!665422 tp_is_empty!29431)))

(declare-fun b!1170721 () Bool)

(declare-fun e!665415 () Bool)

(declare-fun e!665425 () Bool)

(assert (=> b!1170721 (= e!665415 e!665425)))

(declare-fun res!777014 () Bool)

(assert (=> b!1170721 (=> res!777014 e!665425)))

(declare-datatypes ((array!75681 0))(
  ( (array!75682 (arr!36490 (Array (_ BitVec 32) (_ BitVec 64))) (size!37026 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75681)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170721 (= res!777014 (not (validKeyInArray!0 (select (arr!36490 _keys!1208) from!1455))))))

(declare-datatypes ((V!44369 0))(
  ( (V!44370 (val!14772 Int)) )
))
(declare-datatypes ((tuple2!18866 0))(
  ( (tuple2!18867 (_1!9444 (_ BitVec 64)) (_2!9444 V!44369)) )
))
(declare-datatypes ((List!25602 0))(
  ( (Nil!25599) (Cons!25598 (h!26807 tuple2!18866) (t!37495 List!25602)) )
))
(declare-datatypes ((ListLongMap!16835 0))(
  ( (ListLongMap!16836 (toList!8433 List!25602)) )
))
(declare-fun lt!527300 () ListLongMap!16835)

(declare-fun lt!527297 () ListLongMap!16835)

(assert (=> b!1170721 (= lt!527300 lt!527297)))

(declare-fun lt!527298 () ListLongMap!16835)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1503 (ListLongMap!16835 (_ BitVec 64)) ListLongMap!16835)

(assert (=> b!1170721 (= lt!527297 (-!1503 lt!527298 k!934))))

(declare-fun zeroValue!944 () V!44369)

(declare-fun lt!527292 () array!75681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14006 0))(
  ( (ValueCellFull!14006 (v!17410 V!44369)) (EmptyCell!14006) )
))
(declare-datatypes ((array!75683 0))(
  ( (array!75684 (arr!36491 (Array (_ BitVec 32) ValueCell!14006)) (size!37027 (_ BitVec 32))) )
))
(declare-fun lt!527301 () array!75683)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44369)

(declare-fun getCurrentListMapNoExtraKeys!4897 (array!75681 array!75683 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) Int) ListLongMap!16835)

(assert (=> b!1170721 (= lt!527300 (getCurrentListMapNoExtraKeys!4897 lt!527292 lt!527301 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75683)

(assert (=> b!1170721 (= lt!527298 (getCurrentListMapNoExtraKeys!4897 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38620 0))(
  ( (Unit!38621) )
))
(declare-fun lt!527291 () Unit!38620)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!730 (array!75681 array!75683 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38620)

(assert (=> b!1170721 (= lt!527291 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170722 () Bool)

(declare-fun e!665416 () Bool)

(assert (=> b!1170722 (= e!665416 e!665415)))

(declare-fun res!777004 () Bool)

(assert (=> b!1170722 (=> res!777004 e!665415)))

(assert (=> b!1170722 (= res!777004 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527293 () ListLongMap!16835)

(assert (=> b!1170722 (= lt!527293 (getCurrentListMapNoExtraKeys!4897 lt!527292 lt!527301 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527299 () V!44369)

(assert (=> b!1170722 (= lt!527301 (array!75684 (store (arr!36491 _values!996) i!673 (ValueCellFull!14006 lt!527299)) (size!37027 _values!996)))))

(declare-fun dynLambda!2873 (Int (_ BitVec 64)) V!44369)

(assert (=> b!1170722 (= lt!527299 (dynLambda!2873 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527294 () ListLongMap!16835)

(assert (=> b!1170722 (= lt!527294 (getCurrentListMapNoExtraKeys!4897 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170723 () Bool)

(declare-fun e!665424 () Bool)

(assert (=> b!1170723 (= e!665425 e!665424)))

(declare-fun res!777010 () Bool)

(assert (=> b!1170723 (=> res!777010 e!665424)))

(assert (=> b!1170723 (= res!777010 (not (= (select (arr!36490 _keys!1208) from!1455) k!934)))))

(declare-fun e!665419 () Bool)

(assert (=> b!1170723 e!665419))

(declare-fun res!777005 () Bool)

(assert (=> b!1170723 (=> (not res!777005) (not e!665419))))

(declare-fun +!3761 (ListLongMap!16835 tuple2!18866) ListLongMap!16835)

(declare-fun get!18609 (ValueCell!14006 V!44369) V!44369)

(assert (=> b!1170723 (= res!777005 (= lt!527293 (+!3761 lt!527297 (tuple2!18867 (select (arr!36490 _keys!1208) from!1455) (get!18609 (select (arr!36491 _values!996) from!1455) lt!527299)))))))

(declare-fun b!1170724 () Bool)

(declare-fun res!777012 () Bool)

(declare-fun e!665418 () Bool)

(assert (=> b!1170724 (=> (not res!777012) (not e!665418))))

(assert (=> b!1170724 (= res!777012 (validKeyInArray!0 k!934))))

(declare-fun b!1170725 () Bool)

(declare-fun e!665414 () Bool)

(assert (=> b!1170725 (= e!665414 tp_is_empty!29431)))

(declare-fun b!1170726 () Bool)

(declare-fun res!777015 () Bool)

(assert (=> b!1170726 (=> (not res!777015) (not e!665418))))

(assert (=> b!1170726 (= res!777015 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37026 _keys!1208))))))

(declare-fun b!1170727 () Bool)

(assert (=> b!1170727 (= e!665424 true)))

(declare-fun arrayContainsKey!0 (array!75681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170727 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527296 () Unit!38620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38620)

(assert (=> b!1170727 (= lt!527296 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!777008 () Bool)

(assert (=> start!99322 (=> (not res!777008) (not e!665418))))

(assert (=> start!99322 (= res!777008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37026 _keys!1208))))))

(assert (=> start!99322 e!665418))

(assert (=> start!99322 tp_is_empty!29431))

(declare-fun array_inv!27888 (array!75681) Bool)

(assert (=> start!99322 (array_inv!27888 _keys!1208)))

(assert (=> start!99322 true))

(assert (=> start!99322 tp!87417))

(declare-fun e!665417 () Bool)

(declare-fun array_inv!27889 (array!75683) Bool)

(assert (=> start!99322 (and (array_inv!27889 _values!996) e!665417)))

(declare-fun b!1170728 () Bool)

(declare-fun res!777006 () Bool)

(assert (=> b!1170728 (=> (not res!777006) (not e!665418))))

(assert (=> b!1170728 (= res!777006 (and (= (size!37027 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37026 _keys!1208) (size!37027 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170729 () Bool)

(declare-fun e!665420 () Bool)

(assert (=> b!1170729 (= e!665420 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170730 () Bool)

(declare-fun e!665423 () Bool)

(assert (=> b!1170730 (= e!665418 e!665423)))

(declare-fun res!777007 () Bool)

(assert (=> b!1170730 (=> (not res!777007) (not e!665423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75681 (_ BitVec 32)) Bool)

(assert (=> b!1170730 (= res!777007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527292 mask!1564))))

(assert (=> b!1170730 (= lt!527292 (array!75682 (store (arr!36490 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37026 _keys!1208)))))

(declare-fun b!1170731 () Bool)

(declare-fun mapRes!45974 () Bool)

(assert (=> b!1170731 (= e!665417 (and e!665422 mapRes!45974))))

(declare-fun condMapEmpty!45974 () Bool)

(declare-fun mapDefault!45974 () ValueCell!14006)

