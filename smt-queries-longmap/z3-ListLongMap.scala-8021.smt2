; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99202 () Bool)

(assert start!99202)

(declare-fun b_free!24571 () Bool)

(declare-fun b_next!24571 () Bool)

(assert (=> start!99202 (= b_free!24571 (not b_next!24571))))

(declare-fun tp!86423 () Bool)

(declare-fun b_and!39993 () Bool)

(assert (=> start!99202 (= tp!86423 b_and!39993)))

(declare-datatypes ((V!43929 0))(
  ( (V!43930 (val!14607 Int)) )
))
(declare-fun zeroValue!944 () V!43929)

(declare-fun bm!56456 () Bool)

(declare-datatypes ((Unit!38282 0))(
  ( (Unit!38283) )
))
(declare-fun call!56463 () Unit!38282)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!18638 0))(
  ( (tuple2!18639 (_1!9330 (_ BitVec 64)) (_2!9330 V!43929)) )
))
(declare-datatypes ((List!25374 0))(
  ( (Nil!25371) (Cons!25370 (h!26588 tuple2!18638) (t!36929 List!25374)) )
))
(declare-datatypes ((ListLongMap!16615 0))(
  ( (ListLongMap!16616 (toList!8323 List!25374)) )
))
(declare-fun lt!523081 () ListLongMap!16615)

(declare-fun c!116398 () Bool)

(declare-fun c!116396 () Bool)

(declare-fun minValue!944 () V!43929)

(declare-fun addStillContains!959 (ListLongMap!16615 (_ BitVec 64) V!43929 (_ BitVec 64)) Unit!38282)

