; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101008 () Bool)

(assert start!101008)

(declare-fun b_free!26007 () Bool)

(declare-fun b_next!26007 () Bool)

(assert (=> start!101008 (= b_free!26007 (not b_next!26007))))

(declare-fun tp!91037 () Bool)

(declare-fun b_and!43095 () Bool)

(assert (=> start!101008 (= tp!91037 b_and!43095)))

(declare-datatypes ((array!78207 0))(
  ( (array!78208 (arr!37740 (Array (_ BitVec 32) (_ BitVec 64))) (size!38276 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78207)

(declare-fun e!687224 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1210036 () Bool)

(declare-fun arrayContainsKey!0 (array!78207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210036 (= e!687224 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210037 () Bool)

(declare-fun e!687220 () Bool)

(declare-fun e!687218 () Bool)

(assert (=> b!1210037 (= e!687220 e!687218)))

(declare-fun res!804128 () Bool)

(assert (=> b!1210037 (=> (not res!804128) (not e!687218))))

(declare-fun lt!549332 () array!78207)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78207 (_ BitVec 32)) Bool)

(assert (=> b!1210037 (= res!804128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549332 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210037 (= lt!549332 (array!78208 (store (arr!37740 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38276 _keys!1208)))))

(declare-fun b!1210038 () Bool)

(declare-datatypes ((Unit!40104 0))(
  ( (Unit!40105) )
))
(declare-fun e!687222 () Unit!40104)

(declare-fun Unit!40106 () Unit!40104)

(assert (=> b!1210038 (= e!687222 Unit!40106)))

(declare-fun b!1210039 () Bool)

(declare-fun res!804121 () Bool)

(assert (=> b!1210039 (=> (not res!804121) (not e!687220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210039 (= res!804121 (validKeyInArray!0 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1210040 () Bool)

(declare-fun lt!549331 () Bool)

(declare-fun e!687216 () Bool)

(assert (=> b!1210040 (= e!687216 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549331) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!47935 () Bool)

(declare-fun mapRes!47935 () Bool)

(declare-fun tp!91036 () Bool)

(declare-fun e!687225 () Bool)

(assert (=> mapNonEmpty!47935 (= mapRes!47935 (and tp!91036 e!687225))))

(declare-fun mapKey!47935 () (_ BitVec 32))

(declare-datatypes ((V!46075 0))(
  ( (V!46076 (val!15412 Int)) )
))
(declare-datatypes ((ValueCell!14646 0))(
  ( (ValueCellFull!14646 (v!18063 V!46075)) (EmptyCell!14646) )
))
(declare-fun mapValue!47935 () ValueCell!14646)

(declare-fun mapRest!47935 () (Array (_ BitVec 32) ValueCell!14646))

(declare-datatypes ((array!78209 0))(
  ( (array!78210 (arr!37741 (Array (_ BitVec 32) ValueCell!14646)) (size!38277 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78209)

(assert (=> mapNonEmpty!47935 (= (arr!37741 _values!996) (store mapRest!47935 mapKey!47935 mapValue!47935))))

(declare-fun b!1210041 () Bool)

(declare-fun e!687226 () Bool)

(declare-fun tp_is_empty!30711 () Bool)

(assert (=> b!1210041 (= e!687226 tp_is_empty!30711)))

(declare-datatypes ((tuple2!19790 0))(
  ( (tuple2!19791 (_1!9906 (_ BitVec 64)) (_2!9906 V!46075)) )
))
(declare-datatypes ((List!26591 0))(
  ( (Nil!26588) (Cons!26587 (h!27796 tuple2!19790) (t!39578 List!26591)) )
))
(declare-datatypes ((ListLongMap!17759 0))(
  ( (ListLongMap!17760 (toList!8895 List!26591)) )
))
(declare-fun call!59526 () ListLongMap!17759)

(declare-fun call!59529 () Bool)

(declare-fun bm!59522 () Bool)

(declare-fun c!119176 () Bool)

(declare-fun lt!549337 () ListLongMap!17759)

(declare-fun contains!6966 (ListLongMap!17759 (_ BitVec 64)) Bool)

(assert (=> bm!59522 (= call!59529 (contains!6966 (ite c!119176 lt!549337 call!59526) k0!934))))

(declare-fun zeroValue!944 () V!46075)

(declare-fun lt!549334 () ListLongMap!17759)

(declare-fun bm!59523 () Bool)

(declare-fun c!119178 () Bool)

(declare-fun call!59530 () ListLongMap!17759)

(declare-fun minValue!944 () V!46075)

(declare-fun +!4013 (ListLongMap!17759 tuple2!19790) ListLongMap!17759)

(assert (=> bm!59523 (= call!59530 (+!4013 (ite c!119176 lt!549337 lt!549334) (ite c!119176 (tuple2!19791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119178 (tuple2!19791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!804126 () Bool)

(assert (=> start!101008 (=> (not res!804126) (not e!687220))))

(assert (=> start!101008 (= res!804126 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38276 _keys!1208))))))

(assert (=> start!101008 e!687220))

(assert (=> start!101008 tp_is_empty!30711))

(declare-fun array_inv!28748 (array!78207) Bool)

(assert (=> start!101008 (array_inv!28748 _keys!1208)))

(assert (=> start!101008 true))

(assert (=> start!101008 tp!91037))

(declare-fun e!687215 () Bool)

(declare-fun array_inv!28749 (array!78209) Bool)

(assert (=> start!101008 (and (array_inv!28749 _values!996) e!687215)))

(declare-fun b!1210042 () Bool)

(declare-fun res!804127 () Bool)

(assert (=> b!1210042 (=> (not res!804127) (not e!687220))))

(assert (=> b!1210042 (= res!804127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210043 () Bool)

(declare-fun res!804119 () Bool)

(assert (=> b!1210043 (=> (not res!804119) (not e!687220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210043 (= res!804119 (validMask!0 mask!1564))))

(declare-fun b!1210044 () Bool)

(declare-fun res!804125 () Bool)

(assert (=> b!1210044 (=> (not res!804125) (not e!687220))))

(assert (=> b!1210044 (= res!804125 (= (select (arr!37740 _keys!1208) i!673) k0!934))))

(declare-fun b!1210045 () Bool)

(assert (=> b!1210045 (= e!687215 (and e!687226 mapRes!47935))))

(declare-fun condMapEmpty!47935 () Bool)

(declare-fun mapDefault!47935 () ValueCell!14646)

(assert (=> b!1210045 (= condMapEmpty!47935 (= (arr!37741 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14646)) mapDefault!47935)))))

(declare-fun b!1210046 () Bool)

(declare-fun e!687221 () Bool)

(assert (=> b!1210046 (= e!687218 (not e!687221))))

(declare-fun res!804129 () Bool)

(assert (=> b!1210046 (=> res!804129 e!687221)))

(assert (=> b!1210046 (= res!804129 (bvsgt from!1455 i!673))))

(assert (=> b!1210046 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549338 () Unit!40104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78207 (_ BitVec 64) (_ BitVec 32)) Unit!40104)

(assert (=> b!1210046 (= lt!549338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59524 () Bool)

(declare-fun call!59528 () Unit!40104)

(declare-fun call!59525 () Unit!40104)

(assert (=> bm!59524 (= call!59528 call!59525)))

(declare-fun b!1210047 () Bool)

(declare-fun e!687230 () Unit!40104)

(declare-fun Unit!40107 () Unit!40104)

(assert (=> b!1210047 (= e!687230 Unit!40107)))

(assert (=> b!1210047 (= lt!549331 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210047 (= c!119176 (and (not lt!549331) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549335 () Unit!40104)

(declare-fun e!687219 () Unit!40104)

(assert (=> b!1210047 (= lt!549335 e!687219)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!549336 () Unit!40104)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!593 (array!78207 array!78209 (_ BitVec 32) (_ BitVec 32) V!46075 V!46075 (_ BitVec 64) (_ BitVec 32) Int) Unit!40104)

(assert (=> b!1210047 (= lt!549336 (lemmaListMapContainsThenArrayContainsFrom!593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119179 () Bool)

(assert (=> b!1210047 (= c!119179 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804123 () Bool)

(assert (=> b!1210047 (= res!804123 e!687216)))

(assert (=> b!1210047 (=> (not res!804123) (not e!687224))))

(assert (=> b!1210047 e!687224))

(declare-fun lt!549340 () Unit!40104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78207 (_ BitVec 32) (_ BitVec 32)) Unit!40104)

(assert (=> b!1210047 (= lt!549340 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26592 0))(
  ( (Nil!26589) (Cons!26588 (h!27797 (_ BitVec 64)) (t!39579 List!26592)) )
))
(declare-fun arrayNoDuplicates!0 (array!78207 (_ BitVec 32) List!26592) Bool)

(assert (=> b!1210047 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26589)))

(declare-fun lt!549329 () Unit!40104)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78207 (_ BitVec 64) (_ BitVec 32) List!26592) Unit!40104)

(assert (=> b!1210047 (= lt!549329 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26589))))

(assert (=> b!1210047 false))

(declare-fun b!1210048 () Bool)

(assert (=> b!1210048 (contains!6966 call!59530 k0!934)))

(declare-fun lt!549328 () Unit!40104)

(assert (=> b!1210048 (= lt!549328 call!59525)))

(assert (=> b!1210048 call!59529))

(assert (=> b!1210048 (= lt!549337 (+!4013 lt!549334 (tuple2!19791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549339 () Unit!40104)

(declare-fun addStillContains!1041 (ListLongMap!17759 (_ BitVec 64) V!46075 (_ BitVec 64)) Unit!40104)

(assert (=> b!1210048 (= lt!549339 (addStillContains!1041 lt!549334 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210048 (= e!687219 lt!549328)))

(declare-fun b!1210049 () Bool)

(declare-fun e!687228 () Bool)

(assert (=> b!1210049 (= e!687221 e!687228)))

(declare-fun res!804124 () Bool)

(assert (=> b!1210049 (=> res!804124 e!687228)))

(assert (=> b!1210049 (= res!804124 (not (= from!1455 i!673)))))

(declare-fun lt!549342 () ListLongMap!17759)

(declare-fun lt!549326 () array!78209)

(declare-fun getCurrentListMapNoExtraKeys!5328 (array!78207 array!78209 (_ BitVec 32) (_ BitVec 32) V!46075 V!46075 (_ BitVec 32) Int) ListLongMap!17759)

(assert (=> b!1210049 (= lt!549342 (getCurrentListMapNoExtraKeys!5328 lt!549332 lt!549326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3226 (Int (_ BitVec 64)) V!46075)

(assert (=> b!1210049 (= lt!549326 (array!78210 (store (arr!37741 _values!996) i!673 (ValueCellFull!14646 (dynLambda!3226 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38277 _values!996)))))

(declare-fun lt!549343 () ListLongMap!17759)

(assert (=> b!1210049 (= lt!549343 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59525 () Bool)

(assert (=> bm!59525 (= call!59525 (addStillContains!1041 (ite c!119176 lt!549337 lt!549334) (ite c!119176 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119176 minValue!944 (ite c!119178 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1210050 () Bool)

(declare-fun res!804130 () Bool)

(assert (=> b!1210050 (=> (not res!804130) (not e!687220))))

(assert (=> b!1210050 (= res!804130 (and (= (size!38277 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38276 _keys!1208) (size!38277 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210051 () Bool)

(declare-fun e!687217 () Bool)

(assert (=> b!1210051 (= e!687228 e!687217)))

(declare-fun res!804120 () Bool)

(assert (=> b!1210051 (=> res!804120 e!687217)))

(assert (=> b!1210051 (= res!804120 (not (= (select (arr!37740 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687227 () Bool)

(assert (=> b!1210051 e!687227))

(declare-fun c!119177 () Bool)

(assert (=> b!1210051 (= c!119177 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549341 () Unit!40104)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1056 (array!78207 array!78209 (_ BitVec 32) (_ BitVec 32) V!46075 V!46075 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40104)

(assert (=> b!1210051 (= lt!549341 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1056 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59526 () Bool)

(declare-fun call!59532 () ListLongMap!17759)

(assert (=> bm!59526 (= call!59532 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210052 () Bool)

(assert (=> b!1210052 (= e!687216 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59527 () Bool)

(declare-fun call!59527 () Bool)

(assert (=> bm!59527 (= call!59527 call!59529)))

(declare-fun call!59531 () ListLongMap!17759)

(declare-fun b!1210053 () Bool)

(declare-fun -!1845 (ListLongMap!17759 (_ BitVec 64)) ListLongMap!17759)

(assert (=> b!1210053 (= e!687227 (= call!59531 (-!1845 call!59532 k0!934)))))

(declare-fun b!1210054 () Bool)

(assert (=> b!1210054 (= e!687225 tp_is_empty!30711)))

(declare-fun b!1210055 () Bool)

(declare-fun res!804122 () Bool)

(assert (=> b!1210055 (=> (not res!804122) (not e!687220))))

(assert (=> b!1210055 (= res!804122 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38276 _keys!1208))))))

(declare-fun mapIsEmpty!47935 () Bool)

(assert (=> mapIsEmpty!47935 mapRes!47935))

(declare-fun b!1210056 () Bool)

(declare-fun res!804131 () Bool)

(assert (=> b!1210056 (=> (not res!804131) (not e!687218))))

(assert (=> b!1210056 (= res!804131 (arrayNoDuplicates!0 lt!549332 #b00000000000000000000000000000000 Nil!26589))))

(declare-fun bm!59528 () Bool)

(assert (=> bm!59528 (= call!59531 (getCurrentListMapNoExtraKeys!5328 lt!549332 lt!549326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210057 () Bool)

(assert (=> b!1210057 (= c!119178 (and (not lt!549331) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687229 () Unit!40104)

(assert (=> b!1210057 (= e!687219 e!687229)))

(declare-fun b!1210058 () Bool)

(declare-fun lt!549330 () Unit!40104)

(assert (=> b!1210058 (= e!687229 lt!549330)))

(assert (=> b!1210058 (= lt!549330 call!59528)))

(assert (=> b!1210058 call!59527))

(declare-fun bm!59529 () Bool)

(assert (=> bm!59529 (= call!59526 call!59530)))

(declare-fun b!1210059 () Bool)

(declare-fun Unit!40108 () Unit!40104)

(assert (=> b!1210059 (= e!687230 Unit!40108)))

(declare-fun b!1210060 () Bool)

(declare-fun res!804132 () Bool)

(assert (=> b!1210060 (=> (not res!804132) (not e!687220))))

(assert (=> b!1210060 (= res!804132 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26589))))

(declare-fun b!1210061 () Bool)

(assert (=> b!1210061 (= e!687229 e!687222)))

(declare-fun c!119180 () Bool)

(assert (=> b!1210061 (= c!119180 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549331))))

(declare-fun b!1210062 () Bool)

(assert (=> b!1210062 (= e!687227 (= call!59531 call!59532))))

(declare-fun b!1210063 () Bool)

(assert (=> b!1210063 call!59527))

(declare-fun lt!549327 () Unit!40104)

(assert (=> b!1210063 (= lt!549327 call!59528)))

(assert (=> b!1210063 (= e!687222 lt!549327)))

(declare-fun b!1210064 () Bool)

(assert (=> b!1210064 (= e!687217 (bvslt from!1455 (size!38276 _keys!1208)))))

(declare-fun lt!549333 () Unit!40104)

(assert (=> b!1210064 (= lt!549333 e!687230)))

(declare-fun c!119175 () Bool)

(assert (=> b!1210064 (= c!119175 (contains!6966 lt!549334 k0!934))))

(assert (=> b!1210064 (= lt!549334 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101008 res!804126) b!1210043))

(assert (= (and b!1210043 res!804119) b!1210050))

(assert (= (and b!1210050 res!804130) b!1210042))

(assert (= (and b!1210042 res!804127) b!1210060))

(assert (= (and b!1210060 res!804132) b!1210055))

(assert (= (and b!1210055 res!804122) b!1210039))

(assert (= (and b!1210039 res!804121) b!1210044))

(assert (= (and b!1210044 res!804125) b!1210037))

(assert (= (and b!1210037 res!804128) b!1210056))

(assert (= (and b!1210056 res!804131) b!1210046))

(assert (= (and b!1210046 (not res!804129)) b!1210049))

(assert (= (and b!1210049 (not res!804124)) b!1210051))

(assert (= (and b!1210051 c!119177) b!1210053))

(assert (= (and b!1210051 (not c!119177)) b!1210062))

(assert (= (or b!1210053 b!1210062) bm!59528))

(assert (= (or b!1210053 b!1210062) bm!59526))

(assert (= (and b!1210051 (not res!804120)) b!1210064))

(assert (= (and b!1210064 c!119175) b!1210047))

(assert (= (and b!1210064 (not c!119175)) b!1210059))

(assert (= (and b!1210047 c!119176) b!1210048))

(assert (= (and b!1210047 (not c!119176)) b!1210057))

(assert (= (and b!1210057 c!119178) b!1210058))

(assert (= (and b!1210057 (not c!119178)) b!1210061))

(assert (= (and b!1210061 c!119180) b!1210063))

(assert (= (and b!1210061 (not c!119180)) b!1210038))

(assert (= (or b!1210058 b!1210063) bm!59524))

(assert (= (or b!1210058 b!1210063) bm!59529))

(assert (= (or b!1210058 b!1210063) bm!59527))

(assert (= (or b!1210048 bm!59527) bm!59522))

(assert (= (or b!1210048 bm!59524) bm!59525))

(assert (= (or b!1210048 bm!59529) bm!59523))

(assert (= (and b!1210047 c!119179) b!1210052))

(assert (= (and b!1210047 (not c!119179)) b!1210040))

(assert (= (and b!1210047 res!804123) b!1210036))

(assert (= (and b!1210045 condMapEmpty!47935) mapIsEmpty!47935))

(assert (= (and b!1210045 (not condMapEmpty!47935)) mapNonEmpty!47935))

(get-info :version)

(assert (= (and mapNonEmpty!47935 ((_ is ValueCellFull!14646) mapValue!47935)) b!1210054))

(assert (= (and b!1210045 ((_ is ValueCellFull!14646) mapDefault!47935)) b!1210041))

(assert (= start!101008 b!1210045))

(declare-fun b_lambda!21607 () Bool)

(assert (=> (not b_lambda!21607) (not b!1210049)))

(declare-fun t!39577 () Bool)

(declare-fun tb!10807 () Bool)

(assert (=> (and start!101008 (= defaultEntry!1004 defaultEntry!1004) t!39577) tb!10807))

(declare-fun result!22207 () Bool)

(assert (=> tb!10807 (= result!22207 tp_is_empty!30711)))

(assert (=> b!1210049 t!39577))

(declare-fun b_and!43097 () Bool)

(assert (= b_and!43095 (and (=> t!39577 result!22207) b_and!43097)))

(declare-fun m!1115631 () Bool)

(assert (=> bm!59522 m!1115631))

(declare-fun m!1115633 () Bool)

(assert (=> b!1210036 m!1115633))

(declare-fun m!1115635 () Bool)

(assert (=> start!101008 m!1115635))

(declare-fun m!1115637 () Bool)

(assert (=> start!101008 m!1115637))

(declare-fun m!1115639 () Bool)

(assert (=> bm!59525 m!1115639))

(declare-fun m!1115641 () Bool)

(assert (=> b!1210053 m!1115641))

(declare-fun m!1115643 () Bool)

(assert (=> mapNonEmpty!47935 m!1115643))

(declare-fun m!1115645 () Bool)

(assert (=> bm!59523 m!1115645))

(assert (=> b!1210052 m!1115633))

(declare-fun m!1115647 () Bool)

(assert (=> b!1210039 m!1115647))

(declare-fun m!1115649 () Bool)

(assert (=> bm!59528 m!1115649))

(declare-fun m!1115651 () Bool)

(assert (=> b!1210064 m!1115651))

(declare-fun m!1115653 () Bool)

(assert (=> b!1210064 m!1115653))

(declare-fun m!1115655 () Bool)

(assert (=> b!1210047 m!1115655))

(declare-fun m!1115657 () Bool)

(assert (=> b!1210047 m!1115657))

(declare-fun m!1115659 () Bool)

(assert (=> b!1210047 m!1115659))

(declare-fun m!1115661 () Bool)

(assert (=> b!1210047 m!1115661))

(declare-fun m!1115663 () Bool)

(assert (=> b!1210046 m!1115663))

(declare-fun m!1115665 () Bool)

(assert (=> b!1210046 m!1115665))

(declare-fun m!1115667 () Bool)

(assert (=> b!1210044 m!1115667))

(declare-fun m!1115669 () Bool)

(assert (=> b!1210051 m!1115669))

(declare-fun m!1115671 () Bool)

(assert (=> b!1210051 m!1115671))

(declare-fun m!1115673 () Bool)

(assert (=> b!1210049 m!1115673))

(declare-fun m!1115675 () Bool)

(assert (=> b!1210049 m!1115675))

(declare-fun m!1115677 () Bool)

(assert (=> b!1210049 m!1115677))

(declare-fun m!1115679 () Bool)

(assert (=> b!1210049 m!1115679))

(declare-fun m!1115681 () Bool)

(assert (=> b!1210037 m!1115681))

(declare-fun m!1115683 () Bool)

(assert (=> b!1210037 m!1115683))

(assert (=> bm!59526 m!1115653))

(declare-fun m!1115685 () Bool)

(assert (=> b!1210048 m!1115685))

(declare-fun m!1115687 () Bool)

(assert (=> b!1210048 m!1115687))

(declare-fun m!1115689 () Bool)

(assert (=> b!1210048 m!1115689))

(declare-fun m!1115691 () Bool)

(assert (=> b!1210060 m!1115691))

(declare-fun m!1115693 () Bool)

(assert (=> b!1210043 m!1115693))

(declare-fun m!1115695 () Bool)

(assert (=> b!1210056 m!1115695))

(declare-fun m!1115697 () Bool)

(assert (=> b!1210042 m!1115697))

(check-sat (not b!1210037) (not b!1210048) (not b!1210046) (not bm!59526) (not b!1210036) (not bm!59528) (not b!1210052) (not b!1210051) (not b!1210047) tp_is_empty!30711 (not mapNonEmpty!47935) (not b!1210039) (not b!1210060) (not bm!59523) (not b!1210043) (not bm!59525) (not start!101008) (not b_lambda!21607) (not b!1210064) (not b_next!26007) (not b!1210056) (not bm!59522) (not b!1210053) b_and!43097 (not b!1210042) (not b!1210049))
(check-sat b_and!43097 (not b_next!26007))
