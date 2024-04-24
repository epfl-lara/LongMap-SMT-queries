; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99256 () Bool)

(assert start!99256)

(declare-fun b_free!24625 () Bool)

(declare-fun b_next!24625 () Bool)

(assert (=> start!99256 (= b_free!24625 (not b_next!24625))))

(declare-fun tp!86586 () Bool)

(declare-fun b_and!40101 () Bool)

(assert (=> start!99256 (= tp!86586 b_and!40101)))

(declare-datatypes ((array!75197 0))(
  ( (array!75198 (arr!36243 (Array (_ BitVec 32) (_ BitVec 64))) (size!36780 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75197)

(declare-fun e!662564 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1165051 () Bool)

(declare-fun arrayContainsKey!0 (array!75197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165051 (= e!662564 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1165052 () Bool)

(declare-fun e!662560 () Bool)

(assert (=> b!1165052 (= e!662560 true)))

(declare-fun e!662558 () Bool)

(assert (=> b!1165052 e!662558))

(declare-fun res!772248 () Bool)

(assert (=> b!1165052 (=> (not res!772248) (not e!662558))))

(declare-datatypes ((V!44001 0))(
  ( (V!44002 (val!14634 Int)) )
))
(declare-datatypes ((tuple2!18690 0))(
  ( (tuple2!18691 (_1!9356 (_ BitVec 64)) (_2!9356 V!44001)) )
))
(declare-datatypes ((List!25424 0))(
  ( (Nil!25421) (Cons!25420 (h!26638 tuple2!18690) (t!37033 List!25424)) )
))
(declare-datatypes ((ListLongMap!16667 0))(
  ( (ListLongMap!16668 (toList!8349 List!25424)) )
))
(declare-fun lt!524852 () ListLongMap!16667)

(declare-fun lt!524850 () ListLongMap!16667)

(assert (=> b!1165052 (= res!772248 (= lt!524852 lt!524850))))

(declare-fun lt!524847 () ListLongMap!16667)

(declare-fun -!1443 (ListLongMap!16667 (_ BitVec 64)) ListLongMap!16667)

(assert (=> b!1165052 (= lt!524852 (-!1443 lt!524847 k0!934))))

(declare-fun lt!524856 () V!44001)

(declare-fun +!3764 (ListLongMap!16667 tuple2!18690) ListLongMap!16667)

(assert (=> b!1165052 (= (-!1443 (+!3764 lt!524850 (tuple2!18691 (select (arr!36243 _keys!1208) from!1455) lt!524856)) (select (arr!36243 _keys!1208) from!1455)) lt!524850)))

(declare-datatypes ((Unit!38391 0))(
  ( (Unit!38392) )
))
(declare-fun lt!524842 () Unit!38391)

(declare-fun addThenRemoveForNewKeyIsSame!270 (ListLongMap!16667 (_ BitVec 64) V!44001) Unit!38391)

(assert (=> b!1165052 (= lt!524842 (addThenRemoveForNewKeyIsSame!270 lt!524850 (select (arr!36243 _keys!1208) from!1455) lt!524856))))

(declare-datatypes ((ValueCell!13868 0))(
  ( (ValueCellFull!13868 (v!17267 V!44001)) (EmptyCell!13868) )
))
(declare-datatypes ((array!75199 0))(
  ( (array!75200 (arr!36244 (Array (_ BitVec 32) ValueCell!13868)) (size!36781 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75199)

(declare-fun lt!524853 () V!44001)

(declare-fun get!18523 (ValueCell!13868 V!44001) V!44001)

(assert (=> b!1165052 (= lt!524856 (get!18523 (select (arr!36244 _values!996) from!1455) lt!524853))))

(declare-fun lt!524851 () Unit!38391)

(declare-fun e!662569 () Unit!38391)

(assert (=> b!1165052 (= lt!524851 e!662569)))

(declare-fun c!116886 () Bool)

(declare-fun contains!6865 (ListLongMap!16667 (_ BitVec 64)) Bool)

(assert (=> b!1165052 (= c!116886 (contains!6865 lt!524850 k0!934))))

(declare-fun zeroValue!944 () V!44001)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44001)

(declare-fun getCurrentListMapNoExtraKeys!4840 (array!75197 array!75199 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 32) Int) ListLongMap!16667)

(assert (=> b!1165052 (= lt!524850 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1165053 () Bool)

(declare-fun res!772240 () Bool)

(declare-fun e!662553 () Bool)

(assert (=> b!1165053 (=> (not res!772240) (not e!662553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165053 (= res!772240 (validKeyInArray!0 k0!934))))

(declare-fun b!1165054 () Bool)

(declare-fun lt!524846 () ListLongMap!16667)

(assert (=> b!1165054 (contains!6865 (+!3764 lt!524846 (tuple2!18691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524848 () Unit!38391)

(declare-fun call!57113 () Unit!38391)

(assert (=> b!1165054 (= lt!524848 call!57113)))

(declare-fun call!57112 () Bool)

(assert (=> b!1165054 call!57112))

(declare-fun call!57110 () ListLongMap!16667)

(assert (=> b!1165054 (= lt!524846 call!57110)))

(declare-fun lt!524855 () Unit!38391)

(declare-fun addStillContains!982 (ListLongMap!16667 (_ BitVec 64) V!44001 (_ BitVec 64)) Unit!38391)

(assert (=> b!1165054 (= lt!524855 (addStillContains!982 lt!524850 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!662561 () Unit!38391)

(assert (=> b!1165054 (= e!662561 lt!524848)))

(declare-fun mapNonEmpty!45557 () Bool)

(declare-fun mapRes!45557 () Bool)

(declare-fun tp!86585 () Bool)

(declare-fun e!662567 () Bool)

(assert (=> mapNonEmpty!45557 (= mapRes!45557 (and tp!86585 e!662567))))

(declare-fun mapKey!45557 () (_ BitVec 32))

(declare-fun mapValue!45557 () ValueCell!13868)

(declare-fun mapRest!45557 () (Array (_ BitVec 32) ValueCell!13868))

(assert (=> mapNonEmpty!45557 (= (arr!36244 _values!996) (store mapRest!45557 mapKey!45557 mapValue!45557))))

(declare-fun b!1165055 () Bool)

(declare-fun res!772238 () Bool)

(assert (=> b!1165055 (=> (not res!772238) (not e!662553))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165055 (= res!772238 (= (select (arr!36243 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45557 () Bool)

(assert (=> mapIsEmpty!45557 mapRes!45557))

(declare-fun bm!57104 () Bool)

(declare-fun call!57111 () Unit!38391)

(assert (=> bm!57104 (= call!57111 call!57113)))

(declare-fun lt!524854 () Bool)

(declare-fun b!1165056 () Bool)

(declare-fun e!662556 () Bool)

(assert (=> b!1165056 (= e!662556 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524854) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1165057 () Bool)

(declare-fun e!662565 () Bool)

(assert (=> b!1165057 (= e!662565 e!662560)))

(declare-fun res!772241 () Bool)

(assert (=> b!1165057 (=> res!772241 e!662560)))

(assert (=> b!1165057 (= res!772241 (not (= (select (arr!36243 _keys!1208) from!1455) k0!934)))))

(declare-fun e!662555 () Bool)

(assert (=> b!1165057 e!662555))

(declare-fun c!116884 () Bool)

(assert (=> b!1165057 (= c!116884 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524844 () Unit!38391)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!668 (array!75197 array!75199 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38391)

(assert (=> b!1165057 (= lt!524844 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!772239 () Bool)

(assert (=> start!99256 (=> (not res!772239) (not e!662553))))

(assert (=> start!99256 (= res!772239 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36780 _keys!1208))))))

(assert (=> start!99256 e!662553))

(declare-fun tp_is_empty!29155 () Bool)

(assert (=> start!99256 tp_is_empty!29155))

(declare-fun array_inv!27796 (array!75197) Bool)

(assert (=> start!99256 (array_inv!27796 _keys!1208)))

(assert (=> start!99256 true))

(assert (=> start!99256 tp!86586))

(declare-fun e!662562 () Bool)

(declare-fun array_inv!27797 (array!75199) Bool)

(assert (=> start!99256 (and (array_inv!27797 _values!996) e!662562)))

(declare-fun b!1165058 () Bool)

(declare-fun e!662568 () Bool)

(assert (=> b!1165058 (= e!662562 (and e!662568 mapRes!45557))))

(declare-fun condMapEmpty!45557 () Bool)

(declare-fun mapDefault!45557 () ValueCell!13868)

(assert (=> b!1165058 (= condMapEmpty!45557 (= (arr!36244 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13868)) mapDefault!45557)))))

(declare-fun b!1165059 () Bool)

(declare-fun e!662563 () Unit!38391)

(declare-fun Unit!38393 () Unit!38391)

(assert (=> b!1165059 (= e!662563 Unit!38393)))

(declare-fun c!116882 () Bool)

(declare-fun c!116883 () Bool)

(declare-fun bm!57105 () Bool)

(assert (=> bm!57105 (= call!57113 (addStillContains!982 (ite c!116883 lt!524846 lt!524850) (ite c!116883 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116882 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116883 minValue!944 (ite c!116882 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!57107 () ListLongMap!16667)

(declare-fun bm!57106 () Bool)

(assert (=> bm!57106 (= call!57107 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1165060 () Bool)

(assert (=> b!1165060 (= e!662567 tp_is_empty!29155)))

(declare-fun b!1165061 () Bool)

(declare-fun e!662554 () Bool)

(assert (=> b!1165061 (= e!662553 e!662554)))

(declare-fun res!772247 () Bool)

(assert (=> b!1165061 (=> (not res!772247) (not e!662554))))

(declare-fun lt!524862 () array!75197)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75197 (_ BitVec 32)) Bool)

(assert (=> b!1165061 (= res!772247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524862 mask!1564))))

(assert (=> b!1165061 (= lt!524862 (array!75198 (store (arr!36243 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36780 _keys!1208)))))

(declare-fun b!1165062 () Bool)

(declare-fun res!772244 () Bool)

(assert (=> b!1165062 (=> (not res!772244) (not e!662553))))

(declare-datatypes ((List!25425 0))(
  ( (Nil!25422) (Cons!25421 (h!26639 (_ BitVec 64)) (t!37034 List!25425)) )
))
(declare-fun arrayNoDuplicates!0 (array!75197 (_ BitVec 32) List!25425) Bool)

(assert (=> b!1165062 (= res!772244 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25422))))

(declare-fun call!57109 () ListLongMap!16667)

(declare-fun lt!524863 () array!75199)

(declare-fun bm!57107 () Bool)

(assert (=> bm!57107 (= call!57109 (getCurrentListMapNoExtraKeys!4840 lt!524862 lt!524863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57108 () Bool)

(assert (=> bm!57108 (= call!57110 (+!3764 lt!524850 (ite (or c!116883 c!116882) (tuple2!18691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1165063 () Bool)

(declare-fun Unit!38394 () Unit!38391)

(assert (=> b!1165063 (= e!662569 Unit!38394)))

(declare-fun b!1165064 () Bool)

(assert (=> b!1165064 (= e!662555 (= call!57109 call!57107))))

(declare-fun b!1165065 () Bool)

(declare-fun Unit!38395 () Unit!38391)

(assert (=> b!1165065 (= e!662569 Unit!38395)))

(assert (=> b!1165065 (= lt!524854 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1165065 (= c!116883 (and (not lt!524854) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524859 () Unit!38391)

(assert (=> b!1165065 (= lt!524859 e!662561)))

(declare-fun lt!524858 () Unit!38391)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!564 (array!75197 array!75199 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 64) (_ BitVec 32) Int) Unit!38391)

(assert (=> b!1165065 (= lt!524858 (lemmaListMapContainsThenArrayContainsFrom!564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116885 () Bool)

(assert (=> b!1165065 (= c!116885 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!772245 () Bool)

(assert (=> b!1165065 (= res!772245 e!662556)))

(assert (=> b!1165065 (=> (not res!772245) (not e!662564))))

(assert (=> b!1165065 e!662564))

(declare-fun lt!524849 () Unit!38391)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75197 (_ BitVec 32) (_ BitVec 32)) Unit!38391)

(assert (=> b!1165065 (= lt!524849 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1165065 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25422)))

(declare-fun lt!524861 () Unit!38391)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75197 (_ BitVec 64) (_ BitVec 32) List!25425) Unit!38391)

(assert (=> b!1165065 (= lt!524861 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25422))))

(assert (=> b!1165065 false))

(declare-fun b!1165066 () Bool)

(assert (=> b!1165066 (= e!662555 (= call!57109 (-!1443 call!57107 k0!934)))))

(declare-fun bm!57109 () Bool)

(declare-fun call!57114 () Bool)

(assert (=> bm!57109 (= call!57114 call!57112)))

(declare-fun b!1165067 () Bool)

(declare-fun res!772242 () Bool)

(assert (=> b!1165067 (=> (not res!772242) (not e!662553))))

(assert (=> b!1165067 (= res!772242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165068 () Bool)

(declare-fun e!662557 () Bool)

(assert (=> b!1165068 (= e!662557 e!662565)))

(declare-fun res!772249 () Bool)

(assert (=> b!1165068 (=> res!772249 e!662565)))

(assert (=> b!1165068 (= res!772249 (not (= from!1455 i!673)))))

(declare-fun lt!524860 () ListLongMap!16667)

(assert (=> b!1165068 (= lt!524860 (getCurrentListMapNoExtraKeys!4840 lt!524862 lt!524863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1165068 (= lt!524863 (array!75200 (store (arr!36244 _values!996) i!673 (ValueCellFull!13868 lt!524853)) (size!36781 _values!996)))))

(declare-fun dynLambda!2830 (Int (_ BitVec 64)) V!44001)

(assert (=> b!1165068 (= lt!524853 (dynLambda!2830 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1165068 (= lt!524847 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165069 () Bool)

(assert (=> b!1165069 (= e!662554 (not e!662557))))

(declare-fun res!772243 () Bool)

(assert (=> b!1165069 (=> res!772243 e!662557)))

(assert (=> b!1165069 (= res!772243 (bvsgt from!1455 i!673))))

(assert (=> b!1165069 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524845 () Unit!38391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75197 (_ BitVec 64) (_ BitVec 32)) Unit!38391)

(assert (=> b!1165069 (= lt!524845 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165070 () Bool)

(declare-fun e!662559 () Unit!38391)

(declare-fun lt!524857 () Unit!38391)

(assert (=> b!1165070 (= e!662559 lt!524857)))

(assert (=> b!1165070 (= lt!524857 call!57111)))

(assert (=> b!1165070 call!57114))

(declare-fun b!1165071 () Bool)

(assert (=> b!1165071 (= e!662556 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1165072 () Bool)

(assert (=> b!1165072 (= e!662559 e!662563)))

(declare-fun c!116881 () Bool)

(assert (=> b!1165072 (= c!116881 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524854))))

(declare-fun bm!57110 () Bool)

(declare-fun call!57108 () ListLongMap!16667)

(assert (=> bm!57110 (= call!57108 call!57110)))

(declare-fun b!1165073 () Bool)

(declare-fun res!772250 () Bool)

(assert (=> b!1165073 (=> (not res!772250) (not e!662553))))

(assert (=> b!1165073 (= res!772250 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36780 _keys!1208))))))

(declare-fun b!1165074 () Bool)

(assert (=> b!1165074 call!57114))

(declare-fun lt!524843 () Unit!38391)

(assert (=> b!1165074 (= lt!524843 call!57111)))

(assert (=> b!1165074 (= e!662563 lt!524843)))

(declare-fun b!1165075 () Bool)

(assert (=> b!1165075 (= e!662568 tp_is_empty!29155)))

(declare-fun b!1165076 () Bool)

(declare-fun res!772251 () Bool)

(assert (=> b!1165076 (=> (not res!772251) (not e!662553))))

(assert (=> b!1165076 (= res!772251 (and (= (size!36781 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36780 _keys!1208) (size!36781 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165077 () Bool)

(assert (=> b!1165077 (= e!662558 (= lt!524852 (getCurrentListMapNoExtraKeys!4840 lt!524862 lt!524863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1165078 () Bool)

(declare-fun res!772237 () Bool)

(assert (=> b!1165078 (=> (not res!772237) (not e!662554))))

(assert (=> b!1165078 (= res!772237 (arrayNoDuplicates!0 lt!524862 #b00000000000000000000000000000000 Nil!25422))))

(declare-fun b!1165079 () Bool)

(declare-fun res!772246 () Bool)

(assert (=> b!1165079 (=> (not res!772246) (not e!662553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165079 (= res!772246 (validMask!0 mask!1564))))

(declare-fun b!1165080 () Bool)

(assert (=> b!1165080 (= c!116882 (and (not lt!524854) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1165080 (= e!662561 e!662559)))

(declare-fun bm!57111 () Bool)

(assert (=> bm!57111 (= call!57112 (contains!6865 (ite c!116883 lt!524846 call!57108) k0!934))))

(assert (= (and start!99256 res!772239) b!1165079))

(assert (= (and b!1165079 res!772246) b!1165076))

(assert (= (and b!1165076 res!772251) b!1165067))

(assert (= (and b!1165067 res!772242) b!1165062))

(assert (= (and b!1165062 res!772244) b!1165073))

(assert (= (and b!1165073 res!772250) b!1165053))

(assert (= (and b!1165053 res!772240) b!1165055))

(assert (= (and b!1165055 res!772238) b!1165061))

(assert (= (and b!1165061 res!772247) b!1165078))

(assert (= (and b!1165078 res!772237) b!1165069))

(assert (= (and b!1165069 (not res!772243)) b!1165068))

(assert (= (and b!1165068 (not res!772249)) b!1165057))

(assert (= (and b!1165057 c!116884) b!1165066))

(assert (= (and b!1165057 (not c!116884)) b!1165064))

(assert (= (or b!1165066 b!1165064) bm!57107))

(assert (= (or b!1165066 b!1165064) bm!57106))

(assert (= (and b!1165057 (not res!772241)) b!1165052))

(assert (= (and b!1165052 c!116886) b!1165065))

(assert (= (and b!1165052 (not c!116886)) b!1165063))

(assert (= (and b!1165065 c!116883) b!1165054))

(assert (= (and b!1165065 (not c!116883)) b!1165080))

(assert (= (and b!1165080 c!116882) b!1165070))

(assert (= (and b!1165080 (not c!116882)) b!1165072))

(assert (= (and b!1165072 c!116881) b!1165074))

(assert (= (and b!1165072 (not c!116881)) b!1165059))

(assert (= (or b!1165070 b!1165074) bm!57104))

(assert (= (or b!1165070 b!1165074) bm!57110))

(assert (= (or b!1165070 b!1165074) bm!57109))

(assert (= (or b!1165054 bm!57109) bm!57111))

(assert (= (or b!1165054 bm!57104) bm!57105))

(assert (= (or b!1165054 bm!57110) bm!57108))

(assert (= (and b!1165065 c!116885) b!1165071))

(assert (= (and b!1165065 (not c!116885)) b!1165056))

(assert (= (and b!1165065 res!772245) b!1165051))

(assert (= (and b!1165052 res!772248) b!1165077))

(assert (= (and b!1165058 condMapEmpty!45557) mapIsEmpty!45557))

(assert (= (and b!1165058 (not condMapEmpty!45557)) mapNonEmpty!45557))

(get-info :version)

(assert (= (and mapNonEmpty!45557 ((_ is ValueCellFull!13868) mapValue!45557)) b!1165060))

(assert (= (and b!1165058 ((_ is ValueCellFull!13868) mapDefault!45557)) b!1165075))

(assert (= start!99256 b!1165058))

(declare-fun b_lambda!19725 () Bool)

(assert (=> (not b_lambda!19725) (not b!1165068)))

(declare-fun t!37032 () Bool)

(declare-fun tb!9429 () Bool)

(assert (=> (and start!99256 (= defaultEntry!1004 defaultEntry!1004) t!37032) tb!9429))

(declare-fun result!19431 () Bool)

(assert (=> tb!9429 (= result!19431 tp_is_empty!29155)))

(assert (=> b!1165068 t!37032))

(declare-fun b_and!40103 () Bool)

(assert (= b_and!40101 (and (=> t!37032 result!19431) b_and!40103)))

(declare-fun m!1073861 () Bool)

(assert (=> b!1165061 m!1073861))

(declare-fun m!1073863 () Bool)

(assert (=> b!1165061 m!1073863))

(declare-fun m!1073865 () Bool)

(assert (=> bm!57106 m!1073865))

(declare-fun m!1073867 () Bool)

(assert (=> b!1165071 m!1073867))

(declare-fun m!1073869 () Bool)

(assert (=> b!1165053 m!1073869))

(declare-fun m!1073871 () Bool)

(assert (=> mapNonEmpty!45557 m!1073871))

(declare-fun m!1073873 () Bool)

(assert (=> b!1165054 m!1073873))

(assert (=> b!1165054 m!1073873))

(declare-fun m!1073875 () Bool)

(assert (=> b!1165054 m!1073875))

(declare-fun m!1073877 () Bool)

(assert (=> b!1165054 m!1073877))

(declare-fun m!1073879 () Bool)

(assert (=> b!1165065 m!1073879))

(declare-fun m!1073881 () Bool)

(assert (=> b!1165065 m!1073881))

(declare-fun m!1073883 () Bool)

(assert (=> b!1165065 m!1073883))

(declare-fun m!1073885 () Bool)

(assert (=> b!1165065 m!1073885))

(declare-fun m!1073887 () Bool)

(assert (=> b!1165057 m!1073887))

(declare-fun m!1073889 () Bool)

(assert (=> b!1165057 m!1073889))

(declare-fun m!1073891 () Bool)

(assert (=> bm!57108 m!1073891))

(declare-fun m!1073893 () Bool)

(assert (=> b!1165062 m!1073893))

(declare-fun m!1073895 () Bool)

(assert (=> b!1165055 m!1073895))

(declare-fun m!1073897 () Bool)

(assert (=> b!1165079 m!1073897))

(declare-fun m!1073899 () Bool)

(assert (=> b!1165068 m!1073899))

(declare-fun m!1073901 () Bool)

(assert (=> b!1165068 m!1073901))

(declare-fun m!1073903 () Bool)

(assert (=> b!1165068 m!1073903))

(declare-fun m!1073905 () Bool)

(assert (=> b!1165068 m!1073905))

(declare-fun m!1073907 () Bool)

(assert (=> b!1165078 m!1073907))

(declare-fun m!1073909 () Bool)

(assert (=> start!99256 m!1073909))

(declare-fun m!1073911 () Bool)

(assert (=> start!99256 m!1073911))

(declare-fun m!1073913 () Bool)

(assert (=> b!1165069 m!1073913))

(declare-fun m!1073915 () Bool)

(assert (=> b!1165069 m!1073915))

(declare-fun m!1073917 () Bool)

(assert (=> bm!57111 m!1073917))

(assert (=> b!1165051 m!1073867))

(assert (=> b!1165052 m!1073865))

(assert (=> b!1165052 m!1073887))

(declare-fun m!1073919 () Bool)

(assert (=> b!1165052 m!1073919))

(declare-fun m!1073921 () Bool)

(assert (=> b!1165052 m!1073921))

(declare-fun m!1073923 () Bool)

(assert (=> b!1165052 m!1073923))

(declare-fun m!1073925 () Bool)

(assert (=> b!1165052 m!1073925))

(assert (=> b!1165052 m!1073887))

(declare-fun m!1073927 () Bool)

(assert (=> b!1165052 m!1073927))

(declare-fun m!1073929 () Bool)

(assert (=> b!1165052 m!1073929))

(assert (=> b!1165052 m!1073927))

(assert (=> b!1165052 m!1073921))

(assert (=> b!1165052 m!1073887))

(declare-fun m!1073931 () Bool)

(assert (=> b!1165052 m!1073931))

(declare-fun m!1073933 () Bool)

(assert (=> b!1165067 m!1073933))

(declare-fun m!1073935 () Bool)

(assert (=> bm!57105 m!1073935))

(declare-fun m!1073937 () Bool)

(assert (=> b!1165077 m!1073937))

(assert (=> bm!57107 m!1073937))

(declare-fun m!1073939 () Bool)

(assert (=> b!1165066 m!1073939))

(check-sat (not start!99256) (not b_next!24625) (not bm!57105) (not b!1165069) (not b!1165053) (not bm!57107) (not b!1165061) (not b!1165071) (not b_lambda!19725) (not b!1165062) (not b!1165051) (not b!1165079) (not mapNonEmpty!45557) (not b!1165077) (not bm!57108) (not bm!57111) tp_is_empty!29155 (not b!1165067) (not b!1165052) (not b!1165065) (not b!1165057) (not b!1165068) b_and!40103 (not b!1165066) (not bm!57106) (not b!1165054) (not b!1165078))
(check-sat b_and!40103 (not b_next!24625))
