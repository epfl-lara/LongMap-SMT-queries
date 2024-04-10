; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99308 () Bool)

(assert start!99308)

(declare-fun b_free!24887 () Bool)

(declare-fun b_next!24887 () Bool)

(assert (=> start!99308 (= b_free!24887 (not b_next!24887))))

(declare-fun tp!87374 () Bool)

(declare-fun b_and!40641 () Bool)

(assert (=> start!99308 (= tp!87374 b_and!40641)))

(declare-fun b!1170307 () Bool)

(declare-fun res!776678 () Bool)

(declare-fun e!665168 () Bool)

(assert (=> b!1170307 (=> (not res!776678) (not e!665168))))

(declare-datatypes ((array!75653 0))(
  ( (array!75654 (arr!36476 (Array (_ BitVec 32) (_ BitVec 64))) (size!37012 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75653)

(declare-datatypes ((List!25592 0))(
  ( (Nil!25589) (Cons!25588 (h!26797 (_ BitVec 64)) (t!37471 List!25592)) )
))
(declare-fun arrayNoDuplicates!0 (array!75653 (_ BitVec 32) List!25592) Bool)

(assert (=> b!1170307 (= res!776678 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25589))))

(declare-fun b!1170309 () Bool)

(declare-fun res!776674 () Bool)

(assert (=> b!1170309 (=> (not res!776674) (not e!665168))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170309 (= res!776674 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37012 _keys!1208))))))

(declare-fun b!1170310 () Bool)

(declare-fun e!665170 () Bool)

(assert (=> b!1170310 (= e!665168 e!665170)))

(declare-fun res!776673 () Bool)

(assert (=> b!1170310 (=> (not res!776673) (not e!665170))))

(declare-fun lt!527061 () array!75653)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75653 (_ BitVec 32)) Bool)

(assert (=> b!1170310 (= res!776673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527061 mask!1564))))

