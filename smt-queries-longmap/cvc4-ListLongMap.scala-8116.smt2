; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99566 () Bool)

(assert start!99566)

(declare-fun b_free!25145 () Bool)

(declare-fun b_next!25145 () Bool)

(assert (=> start!99566 (= b_free!25145 (not b_next!25145))))

(declare-fun tp!88148 () Bool)

(declare-fun b_and!41157 () Bool)

(assert (=> start!99566 (= tp!88148 b_and!41157)))

(declare-fun b!1178555 () Bool)

(declare-fun e!670009 () Bool)

(declare-fun tp_is_empty!29675 () Bool)

(assert (=> b!1178555 (= e!670009 tp_is_empty!29675)))

(declare-fun b!1178556 () Bool)

(declare-fun res!782938 () Bool)

(declare-fun e!670008 () Bool)

(assert (=> b!1178556 (=> (not res!782938) (not e!670008))))

(declare-datatypes ((array!76153 0))(
  ( (array!76154 (arr!36726 (Array (_ BitVec 32) (_ BitVec 64))) (size!37262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76153)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76153 (_ BitVec 32)) Bool)

(assert (=> b!1178556 (= res!782938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178557 () Bool)

(declare-fun res!782953 () Bool)

(assert (=> b!1178557 (=> (not res!782953) (not e!670008))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1178557 (= res!782953 (= (select (arr!36726 _keys!1208) i!673) k!934))))

(declare-fun b!1178558 () Bool)

(declare-fun e!670005 () Bool)

(assert (=> b!1178558 (= e!670008 e!670005)))

(declare-fun res!782948 () Bool)

(assert (=> b!1178558 (=> (not res!782948) (not e!670005))))

(declare-fun lt!532441 () array!76153)

(assert (=> b!1178558 (= res!782948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532441 mask!1564))))

(assert (=> b!1178558 (= lt!532441 (array!76154 (store (arr!36726 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37262 _keys!1208)))))

(declare-fun b!1178559 () Bool)

(declare-fun e!670006 () Bool)

(assert (=> b!1178559 (= e!670006 true)))

(declare-fun e!670010 () Bool)

(assert (=> b!1178559 e!670010))

(declare-fun res!782947 () Bool)

(assert (=> b!1178559 (=> (not res!782947) (not e!670010))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178559 (= res!782947 (not (= (select (arr!36726 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38930 0))(
  ( (Unit!38931) )
))
(declare-fun lt!532440 () Unit!38930)

(declare-fun e!670015 () Unit!38930)

(assert (=> b!1178559 (= lt!532440 e!670015)))

(declare-fun c!116841 () Bool)

(assert (=> b!1178559 (= c!116841 (= (select (arr!36726 _keys!1208) from!1455) k!934))))

(declare-fun e!670011 () Bool)

(assert (=> b!1178559 e!670011))

(declare-fun res!782943 () Bool)

(assert (=> b!1178559 (=> (not res!782943) (not e!670011))))

(declare-datatypes ((V!44693 0))(
  ( (V!44694 (val!14894 Int)) )
))
(declare-datatypes ((tuple2!19058 0))(
  ( (tuple2!19059 (_1!9540 (_ BitVec 64)) (_2!9540 V!44693)) )
))
(declare-fun lt!532430 () tuple2!19058)

(declare-datatypes ((List!25796 0))(
  ( (Nil!25793) (Cons!25792 (h!27001 tuple2!19058) (t!37933 List!25796)) )
))
(declare-datatypes ((ListLongMap!17027 0))(
  ( (ListLongMap!17028 (toList!8529 List!25796)) )
))
(declare-fun lt!532429 () ListLongMap!17027)

(declare-fun lt!532442 () ListLongMap!17027)

(declare-fun +!3843 (ListLongMap!17027 tuple2!19058) ListLongMap!17027)

(assert (=> b!1178559 (= res!782943 (= lt!532429 (+!3843 lt!532442 lt!532430)))))

(declare-datatypes ((ValueCell!14128 0))(
  ( (ValueCellFull!14128 (v!17532 V!44693)) (EmptyCell!14128) )
))
(declare-datatypes ((array!76155 0))(
  ( (array!76156 (arr!36727 (Array (_ BitVec 32) ValueCell!14128)) (size!37263 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76155)

(declare-fun lt!532432 () V!44693)

(declare-fun get!18771 (ValueCell!14128 V!44693) V!44693)

(assert (=> b!1178559 (= lt!532430 (tuple2!19059 (select (arr!36726 _keys!1208) from!1455) (get!18771 (select (arr!36727 _values!996) from!1455) lt!532432)))))

(declare-fun b!1178560 () Bool)

(declare-fun e!670014 () Bool)

(assert (=> b!1178560 (= e!670014 tp_is_empty!29675)))

(declare-fun b!1178561 () Bool)

(declare-fun e!670003 () Bool)

(declare-fun arrayContainsKey!0 (array!76153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178561 (= e!670003 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46340 () Bool)

(declare-fun mapRes!46340 () Bool)

(assert (=> mapIsEmpty!46340 mapRes!46340))

(declare-fun b!1178562 () Bool)

(declare-fun e!670004 () Bool)

(declare-fun e!670007 () Bool)

(assert (=> b!1178562 (= e!670004 e!670007)))

(declare-fun res!782939 () Bool)

(assert (=> b!1178562 (=> res!782939 e!670007)))

(assert (=> b!1178562 (= res!782939 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44693)

(declare-fun zeroValue!944 () V!44693)

(declare-fun lt!532431 () array!76155)

(declare-fun getCurrentListMapNoExtraKeys!4985 (array!76153 array!76155 (_ BitVec 32) (_ BitVec 32) V!44693 V!44693 (_ BitVec 32) Int) ListLongMap!17027)

(assert (=> b!1178562 (= lt!532429 (getCurrentListMapNoExtraKeys!4985 lt!532441 lt!532431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178562 (= lt!532431 (array!76156 (store (arr!36727 _values!996) i!673 (ValueCellFull!14128 lt!532432)) (size!37263 _values!996)))))

(declare-fun dynLambda!2947 (Int (_ BitVec 64)) V!44693)

(assert (=> b!1178562 (= lt!532432 (dynLambda!2947 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532433 () ListLongMap!17027)

(assert (=> b!1178562 (= lt!532433 (getCurrentListMapNoExtraKeys!4985 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178563 () Bool)

(declare-fun res!782941 () Bool)

(assert (=> b!1178563 (=> (not res!782941) (not e!670008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178563 (= res!782941 (validKeyInArray!0 k!934))))

(declare-fun b!1178564 () Bool)

(assert (=> b!1178564 (= e!670011 e!670003)))

(declare-fun res!782946 () Bool)

(assert (=> b!1178564 (=> res!782946 e!670003)))

(assert (=> b!1178564 (= res!782946 (not (= (select (arr!36726 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178565 () Bool)

(assert (=> b!1178565 (= e!670007 e!670006)))

(declare-fun res!782949 () Bool)

(assert (=> b!1178565 (=> res!782949 e!670006)))

(assert (=> b!1178565 (= res!782949 (not (validKeyInArray!0 (select (arr!36726 _keys!1208) from!1455))))))

(declare-fun lt!532438 () ListLongMap!17027)

(assert (=> b!1178565 (= lt!532438 lt!532442)))

(declare-fun lt!532434 () ListLongMap!17027)

(declare-fun -!1576 (ListLongMap!17027 (_ BitVec 64)) ListLongMap!17027)

(assert (=> b!1178565 (= lt!532442 (-!1576 lt!532434 k!934))))

(assert (=> b!1178565 (= lt!532438 (getCurrentListMapNoExtraKeys!4985 lt!532441 lt!532431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178565 (= lt!532434 (getCurrentListMapNoExtraKeys!4985 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532439 () Unit!38930)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!803 (array!76153 array!76155 (_ BitVec 32) (_ BitVec 32) V!44693 V!44693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38930)

(assert (=> b!1178565 (= lt!532439 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178566 () Bool)

(declare-fun res!782945 () Bool)

(assert (=> b!1178566 (=> (not res!782945) (not e!670008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178566 (= res!782945 (validMask!0 mask!1564))))

(declare-fun b!1178567 () Bool)

(declare-fun Unit!38932 () Unit!38930)

(assert (=> b!1178567 (= e!670015 Unit!38932)))

(declare-fun b!1178568 () Bool)

(declare-fun Unit!38933 () Unit!38930)

(assert (=> b!1178568 (= e!670015 Unit!38933)))

(declare-fun lt!532443 () Unit!38930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38930)

(assert (=> b!1178568 (= lt!532443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178568 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532437 () Unit!38930)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76153 (_ BitVec 32) (_ BitVec 32)) Unit!38930)

(assert (=> b!1178568 (= lt!532437 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25797 0))(
  ( (Nil!25794) (Cons!25793 (h!27002 (_ BitVec 64)) (t!37934 List!25797)) )
))
(declare-fun arrayNoDuplicates!0 (array!76153 (_ BitVec 32) List!25797) Bool)

(assert (=> b!1178568 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25794)))

(declare-fun lt!532435 () Unit!38930)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76153 (_ BitVec 64) (_ BitVec 32) List!25797) Unit!38930)

(assert (=> b!1178568 (= lt!532435 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25794))))

(assert (=> b!1178568 false))

(declare-fun b!1178569 () Bool)

(declare-fun res!782952 () Bool)

(assert (=> b!1178569 (=> (not res!782952) (not e!670008))))

(assert (=> b!1178569 (= res!782952 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25794))))

(declare-fun b!1178570 () Bool)

(assert (=> b!1178570 (= e!670010 (= lt!532433 (+!3843 lt!532434 lt!532430)))))

(declare-fun b!1178571 () Bool)

(declare-fun e!670013 () Bool)

(assert (=> b!1178571 (= e!670013 (and e!670009 mapRes!46340))))

(declare-fun condMapEmpty!46340 () Bool)

(declare-fun mapDefault!46340 () ValueCell!14128)

