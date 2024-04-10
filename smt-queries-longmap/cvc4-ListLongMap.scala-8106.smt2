; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99506 () Bool)

(assert start!99506)

(declare-fun b_free!25085 () Bool)

(declare-fun b_next!25085 () Bool)

(assert (=> start!99506 (= b_free!25085 (not b_next!25085))))

(declare-fun tp!87968 () Bool)

(declare-fun b_and!41037 () Bool)

(assert (=> start!99506 (= tp!87968 b_and!41037)))

(declare-datatypes ((V!44613 0))(
  ( (V!44614 (val!14864 Int)) )
))
(declare-datatypes ((tuple2!19008 0))(
  ( (tuple2!19009 (_1!9515 (_ BitVec 64)) (_2!9515 V!44613)) )
))
(declare-datatypes ((List!25746 0))(
  ( (Nil!25743) (Cons!25742 (h!26951 tuple2!19008) (t!37823 List!25746)) )
))
(declare-datatypes ((ListLongMap!16977 0))(
  ( (ListLongMap!16978 (toList!8504 List!25746)) )
))
(declare-fun lt!531092 () ListLongMap!16977)

(declare-fun lt!531082 () tuple2!19008)

(declare-fun lt!531080 () ListLongMap!16977)

(declare-fun e!668837 () Bool)

(declare-fun b!1176605 () Bool)

(declare-fun +!3820 (ListLongMap!16977 tuple2!19008) ListLongMap!16977)

(assert (=> b!1176605 (= e!668837 (= lt!531080 (+!3820 lt!531092 lt!531082)))))

(declare-fun b!1176606 () Bool)

(declare-fun res!781499 () Bool)

(declare-fun e!668845 () Bool)

(assert (=> b!1176606 (=> (not res!781499) (not e!668845))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176606 (= res!781499 (validMask!0 mask!1564))))

(declare-fun b!1176607 () Bool)

(declare-fun res!781513 () Bool)

(assert (=> b!1176607 (=> (not res!781513) (not e!668845))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76037 0))(
  ( (array!76038 (arr!36668 (Array (_ BitVec 32) (_ BitVec 64))) (size!37204 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76037)

(assert (=> b!1176607 (= res!781513 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37204 _keys!1208))))))

(declare-fun b!1176608 () Bool)

(declare-datatypes ((Unit!38843 0))(
  ( (Unit!38844) )
))
(declare-fun e!668843 () Unit!38843)

(declare-fun Unit!38845 () Unit!38843)

(assert (=> b!1176608 (= e!668843 Unit!38845)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!531089 () Unit!38843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38843)

(assert (=> b!1176608 (= lt!531089 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176608 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531079 () Unit!38843)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76037 (_ BitVec 32) (_ BitVec 32)) Unit!38843)

(assert (=> b!1176608 (= lt!531079 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25747 0))(
  ( (Nil!25744) (Cons!25743 (h!26952 (_ BitVec 64)) (t!37824 List!25747)) )
))
(declare-fun arrayNoDuplicates!0 (array!76037 (_ BitVec 32) List!25747) Bool)

(assert (=> b!1176608 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25744)))

(declare-fun lt!531088 () Unit!38843)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76037 (_ BitVec 64) (_ BitVec 32) List!25747) Unit!38843)

(assert (=> b!1176608 (= lt!531088 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25744))))

(assert (=> b!1176608 false))

(declare-fun b!1176609 () Bool)

(declare-fun e!668842 () Bool)

(declare-fun e!668835 () Bool)

(assert (=> b!1176609 (= e!668842 e!668835)))

(declare-fun res!781512 () Bool)

(assert (=> b!1176609 (=> res!781512 e!668835)))

(assert (=> b!1176609 (= res!781512 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44613)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531093 () ListLongMap!16977)

(declare-fun minValue!944 () V!44613)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531091 () array!76037)

(declare-datatypes ((ValueCell!14098 0))(
  ( (ValueCellFull!14098 (v!17502 V!44613)) (EmptyCell!14098) )
))
(declare-datatypes ((array!76039 0))(
  ( (array!76040 (arr!36669 (Array (_ BitVec 32) ValueCell!14098)) (size!37205 (_ BitVec 32))) )
))
(declare-fun lt!531084 () array!76039)

(declare-fun getCurrentListMapNoExtraKeys!4963 (array!76037 array!76039 (_ BitVec 32) (_ BitVec 32) V!44613 V!44613 (_ BitVec 32) Int) ListLongMap!16977)

