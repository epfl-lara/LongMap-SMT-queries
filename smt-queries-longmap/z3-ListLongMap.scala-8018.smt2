; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99184 () Bool)

(assert start!99184)

(declare-fun b_free!24553 () Bool)

(declare-fun b_next!24553 () Bool)

(assert (=> start!99184 (= b_free!24553 (not b_next!24553))))

(declare-fun tp!86370 () Bool)

(declare-fun b_and!39957 () Bool)

(assert (=> start!99184 (= tp!86370 b_and!39957)))

(declare-fun b!1161739 () Bool)

(declare-fun res!770621 () Bool)

(declare-fun e!660724 () Bool)

(assert (=> b!1161739 (=> (not res!770621) (not e!660724))))

(declare-datatypes ((array!75055 0))(
  ( (array!75056 (arr!36172 (Array (_ BitVec 32) (_ BitVec 64))) (size!36709 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75055)

(declare-datatypes ((List!25358 0))(
  ( (Nil!25355) (Cons!25354 (h!26572 (_ BitVec 64)) (t!36895 List!25358)) )
))
(declare-fun arrayNoDuplicates!0 (array!75055 (_ BitVec 32) List!25358) Bool)

(assert (=> b!1161739 (= res!770621 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25355))))

(declare-fun b!1161740 () Bool)

(declare-fun e!660732 () Bool)

(declare-fun e!660717 () Bool)

(assert (=> b!1161740 (= e!660732 (not e!660717))))

(declare-fun res!770631 () Bool)

(assert (=> b!1161740 (=> res!770631 e!660717)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161740 (= res!770631 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161740 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38245 0))(
  ( (Unit!38246) )
))
(declare-fun lt!522471 () Unit!38245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75055 (_ BitVec 64) (_ BitVec 32)) Unit!38245)

(assert (=> b!1161740 (= lt!522471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!56240 () Bool)

(declare-datatypes ((V!43905 0))(
  ( (V!43906 (val!14598 Int)) )
))
(declare-datatypes ((tuple2!18620 0))(
  ( (tuple2!18621 (_1!9321 (_ BitVec 64)) (_2!9321 V!43905)) )
))
(declare-datatypes ((List!25359 0))(
  ( (Nil!25356) (Cons!25355 (h!26573 tuple2!18620) (t!36896 List!25359)) )
))
(declare-datatypes ((ListLongMap!16597 0))(
  ( (ListLongMap!16598 (toList!8314 List!25359)) )
))
(declare-fun call!56250 () ListLongMap!16597)

(declare-fun call!56248 () ListLongMap!16597)

(assert (=> bm!56240 (= call!56250 call!56248)))

(declare-fun mapNonEmpty!45449 () Bool)

(declare-fun mapRes!45449 () Bool)

(declare-fun tp!86369 () Bool)

(declare-fun e!660721 () Bool)

(assert (=> mapNonEmpty!45449 (= mapRes!45449 (and tp!86369 e!660721))))

(declare-fun mapKey!45449 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13832 0))(
  ( (ValueCellFull!13832 (v!17231 V!43905)) (EmptyCell!13832) )
))
(declare-fun mapRest!45449 () (Array (_ BitVec 32) ValueCell!13832))

(declare-fun mapValue!45449 () ValueCell!13832)

(declare-datatypes ((array!75057 0))(
  ( (array!75058 (arr!36173 (Array (_ BitVec 32) ValueCell!13832)) (size!36710 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75057)

(assert (=> mapNonEmpty!45449 (= (arr!36173 _values!996) (store mapRest!45449 mapKey!45449 mapValue!45449))))

(declare-fun mapIsEmpty!45449 () Bool)

(assert (=> mapIsEmpty!45449 mapRes!45449))

(declare-fun b!1161741 () Bool)

(declare-fun e!660722 () Bool)

(assert (=> b!1161741 (= e!660722 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161742 () Bool)

(declare-fun call!56246 () Bool)

(assert (=> b!1161742 call!56246))

(declare-fun lt!522479 () Unit!38245)

(declare-fun call!56247 () Unit!38245)

(assert (=> b!1161742 (= lt!522479 call!56247)))

(declare-fun e!660730 () Unit!38245)

(assert (=> b!1161742 (= e!660730 lt!522479)))

(declare-fun b!1161743 () Bool)

(declare-fun e!660726 () Bool)

(declare-fun call!56245 () ListLongMap!16597)

(declare-fun call!56243 () ListLongMap!16597)

(assert (=> b!1161743 (= e!660726 (= call!56245 call!56243))))

(declare-fun b!1161744 () Bool)

(declare-fun Unit!38247 () Unit!38245)

(assert (=> b!1161744 (= e!660730 Unit!38247)))

(declare-fun zeroValue!944 () V!43905)

(declare-fun bm!56241 () Bool)

(declare-fun call!56244 () Unit!38245)

(declare-fun c!116234 () Bool)

(declare-fun c!116238 () Bool)

(declare-fun minValue!944 () V!43905)

(declare-fun lt!522476 () ListLongMap!16597)

(declare-fun addStillContains!951 (ListLongMap!16597 (_ BitVec 64) V!43905 (_ BitVec 64)) Unit!38245)

(assert (=> bm!56241 (= call!56244 (addStillContains!951 lt!522476 (ite (or c!116234 c!116238) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116234 c!116238) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1161745 () Bool)

(declare-fun res!770624 () Bool)

(assert (=> b!1161745 (=> (not res!770624) (not e!660732))))

(declare-fun lt!522483 () array!75055)

(assert (=> b!1161745 (= res!770624 (arrayNoDuplicates!0 lt!522483 #b00000000000000000000000000000000 Nil!25355))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!522470 () array!75057)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!56242 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4806 (array!75055 array!75057 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) Int) ListLongMap!16597)

(assert (=> bm!56242 (= call!56245 (getCurrentListMapNoExtraKeys!4806 lt!522483 lt!522470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770626 () Bool)

(assert (=> start!99184 (=> (not res!770626) (not e!660724))))

(assert (=> start!99184 (= res!770626 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36709 _keys!1208))))))

(assert (=> start!99184 e!660724))

(declare-fun tp_is_empty!29083 () Bool)

(assert (=> start!99184 tp_is_empty!29083))

(declare-fun array_inv!27744 (array!75055) Bool)

(assert (=> start!99184 (array_inv!27744 _keys!1208)))

(assert (=> start!99184 true))

(assert (=> start!99184 tp!86370))

(declare-fun e!660723 () Bool)

(declare-fun array_inv!27745 (array!75057) Bool)

(assert (=> start!99184 (and (array_inv!27745 _values!996) e!660723)))

(declare-fun e!660728 () Bool)

(declare-fun lt!522472 () Bool)

(declare-fun b!1161746 () Bool)

(assert (=> b!1161746 (= e!660728 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522472) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56243 () Bool)

(declare-fun call!56249 () Bool)

(assert (=> bm!56243 (= call!56246 call!56249)))

(declare-fun bm!56244 () Bool)

(assert (=> bm!56244 (= call!56247 call!56244)))

(declare-fun b!1161747 () Bool)

(declare-fun e!660731 () Bool)

(declare-fun e!660733 () Bool)

(assert (=> b!1161747 (= e!660731 e!660733)))

(declare-fun res!770618 () Bool)

(assert (=> b!1161747 (=> res!770618 e!660733)))

(assert (=> b!1161747 (= res!770618 (not (= (select (arr!36172 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161747 e!660726))

(declare-fun c!116235 () Bool)

(assert (=> b!1161747 (= c!116235 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522467 () Unit!38245)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!643 (array!75055 array!75057 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38245)

(assert (=> b!1161747 (= lt!522467 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!643 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161748 () Bool)

(declare-fun e!660725 () Unit!38245)

(declare-fun Unit!38248 () Unit!38245)

(assert (=> b!1161748 (= e!660725 Unit!38248)))

(declare-fun b!1161749 () Bool)

(declare-fun res!770617 () Bool)

(assert (=> b!1161749 (=> (not res!770617) (not e!660724))))

(assert (=> b!1161749 (= res!770617 (and (= (size!36710 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36709 _keys!1208) (size!36710 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161750 () Bool)

(assert (=> b!1161750 (= e!660724 e!660732)))

(declare-fun res!770628 () Bool)

(assert (=> b!1161750 (=> (not res!770628) (not e!660732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75055 (_ BitVec 32)) Bool)

(assert (=> b!1161750 (= res!770628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522483 mask!1564))))

(assert (=> b!1161750 (= lt!522483 (array!75056 (store (arr!36172 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36709 _keys!1208)))))

(declare-fun b!1161751 () Bool)

(declare-fun e!660719 () Bool)

(assert (=> b!1161751 (= e!660723 (and e!660719 mapRes!45449))))

(declare-fun condMapEmpty!45449 () Bool)

(declare-fun mapDefault!45449 () ValueCell!13832)

(assert (=> b!1161751 (= condMapEmpty!45449 (= (arr!36173 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13832)) mapDefault!45449)))))

(declare-fun b!1161752 () Bool)

(declare-fun lt!522475 () ListLongMap!16597)

(declare-fun contains!6833 (ListLongMap!16597 (_ BitVec 64)) Bool)

(declare-fun +!3732 (ListLongMap!16597 tuple2!18620) ListLongMap!16597)

(assert (=> b!1161752 (contains!6833 (+!3732 lt!522475 (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522473 () Unit!38245)

(assert (=> b!1161752 (= lt!522473 (addStillContains!951 lt!522475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1161752 call!56249))

(assert (=> b!1161752 (= lt!522475 call!56248)))

(declare-fun lt!522468 () Unit!38245)

(assert (=> b!1161752 (= lt!522468 call!56244)))

(declare-fun e!660727 () Unit!38245)

(assert (=> b!1161752 (= e!660727 lt!522473)))

(declare-fun b!1161753 () Bool)

(assert (=> b!1161753 (= e!660721 tp_is_empty!29083)))

(declare-fun e!660729 () Bool)

(declare-fun lt!522484 () ListLongMap!16597)

(declare-fun b!1161754 () Bool)

(assert (=> b!1161754 (= e!660729 (= lt!522484 (getCurrentListMapNoExtraKeys!4806 lt!522483 lt!522470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161755 () Bool)

(assert (=> b!1161755 (= e!660719 tp_is_empty!29083)))

(declare-fun bm!56245 () Bool)

(assert (=> bm!56245 (= call!56248 (+!3732 lt!522476 (ite (or c!116234 c!116238) (tuple2!18621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1161756 () Bool)

(declare-fun e!660718 () Unit!38245)

(declare-fun lt!522486 () Unit!38245)

(assert (=> b!1161756 (= e!660718 lt!522486)))

(assert (=> b!1161756 (= lt!522486 call!56247)))

(assert (=> b!1161756 call!56246))

(declare-fun b!1161757 () Bool)

(declare-fun res!770620 () Bool)

(assert (=> b!1161757 (=> (not res!770620) (not e!660724))))

(assert (=> b!1161757 (= res!770620 (= (select (arr!36172 _keys!1208) i!673) k0!934))))

(declare-fun b!1161758 () Bool)

(declare-fun Unit!38249 () Unit!38245)

(assert (=> b!1161758 (= e!660725 Unit!38249)))

(assert (=> b!1161758 (= lt!522472 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161758 (= c!116234 (and (not lt!522472) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522474 () Unit!38245)

(assert (=> b!1161758 (= lt!522474 e!660727)))

(declare-fun lt!522478 () Unit!38245)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!538 (array!75055 array!75057 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 64) (_ BitVec 32) Int) Unit!38245)

(assert (=> b!1161758 (= lt!522478 (lemmaListMapContainsThenArrayContainsFrom!538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116233 () Bool)

(assert (=> b!1161758 (= c!116233 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770629 () Bool)

(assert (=> b!1161758 (= res!770629 e!660728)))

(assert (=> b!1161758 (=> (not res!770629) (not e!660722))))

(assert (=> b!1161758 e!660722))

(declare-fun lt!522482 () Unit!38245)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75055 (_ BitVec 32) (_ BitVec 32)) Unit!38245)

(assert (=> b!1161758 (= lt!522482 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161758 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25355)))

(declare-fun lt!522480 () Unit!38245)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75055 (_ BitVec 64) (_ BitVec 32) List!25358) Unit!38245)

(assert (=> b!1161758 (= lt!522480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25355))))

(assert (=> b!1161758 false))

(declare-fun b!1161759 () Bool)

(assert (=> b!1161759 (= e!660717 e!660731)))

(declare-fun res!770627 () Bool)

(assert (=> b!1161759 (=> res!770627 e!660731)))

(assert (=> b!1161759 (= res!770627 (not (= from!1455 i!673)))))

(declare-fun lt!522477 () ListLongMap!16597)

(assert (=> b!1161759 (= lt!522477 (getCurrentListMapNoExtraKeys!4806 lt!522483 lt!522470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522481 () V!43905)

(assert (=> b!1161759 (= lt!522470 (array!75058 (store (arr!36173 _values!996) i!673 (ValueCellFull!13832 lt!522481)) (size!36710 _values!996)))))

(declare-fun dynLambda!2808 (Int (_ BitVec 64)) V!43905)

(assert (=> b!1161759 (= lt!522481 (dynLambda!2808 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522469 () ListLongMap!16597)

(assert (=> b!1161759 (= lt!522469 (getCurrentListMapNoExtraKeys!4806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161760 () Bool)

(declare-fun res!770622 () Bool)

(assert (=> b!1161760 (=> (not res!770622) (not e!660724))))

(assert (=> b!1161760 (= res!770622 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36709 _keys!1208))))))

(declare-fun b!1161761 () Bool)

(assert (=> b!1161761 (= e!660718 e!660730)))

(declare-fun c!116236 () Bool)

(assert (=> b!1161761 (= c!116236 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522472))))

(declare-fun b!1161762 () Bool)

(assert (=> b!1161762 (= c!116238 (and (not lt!522472) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1161762 (= e!660727 e!660718)))

(declare-fun b!1161763 () Bool)

(declare-fun res!770619 () Bool)

(assert (=> b!1161763 (=> (not res!770619) (not e!660724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161763 (= res!770619 (validMask!0 mask!1564))))

(declare-fun b!1161764 () Bool)

(declare-fun res!770623 () Bool)

(assert (=> b!1161764 (=> (not res!770623) (not e!660724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161764 (= res!770623 (validKeyInArray!0 k0!934))))

(declare-fun b!1161765 () Bool)

(declare-fun -!1412 (ListLongMap!16597 (_ BitVec 64)) ListLongMap!16597)

(assert (=> b!1161765 (= e!660726 (= call!56245 (-!1412 call!56243 k0!934)))))

(declare-fun bm!56246 () Bool)

(assert (=> bm!56246 (= call!56249 (contains!6833 (ite c!116234 lt!522475 call!56250) k0!934))))

(declare-fun b!1161766 () Bool)

(assert (=> b!1161766 (= e!660733 true)))

(assert (=> b!1161766 e!660729))

(declare-fun res!770625 () Bool)

(assert (=> b!1161766 (=> (not res!770625) (not e!660729))))

(assert (=> b!1161766 (= res!770625 (= lt!522484 lt!522476))))

(assert (=> b!1161766 (= lt!522484 (-!1412 lt!522469 k0!934))))

(declare-fun lt!522487 () V!43905)

(assert (=> b!1161766 (= (-!1412 (+!3732 lt!522476 (tuple2!18621 (select (arr!36172 _keys!1208) from!1455) lt!522487)) (select (arr!36172 _keys!1208) from!1455)) lt!522476)))

(declare-fun lt!522466 () Unit!38245)

(declare-fun addThenRemoveForNewKeyIsSame!242 (ListLongMap!16597 (_ BitVec 64) V!43905) Unit!38245)

(assert (=> b!1161766 (= lt!522466 (addThenRemoveForNewKeyIsSame!242 lt!522476 (select (arr!36172 _keys!1208) from!1455) lt!522487))))

(declare-fun get!18471 (ValueCell!13832 V!43905) V!43905)

(assert (=> b!1161766 (= lt!522487 (get!18471 (select (arr!36173 _values!996) from!1455) lt!522481))))

(declare-fun lt!522485 () Unit!38245)

(assert (=> b!1161766 (= lt!522485 e!660725)))

(declare-fun c!116237 () Bool)

(assert (=> b!1161766 (= c!116237 (contains!6833 lt!522476 k0!934))))

(assert (=> b!1161766 (= lt!522476 (getCurrentListMapNoExtraKeys!4806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161767 () Bool)

(assert (=> b!1161767 (= e!660728 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161768 () Bool)

(declare-fun res!770630 () Bool)

(assert (=> b!1161768 (=> (not res!770630) (not e!660724))))

(assert (=> b!1161768 (= res!770630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56247 () Bool)

(assert (=> bm!56247 (= call!56243 (getCurrentListMapNoExtraKeys!4806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99184 res!770626) b!1161763))

(assert (= (and b!1161763 res!770619) b!1161749))

(assert (= (and b!1161749 res!770617) b!1161768))

(assert (= (and b!1161768 res!770630) b!1161739))

(assert (= (and b!1161739 res!770621) b!1161760))

(assert (= (and b!1161760 res!770622) b!1161764))

(assert (= (and b!1161764 res!770623) b!1161757))

(assert (= (and b!1161757 res!770620) b!1161750))

(assert (= (and b!1161750 res!770628) b!1161745))

(assert (= (and b!1161745 res!770624) b!1161740))

(assert (= (and b!1161740 (not res!770631)) b!1161759))

(assert (= (and b!1161759 (not res!770627)) b!1161747))

(assert (= (and b!1161747 c!116235) b!1161765))

(assert (= (and b!1161747 (not c!116235)) b!1161743))

(assert (= (or b!1161765 b!1161743) bm!56242))

(assert (= (or b!1161765 b!1161743) bm!56247))

(assert (= (and b!1161747 (not res!770618)) b!1161766))

(assert (= (and b!1161766 c!116237) b!1161758))

(assert (= (and b!1161766 (not c!116237)) b!1161748))

(assert (= (and b!1161758 c!116234) b!1161752))

(assert (= (and b!1161758 (not c!116234)) b!1161762))

(assert (= (and b!1161762 c!116238) b!1161756))

(assert (= (and b!1161762 (not c!116238)) b!1161761))

(assert (= (and b!1161761 c!116236) b!1161742))

(assert (= (and b!1161761 (not c!116236)) b!1161744))

(assert (= (or b!1161756 b!1161742) bm!56244))

(assert (= (or b!1161756 b!1161742) bm!56240))

(assert (= (or b!1161756 b!1161742) bm!56243))

(assert (= (or b!1161752 bm!56243) bm!56246))

(assert (= (or b!1161752 bm!56244) bm!56241))

(assert (= (or b!1161752 bm!56240) bm!56245))

(assert (= (and b!1161758 c!116233) b!1161767))

(assert (= (and b!1161758 (not c!116233)) b!1161746))

(assert (= (and b!1161758 res!770629) b!1161741))

(assert (= (and b!1161766 res!770625) b!1161754))

(assert (= (and b!1161751 condMapEmpty!45449) mapIsEmpty!45449))

(assert (= (and b!1161751 (not condMapEmpty!45449)) mapNonEmpty!45449))

(get-info :version)

(assert (= (and mapNonEmpty!45449 ((_ is ValueCellFull!13832) mapValue!45449)) b!1161753))

(assert (= (and b!1161751 ((_ is ValueCellFull!13832) mapDefault!45449)) b!1161755))

(assert (= start!99184 b!1161751))

(declare-fun b_lambda!19653 () Bool)

(assert (=> (not b_lambda!19653) (not b!1161759)))

(declare-fun t!36894 () Bool)

(declare-fun tb!9357 () Bool)

(assert (=> (and start!99184 (= defaultEntry!1004 defaultEntry!1004) t!36894) tb!9357))

(declare-fun result!19287 () Bool)

(assert (=> tb!9357 (= result!19287 tp_is_empty!29083)))

(assert (=> b!1161759 t!36894))

(declare-fun b_and!39959 () Bool)

(assert (= b_and!39957 (and (=> t!36894 result!19287) b_and!39959)))

(declare-fun m!1070969 () Bool)

(assert (=> b!1161765 m!1070969))

(declare-fun m!1070971 () Bool)

(assert (=> b!1161759 m!1070971))

(declare-fun m!1070973 () Bool)

(assert (=> b!1161759 m!1070973))

(declare-fun m!1070975 () Bool)

(assert (=> b!1161759 m!1070975))

(declare-fun m!1070977 () Bool)

(assert (=> b!1161759 m!1070977))

(declare-fun m!1070979 () Bool)

(assert (=> b!1161757 m!1070979))

(declare-fun m!1070981 () Bool)

(assert (=> b!1161768 m!1070981))

(declare-fun m!1070983 () Bool)

(assert (=> b!1161752 m!1070983))

(assert (=> b!1161752 m!1070983))

(declare-fun m!1070985 () Bool)

(assert (=> b!1161752 m!1070985))

(declare-fun m!1070987 () Bool)

(assert (=> b!1161752 m!1070987))

(declare-fun m!1070989 () Bool)

(assert (=> mapNonEmpty!45449 m!1070989))

(declare-fun m!1070991 () Bool)

(assert (=> b!1161745 m!1070991))

(declare-fun m!1070993 () Bool)

(assert (=> b!1161767 m!1070993))

(declare-fun m!1070995 () Bool)

(assert (=> b!1161747 m!1070995))

(declare-fun m!1070997 () Bool)

(assert (=> b!1161747 m!1070997))

(declare-fun m!1070999 () Bool)

(assert (=> bm!56242 m!1070999))

(declare-fun m!1071001 () Bool)

(assert (=> bm!56245 m!1071001))

(declare-fun m!1071003 () Bool)

(assert (=> b!1161764 m!1071003))

(declare-fun m!1071005 () Bool)

(assert (=> bm!56241 m!1071005))

(assert (=> b!1161754 m!1070999))

(declare-fun m!1071007 () Bool)

(assert (=> b!1161739 m!1071007))

(declare-fun m!1071009 () Bool)

(assert (=> start!99184 m!1071009))

(declare-fun m!1071011 () Bool)

(assert (=> start!99184 m!1071011))

(declare-fun m!1071013 () Bool)

(assert (=> b!1161740 m!1071013))

(declare-fun m!1071015 () Bool)

(assert (=> b!1161740 m!1071015))

(declare-fun m!1071017 () Bool)

(assert (=> b!1161750 m!1071017))

(declare-fun m!1071019 () Bool)

(assert (=> b!1161750 m!1071019))

(declare-fun m!1071021 () Bool)

(assert (=> b!1161766 m!1071021))

(declare-fun m!1071023 () Bool)

(assert (=> b!1161766 m!1071023))

(declare-fun m!1071025 () Bool)

(assert (=> b!1161766 m!1071025))

(declare-fun m!1071027 () Bool)

(assert (=> b!1161766 m!1071027))

(declare-fun m!1071029 () Bool)

(assert (=> b!1161766 m!1071029))

(assert (=> b!1161766 m!1071027))

(assert (=> b!1161766 m!1070995))

(declare-fun m!1071031 () Bool)

(assert (=> b!1161766 m!1071031))

(assert (=> b!1161766 m!1071023))

(declare-fun m!1071033 () Bool)

(assert (=> b!1161766 m!1071033))

(assert (=> b!1161766 m!1070995))

(declare-fun m!1071035 () Bool)

(assert (=> b!1161766 m!1071035))

(assert (=> b!1161766 m!1070995))

(assert (=> b!1161741 m!1070993))

(declare-fun m!1071037 () Bool)

(assert (=> b!1161763 m!1071037))

(assert (=> bm!56247 m!1071021))

(declare-fun m!1071039 () Bool)

(assert (=> bm!56246 m!1071039))

(declare-fun m!1071041 () Bool)

(assert (=> b!1161758 m!1071041))

(declare-fun m!1071043 () Bool)

(assert (=> b!1161758 m!1071043))

(declare-fun m!1071045 () Bool)

(assert (=> b!1161758 m!1071045))

(declare-fun m!1071047 () Bool)

(assert (=> b!1161758 m!1071047))

(check-sat (not b!1161739) (not bm!56245) (not bm!56242) (not bm!56247) (not b_lambda!19653) (not b!1161765) (not b!1161766) tp_is_empty!29083 (not b!1161752) (not b!1161740) (not b!1161764) b_and!39959 (not start!99184) (not b!1161763) (not b_next!24553) (not b!1161741) (not b!1161745) (not bm!56246) (not b!1161767) (not mapNonEmpty!45449) (not bm!56241) (not b!1161754) (not b!1161758) (not b!1161768) (not b!1161747) (not b!1161750) (not b!1161759))
(check-sat b_and!39959 (not b_next!24553))
