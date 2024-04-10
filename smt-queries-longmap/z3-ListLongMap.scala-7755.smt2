; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97276 () Bool)

(assert start!97276)

(declare-fun b_free!23247 () Bool)

(declare-fun b_next!23247 () Bool)

(assert (=> start!97276 (= b_free!23247 (not b_next!23247))))

(declare-fun tp!82039 () Bool)

(declare-fun b_and!37325 () Bool)

(assert (=> start!97276 (= tp!82039 b_and!37325)))

(declare-fun b!1107545 () Bool)

(declare-fun res!739143 () Bool)

(declare-fun e!631902 () Bool)

(assert (=> b!1107545 (=> (not res!739143) (not e!631902))))

(declare-datatypes ((array!71931 0))(
  ( (array!71932 (arr!34618 (Array (_ BitVec 32) (_ BitVec 64))) (size!35154 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71931)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71931 (_ BitVec 32)) Bool)

(assert (=> b!1107545 (= res!739143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107546 () Bool)

(declare-fun res!739146 () Bool)

(assert (=> b!1107546 (=> (not res!739146) (not e!631902))))

(declare-datatypes ((List!24128 0))(
  ( (Nil!24125) (Cons!24124 (h!25333 (_ BitVec 64)) (t!34421 List!24128)) )
))
(declare-fun arrayNoDuplicates!0 (array!71931 (_ BitVec 32) List!24128) Bool)

(assert (=> b!1107546 (= res!739146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24125))))

(declare-fun b!1107547 () Bool)

(declare-fun e!631898 () Bool)

(declare-datatypes ((V!41803 0))(
  ( (V!41804 (val!13810 Int)) )
))
(declare-datatypes ((tuple2!17444 0))(
  ( (tuple2!17445 (_1!8733 (_ BitVec 64)) (_2!8733 V!41803)) )
))
(declare-datatypes ((List!24129 0))(
  ( (Nil!24126) (Cons!24125 (h!25334 tuple2!17444) (t!34422 List!24129)) )
))
(declare-datatypes ((ListLongMap!15413 0))(
  ( (ListLongMap!15414 (toList!7722 List!24129)) )
))
(declare-fun call!46438 () ListLongMap!15413)

(declare-fun call!46437 () ListLongMap!15413)

(assert (=> b!1107547 (= e!631898 (= call!46438 call!46437))))

(declare-fun mapNonEmpty!43078 () Bool)

(declare-fun mapRes!43078 () Bool)

(declare-fun tp!82040 () Bool)

(declare-fun e!631904 () Bool)

(assert (=> mapNonEmpty!43078 (= mapRes!43078 (and tp!82040 e!631904))))

(declare-datatypes ((ValueCell!13044 0))(
  ( (ValueCellFull!13044 (v!16443 V!41803)) (EmptyCell!13044) )
))
(declare-fun mapValue!43078 () ValueCell!13044)

(declare-fun mapKey!43078 () (_ BitVec 32))

(declare-datatypes ((array!71933 0))(
  ( (array!71934 (arr!34619 (Array (_ BitVec 32) ValueCell!13044)) (size!35155 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71933)

(declare-fun mapRest!43078 () (Array (_ BitVec 32) ValueCell!13044))

(assert (=> mapNonEmpty!43078 (= (arr!34619 _values!996) (store mapRest!43078 mapKey!43078 mapValue!43078))))

(declare-fun b!1107548 () Bool)

(declare-fun e!631905 () Bool)

(declare-fun tp_is_empty!27507 () Bool)

(assert (=> b!1107548 (= e!631905 tp_is_empty!27507)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!495648 () array!71931)

(declare-fun minValue!944 () V!41803)

(declare-fun bm!46434 () Bool)

(declare-fun zeroValue!944 () V!41803)

(declare-fun getCurrentListMapNoExtraKeys!4220 (array!71931 array!71933 (_ BitVec 32) (_ BitVec 32) V!41803 V!41803 (_ BitVec 32) Int) ListLongMap!15413)

(declare-fun dynLambda!2353 (Int (_ BitVec 64)) V!41803)

(assert (=> bm!46434 (= call!46438 (getCurrentListMapNoExtraKeys!4220 lt!495648 (array!71934 (store (arr!34619 _values!996) i!673 (ValueCellFull!13044 (dynLambda!2353 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35155 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107549 () Bool)

(declare-fun e!631899 () Bool)

(assert (=> b!1107549 (= e!631902 e!631899)))

(declare-fun res!739144 () Bool)

(assert (=> b!1107549 (=> (not res!739144) (not e!631899))))

(assert (=> b!1107549 (= res!739144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495648 mask!1564))))

(assert (=> b!1107549 (= lt!495648 (array!71932 (store (arr!34618 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35154 _keys!1208)))))

(declare-fun res!739149 () Bool)

(assert (=> start!97276 (=> (not res!739149) (not e!631902))))

(assert (=> start!97276 (= res!739149 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35154 _keys!1208))))))

(assert (=> start!97276 e!631902))

(assert (=> start!97276 tp_is_empty!27507))

(declare-fun array_inv!26642 (array!71931) Bool)

(assert (=> start!97276 (array_inv!26642 _keys!1208)))

(assert (=> start!97276 true))

(assert (=> start!97276 tp!82039))

(declare-fun e!631901 () Bool)

(declare-fun array_inv!26643 (array!71933) Bool)

(assert (=> start!97276 (and (array_inv!26643 _values!996) e!631901)))

(declare-fun b!1107550 () Bool)

(declare-fun res!739142 () Bool)

(assert (=> b!1107550 (=> (not res!739142) (not e!631902))))

(assert (=> b!1107550 (= res!739142 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35154 _keys!1208))))))

(declare-fun b!1107551 () Bool)

(declare-fun res!739148 () Bool)

(assert (=> b!1107551 (=> (not res!739148) (not e!631902))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107551 (= res!739148 (= (select (arr!34618 _keys!1208) i!673) k0!934))))

(declare-fun b!1107552 () Bool)

(declare-fun e!631900 () Bool)

(assert (=> b!1107552 (= e!631899 (not e!631900))))

(declare-fun res!739141 () Bool)

(assert (=> b!1107552 (=> res!739141 e!631900)))

(assert (=> b!1107552 (= res!739141 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35154 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107552 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36350 0))(
  ( (Unit!36351) )
))
(declare-fun lt!495649 () Unit!36350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71931 (_ BitVec 64) (_ BitVec 32)) Unit!36350)

(assert (=> b!1107552 (= lt!495649 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107553 () Bool)

(assert (=> b!1107553 (= e!631904 tp_is_empty!27507)))

(declare-fun b!1107554 () Bool)

(declare-fun -!1002 (ListLongMap!15413 (_ BitVec 64)) ListLongMap!15413)

(assert (=> b!1107554 (= e!631898 (= call!46438 (-!1002 call!46437 k0!934)))))

(declare-fun b!1107555 () Bool)

(declare-fun res!739145 () Bool)

(assert (=> b!1107555 (=> (not res!739145) (not e!631902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107555 (= res!739145 (validMask!0 mask!1564))))

(declare-fun b!1107556 () Bool)

(declare-fun res!739140 () Bool)

(assert (=> b!1107556 (=> (not res!739140) (not e!631902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107556 (= res!739140 (validKeyInArray!0 k0!934))))

(declare-fun b!1107557 () Bool)

(assert (=> b!1107557 (= e!631900 true)))

(assert (=> b!1107557 e!631898))

(declare-fun c!109050 () Bool)

(assert (=> b!1107557 (= c!109050 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495650 () Unit!36350)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!249 (array!71931 array!71933 (_ BitVec 32) (_ BitVec 32) V!41803 V!41803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36350)

(assert (=> b!1107557 (= lt!495650 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43078 () Bool)

(assert (=> mapIsEmpty!43078 mapRes!43078))

(declare-fun b!1107558 () Bool)

(declare-fun res!739147 () Bool)

(assert (=> b!1107558 (=> (not res!739147) (not e!631899))))

(assert (=> b!1107558 (= res!739147 (arrayNoDuplicates!0 lt!495648 #b00000000000000000000000000000000 Nil!24125))))

(declare-fun bm!46435 () Bool)

(assert (=> bm!46435 (= call!46437 (getCurrentListMapNoExtraKeys!4220 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107559 () Bool)

(declare-fun res!739150 () Bool)

(assert (=> b!1107559 (=> (not res!739150) (not e!631902))))

(assert (=> b!1107559 (= res!739150 (and (= (size!35155 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35154 _keys!1208) (size!35155 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107560 () Bool)

(assert (=> b!1107560 (= e!631901 (and e!631905 mapRes!43078))))

(declare-fun condMapEmpty!43078 () Bool)

(declare-fun mapDefault!43078 () ValueCell!13044)

(assert (=> b!1107560 (= condMapEmpty!43078 (= (arr!34619 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13044)) mapDefault!43078)))))

(assert (= (and start!97276 res!739149) b!1107555))

(assert (= (and b!1107555 res!739145) b!1107559))

(assert (= (and b!1107559 res!739150) b!1107545))

(assert (= (and b!1107545 res!739143) b!1107546))

(assert (= (and b!1107546 res!739146) b!1107550))

(assert (= (and b!1107550 res!739142) b!1107556))

(assert (= (and b!1107556 res!739140) b!1107551))

(assert (= (and b!1107551 res!739148) b!1107549))

(assert (= (and b!1107549 res!739144) b!1107558))

(assert (= (and b!1107558 res!739147) b!1107552))

(assert (= (and b!1107552 (not res!739141)) b!1107557))

(assert (= (and b!1107557 c!109050) b!1107554))

(assert (= (and b!1107557 (not c!109050)) b!1107547))

(assert (= (or b!1107554 b!1107547) bm!46434))

(assert (= (or b!1107554 b!1107547) bm!46435))

(assert (= (and b!1107560 condMapEmpty!43078) mapIsEmpty!43078))

(assert (= (and b!1107560 (not condMapEmpty!43078)) mapNonEmpty!43078))

(get-info :version)

(assert (= (and mapNonEmpty!43078 ((_ is ValueCellFull!13044) mapValue!43078)) b!1107553))

(assert (= (and b!1107560 ((_ is ValueCellFull!13044) mapDefault!43078)) b!1107548))

(assert (= start!97276 b!1107560))

(declare-fun b_lambda!18265 () Bool)

(assert (=> (not b_lambda!18265) (not bm!46434)))

(declare-fun t!34420 () Bool)

(declare-fun tb!8113 () Bool)

(assert (=> (and start!97276 (= defaultEntry!1004 defaultEntry!1004) t!34420) tb!8113))

(declare-fun result!16787 () Bool)

(assert (=> tb!8113 (= result!16787 tp_is_empty!27507)))

(assert (=> bm!46434 t!34420))

(declare-fun b_and!37327 () Bool)

(assert (= b_and!37325 (and (=> t!34420 result!16787) b_and!37327)))

(declare-fun m!1026295 () Bool)

(assert (=> bm!46435 m!1026295))

(declare-fun m!1026297 () Bool)

(assert (=> b!1107554 m!1026297))

(declare-fun m!1026299 () Bool)

(assert (=> bm!46434 m!1026299))

(declare-fun m!1026301 () Bool)

(assert (=> bm!46434 m!1026301))

(declare-fun m!1026303 () Bool)

(assert (=> bm!46434 m!1026303))

(declare-fun m!1026305 () Bool)

(assert (=> b!1107545 m!1026305))

(declare-fun m!1026307 () Bool)

(assert (=> b!1107557 m!1026307))

(declare-fun m!1026309 () Bool)

(assert (=> b!1107551 m!1026309))

(declare-fun m!1026311 () Bool)

(assert (=> start!97276 m!1026311))

(declare-fun m!1026313 () Bool)

(assert (=> start!97276 m!1026313))

(declare-fun m!1026315 () Bool)

(assert (=> b!1107546 m!1026315))

(declare-fun m!1026317 () Bool)

(assert (=> b!1107549 m!1026317))

(declare-fun m!1026319 () Bool)

(assert (=> b!1107549 m!1026319))

(declare-fun m!1026321 () Bool)

(assert (=> b!1107558 m!1026321))

(declare-fun m!1026323 () Bool)

(assert (=> mapNonEmpty!43078 m!1026323))

(declare-fun m!1026325 () Bool)

(assert (=> b!1107556 m!1026325))

(declare-fun m!1026327 () Bool)

(assert (=> b!1107555 m!1026327))

(declare-fun m!1026329 () Bool)

(assert (=> b!1107552 m!1026329))

(declare-fun m!1026331 () Bool)

(assert (=> b!1107552 m!1026331))

(check-sat (not b!1107558) (not b!1107552) (not b!1107546) (not b!1107549) (not mapNonEmpty!43078) (not b!1107557) (not b_next!23247) (not b!1107556) (not b!1107555) (not start!97276) tp_is_empty!27507 b_and!37327 (not b!1107545) (not b!1107554) (not b_lambda!18265) (not bm!46435) (not bm!46434))
(check-sat b_and!37327 (not b_next!23247))