(assert (=> b!1176609 (= lt!531093 (getCurrentListMapNoExtraKeys!4963 lt!531091 lt!531084 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531083 () V!44613)

(declare-fun _values!996 () array!76039)

(assert (=> b!1176609 (= lt!531084 (array!76040 (store (arr!36669 _values!996) i!673 (ValueCellFull!14098 lt!531083)) (size!37205 _values!996)))))

(declare-fun dynLambda!2928 (Int (_ BitVec 64)) V!44613)

(assert (=> b!1176609 (= lt!531083 (dynLambda!2928 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1176609 (= lt!531080 (getCurrentListMapNoExtraKeys!4963 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176610 () Bool)

(declare-fun e!668840 () Bool)

(declare-fun e!668841 () Bool)

(assert (=> b!1176610 (= e!668840 e!668841)))

(declare-fun res!781511 () Bool)

(assert (=> b!1176610 (=> res!781511 e!668841)))

(assert (=> b!1176610 (= res!781511 (not (= (select (arr!36668 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176611 () Bool)

(declare-fun e!668839 () Bool)

(assert (=> b!1176611 (= e!668839 (not e!668842))))

(declare-fun res!781502 () Bool)

(assert (=> b!1176611 (=> res!781502 e!668842)))

(assert (=> b!1176611 (= res!781502 (bvsgt from!1455 i!673))))

(assert (=> b!1176611 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531086 () Unit!38843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76037 (_ BitVec 64) (_ BitVec 32)) Unit!38843)

(assert (=> b!1176611 (= lt!531086 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176612 () Bool)

(declare-fun e!668836 () Bool)

(assert (=> b!1176612 (= e!668836 true)))

(assert (=> b!1176612 e!668837))

(declare-fun res!781508 () Bool)

(assert (=> b!1176612 (=> (not res!781508) (not e!668837))))

(assert (=> b!1176612 (= res!781508 (not (= (select (arr!36668 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531090 () Unit!38843)

(assert (=> b!1176612 (= lt!531090 e!668843)))

(declare-fun c!116751 () Bool)

(assert (=> b!1176612 (= c!116751 (= (select (arr!36668 _keys!1208) from!1455) k!934))))

(assert (=> b!1176612 e!668840))

(declare-fun res!781505 () Bool)

(assert (=> b!1176612 (=> (not res!781505) (not e!668840))))

(declare-fun lt!531081 () ListLongMap!16977)

(assert (=> b!1176612 (= res!781505 (= lt!531093 (+!3820 lt!531081 lt!531082)))))

(declare-fun get!18728 (ValueCell!14098 V!44613) V!44613)

(assert (=> b!1176612 (= lt!531082 (tuple2!19009 (select (arr!36668 _keys!1208) from!1455) (get!18728 (select (arr!36669 _values!996) from!1455) lt!531083)))))

(declare-fun b!1176613 () Bool)

(declare-fun e!668838 () Bool)

(declare-fun tp_is_empty!29615 () Bool)

(assert (=> b!1176613 (= e!668838 tp_is_empty!29615)))

(declare-fun mapNonEmpty!46250 () Bool)

(declare-fun mapRes!46250 () Bool)

(declare-fun tp!87969 () Bool)

(assert (=> mapNonEmpty!46250 (= mapRes!46250 (and tp!87969 e!668838))))

(declare-fun mapKey!46250 () (_ BitVec 32))

(declare-fun mapRest!46250 () (Array (_ BitVec 32) ValueCell!14098))

(declare-fun mapValue!46250 () ValueCell!14098)

(assert (=> mapNonEmpty!46250 (= (arr!36669 _values!996) (store mapRest!46250 mapKey!46250 mapValue!46250))))

(declare-fun b!1176614 () Bool)

(declare-fun res!781503 () Bool)

(assert (=> b!1176614 (=> (not res!781503) (not e!668845))))

(assert (=> b!1176614 (= res!781503 (= (select (arr!36668 _keys!1208) i!673) k!934))))

(declare-fun b!1176615 () Bool)

(declare-fun res!781507 () Bool)

(assert (=> b!1176615 (=> (not res!781507) (not e!668845))))

(assert (=> b!1176615 (= res!781507 (and (= (size!37205 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37204 _keys!1208) (size!37205 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176616 () Bool)

(assert (=> b!1176616 (= e!668841 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176617 () Bool)

(declare-fun e!668834 () Bool)

(declare-fun e!668844 () Bool)

(assert (=> b!1176617 (= e!668834 (and e!668844 mapRes!46250))))

(declare-fun condMapEmpty!46250 () Bool)

(declare-fun mapDefault!46250 () ValueCell!14098)