(assert (=> bm!56456 (= call!56463 (addStillContains!959 lt!523081 (ite (or c!116396 c!116398) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116396 c!116398) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162567 () Bool)

(declare-fun res!771031 () Bool)

(declare-fun e!661183 () Bool)

(assert (=> b!1162567 (=> (not res!771031) (not e!661183))))

(declare-datatypes ((array!75091 0))(
  ( (array!75092 (arr!36190 (Array (_ BitVec 32) (_ BitVec 64))) (size!36727 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75091)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75091 (_ BitVec 32)) Bool)

(assert (=> b!1162567 (= res!771031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162568 () Bool)

(declare-fun e!661180 () Unit!38282)

(declare-fun lt!523068 () Unit!38282)

(assert (=> b!1162568 (= e!661180 lt!523068)))

(declare-fun call!56465 () Unit!38282)

(assert (=> b!1162568 (= lt!523068 call!56465)))

(declare-fun call!56461 () Bool)

(assert (=> b!1162568 call!56461))

(declare-fun b!1162569 () Bool)

(declare-fun res!771028 () Bool)

(assert (=> b!1162569 (=> (not res!771028) (not e!661183))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162569 (= res!771028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36727 _keys!1208))))))

(declare-fun b!1162570 () Bool)

(declare-fun e!661191 () Bool)

(declare-fun e!661190 () Bool)

(assert (=> b!1162570 (= e!661191 e!661190)))

(declare-fun res!771024 () Bool)

(assert (=> b!1162570 (=> res!771024 e!661190)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1162570 (= res!771024 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13841 0))(
  ( (ValueCellFull!13841 (v!17240 V!43929)) (EmptyCell!13841) )
))
(declare-datatypes ((array!75093 0))(
  ( (array!75094 (arr!36191 (Array (_ BitVec 32) ValueCell!13841)) (size!36728 (_ BitVec 32))) )
))
(declare-fun lt!523073 () array!75093)

(declare-fun lt!523075 () ListLongMap!16615)

(declare-fun lt!523079 () array!75091)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4815 (array!75091 array!75093 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 32) Int) ListLongMap!16615)

(assert (=> b!1162570 (= lt!523075 (getCurrentListMapNoExtraKeys!4815 lt!523079 lt!523073 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523080 () V!43929)

(declare-fun _values!996 () array!75093)

(assert (=> b!1162570 (= lt!523073 (array!75094 (store (arr!36191 _values!996) i!673 (ValueCellFull!13841 lt!523080)) (size!36728 _values!996)))))

(declare-fun dynLambda!2812 (Int (_ BitVec 64)) V!43929)

(assert (=> b!1162570 (= lt!523080 (dynLambda!2812 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523069 () ListLongMap!16615)

(assert (=> b!1162570 (= lt!523069 (getCurrentListMapNoExtraKeys!4815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523074 () ListLongMap!16615)

(declare-fun b!1162571 () Bool)

(declare-fun e!661181 () Bool)

(assert (=> b!1162571 (= e!661181 (= lt!523074 (getCurrentListMapNoExtraKeys!4815 lt!523079 lt!523073 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162572 () Bool)

(declare-fun e!661179 () Bool)

(assert (=> b!1162572 (= e!661190 e!661179)))

(declare-fun res!771025 () Bool)

(assert (=> b!1162572 (=> res!771025 e!661179)))

(assert (=> b!1162572 (= res!771025 (not (= (select (arr!36190 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661189 () Bool)

(assert (=> b!1162572 e!661189))

(declare-fun c!116395 () Bool)

(assert (=> b!1162572 (= c!116395 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523070 () Unit!38282)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!648 (array!75091 array!75093 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38282)

(assert (=> b!1162572 (= lt!523070 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!648 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162573 () Bool)

(declare-fun res!771023 () Bool)

(assert (=> b!1162573 (=> (not res!771023) (not e!661183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162573 (= res!771023 (validMask!0 mask!1564))))

(declare-fun call!56460 () ListLongMap!16615)

(declare-fun b!1162574 () Bool)

(declare-fun call!56464 () ListLongMap!16615)

(declare-fun -!1419 (ListLongMap!16615 (_ BitVec 64)) ListLongMap!16615)

(assert (=> b!1162574 (= e!661189 (= call!56464 (-!1419 call!56460 k0!934)))))

(declare-fun mapIsEmpty!45476 () Bool)

(declare-fun mapRes!45476 () Bool)

(assert (=> mapIsEmpty!45476 mapRes!45476))

(declare-fun bm!56457 () Bool)

(assert (=> bm!56457 (= call!56465 call!56463)))

(declare-fun e!661186 () Bool)

(declare-fun b!1162575 () Bool)

(declare-fun arrayContainsKey!0 (array!75091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162575 (= e!661186 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162576 () Bool)

(declare-fun lt!523062 () Bool)

(assert (=> b!1162576 (= c!116398 (and (not lt!523062) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661192 () Unit!38282)

(assert (=> b!1162576 (= e!661192 e!661180)))

(declare-fun b!1162577 () Bool)

(declare-fun res!771026 () Bool)

(assert (=> b!1162577 (=> (not res!771026) (not e!661183))))

(declare-datatypes ((List!25375 0))(
  ( (Nil!25372) (Cons!25371 (h!26589 (_ BitVec 64)) (t!36930 List!25375)) )
))
(declare-fun arrayNoDuplicates!0 (array!75091 (_ BitVec 32) List!25375) Bool)

(assert (=> b!1162577 (= res!771026 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25372))))

(declare-fun b!1162578 () Bool)

(declare-fun e!661185 () Unit!38282)

(declare-fun Unit!38284 () Unit!38282)

(assert (=> b!1162578 (= e!661185 Unit!38284)))

(declare-fun b!1162579 () Bool)

(declare-fun Unit!38285 () Unit!38282)

(assert (=> b!1162579 (= e!661185 Unit!38285)))

(assert (=> b!1162579 (= lt!523062 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162579 (= c!116396 (and (not lt!523062) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523064 () Unit!38282)

(assert (=> b!1162579 (= lt!523064 e!661192)))

(declare-fun lt!523072 () Unit!38282)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!544 (array!75091 array!75093 (_ BitVec 32) (_ BitVec 32) V!43929 V!43929 (_ BitVec 64) (_ BitVec 32) Int) Unit!38282)

(assert (=> b!1162579 (= lt!523072 (lemmaListMapContainsThenArrayContainsFrom!544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116397 () Bool)

(assert (=> b!1162579 (= c!116397 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771027 () Bool)

(assert (=> b!1162579 (= res!771027 e!661186)))

(declare-fun e!661177 () Bool)

(assert (=> b!1162579 (=> (not res!771027) (not e!661177))))

(assert (=> b!1162579 e!661177))

(declare-fun lt!523077 () Unit!38282)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75091 (_ BitVec 32) (_ BitVec 32)) Unit!38282)

(assert (=> b!1162579 (= lt!523077 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162579 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25372)))

(declare-fun lt!523063 () Unit!38282)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75091 (_ BitVec 64) (_ BitVec 32) List!25375) Unit!38282)

(assert (=> b!1162579 (= lt!523063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25372))))

(assert (=> b!1162579 false))

(declare-fun b!1162580 () Bool)

(declare-fun e!661184 () Bool)

(assert (=> b!1162580 (= e!661183 e!661184)))

(declare-fun res!771032 () Bool)

(assert (=> b!1162580 (=> (not res!771032) (not e!661184))))

(assert (=> b!1162580 (= res!771032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523079 mask!1564))))

(assert (=> b!1162580 (= lt!523079 (array!75092 (store (arr!36190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36727 _keys!1208)))))

(declare-fun b!1162581 () Bool)

(declare-fun e!661182 () Unit!38282)

(assert (=> b!1162581 (= e!661180 e!661182)))

(declare-fun c!116399 () Bool)

(assert (=> b!1162581 (= c!116399 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523062))))

(declare-fun b!1162582 () Bool)

(declare-fun res!771034 () Bool)

(assert (=> b!1162582 (=> (not res!771034) (not e!661183))))

(assert (=> b!1162582 (= res!771034 (= (select (arr!36190 _keys!1208) i!673) k0!934))))

(declare-fun b!1162583 () Bool)

(declare-fun call!56466 () ListLongMap!16615)

(declare-fun contains!6841 (ListLongMap!16615 (_ BitVec 64)) Bool)

(assert (=> b!1162583 (contains!6841 call!56466 k0!934)))

(declare-fun lt!523078 () Unit!38282)

(declare-fun lt!523071 () ListLongMap!16615)

(assert (=> b!1162583 (= lt!523078 (addStillContains!959 lt!523071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56459 () Bool)

(assert (=> b!1162583 call!56459))

(declare-fun +!3740 (ListLongMap!16615 tuple2!18638) ListLongMap!16615)

(assert (=> b!1162583 (= lt!523071 (+!3740 lt!523081 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523076 () Unit!38282)

(assert (=> b!1162583 (= lt!523076 call!56463)))

(assert (=> b!1162583 (= e!661192 lt!523078)))

(declare-fun b!1162584 () Bool)

(assert (=> b!1162584 (= e!661184 (not e!661191))))

(declare-fun res!771035 () Bool)

(assert (=> b!1162584 (=> res!771035 e!661191)))

(assert (=> b!1162584 (= res!771035 (bvsgt from!1455 i!673))))

(assert (=> b!1162584 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523065 () Unit!38282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75091 (_ BitVec 64) (_ BitVec 32)) Unit!38282)

(assert (=> b!1162584 (= lt!523065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162585 () Bool)

(assert (=> b!1162585 (= e!661177 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56458 () Bool)

(assert (=> bm!56458 (= call!56460 (getCurrentListMapNoExtraKeys!4815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162586 () Bool)

(declare-fun e!661187 () Bool)

(declare-fun tp_is_empty!29101 () Bool)

(assert (=> b!1162586 (= e!661187 tp_is_empty!29101)))

(declare-fun b!1162587 () Bool)

(declare-fun e!661176 () Bool)

(declare-fun e!661178 () Bool)

(assert (=> b!1162587 (= e!661176 (and e!661178 mapRes!45476))))

(declare-fun condMapEmpty!45476 () Bool)

(declare-fun mapDefault!45476 () ValueCell!13841)

(assert (=> b!1162587 (= condMapEmpty!45476 (= (arr!36191 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13841)) mapDefault!45476)))))

(declare-fun bm!56459 () Bool)

(assert (=> bm!56459 (= call!56461 call!56459)))

(declare-fun b!1162588 () Bool)

(assert (=> b!1162588 (= e!661189 (= call!56464 call!56460))))

(declare-fun b!1162589 () Bool)

(assert (=> b!1162589 (= e!661179 true)))

(assert (=> b!1162589 e!661181))

(declare-fun res!771030 () Bool)

(assert (=> b!1162589 (=> (not res!771030) (not e!661181))))

(assert (=> b!1162589 (= res!771030 (= lt!523074 lt!523081))))

(assert (=> b!1162589 (= lt!523074 (-!1419 lt!523069 k0!934))))

(declare-fun lt!523061 () V!43929)

(assert (=> b!1162589 (= (-!1419 (+!3740 lt!523081 (tuple2!18639 (select (arr!36190 _keys!1208) from!1455) lt!523061)) (select (arr!36190 _keys!1208) from!1455)) lt!523081)))

(declare-fun lt!523060 () Unit!38282)

(declare-fun addThenRemoveForNewKeyIsSame!248 (ListLongMap!16615 (_ BitVec 64) V!43929) Unit!38282)

(assert (=> b!1162589 (= lt!523060 (addThenRemoveForNewKeyIsSame!248 lt!523081 (select (arr!36190 _keys!1208) from!1455) lt!523061))))

(declare-fun get!18483 (ValueCell!13841 V!43929) V!43929)

(assert (=> b!1162589 (= lt!523061 (get!18483 (select (arr!36191 _values!996) from!1455) lt!523080))))

(declare-fun lt!523066 () Unit!38282)

(assert (=> b!1162589 (= lt!523066 e!661185)))

(declare-fun c!116400 () Bool)

(assert (=> b!1162589 (= c!116400 (contains!6841 lt!523081 k0!934))))

(assert (=> b!1162589 (= lt!523081 (getCurrentListMapNoExtraKeys!4815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162590 () Bool)

(assert (=> b!1162590 (= e!661186 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523062) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162591 () Bool)

(assert (=> b!1162591 (= e!661178 tp_is_empty!29101)))

(declare-fun bm!56460 () Bool)

(declare-fun call!56462 () ListLongMap!16615)

(assert (=> bm!56460 (= call!56459 (contains!6841 (ite c!116396 lt!523071 call!56462) k0!934))))

(declare-fun res!771022 () Bool)

(assert (=> start!99202 (=> (not res!771022) (not e!661183))))

(assert (=> start!99202 (= res!771022 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36727 _keys!1208))))))

(assert (=> start!99202 e!661183))

(assert (=> start!99202 tp_is_empty!29101))

(declare-fun array_inv!27756 (array!75091) Bool)

(assert (=> start!99202 (array_inv!27756 _keys!1208)))

(assert (=> start!99202 true))

(assert (=> start!99202 tp!86423))

(declare-fun array_inv!27757 (array!75093) Bool)

(assert (=> start!99202 (and (array_inv!27757 _values!996) e!661176)))

(declare-fun mapNonEmpty!45476 () Bool)

(declare-fun tp!86424 () Bool)

(assert (=> mapNonEmpty!45476 (= mapRes!45476 (and tp!86424 e!661187))))

(declare-fun mapValue!45476 () ValueCell!13841)

(declare-fun mapRest!45476 () (Array (_ BitVec 32) ValueCell!13841))

(declare-fun mapKey!45476 () (_ BitVec 32))

(assert (=> mapNonEmpty!45476 (= (arr!36191 _values!996) (store mapRest!45476 mapKey!45476 mapValue!45476))))

(declare-fun b!1162592 () Bool)

(declare-fun res!771033 () Bool)

(assert (=> b!1162592 (=> (not res!771033) (not e!661183))))

(assert (=> b!1162592 (= res!771033 (and (= (size!36728 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36727 _keys!1208) (size!36728 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56461 () Bool)

(assert (=> bm!56461 (= call!56462 call!56466)))

(declare-fun b!1162593 () Bool)

(declare-fun Unit!38286 () Unit!38282)

(assert (=> b!1162593 (= e!661182 Unit!38286)))

(declare-fun bm!56462 () Bool)

(assert (=> bm!56462 (= call!56466 (+!3740 (ite c!116396 lt!523071 lt!523081) (ite c!116396 (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116398 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!56463 () Bool)

(assert (=> bm!56463 (= call!56464 (getCurrentListMapNoExtraKeys!4815 lt!523079 lt!523073 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162594 () Bool)

(declare-fun res!771029 () Bool)

(assert (=> b!1162594 (=> (not res!771029) (not e!661183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162594 (= res!771029 (validKeyInArray!0 k0!934))))

(declare-fun b!1162595 () Bool)

(assert (=> b!1162595 call!56461))

(declare-fun lt!523067 () Unit!38282)

(assert (=> b!1162595 (= lt!523067 call!56465)))

(assert (=> b!1162595 (= e!661182 lt!523067)))

(declare-fun b!1162596 () Bool)

(declare-fun res!771036 () Bool)

(assert (=> b!1162596 (=> (not res!771036) (not e!661184))))

(assert (=> b!1162596 (= res!771036 (arrayNoDuplicates!0 lt!523079 #b00000000000000000000000000000000 Nil!25372))))

(assert (= (and start!99202 res!771022) b!1162573))

(assert (= (and b!1162573 res!771023) b!1162592))

(assert (= (and b!1162592 res!771033) b!1162567))

(assert (= (and b!1162567 res!771031) b!1162577))

(assert (= (and b!1162577 res!771026) b!1162569))

(assert (= (and b!1162569 res!771028) b!1162594))

(assert (= (and b!1162594 res!771029) b!1162582))

(assert (= (and b!1162582 res!771034) b!1162580))

(assert (= (and b!1162580 res!771032) b!1162596))

(assert (= (and b!1162596 res!771036) b!1162584))

(assert (= (and b!1162584 (not res!771035)) b!1162570))

(assert (= (and b!1162570 (not res!771024)) b!1162572))

(assert (= (and b!1162572 c!116395) b!1162574))

(assert (= (and b!1162572 (not c!116395)) b!1162588))

(assert (= (or b!1162574 b!1162588) bm!56463))

(assert (= (or b!1162574 b!1162588) bm!56458))

(assert (= (and b!1162572 (not res!771025)) b!1162589))

(assert (= (and b!1162589 c!116400) b!1162579))

(assert (= (and b!1162589 (not c!116400)) b!1162578))

(assert (= (and b!1162579 c!116396) b!1162583))

(assert (= (and b!1162579 (not c!116396)) b!1162576))

(assert (= (and b!1162576 c!116398) b!1162568))

(assert (= (and b!1162576 (not c!116398)) b!1162581))

(assert (= (and b!1162581 c!116399) b!1162595))

(assert (= (and b!1162581 (not c!116399)) b!1162593))

(assert (= (or b!1162568 b!1162595) bm!56457))

(assert (= (or b!1162568 b!1162595) bm!56461))

(assert (= (or b!1162568 b!1162595) bm!56459))

(assert (= (or b!1162583 bm!56459) bm!56460))

(assert (= (or b!1162583 bm!56457) bm!56456))

(assert (= (or b!1162583 bm!56461) bm!56462))

(assert (= (and b!1162579 c!116397) b!1162575))

(assert (= (and b!1162579 (not c!116397)) b!1162590))

(assert (= (and b!1162579 res!771027) b!1162585))

(assert (= (and b!1162589 res!771030) b!1162571))

(assert (= (and b!1162587 condMapEmpty!45476) mapIsEmpty!45476))

(assert (= (and b!1162587 (not condMapEmpty!45476)) mapNonEmpty!45476))

(get-info :version)

(assert (= (and mapNonEmpty!45476 ((_ is ValueCellFull!13841) mapValue!45476)) b!1162586))

(assert (= (and b!1162587 ((_ is ValueCellFull!13841) mapDefault!45476)) b!1162591))

(assert (= start!99202 b!1162587))

(declare-fun b_lambda!19671 () Bool)

(assert (=> (not b_lambda!19671) (not b!1162570)))

(declare-fun t!36928 () Bool)

(declare-fun tb!9375 () Bool)

(assert (=> (and start!99202 (= defaultEntry!1004 defaultEntry!1004) t!36928) tb!9375))

(declare-fun result!19323 () Bool)

(assert (=> tb!9375 (= result!19323 tp_is_empty!29101)))

(assert (=> b!1162570 t!36928))

(declare-fun b_and!39995 () Bool)

(assert (= b_and!39993 (and (=> t!36928 result!19323) b_and!39995)))

(declare-fun m!1071689 () Bool)

(assert (=> bm!56456 m!1071689))

(declare-fun m!1071691 () Bool)

(assert (=> b!1162589 m!1071691))

(declare-fun m!1071693 () Bool)

(assert (=> b!1162589 m!1071693))

(declare-fun m!1071695 () Bool)

(assert (=> b!1162589 m!1071695))

(declare-fun m!1071697 () Bool)

(assert (=> b!1162589 m!1071697))

(declare-fun m!1071699 () Bool)

(assert (=> b!1162589 m!1071699))

(assert (=> b!1162589 m!1071699))

(declare-fun m!1071701 () Bool)

(assert (=> b!1162589 m!1071701))

(declare-fun m!1071703 () Bool)

(assert (=> b!1162589 m!1071703))

(declare-fun m!1071705 () Bool)

(assert (=> b!1162589 m!1071705))

(assert (=> b!1162589 m!1071693))

(assert (=> b!1162589 m!1071705))

(assert (=> b!1162589 m!1071693))

(declare-fun m!1071707 () Bool)

(assert (=> b!1162589 m!1071707))

(declare-fun m!1071709 () Bool)

(assert (=> b!1162574 m!1071709))

(assert (=> b!1162572 m!1071693))

(declare-fun m!1071711 () Bool)

(assert (=> b!1162572 m!1071711))

(declare-fun m!1071713 () Bool)

(assert (=> b!1162585 m!1071713))

(declare-fun m!1071715 () Bool)

(assert (=> b!1162596 m!1071715))

(declare-fun m!1071717 () Bool)

(assert (=> mapNonEmpty!45476 m!1071717))

(declare-fun m!1071719 () Bool)

(assert (=> b!1162579 m!1071719))

(declare-fun m!1071721 () Bool)

(assert (=> b!1162579 m!1071721))

(declare-fun m!1071723 () Bool)

(assert (=> b!1162579 m!1071723))

(declare-fun m!1071725 () Bool)

(assert (=> b!1162579 m!1071725))

(declare-fun m!1071727 () Bool)

(assert (=> b!1162571 m!1071727))

(declare-fun m!1071729 () Bool)

(assert (=> b!1162570 m!1071729))

(declare-fun m!1071731 () Bool)

(assert (=> b!1162570 m!1071731))

(declare-fun m!1071733 () Bool)

(assert (=> b!1162570 m!1071733))

(declare-fun m!1071735 () Bool)

(assert (=> b!1162570 m!1071735))

(declare-fun m!1071737 () Bool)

(assert (=> b!1162582 m!1071737))

(declare-fun m!1071739 () Bool)

(assert (=> bm!56462 m!1071739))

(assert (=> bm!56458 m!1071691))

(assert (=> bm!56463 m!1071727))

(declare-fun m!1071741 () Bool)

(assert (=> b!1162580 m!1071741))

(declare-fun m!1071743 () Bool)

(assert (=> b!1162580 m!1071743))

(declare-fun m!1071745 () Bool)

(assert (=> b!1162567 m!1071745))

(declare-fun m!1071747 () Bool)

(assert (=> b!1162594 m!1071747))

(declare-fun m!1071749 () Bool)

(assert (=> b!1162577 m!1071749))

(declare-fun m!1071751 () Bool)

(assert (=> b!1162573 m!1071751))

(declare-fun m!1071753 () Bool)

(assert (=> b!1162584 m!1071753))

(declare-fun m!1071755 () Bool)

(assert (=> b!1162584 m!1071755))

(declare-fun m!1071757 () Bool)

(assert (=> bm!56460 m!1071757))

(declare-fun m!1071759 () Bool)

(assert (=> b!1162583 m!1071759))

(declare-fun m!1071761 () Bool)

(assert (=> b!1162583 m!1071761))

(declare-fun m!1071763 () Bool)

(assert (=> b!1162583 m!1071763))

(declare-fun m!1071765 () Bool)

(assert (=> start!99202 m!1071765))

(declare-fun m!1071767 () Bool)

(assert (=> start!99202 m!1071767))

(assert (=> b!1162575 m!1071713))

(check-sat (not b!1162570) (not bm!56463) (not bm!56460) (not b!1162572) (not b!1162580) b_and!39995 (not b!1162584) (not b!1162589) (not bm!56456) (not b!1162596) (not bm!56462) (not b_lambda!19671) (not b!1162579) (not b!1162574) (not b!1162583) (not bm!56458) (not b!1162573) (not b!1162585) tp_is_empty!29101 (not b!1162594) (not start!99202) (not b!1162571) (not b_next!24571) (not b!1162567) (not mapNonEmpty!45476) (not b!1162577) (not b!1162575))
(check-sat b_and!39995 (not b_next!24571))