(assert (=> b!1170310 (= lt!527061 (array!75654 (store (arr!36476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37012 _keys!1208)))))

(declare-fun b!1170311 () Bool)

(declare-fun e!665163 () Bool)

(declare-fun e!665162 () Bool)

(assert (=> b!1170311 (= e!665163 e!665162)))

(declare-fun res!776667 () Bool)

(assert (=> b!1170311 (=> res!776667 e!665162)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170311 (= res!776667 (not (= (select (arr!36476 _keys!1208) from!1455) k!934)))))

(declare-fun e!665172 () Bool)

(assert (=> b!1170311 e!665172))

(declare-fun res!776669 () Bool)

(assert (=> b!1170311 (=> (not res!776669) (not e!665172))))

(declare-datatypes ((V!44349 0))(
  ( (V!44350 (val!14765 Int)) )
))
(declare-fun lt!527070 () V!44349)

(declare-datatypes ((tuple2!18856 0))(
  ( (tuple2!18857 (_1!9439 (_ BitVec 64)) (_2!9439 V!44349)) )
))
(declare-datatypes ((List!25593 0))(
  ( (Nil!25590) (Cons!25589 (h!26798 tuple2!18856) (t!37472 List!25593)) )
))
(declare-datatypes ((ListLongMap!16825 0))(
  ( (ListLongMap!16826 (toList!8428 List!25593)) )
))
(declare-fun lt!527062 () ListLongMap!16825)

(declare-datatypes ((ValueCell!13999 0))(
  ( (ValueCellFull!13999 (v!17403 V!44349)) (EmptyCell!13999) )
))
(declare-datatypes ((array!75655 0))(
  ( (array!75656 (arr!36477 (Array (_ BitVec 32) ValueCell!13999)) (size!37013 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75655)

(declare-fun lt!527060 () ListLongMap!16825)

(declare-fun +!3757 (ListLongMap!16825 tuple2!18856) ListLongMap!16825)

(declare-fun get!18599 (ValueCell!13999 V!44349) V!44349)

(assert (=> b!1170311 (= res!776669 (= lt!527062 (+!3757 lt!527060 (tuple2!18857 (select (arr!36476 _keys!1208) from!1455) (get!18599 (select (arr!36477 _values!996) from!1455) lt!527070)))))))

(declare-fun b!1170312 () Bool)

(declare-fun e!665167 () Bool)

(assert (=> b!1170312 (= e!665167 e!665163)))

(declare-fun res!776672 () Bool)

(assert (=> b!1170312 (=> res!776672 e!665163)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170312 (= res!776672 (not (validKeyInArray!0 (select (arr!36476 _keys!1208) from!1455))))))

(declare-fun lt!527066 () ListLongMap!16825)

(assert (=> b!1170312 (= lt!527066 lt!527060)))

(declare-fun lt!527065 () ListLongMap!16825)

(declare-fun -!1499 (ListLongMap!16825 (_ BitVec 64)) ListLongMap!16825)

(assert (=> b!1170312 (= lt!527060 (-!1499 lt!527065 k!934))))

(declare-fun zeroValue!944 () V!44349)

(declare-fun lt!527063 () array!75655)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44349)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4892 (array!75653 array!75655 (_ BitVec 32) (_ BitVec 32) V!44349 V!44349 (_ BitVec 32) Int) ListLongMap!16825)

(assert (=> b!1170312 (= lt!527066 (getCurrentListMapNoExtraKeys!4892 lt!527061 lt!527063 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170312 (= lt!527065 (getCurrentListMapNoExtraKeys!4892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38608 0))(
  ( (Unit!38609) )
))
(declare-fun lt!527067 () Unit!38608)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!726 (array!75653 array!75655 (_ BitVec 32) (_ BitVec 32) V!44349 V!44349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38608)

(assert (=> b!1170312 (= lt!527067 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170313 () Bool)

(assert (=> b!1170313 (= e!665162 true)))

(declare-fun arrayContainsKey!0 (array!75653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170313 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527069 () Unit!38608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38608)

(assert (=> b!1170313 (= lt!527069 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170314 () Bool)

(declare-fun res!776676 () Bool)

(assert (=> b!1170314 (=> (not res!776676) (not e!665168))))

(assert (=> b!1170314 (= res!776676 (and (= (size!37013 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37012 _keys!1208) (size!37013 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!665169 () Bool)

(declare-fun b!1170315 () Bool)

(assert (=> b!1170315 (= e!665169 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170316 () Bool)

(declare-fun res!776671 () Bool)

(assert (=> b!1170316 (=> (not res!776671) (not e!665168))))

(assert (=> b!1170316 (= res!776671 (validKeyInArray!0 k!934))))

(declare-fun b!1170317 () Bool)

(declare-fun res!776675 () Bool)

(assert (=> b!1170317 (=> (not res!776675) (not e!665168))))

(assert (=> b!1170317 (= res!776675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170318 () Bool)

(declare-fun res!776668 () Bool)

(assert (=> b!1170318 (=> (not res!776668) (not e!665168))))

(assert (=> b!1170318 (= res!776668 (= (select (arr!36476 _keys!1208) i!673) k!934))))

(declare-fun b!1170319 () Bool)

(assert (=> b!1170319 (= e!665172 e!665169)))

(declare-fun res!776680 () Bool)

(assert (=> b!1170319 (=> res!776680 e!665169)))

(assert (=> b!1170319 (= res!776680 (not (= (select (arr!36476 _keys!1208) from!1455) k!934)))))

(declare-fun mapNonEmpty!45953 () Bool)

(declare-fun mapRes!45953 () Bool)

(declare-fun tp!87375 () Bool)

(declare-fun e!665173 () Bool)

(assert (=> mapNonEmpty!45953 (= mapRes!45953 (and tp!87375 e!665173))))

(declare-fun mapValue!45953 () ValueCell!13999)

(declare-fun mapKey!45953 () (_ BitVec 32))

(declare-fun mapRest!45953 () (Array (_ BitVec 32) ValueCell!13999))

(assert (=> mapNonEmpty!45953 (= (arr!36477 _values!996) (store mapRest!45953 mapKey!45953 mapValue!45953))))

(declare-fun b!1170320 () Bool)

(declare-fun res!776665 () Bool)

(assert (=> b!1170320 (=> (not res!776665) (not e!665168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170320 (= res!776665 (validMask!0 mask!1564))))

(declare-fun b!1170308 () Bool)

(declare-fun e!665166 () Bool)

(assert (=> b!1170308 (= e!665166 e!665167)))

(declare-fun res!776666 () Bool)

(assert (=> b!1170308 (=> res!776666 e!665167)))

(assert (=> b!1170308 (= res!776666 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170308 (= lt!527062 (getCurrentListMapNoExtraKeys!4892 lt!527061 lt!527063 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170308 (= lt!527063 (array!75656 (store (arr!36477 _values!996) i!673 (ValueCellFull!13999 lt!527070)) (size!37013 _values!996)))))

(declare-fun dynLambda!2869 (Int (_ BitVec 64)) V!44349)

(assert (=> b!1170308 (= lt!527070 (dynLambda!2869 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527068 () ListLongMap!16825)

(assert (=> b!1170308 (= lt!527068 (getCurrentListMapNoExtraKeys!4892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!776670 () Bool)

(assert (=> start!99308 (=> (not res!776670) (not e!665168))))

(assert (=> start!99308 (= res!776670 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37012 _keys!1208))))))

(assert (=> start!99308 e!665168))

(declare-fun tp_is_empty!29417 () Bool)

(assert (=> start!99308 tp_is_empty!29417))

(declare-fun array_inv!27880 (array!75653) Bool)

(assert (=> start!99308 (array_inv!27880 _keys!1208)))

(assert (=> start!99308 true))

(assert (=> start!99308 tp!87374))

(declare-fun e!665164 () Bool)

(declare-fun array_inv!27881 (array!75655) Bool)

(assert (=> start!99308 (and (array_inv!27881 _values!996) e!665164)))

(declare-fun b!1170321 () Bool)

(assert (=> b!1170321 (= e!665170 (not e!665166))))

(declare-fun res!776677 () Bool)

(assert (=> b!1170321 (=> res!776677 e!665166)))

(assert (=> b!1170321 (= res!776677 (bvsgt from!1455 i!673))))

(assert (=> b!1170321 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!527064 () Unit!38608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75653 (_ BitVec 64) (_ BitVec 32)) Unit!38608)

(assert (=> b!1170321 (= lt!527064 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!45953 () Bool)

(assert (=> mapIsEmpty!45953 mapRes!45953))

(declare-fun b!1170322 () Bool)

(declare-fun e!665165 () Bool)

(assert (=> b!1170322 (= e!665165 tp_is_empty!29417)))

(declare-fun b!1170323 () Bool)

(assert (=> b!1170323 (= e!665164 (and e!665165 mapRes!45953))))

(declare-fun condMapEmpty!45953 () Bool)

(declare-fun mapDefault!45953 () ValueCell!13999)

