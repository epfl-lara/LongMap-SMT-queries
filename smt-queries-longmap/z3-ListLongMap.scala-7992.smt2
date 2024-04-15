; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98786 () Bool)

(assert start!98786)

(declare-fun b_free!24397 () Bool)

(declare-fun b_next!24397 () Bool)

(assert (=> start!98786 (= b_free!24397 (not b_next!24397))))

(declare-fun tp!85901 () Bool)

(declare-fun b_and!39621 () Bool)

(assert (=> start!98786 (= tp!85901 b_and!39621)))

(declare-datatypes ((V!43697 0))(
  ( (V!43698 (val!14520 Int)) )
))
(declare-fun zeroValue!944 () V!43697)

(declare-fun b!1153150 () Bool)

(declare-fun e!655840 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13754 0))(
  ( (ValueCellFull!13754 (v!17156 V!43697)) (EmptyCell!13754) )
))
(declare-datatypes ((array!74618 0))(
  ( (array!74619 (arr!35960 (Array (_ BitVec 32) ValueCell!13754)) (size!36498 (_ BitVec 32))) )
))
(declare-fun lt!516655 () array!74618)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43697)

(declare-datatypes ((array!74620 0))(
  ( (array!74621 (arr!35961 (Array (_ BitVec 32) (_ BitVec 64))) (size!36499 (_ BitVec 32))) )
))
(declare-fun lt!516648 () array!74620)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18524 0))(
  ( (tuple2!18525 (_1!9273 (_ BitVec 64)) (_2!9273 V!43697)) )
))
(declare-datatypes ((List!25254 0))(
  ( (Nil!25251) (Cons!25250 (h!26459 tuple2!18524) (t!36634 List!25254)) )
))
(declare-datatypes ((ListLongMap!16493 0))(
  ( (ListLongMap!16494 (toList!8262 List!25254)) )
))
(declare-fun lt!516662 () ListLongMap!16493)

(declare-fun getCurrentListMapNoExtraKeys!4744 (array!74620 array!74618 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 32) Int) ListLongMap!16493)

