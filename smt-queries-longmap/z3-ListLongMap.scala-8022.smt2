; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98974 () Bool)

(assert start!98974)

(declare-fun b_free!24579 () Bool)

(declare-fun b_next!24579 () Bool)

(assert (=> start!98974 (= b_free!24579 (not b_next!24579))))

(declare-fun tp!86447 () Bool)

(declare-fun b_and!40007 () Bool)

(assert (=> start!98974 (= tp!86447 b_and!40007)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!56487 () Bool)

(declare-datatypes ((Unit!38311 0))(
  ( (Unit!38312) )
))
(declare-fun call!56490 () Unit!38311)

(declare-fun c!116072 () Bool)

(declare-datatypes ((V!43939 0))(
  ( (V!43940 (val!14611 Int)) )
))
(declare-fun minValue!944 () V!43939)

(declare-fun c!116070 () Bool)

(declare-fun zeroValue!944 () V!43939)

(declare-datatypes ((tuple2!18618 0))(
  ( (tuple2!18619 (_1!9320 (_ BitVec 64)) (_2!9320 V!43939)) )
))
(declare-datatypes ((List!25353 0))(
  ( (Nil!25350) (Cons!25349 (h!26558 tuple2!18618) (t!36924 List!25353)) )
))
(declare-datatypes ((ListLongMap!16587 0))(
  ( (ListLongMap!16588 (toList!8309 List!25353)) )
))
(declare-fun lt!522853 () ListLongMap!16587)

(declare-fun lt!522861 () ListLongMap!16587)

(declare-fun addStillContains!955 (ListLongMap!16587 (_ BitVec 64) V!43939 (_ BitVec 64)) Unit!38311)

(assert (=> bm!56487 (= call!56490 (addStillContains!955 (ite c!116072 lt!522853 lt!522861) (ite c!116072 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116070 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116072 minValue!944 (ite c!116070 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!56496 () Bool)

(declare-fun call!56494 () ListLongMap!16587)

(declare-fun bm!56488 () Bool)

(declare-fun contains!6814 (ListLongMap!16587 (_ BitVec 64)) Bool)

(assert (=> bm!56488 (= call!56496 (contains!6814 (ite c!116072 lt!522853 call!56494) k0!934))))

(declare-fun bm!56489 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!56493 () ListLongMap!16587)

(declare-datatypes ((array!75057 0))(
  ( (array!75058 (arr!36179 (Array (_ BitVec 32) (_ BitVec 64))) (size!36715 (_ BitVec 32))) )
))
(declare-fun lt!522847 () array!75057)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13845 0))(
  ( (ValueCellFull!13845 (v!17248 V!43939)) (EmptyCell!13845) )
))
(declare-datatypes ((array!75059 0))(
  ( (array!75060 (arr!36180 (Array (_ BitVec 32) ValueCell!13845)) (size!36716 (_ BitVec 32))) )
))
(declare-fun lt!522840 () array!75059)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4773 (array!75057 array!75059 (_ BitVec 32) (_ BitVec 32) V!43939 V!43939 (_ BitVec 32) Int) ListLongMap!16587)

(assert (=> bm!56489 (= call!56493 (getCurrentListMapNoExtraKeys!4773 lt!522847 lt!522840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161646 () Bool)

(declare-fun e!660564 () Bool)

(declare-fun lt!522844 () Bool)

(assert (=> b!1161646 (= e!660564 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522844) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161647 () Bool)

(declare-fun res!770698 () Bool)

(declare-fun e!660557 () Bool)

(assert (=> b!1161647 (=> (not res!770698) (not e!660557))))

(declare-fun _keys!1208 () array!75057)

(declare-fun _values!996 () array!75059)

(assert (=> b!1161647 (= res!770698 (and (= (size!36716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36715 _keys!1208) (size!36716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161648 () Bool)

(declare-fun e!660548 () Bool)

(declare-fun tp_is_empty!29109 () Bool)

(assert (=> b!1161648 (= e!660548 tp_is_empty!29109)))

(declare-fun b!1161650 () Bool)

(declare-fun e!660552 () Unit!38311)

(declare-fun Unit!38313 () Unit!38311)

(assert (=> b!1161650 (= e!660552 Unit!38313)))

(declare-fun bm!56490 () Bool)

(declare-fun call!56491 () Bool)

(assert (=> bm!56490 (= call!56491 call!56496)))

(declare-fun e!660549 () Bool)

(declare-fun lt!522859 () ListLongMap!16587)

(declare-fun b!1161651 () Bool)

(assert (=> b!1161651 (= e!660549 (= lt!522859 (getCurrentListMapNoExtraKeys!4773 lt!522847 lt!522840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161652 () Bool)

(declare-fun e!660561 () Bool)

(assert (=> b!1161652 (= e!660557 e!660561)))

(declare-fun res!770696 () Bool)

(assert (=> b!1161652 (=> (not res!770696) (not e!660561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75057 (_ BitVec 32)) Bool)

(assert (=> b!1161652 (= res!770696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522847 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161652 (= lt!522847 (array!75058 (store (arr!36179 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36715 _keys!1208)))))

(declare-fun b!1161653 () Bool)

(declare-fun res!770699 () Bool)

(assert (=> b!1161653 (=> (not res!770699) (not e!660557))))

(assert (=> b!1161653 (= res!770699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161654 () Bool)

(declare-fun res!770695 () Bool)

(assert (=> b!1161654 (=> (not res!770695) (not e!660557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161654 (= res!770695 (validKeyInArray!0 k0!934))))

(declare-fun b!1161655 () Bool)

(assert (=> b!1161655 call!56491))

(declare-fun lt!522855 () Unit!38311)

(declare-fun call!56492 () Unit!38311)

(assert (=> b!1161655 (= lt!522855 call!56492)))

(declare-fun e!660551 () Unit!38311)

(assert (=> b!1161655 (= e!660551 lt!522855)))

(declare-fun b!1161656 () Bool)

(declare-fun e!660550 () Bool)

(declare-fun e!660555 () Bool)

(declare-fun mapRes!45488 () Bool)

(assert (=> b!1161656 (= e!660550 (and e!660555 mapRes!45488))))

(declare-fun condMapEmpty!45488 () Bool)

(declare-fun mapDefault!45488 () ValueCell!13845)

(assert (=> b!1161656 (= condMapEmpty!45488 (= (arr!36180 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13845)) mapDefault!45488)))))

(declare-fun bm!56491 () Bool)

(declare-fun call!56495 () ListLongMap!16587)

(assert (=> bm!56491 (= call!56495 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45488 () Bool)

(assert (=> mapIsEmpty!45488 mapRes!45488))

(declare-fun b!1161657 () Bool)

(declare-fun e!660556 () Bool)

(declare-fun e!660562 () Bool)

(assert (=> b!1161657 (= e!660556 e!660562)))

(declare-fun res!770706 () Bool)

(assert (=> b!1161657 (=> res!770706 e!660562)))

(assert (=> b!1161657 (= res!770706 (not (= from!1455 i!673)))))

(declare-fun lt!522858 () ListLongMap!16587)

(assert (=> b!1161657 (= lt!522858 (getCurrentListMapNoExtraKeys!4773 lt!522847 lt!522840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522846 () V!43939)

(assert (=> b!1161657 (= lt!522840 (array!75060 (store (arr!36180 _values!996) i!673 (ValueCellFull!13845 lt!522846)) (size!36716 _values!996)))))

(declare-fun dynLambda!2769 (Int (_ BitVec 64)) V!43939)

(assert (=> b!1161657 (= lt!522846 (dynLambda!2769 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522854 () ListLongMap!16587)

(assert (=> b!1161657 (= lt!522854 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!660553 () Bool)

(declare-fun b!1161658 () Bool)

(declare-fun -!1415 (ListLongMap!16587 (_ BitVec 64)) ListLongMap!16587)

(assert (=> b!1161658 (= e!660553 (= call!56493 (-!1415 call!56495 k0!934)))))

(declare-fun b!1161659 () Bool)

(declare-fun e!660560 () Bool)

(assert (=> b!1161659 (= e!660560 true)))

(assert (=> b!1161659 e!660549))

(declare-fun res!770703 () Bool)

(assert (=> b!1161659 (=> (not res!770703) (not e!660549))))

(assert (=> b!1161659 (= res!770703 (= lt!522859 lt!522861))))

(assert (=> b!1161659 (= lt!522859 (-!1415 lt!522854 k0!934))))

(declare-fun lt!522852 () V!43939)

(declare-fun +!3713 (ListLongMap!16587 tuple2!18618) ListLongMap!16587)

(assert (=> b!1161659 (= (-!1415 (+!3713 lt!522861 (tuple2!18619 (select (arr!36179 _keys!1208) from!1455) lt!522852)) (select (arr!36179 _keys!1208) from!1455)) lt!522861)))

(declare-fun lt!522843 () Unit!38311)

(declare-fun addThenRemoveForNewKeyIsSame!249 (ListLongMap!16587 (_ BitVec 64) V!43939) Unit!38311)

(assert (=> b!1161659 (= lt!522843 (addThenRemoveForNewKeyIsSame!249 lt!522861 (select (arr!36179 _keys!1208) from!1455) lt!522852))))

(declare-fun get!18455 (ValueCell!13845 V!43939) V!43939)

(assert (=> b!1161659 (= lt!522852 (get!18455 (select (arr!36180 _values!996) from!1455) lt!522846))))

(declare-fun lt!522848 () Unit!38311)

(assert (=> b!1161659 (= lt!522848 e!660552)))

(declare-fun c!116074 () Bool)

(assert (=> b!1161659 (= c!116074 (contains!6814 lt!522861 k0!934))))

(assert (=> b!1161659 (= lt!522861 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161660 () Bool)

(declare-fun res!770694 () Bool)

(assert (=> b!1161660 (=> (not res!770694) (not e!660557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161660 (= res!770694 (validMask!0 mask!1564))))

(declare-fun b!1161661 () Bool)

(assert (=> b!1161661 (= c!116070 (and (not lt!522844) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660554 () Unit!38311)

(declare-fun e!660559 () Unit!38311)

(assert (=> b!1161661 (= e!660554 e!660559)))

(declare-fun bm!56492 () Bool)

(assert (=> bm!56492 (= call!56492 call!56490)))

(declare-fun bm!56493 () Bool)

(declare-fun call!56497 () ListLongMap!16587)

(assert (=> bm!56493 (= call!56497 (+!3713 lt!522861 (ite (or c!116072 c!116070) (tuple2!18619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1161662 () Bool)

(assert (=> b!1161662 (= e!660562 e!660560)))

(declare-fun res!770707 () Bool)

(assert (=> b!1161662 (=> res!770707 e!660560)))

(assert (=> b!1161662 (= res!770707 (not (= (select (arr!36179 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161662 e!660553))

(declare-fun c!116071 () Bool)

(assert (=> b!1161662 (= c!116071 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522842 () Unit!38311)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!645 (array!75057 array!75059 (_ BitVec 32) (_ BitVec 32) V!43939 V!43939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38311)

(assert (=> b!1161662 (= lt!522842 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161663 () Bool)

(declare-fun Unit!38314 () Unit!38311)

(assert (=> b!1161663 (= e!660552 Unit!38314)))

(assert (=> b!1161663 (= lt!522844 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161663 (= c!116072 (and (not lt!522844) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522850 () Unit!38311)

(assert (=> b!1161663 (= lt!522850 e!660554)))

(declare-fun lt!522860 () Unit!38311)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!540 (array!75057 array!75059 (_ BitVec 32) (_ BitVec 32) V!43939 V!43939 (_ BitVec 64) (_ BitVec 32) Int) Unit!38311)

(assert (=> b!1161663 (= lt!522860 (lemmaListMapContainsThenArrayContainsFrom!540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116069 () Bool)

(assert (=> b!1161663 (= c!116069 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770708 () Bool)

(assert (=> b!1161663 (= res!770708 e!660564)))

(declare-fun e!660558 () Bool)

(assert (=> b!1161663 (=> (not res!770708) (not e!660558))))

(assert (=> b!1161663 e!660558))

(declare-fun lt!522845 () Unit!38311)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75057 (_ BitVec 32) (_ BitVec 32)) Unit!38311)

(assert (=> b!1161663 (= lt!522845 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25354 0))(
  ( (Nil!25351) (Cons!25350 (h!26559 (_ BitVec 64)) (t!36925 List!25354)) )
))
(declare-fun arrayNoDuplicates!0 (array!75057 (_ BitVec 32) List!25354) Bool)

(assert (=> b!1161663 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25351)))

(declare-fun lt!522841 () Unit!38311)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75057 (_ BitVec 64) (_ BitVec 32) List!25354) Unit!38311)

(assert (=> b!1161663 (= lt!522841 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25351))))

(assert (=> b!1161663 false))

(declare-fun b!1161664 () Bool)

(assert (=> b!1161664 (= e!660553 (= call!56493 call!56495))))

(declare-fun b!1161665 () Bool)

(declare-fun res!770705 () Bool)

(assert (=> b!1161665 (=> (not res!770705) (not e!660561))))

(assert (=> b!1161665 (= res!770705 (arrayNoDuplicates!0 lt!522847 #b00000000000000000000000000000000 Nil!25351))))

(declare-fun b!1161649 () Bool)

(declare-fun arrayContainsKey!0 (array!75057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161649 (= e!660558 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!770702 () Bool)

(assert (=> start!98974 (=> (not res!770702) (not e!660557))))

(assert (=> start!98974 (= res!770702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36715 _keys!1208))))))

(assert (=> start!98974 e!660557))

(assert (=> start!98974 tp_is_empty!29109))

(declare-fun array_inv!27682 (array!75057) Bool)

(assert (=> start!98974 (array_inv!27682 _keys!1208)))

(assert (=> start!98974 true))

(assert (=> start!98974 tp!86447))

(declare-fun array_inv!27683 (array!75059) Bool)

(assert (=> start!98974 (and (array_inv!27683 _values!996) e!660550)))

(declare-fun b!1161666 () Bool)

(declare-fun res!770697 () Bool)

(assert (=> b!1161666 (=> (not res!770697) (not e!660557))))

(assert (=> b!1161666 (= res!770697 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36715 _keys!1208))))))

(declare-fun b!1161667 () Bool)

(assert (=> b!1161667 (= e!660555 tp_is_empty!29109)))

(declare-fun b!1161668 () Bool)

(declare-fun res!770701 () Bool)

(assert (=> b!1161668 (=> (not res!770701) (not e!660557))))

(assert (=> b!1161668 (= res!770701 (= (select (arr!36179 _keys!1208) i!673) k0!934))))

(declare-fun bm!56494 () Bool)

(assert (=> bm!56494 (= call!56494 call!56497)))

(declare-fun b!1161669 () Bool)

(assert (=> b!1161669 (= e!660564 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45488 () Bool)

(declare-fun tp!86448 () Bool)

(assert (=> mapNonEmpty!45488 (= mapRes!45488 (and tp!86448 e!660548))))

(declare-fun mapValue!45488 () ValueCell!13845)

(declare-fun mapKey!45488 () (_ BitVec 32))

(declare-fun mapRest!45488 () (Array (_ BitVec 32) ValueCell!13845))

(assert (=> mapNonEmpty!45488 (= (arr!36180 _values!996) (store mapRest!45488 mapKey!45488 mapValue!45488))))

(declare-fun b!1161670 () Bool)

(assert (=> b!1161670 (contains!6814 (+!3713 lt!522853 (tuple2!18619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522857 () Unit!38311)

(assert (=> b!1161670 (= lt!522857 call!56490)))

(assert (=> b!1161670 call!56496))

(assert (=> b!1161670 (= lt!522853 call!56497)))

(declare-fun lt!522849 () Unit!38311)

(assert (=> b!1161670 (= lt!522849 (addStillContains!955 lt!522861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1161670 (= e!660554 lt!522857)))

(declare-fun b!1161671 () Bool)

(declare-fun res!770704 () Bool)

(assert (=> b!1161671 (=> (not res!770704) (not e!660557))))

(assert (=> b!1161671 (= res!770704 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25351))))

(declare-fun b!1161672 () Bool)

(declare-fun Unit!38315 () Unit!38311)

(assert (=> b!1161672 (= e!660551 Unit!38315)))

(declare-fun b!1161673 () Bool)

(assert (=> b!1161673 (= e!660561 (not e!660556))))

(declare-fun res!770700 () Bool)

(assert (=> b!1161673 (=> res!770700 e!660556)))

(assert (=> b!1161673 (= res!770700 (bvsgt from!1455 i!673))))

(assert (=> b!1161673 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522851 () Unit!38311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75057 (_ BitVec 64) (_ BitVec 32)) Unit!38311)

(assert (=> b!1161673 (= lt!522851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161674 () Bool)

(assert (=> b!1161674 (= e!660559 e!660551)))

(declare-fun c!116073 () Bool)

(assert (=> b!1161674 (= c!116073 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522844))))

(declare-fun b!1161675 () Bool)

(declare-fun lt!522856 () Unit!38311)

(assert (=> b!1161675 (= e!660559 lt!522856)))

(assert (=> b!1161675 (= lt!522856 call!56492)))

(assert (=> b!1161675 call!56491))

(assert (= (and start!98974 res!770702) b!1161660))

(assert (= (and b!1161660 res!770694) b!1161647))

(assert (= (and b!1161647 res!770698) b!1161653))

(assert (= (and b!1161653 res!770699) b!1161671))

(assert (= (and b!1161671 res!770704) b!1161666))

(assert (= (and b!1161666 res!770697) b!1161654))

(assert (= (and b!1161654 res!770695) b!1161668))

(assert (= (and b!1161668 res!770701) b!1161652))

(assert (= (and b!1161652 res!770696) b!1161665))

(assert (= (and b!1161665 res!770705) b!1161673))

(assert (= (and b!1161673 (not res!770700)) b!1161657))

(assert (= (and b!1161657 (not res!770706)) b!1161662))

(assert (= (and b!1161662 c!116071) b!1161658))

(assert (= (and b!1161662 (not c!116071)) b!1161664))

(assert (= (or b!1161658 b!1161664) bm!56489))

(assert (= (or b!1161658 b!1161664) bm!56491))

(assert (= (and b!1161662 (not res!770707)) b!1161659))

(assert (= (and b!1161659 c!116074) b!1161663))

(assert (= (and b!1161659 (not c!116074)) b!1161650))

(assert (= (and b!1161663 c!116072) b!1161670))

(assert (= (and b!1161663 (not c!116072)) b!1161661))

(assert (= (and b!1161661 c!116070) b!1161675))

(assert (= (and b!1161661 (not c!116070)) b!1161674))

(assert (= (and b!1161674 c!116073) b!1161655))

(assert (= (and b!1161674 (not c!116073)) b!1161672))

(assert (= (or b!1161675 b!1161655) bm!56492))

(assert (= (or b!1161675 b!1161655) bm!56494))

(assert (= (or b!1161675 b!1161655) bm!56490))

(assert (= (or b!1161670 bm!56490) bm!56488))

(assert (= (or b!1161670 bm!56492) bm!56487))

(assert (= (or b!1161670 bm!56494) bm!56493))

(assert (= (and b!1161663 c!116069) b!1161669))

(assert (= (and b!1161663 (not c!116069)) b!1161646))

(assert (= (and b!1161663 res!770708) b!1161649))

(assert (= (and b!1161659 res!770703) b!1161651))

(assert (= (and b!1161656 condMapEmpty!45488) mapIsEmpty!45488))

(assert (= (and b!1161656 (not condMapEmpty!45488)) mapNonEmpty!45488))

(get-info :version)

(assert (= (and mapNonEmpty!45488 ((_ is ValueCellFull!13845) mapValue!45488)) b!1161648))

(assert (= (and b!1161656 ((_ is ValueCellFull!13845) mapDefault!45488)) b!1161667))

(assert (= start!98974 b!1161656))

(declare-fun b_lambda!19685 () Bool)

(assert (=> (not b_lambda!19685) (not b!1161657)))

(declare-fun t!36923 () Bool)

(declare-fun tb!9391 () Bool)

(assert (=> (and start!98974 (= defaultEntry!1004 defaultEntry!1004) t!36923) tb!9391))

(declare-fun result!19347 () Bool)

(assert (=> tb!9391 (= result!19347 tp_is_empty!29109)))

(assert (=> b!1161657 t!36923))

(declare-fun b_and!40009 () Bool)

(assert (= b_and!40007 (and (=> t!36923 result!19347) b_and!40009)))

(declare-fun m!1070445 () Bool)

(assert (=> b!1161663 m!1070445))

(declare-fun m!1070447 () Bool)

(assert (=> b!1161663 m!1070447))

(declare-fun m!1070449 () Bool)

(assert (=> b!1161663 m!1070449))

(declare-fun m!1070451 () Bool)

(assert (=> b!1161663 m!1070451))

(declare-fun m!1070453 () Bool)

(assert (=> b!1161654 m!1070453))

(declare-fun m!1070455 () Bool)

(assert (=> bm!56488 m!1070455))

(declare-fun m!1070457 () Bool)

(assert (=> b!1161668 m!1070457))

(declare-fun m!1070459 () Bool)

(assert (=> bm!56489 m!1070459))

(declare-fun m!1070461 () Bool)

(assert (=> b!1161660 m!1070461))

(assert (=> b!1161651 m!1070459))

(declare-fun m!1070463 () Bool)

(assert (=> start!98974 m!1070463))

(declare-fun m!1070465 () Bool)

(assert (=> start!98974 m!1070465))

(declare-fun m!1070467 () Bool)

(assert (=> bm!56491 m!1070467))

(declare-fun m!1070469 () Bool)

(assert (=> b!1161652 m!1070469))

(declare-fun m!1070471 () Bool)

(assert (=> b!1161652 m!1070471))

(declare-fun m!1070473 () Bool)

(assert (=> b!1161673 m!1070473))

(declare-fun m!1070475 () Bool)

(assert (=> b!1161673 m!1070475))

(declare-fun m!1070477 () Bool)

(assert (=> b!1161671 m!1070477))

(declare-fun m!1070479 () Bool)

(assert (=> b!1161657 m!1070479))

(declare-fun m!1070481 () Bool)

(assert (=> b!1161657 m!1070481))

(declare-fun m!1070483 () Bool)

(assert (=> b!1161657 m!1070483))

(declare-fun m!1070485 () Bool)

(assert (=> b!1161657 m!1070485))

(declare-fun m!1070487 () Bool)

(assert (=> mapNonEmpty!45488 m!1070487))

(assert (=> b!1161659 m!1070467))

(declare-fun m!1070489 () Bool)

(assert (=> b!1161659 m!1070489))

(declare-fun m!1070491 () Bool)

(assert (=> b!1161659 m!1070491))

(declare-fun m!1070493 () Bool)

(assert (=> b!1161659 m!1070493))

(declare-fun m!1070495 () Bool)

(assert (=> b!1161659 m!1070495))

(assert (=> b!1161659 m!1070491))

(assert (=> b!1161659 m!1070493))

(declare-fun m!1070497 () Bool)

(assert (=> b!1161659 m!1070497))

(declare-fun m!1070499 () Bool)

(assert (=> b!1161659 m!1070499))

(declare-fun m!1070501 () Bool)

(assert (=> b!1161659 m!1070501))

(assert (=> b!1161659 m!1070489))

(declare-fun m!1070503 () Bool)

(assert (=> b!1161659 m!1070503))

(assert (=> b!1161659 m!1070493))

(declare-fun m!1070505 () Bool)

(assert (=> b!1161665 m!1070505))

(declare-fun m!1070507 () Bool)

(assert (=> b!1161670 m!1070507))

(assert (=> b!1161670 m!1070507))

(declare-fun m!1070509 () Bool)

(assert (=> b!1161670 m!1070509))

(declare-fun m!1070511 () Bool)

(assert (=> b!1161670 m!1070511))

(assert (=> b!1161662 m!1070493))

(declare-fun m!1070513 () Bool)

(assert (=> b!1161662 m!1070513))

(declare-fun m!1070515 () Bool)

(assert (=> bm!56493 m!1070515))

(declare-fun m!1070517 () Bool)

(assert (=> b!1161649 m!1070517))

(assert (=> b!1161669 m!1070517))

(declare-fun m!1070519 () Bool)

(assert (=> b!1161653 m!1070519))

(declare-fun m!1070521 () Bool)

(assert (=> b!1161658 m!1070521))

(declare-fun m!1070523 () Bool)

(assert (=> bm!56487 m!1070523))

(check-sat (not b!1161670) (not mapNonEmpty!45488) (not b_next!24579) (not b!1161665) tp_is_empty!29109 (not b!1161652) (not b!1161653) (not b_lambda!19685) (not bm!56488) (not start!98974) (not bm!56489) (not bm!56493) (not b!1161657) (not b!1161673) (not b!1161651) (not b!1161659) b_and!40009 (not b!1161658) (not b!1161649) (not b!1161663) (not bm!56487) (not b!1161671) (not b!1161662) (not b!1161669) (not b!1161660) (not b!1161654) (not bm!56491))
(check-sat b_and!40009 (not b_next!24579))