(assert (=> b!1153150 (= e!655840 (= lt!516662 (getCurrentListMapNoExtraKeys!4744 lt!516648 lt!516655 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153151 () Bool)

(declare-fun call!54289 () Bool)

(assert (=> b!1153151 call!54289))

(declare-datatypes ((Unit!37782 0))(
  ( (Unit!37783) )
))
(declare-fun lt!516644 () Unit!37782)

(declare-fun call!54285 () Unit!37782)

(assert (=> b!1153151 (= lt!516644 call!54285)))

(declare-fun e!655835 () Unit!37782)

(assert (=> b!1153151 (= e!655835 lt!516644)))

(declare-fun mapIsEmpty!45215 () Bool)

(declare-fun mapRes!45215 () Bool)

(assert (=> mapIsEmpty!45215 mapRes!45215))

(declare-fun call!54290 () ListLongMap!16493)

(declare-fun bm!54280 () Bool)

(assert (=> bm!54280 (= call!54290 (getCurrentListMapNoExtraKeys!4744 lt!516648 lt!516655 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153153 () Bool)

(declare-fun e!655838 () Bool)

(declare-fun e!655836 () Bool)

(assert (=> b!1153153 (= e!655838 e!655836)))

(declare-fun res!766536 () Bool)

(assert (=> b!1153153 (=> res!766536 e!655836)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153153 (= res!766536 (not (= from!1455 i!673)))))

(declare-fun lt!516663 () ListLongMap!16493)

(assert (=> b!1153153 (= lt!516663 (getCurrentListMapNoExtraKeys!4744 lt!516648 lt!516655 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74618)

(declare-fun lt!516651 () V!43697)

(assert (=> b!1153153 (= lt!516655 (array!74619 (store (arr!35960 _values!996) i!673 (ValueCellFull!13754 lt!516651)) (size!36498 _values!996)))))

(declare-fun dynLambda!2704 (Int (_ BitVec 64)) V!43697)

(assert (=> b!1153153 (= lt!516651 (dynLambda!2704 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74620)

(declare-fun lt!516660 () ListLongMap!16493)

(assert (=> b!1153153 (= lt!516660 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153154 () Bool)

(declare-fun e!655841 () Bool)

(assert (=> b!1153154 (= e!655841 (not e!655838))))

(declare-fun res!766542 () Bool)

(assert (=> b!1153154 (=> res!766542 e!655838)))

(assert (=> b!1153154 (= res!766542 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153154 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516647 () Unit!37782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74620 (_ BitVec 64) (_ BitVec 32)) Unit!37782)

(assert (=> b!1153154 (= lt!516647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153155 () Bool)

(declare-fun e!655831 () Unit!37782)

(declare-fun Unit!37784 () Unit!37782)

(assert (=> b!1153155 (= e!655831 Unit!37784)))

(declare-fun lt!516657 () Bool)

(assert (=> b!1153155 (= lt!516657 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114410 () Bool)

(assert (=> b!1153155 (= c!114410 (and (not lt!516657) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516656 () Unit!37782)

(declare-fun e!655832 () Unit!37782)

(assert (=> b!1153155 (= lt!516656 e!655832)))

(declare-fun lt!516646 () Unit!37782)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!473 (array!74620 array!74618 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 64) (_ BitVec 32) Int) Unit!37782)

(assert (=> b!1153155 (= lt!516646 (lemmaListMapContainsThenArrayContainsFrom!473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114407 () Bool)

(assert (=> b!1153155 (= c!114407 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766538 () Bool)

(declare-fun e!655829 () Bool)

(assert (=> b!1153155 (= res!766538 e!655829)))

(declare-fun e!655843 () Bool)

(assert (=> b!1153155 (=> (not res!766538) (not e!655843))))

(assert (=> b!1153155 e!655843))

(declare-fun lt!516652 () Unit!37782)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74620 (_ BitVec 32) (_ BitVec 32)) Unit!37782)

(assert (=> b!1153155 (= lt!516652 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25255 0))(
  ( (Nil!25252) (Cons!25251 (h!26460 (_ BitVec 64)) (t!36635 List!25255)) )
))
(declare-fun arrayNoDuplicates!0 (array!74620 (_ BitVec 32) List!25255) Bool)

(assert (=> b!1153155 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25252)))

(declare-fun lt!516653 () Unit!37782)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74620 (_ BitVec 64) (_ BitVec 32) List!25255) Unit!37782)

(assert (=> b!1153155 (= lt!516653 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25252))))

(assert (=> b!1153155 false))

(declare-fun bm!54281 () Bool)

(declare-fun call!54288 () ListLongMap!16493)

(declare-fun call!54284 () ListLongMap!16493)

(assert (=> bm!54281 (= call!54288 call!54284)))

(declare-fun bm!54282 () Bool)

(declare-fun call!54283 () Bool)

(assert (=> bm!54282 (= call!54289 call!54283)))

(declare-fun b!1153156 () Bool)

(assert (=> b!1153156 (= e!655829 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153157 () Bool)

(declare-fun e!655845 () Unit!37782)

(assert (=> b!1153157 (= e!655845 e!655835)))

(declare-fun c!114405 () Bool)

(assert (=> b!1153157 (= c!114405 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516657))))

(declare-fun b!1153158 () Bool)

(declare-fun res!766535 () Bool)

(declare-fun e!655844 () Bool)

(assert (=> b!1153158 (=> (not res!766535) (not e!655844))))

(assert (=> b!1153158 (= res!766535 (and (= (size!36498 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36499 _keys!1208) (size!36498 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153159 () Bool)

(declare-fun e!655842 () Bool)

(declare-fun tp_is_empty!28927 () Bool)

(assert (=> b!1153159 (= e!655842 tp_is_empty!28927)))

(declare-fun b!1153160 () Bool)

(declare-fun Unit!37785 () Unit!37782)

(assert (=> b!1153160 (= e!655835 Unit!37785)))

(declare-fun call!54287 () ListLongMap!16493)

(declare-fun b!1153161 () Bool)

(declare-fun e!655834 () Bool)

(declare-fun -!1323 (ListLongMap!16493 (_ BitVec 64)) ListLongMap!16493)

(assert (=> b!1153161 (= e!655834 (= call!54290 (-!1323 call!54287 k0!934)))))

(declare-fun lt!516661 () ListLongMap!16493)

(declare-fun bm!54283 () Bool)

(declare-fun c!114406 () Bool)

(declare-fun +!3674 (ListLongMap!16493 tuple2!18524) ListLongMap!16493)

(assert (=> bm!54283 (= call!54284 (+!3674 lt!516661 (ite (or c!114410 c!114406) (tuple2!18525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1153162 () Bool)

(declare-fun e!655833 () Bool)

(assert (=> b!1153162 (= e!655836 e!655833)))

(declare-fun res!766539 () Bool)

(assert (=> b!1153162 (=> res!766539 e!655833)))

(assert (=> b!1153162 (= res!766539 (not (= (select (arr!35961 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153162 e!655834))

(declare-fun c!114408 () Bool)

(assert (=> b!1153162 (= c!114408 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516659 () Unit!37782)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 (array!74620 array!74618 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37782)

(assert (=> b!1153162 (= lt!516659 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!516658 () ListLongMap!16493)

(declare-fun bm!54284 () Bool)

(declare-fun contains!6715 (ListLongMap!16493 (_ BitVec 64)) Bool)

(assert (=> bm!54284 (= call!54283 (contains!6715 (ite c!114410 lt!516658 call!54288) k0!934))))

(declare-fun b!1153163 () Bool)

(assert (=> b!1153163 (= c!114406 (and (not lt!516657) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153163 (= e!655832 e!655845)))

(declare-fun b!1153164 () Bool)

(assert (=> b!1153164 (= e!655843 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153152 () Bool)

(declare-fun res!766547 () Bool)

(assert (=> b!1153152 (=> (not res!766547) (not e!655841))))

(assert (=> b!1153152 (= res!766547 (arrayNoDuplicates!0 lt!516648 #b00000000000000000000000000000000 Nil!25252))))

(declare-fun res!766537 () Bool)

(assert (=> start!98786 (=> (not res!766537) (not e!655844))))

(assert (=> start!98786 (= res!766537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36499 _keys!1208))))))

(assert (=> start!98786 e!655844))

(assert (=> start!98786 tp_is_empty!28927))

(declare-fun array_inv!27628 (array!74620) Bool)

(assert (=> start!98786 (array_inv!27628 _keys!1208)))

(assert (=> start!98786 true))

(assert (=> start!98786 tp!85901))

(declare-fun e!655837 () Bool)

(declare-fun array_inv!27629 (array!74618) Bool)

(assert (=> start!98786 (and (array_inv!27629 _values!996) e!655837)))

(declare-fun b!1153165 () Bool)

(assert (=> b!1153165 (= e!655829 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516657) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153166 () Bool)

(declare-fun res!766541 () Bool)

(assert (=> b!1153166 (=> (not res!766541) (not e!655844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153166 (= res!766541 (validKeyInArray!0 k0!934))))

(declare-fun call!54286 () Unit!37782)

(declare-fun bm!54285 () Bool)

(declare-fun addStillContains!885 (ListLongMap!16493 (_ BitVec 64) V!43697 (_ BitVec 64)) Unit!37782)

(assert (=> bm!54285 (= call!54286 (addStillContains!885 lt!516661 (ite (or c!114410 c!114406) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114410 c!114406) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapNonEmpty!45215 () Bool)

(declare-fun tp!85902 () Bool)

(assert (=> mapNonEmpty!45215 (= mapRes!45215 (and tp!85902 e!655842))))

(declare-fun mapKey!45215 () (_ BitVec 32))

(declare-fun mapRest!45215 () (Array (_ BitVec 32) ValueCell!13754))

(declare-fun mapValue!45215 () ValueCell!13754)

(assert (=> mapNonEmpty!45215 (= (arr!35960 _values!996) (store mapRest!45215 mapKey!45215 mapValue!45215))))

(declare-fun b!1153167 () Bool)

(assert (=> b!1153167 (= e!655844 e!655841)))

(declare-fun res!766544 () Bool)

(assert (=> b!1153167 (=> (not res!766544) (not e!655841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74620 (_ BitVec 32)) Bool)

(assert (=> b!1153167 (= res!766544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516648 mask!1564))))

(assert (=> b!1153167 (= lt!516648 (array!74621 (store (arr!35961 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36499 _keys!1208)))))

(declare-fun b!1153168 () Bool)

(declare-fun res!766546 () Bool)

(assert (=> b!1153168 (=> (not res!766546) (not e!655844))))

(assert (=> b!1153168 (= res!766546 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36499 _keys!1208))))))

(declare-fun b!1153169 () Bool)

(declare-fun e!655839 () Bool)

(assert (=> b!1153169 (= e!655839 tp_is_empty!28927)))

(declare-fun bm!54286 () Bool)

(assert (=> bm!54286 (= call!54285 call!54286)))

(declare-fun b!1153170 () Bool)

(assert (=> b!1153170 (= e!655834 (= call!54290 call!54287))))

(declare-fun bm!54287 () Bool)

(assert (=> bm!54287 (= call!54287 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153171 () Bool)

(declare-fun res!766543 () Bool)

(assert (=> b!1153171 (=> (not res!766543) (not e!655844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153171 (= res!766543 (validMask!0 mask!1564))))

(declare-fun b!1153172 () Bool)

(declare-fun res!766540 () Bool)

(assert (=> b!1153172 (=> (not res!766540) (not e!655844))))

(assert (=> b!1153172 (= res!766540 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25252))))

(declare-fun b!1153173 () Bool)

(declare-fun Unit!37786 () Unit!37782)

(assert (=> b!1153173 (= e!655831 Unit!37786)))

(declare-fun b!1153174 () Bool)

(assert (=> b!1153174 (= e!655833 true)))

(assert (=> b!1153174 e!655840))

(declare-fun res!766533 () Bool)

(assert (=> b!1153174 (=> (not res!766533) (not e!655840))))

(assert (=> b!1153174 (= res!766533 (= lt!516662 lt!516661))))

(assert (=> b!1153174 (= lt!516662 (-!1323 lt!516660 k0!934))))

(declare-fun lt!516650 () V!43697)

(assert (=> b!1153174 (= (-!1323 (+!3674 lt!516661 (tuple2!18525 (select (arr!35961 _keys!1208) from!1455) lt!516650)) (select (arr!35961 _keys!1208) from!1455)) lt!516661)))

(declare-fun lt!516643 () Unit!37782)

(declare-fun addThenRemoveForNewKeyIsSame!178 (ListLongMap!16493 (_ BitVec 64) V!43697) Unit!37782)

(assert (=> b!1153174 (= lt!516643 (addThenRemoveForNewKeyIsSame!178 lt!516661 (select (arr!35961 _keys!1208) from!1455) lt!516650))))

(declare-fun get!18324 (ValueCell!13754 V!43697) V!43697)

(assert (=> b!1153174 (= lt!516650 (get!18324 (select (arr!35960 _values!996) from!1455) lt!516651))))

(declare-fun lt!516642 () Unit!37782)

(assert (=> b!1153174 (= lt!516642 e!655831)))

(declare-fun c!114409 () Bool)

(assert (=> b!1153174 (= c!114409 (contains!6715 lt!516661 k0!934))))

(assert (=> b!1153174 (= lt!516661 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153175 () Bool)

(declare-fun lt!516645 () Unit!37782)

(assert (=> b!1153175 (= e!655845 lt!516645)))

(assert (=> b!1153175 (= lt!516645 call!54285)))

(assert (=> b!1153175 call!54289))

(declare-fun b!1153176 () Bool)

(declare-fun res!766545 () Bool)

(assert (=> b!1153176 (=> (not res!766545) (not e!655844))))

(assert (=> b!1153176 (= res!766545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153177 () Bool)

(declare-fun res!766534 () Bool)

(assert (=> b!1153177 (=> (not res!766534) (not e!655844))))

(assert (=> b!1153177 (= res!766534 (= (select (arr!35961 _keys!1208) i!673) k0!934))))

(declare-fun b!1153178 () Bool)

(assert (=> b!1153178 (contains!6715 (+!3674 lt!516658 (tuple2!18525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516649 () Unit!37782)

(assert (=> b!1153178 (= lt!516649 (addStillContains!885 lt!516658 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1153178 call!54283))

(assert (=> b!1153178 (= lt!516658 call!54284)))

(declare-fun lt!516654 () Unit!37782)

(assert (=> b!1153178 (= lt!516654 call!54286)))

(assert (=> b!1153178 (= e!655832 lt!516649)))

(declare-fun b!1153179 () Bool)

(assert (=> b!1153179 (= e!655837 (and e!655839 mapRes!45215))))

(declare-fun condMapEmpty!45215 () Bool)

(declare-fun mapDefault!45215 () ValueCell!13754)

(assert (=> b!1153179 (= condMapEmpty!45215 (= (arr!35960 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13754)) mapDefault!45215)))))

(assert (= (and start!98786 res!766537) b!1153171))

(assert (= (and b!1153171 res!766543) b!1153158))

(assert (= (and b!1153158 res!766535) b!1153176))

(assert (= (and b!1153176 res!766545) b!1153172))

(assert (= (and b!1153172 res!766540) b!1153168))

(assert (= (and b!1153168 res!766546) b!1153166))

(assert (= (and b!1153166 res!766541) b!1153177))

(assert (= (and b!1153177 res!766534) b!1153167))

(assert (= (and b!1153167 res!766544) b!1153152))

(assert (= (and b!1153152 res!766547) b!1153154))

(assert (= (and b!1153154 (not res!766542)) b!1153153))

(assert (= (and b!1153153 (not res!766536)) b!1153162))

(assert (= (and b!1153162 c!114408) b!1153161))

(assert (= (and b!1153162 (not c!114408)) b!1153170))

(assert (= (or b!1153161 b!1153170) bm!54280))

(assert (= (or b!1153161 b!1153170) bm!54287))

(assert (= (and b!1153162 (not res!766539)) b!1153174))

(assert (= (and b!1153174 c!114409) b!1153155))

(assert (= (and b!1153174 (not c!114409)) b!1153173))

(assert (= (and b!1153155 c!114410) b!1153178))

(assert (= (and b!1153155 (not c!114410)) b!1153163))

(assert (= (and b!1153163 c!114406) b!1153175))

(assert (= (and b!1153163 (not c!114406)) b!1153157))

(assert (= (and b!1153157 c!114405) b!1153151))

(assert (= (and b!1153157 (not c!114405)) b!1153160))

(assert (= (or b!1153175 b!1153151) bm!54286))

(assert (= (or b!1153175 b!1153151) bm!54281))

(assert (= (or b!1153175 b!1153151) bm!54282))

(assert (= (or b!1153178 bm!54282) bm!54284))

(assert (= (or b!1153178 bm!54286) bm!54285))

(assert (= (or b!1153178 bm!54281) bm!54283))

(assert (= (and b!1153155 c!114407) b!1153156))

(assert (= (and b!1153155 (not c!114407)) b!1153165))

(assert (= (and b!1153155 res!766538) b!1153164))

(assert (= (and b!1153174 res!766533) b!1153150))

(assert (= (and b!1153179 condMapEmpty!45215) mapIsEmpty!45215))

(assert (= (and b!1153179 (not condMapEmpty!45215)) mapNonEmpty!45215))

(get-info :version)

(assert (= (and mapNonEmpty!45215 ((_ is ValueCellFull!13754) mapValue!45215)) b!1153159))

(assert (= (and b!1153179 ((_ is ValueCellFull!13754) mapDefault!45215)) b!1153169))

(assert (= start!98786 b!1153179))

(declare-fun b_lambda!19485 () Bool)

(assert (=> (not b_lambda!19485) (not b!1153153)))

(declare-fun t!36633 () Bool)

(declare-fun tb!9201 () Bool)

(assert (=> (and start!98786 (= defaultEntry!1004 defaultEntry!1004) t!36633) tb!9201))

(declare-fun result!18975 () Bool)

(assert (=> tb!9201 (= result!18975 tp_is_empty!28927)))

(assert (=> b!1153153 t!36633))

(declare-fun b_and!39623 () Bool)

(assert (= b_and!39621 (and (=> t!36633 result!18975) b_and!39623)))

(declare-fun m!1062547 () Bool)

(assert (=> bm!54284 m!1062547))

(declare-fun m!1062549 () Bool)

(assert (=> bm!54285 m!1062549))

(declare-fun m!1062551 () Bool)

(assert (=> b!1153150 m!1062551))

(declare-fun m!1062553 () Bool)

(assert (=> bm!54287 m!1062553))

(declare-fun m!1062555 () Bool)

(assert (=> b!1153164 m!1062555))

(assert (=> bm!54280 m!1062551))

(declare-fun m!1062557 () Bool)

(assert (=> b!1153172 m!1062557))

(declare-fun m!1062559 () Bool)

(assert (=> bm!54283 m!1062559))

(declare-fun m!1062561 () Bool)

(assert (=> b!1153162 m!1062561))

(declare-fun m!1062563 () Bool)

(assert (=> b!1153162 m!1062563))

(declare-fun m!1062565 () Bool)

(assert (=> b!1153152 m!1062565))

(declare-fun m!1062567 () Bool)

(assert (=> start!98786 m!1062567))

(declare-fun m!1062569 () Bool)

(assert (=> start!98786 m!1062569))

(declare-fun m!1062571 () Bool)

(assert (=> b!1153166 m!1062571))

(declare-fun m!1062573 () Bool)

(assert (=> b!1153178 m!1062573))

(assert (=> b!1153178 m!1062573))

(declare-fun m!1062575 () Bool)

(assert (=> b!1153178 m!1062575))

(declare-fun m!1062577 () Bool)

(assert (=> b!1153178 m!1062577))

(declare-fun m!1062579 () Bool)

(assert (=> b!1153176 m!1062579))

(assert (=> b!1153156 m!1062555))

(declare-fun m!1062581 () Bool)

(assert (=> b!1153161 m!1062581))

(declare-fun m!1062583 () Bool)

(assert (=> b!1153171 m!1062583))

(declare-fun m!1062585 () Bool)

(assert (=> mapNonEmpty!45215 m!1062585))

(declare-fun m!1062587 () Bool)

(assert (=> b!1153153 m!1062587))

(declare-fun m!1062589 () Bool)

(assert (=> b!1153153 m!1062589))

(declare-fun m!1062591 () Bool)

(assert (=> b!1153153 m!1062591))

(declare-fun m!1062593 () Bool)

(assert (=> b!1153153 m!1062593))

(assert (=> b!1153174 m!1062553))

(declare-fun m!1062595 () Bool)

(assert (=> b!1153174 m!1062595))

(declare-fun m!1062597 () Bool)

(assert (=> b!1153174 m!1062597))

(declare-fun m!1062599 () Bool)

(assert (=> b!1153174 m!1062599))

(declare-fun m!1062601 () Bool)

(assert (=> b!1153174 m!1062601))

(assert (=> b!1153174 m!1062561))

(declare-fun m!1062603 () Bool)

(assert (=> b!1153174 m!1062603))

(assert (=> b!1153174 m!1062561))

(assert (=> b!1153174 m!1062595))

(declare-fun m!1062605 () Bool)

(assert (=> b!1153174 m!1062605))

(assert (=> b!1153174 m!1062601))

(assert (=> b!1153174 m!1062561))

(declare-fun m!1062607 () Bool)

(assert (=> b!1153174 m!1062607))

(declare-fun m!1062609 () Bool)

(assert (=> b!1153167 m!1062609))

(declare-fun m!1062611 () Bool)

(assert (=> b!1153167 m!1062611))

(declare-fun m!1062613 () Bool)

(assert (=> b!1153154 m!1062613))

(declare-fun m!1062615 () Bool)

(assert (=> b!1153154 m!1062615))

(declare-fun m!1062617 () Bool)

(assert (=> b!1153155 m!1062617))

(declare-fun m!1062619 () Bool)

(assert (=> b!1153155 m!1062619))

(declare-fun m!1062621 () Bool)

(assert (=> b!1153155 m!1062621))

(declare-fun m!1062623 () Bool)

(assert (=> b!1153155 m!1062623))

(declare-fun m!1062625 () Bool)

(assert (=> b!1153177 m!1062625))

(check-sat (not b!1153171) (not b!1153154) (not b_next!24397) (not start!98786) (not b!1153152) (not b!1153155) (not b!1153164) (not b!1153176) (not b_lambda!19485) (not b!1153153) (not b!1153162) (not bm!54280) (not bm!54285) (not b!1153150) (not bm!54284) (not b!1153178) b_and!39623 (not bm!54287) (not bm!54283) (not b!1153167) (not mapNonEmpty!45215) tp_is_empty!28927 (not b!1153156) (not b!1153172) (not b!1153166) (not b!1153174) (not b!1153161))
(check-sat b_and!39623 (not b_next!24397))
