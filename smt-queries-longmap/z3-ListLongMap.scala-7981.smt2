; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98962 () Bool)

(assert start!98962)

(declare-fun b_free!24331 () Bool)

(declare-fun b_next!24331 () Bool)

(assert (=> start!98962 (= b_free!24331 (not b_next!24331))))

(declare-fun tp!85703 () Bool)

(declare-fun b_and!39513 () Bool)

(assert (=> start!98962 (= tp!85703 b_and!39513)))

(declare-fun b!1151527 () Bool)

(declare-fun res!765625 () Bool)

(declare-fun e!655070 () Bool)

(assert (=> b!1151527 (=> (not res!765625) (not e!655070))))

(declare-datatypes ((array!74615 0))(
  ( (array!74616 (arr!35952 (Array (_ BitVec 32) (_ BitVec 64))) (size!36489 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74615)

(declare-datatypes ((List!25153 0))(
  ( (Nil!25150) (Cons!25149 (h!26367 (_ BitVec 64)) (t!36468 List!25153)) )
))
(declare-fun arrayNoDuplicates!0 (array!74615 (_ BitVec 32) List!25153) Bool)

(assert (=> b!1151527 (= res!765625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25150))))

(declare-fun b!1151528 () Bool)

(declare-datatypes ((Unit!37800 0))(
  ( (Unit!37801) )
))
(declare-fun e!655058 () Unit!37800)

(declare-fun Unit!37802 () Unit!37800)

(assert (=> b!1151528 (= e!655058 Unit!37802)))

(declare-fun b!1151529 () Bool)

(declare-fun e!655069 () Unit!37800)

(declare-fun e!655064 () Unit!37800)

(assert (=> b!1151529 (= e!655069 e!655064)))

(declare-fun c!114240 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!515150 () Bool)

(assert (=> b!1151529 (= c!114240 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515150))))

(declare-datatypes ((V!43609 0))(
  ( (V!43610 (val!14487 Int)) )
))
(declare-fun zeroValue!944 () V!43609)

(declare-fun bm!53576 () Bool)

(declare-datatypes ((tuple2!18400 0))(
  ( (tuple2!18401 (_1!9211 (_ BitVec 64)) (_2!9211 V!43609)) )
))
(declare-datatypes ((List!25154 0))(
  ( (Nil!25151) (Cons!25150 (h!26368 tuple2!18400) (t!36469 List!25154)) )
))
(declare-datatypes ((ListLongMap!16377 0))(
  ( (ListLongMap!16378 (toList!8204 List!25154)) )
))
(declare-fun lt!515156 () ListLongMap!16377)

(declare-fun c!114239 () Bool)

(declare-fun c!114236 () Bool)

(declare-fun call!53584 () ListLongMap!16377)

(declare-fun minValue!944 () V!43609)

(declare-fun +!3642 (ListLongMap!16377 tuple2!18400) ListLongMap!16377)

(assert (=> bm!53576 (= call!53584 (+!3642 lt!515156 (ite (or c!114236 c!114239) (tuple2!18401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1151530 () Bool)

(assert (=> b!1151530 (= c!114239 (and (not lt!515150) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655059 () Unit!37800)

(assert (=> b!1151530 (= e!655059 e!655069)))

(declare-fun b!1151531 () Bool)

(declare-fun res!765631 () Bool)

(assert (=> b!1151531 (=> (not res!765631) (not e!655070))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74615 (_ BitVec 32)) Bool)

(assert (=> b!1151531 (= res!765631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151532 () Bool)

(declare-fun lt!515147 () ListLongMap!16377)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6739 (ListLongMap!16377 (_ BitVec 64)) Bool)

(assert (=> b!1151532 (contains!6739 (+!3642 lt!515147 (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!515151 () Unit!37800)

(declare-fun addStillContains!866 (ListLongMap!16377 (_ BitVec 64) V!43609 (_ BitVec 64)) Unit!37800)

(assert (=> b!1151532 (= lt!515151 (addStillContains!866 lt!515147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53580 () Bool)

(assert (=> b!1151532 call!53580))

(assert (=> b!1151532 (= lt!515147 call!53584)))

(declare-fun lt!515152 () Unit!37800)

(declare-fun call!53586 () Unit!37800)

(assert (=> b!1151532 (= lt!515152 call!53586)))

(assert (=> b!1151532 (= e!655059 lt!515151)))

(declare-fun mapNonEmpty!45116 () Bool)

(declare-fun mapRes!45116 () Bool)

(declare-fun tp!85704 () Bool)

(declare-fun e!655060 () Bool)

(assert (=> mapNonEmpty!45116 (= mapRes!45116 (and tp!85704 e!655060))))

(declare-fun mapKey!45116 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13721 0))(
  ( (ValueCellFull!13721 (v!17120 V!43609)) (EmptyCell!13721) )
))
(declare-fun mapRest!45116 () (Array (_ BitVec 32) ValueCell!13721))

(declare-datatypes ((array!74617 0))(
  ( (array!74618 (arr!35953 (Array (_ BitVec 32) ValueCell!13721)) (size!36490 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74617)

(declare-fun mapValue!45116 () ValueCell!13721)

(assert (=> mapNonEmpty!45116 (= (arr!35953 _values!996) (store mapRest!45116 mapKey!45116 mapValue!45116))))

(declare-fun b!1151533 () Bool)

(declare-fun lt!515159 () Unit!37800)

(assert (=> b!1151533 (= e!655069 lt!515159)))

(declare-fun call!53583 () Unit!37800)

(assert (=> b!1151533 (= lt!515159 call!53583)))

(declare-fun call!53585 () Bool)

(assert (=> b!1151533 call!53585))

(declare-fun bm!53577 () Bool)

(declare-fun call!53582 () ListLongMap!16377)

(assert (=> bm!53577 (= call!53582 call!53584)))

(declare-fun b!1151534 () Bool)

(declare-fun tp_is_empty!28861 () Bool)

(assert (=> b!1151534 (= e!655060 tp_is_empty!28861)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!53578 () Bool)

(declare-fun call!53579 () ListLongMap!16377)

(declare-fun getCurrentListMapNoExtraKeys!4704 (array!74615 array!74617 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) Int) ListLongMap!16377)

(assert (=> bm!53578 (= call!53579 (getCurrentListMapNoExtraKeys!4704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151535 () Bool)

(declare-fun e!655066 () Bool)

(declare-fun e!655061 () Bool)

(assert (=> b!1151535 (= e!655066 e!655061)))

(declare-fun res!765636 () Bool)

(assert (=> b!1151535 (=> res!765636 e!655061)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151535 (= res!765636 (not (= from!1455 i!673)))))

(declare-fun lt!515149 () ListLongMap!16377)

(declare-fun lt!515141 () array!74615)

(declare-fun lt!515146 () array!74617)

(assert (=> b!1151535 (= lt!515149 (getCurrentListMapNoExtraKeys!4704 lt!515141 lt!515146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515148 () V!43609)

(assert (=> b!1151535 (= lt!515146 (array!74618 (store (arr!35953 _values!996) i!673 (ValueCellFull!13721 lt!515148)) (size!36490 _values!996)))))

(declare-fun dynLambda!2727 (Int (_ BitVec 64)) V!43609)

(assert (=> b!1151535 (= lt!515148 (dynLambda!2727 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515143 () ListLongMap!16377)

(assert (=> b!1151535 (= lt!515143 (getCurrentListMapNoExtraKeys!4704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!655057 () Bool)

(declare-fun b!1151536 () Bool)

(declare-fun lt!515160 () ListLongMap!16377)

(assert (=> b!1151536 (= e!655057 (= lt!515160 (getCurrentListMapNoExtraKeys!4704 lt!515141 lt!515146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151537 () Bool)

(declare-fun res!765630 () Bool)

(assert (=> b!1151537 (=> (not res!765630) (not e!655070))))

(assert (=> b!1151537 (= res!765630 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36489 _keys!1208))))))

(declare-fun mapIsEmpty!45116 () Bool)

(assert (=> mapIsEmpty!45116 mapRes!45116))

(declare-fun res!765628 () Bool)

(assert (=> start!98962 (=> (not res!765628) (not e!655070))))

(assert (=> start!98962 (= res!765628 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36489 _keys!1208))))))

(assert (=> start!98962 e!655070))

(assert (=> start!98962 tp_is_empty!28861))

(declare-fun array_inv!27586 (array!74615) Bool)

(assert (=> start!98962 (array_inv!27586 _keys!1208)))

(assert (=> start!98962 true))

(assert (=> start!98962 tp!85703))

(declare-fun e!655062 () Bool)

(declare-fun array_inv!27587 (array!74617) Bool)

(assert (=> start!98962 (and (array_inv!27587 _values!996) e!655062)))

(declare-fun b!1151538 () Bool)

(declare-fun Unit!37803 () Unit!37800)

(assert (=> b!1151538 (= e!655064 Unit!37803)))

(declare-fun b!1151539 () Bool)

(declare-fun e!655056 () Bool)

(declare-fun arrayContainsKey!0 (array!74615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151539 (= e!655056 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!53581 () ListLongMap!16377)

(declare-fun b!1151540 () Bool)

(declare-fun e!655072 () Bool)

(declare-fun -!1325 (ListLongMap!16377 (_ BitVec 64)) ListLongMap!16377)

(assert (=> b!1151540 (= e!655072 (= call!53581 (-!1325 call!53579 k0!934)))))

(declare-fun b!1151541 () Bool)

(declare-fun e!655063 () Bool)

(assert (=> b!1151541 (= e!655063 tp_is_empty!28861)))

(declare-fun bm!53579 () Bool)

(assert (=> bm!53579 (= call!53581 (getCurrentListMapNoExtraKeys!4704 lt!515141 lt!515146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151542 () Bool)

(declare-fun e!655067 () Bool)

(assert (=> b!1151542 (= e!655067 (not e!655066))))

(declare-fun res!765627 () Bool)

(assert (=> b!1151542 (=> res!765627 e!655066)))

(assert (=> b!1151542 (= res!765627 (bvsgt from!1455 i!673))))

(assert (=> b!1151542 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515154 () Unit!37800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74615 (_ BitVec 64) (_ BitVec 32)) Unit!37800)

(assert (=> b!1151542 (= lt!515154 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53580 () Bool)

(assert (=> bm!53580 (= call!53585 call!53580)))

(declare-fun b!1151543 () Bool)

(declare-fun e!655065 () Bool)

(assert (=> b!1151543 (= e!655065 true)))

(assert (=> b!1151543 e!655057))

(declare-fun res!765623 () Bool)

(assert (=> b!1151543 (=> (not res!765623) (not e!655057))))

(assert (=> b!1151543 (= res!765623 (= lt!515160 lt!515156))))

(assert (=> b!1151543 (= lt!515160 (-!1325 lt!515143 k0!934))))

(declare-fun lt!515161 () V!43609)

(assert (=> b!1151543 (= (-!1325 (+!3642 lt!515156 (tuple2!18401 (select (arr!35952 _keys!1208) from!1455) lt!515161)) (select (arr!35952 _keys!1208) from!1455)) lt!515156)))

(declare-fun lt!515140 () Unit!37800)

(declare-fun addThenRemoveForNewKeyIsSame!172 (ListLongMap!16377 (_ BitVec 64) V!43609) Unit!37800)

(assert (=> b!1151543 (= lt!515140 (addThenRemoveForNewKeyIsSame!172 lt!515156 (select (arr!35952 _keys!1208) from!1455) lt!515161))))

(declare-fun get!18327 (ValueCell!13721 V!43609) V!43609)

(assert (=> b!1151543 (= lt!515161 (get!18327 (select (arr!35953 _values!996) from!1455) lt!515148))))

(declare-fun lt!515144 () Unit!37800)

(assert (=> b!1151543 (= lt!515144 e!655058)))

(declare-fun c!114235 () Bool)

(assert (=> b!1151543 (= c!114235 (contains!6739 lt!515156 k0!934))))

(assert (=> b!1151543 (= lt!515156 (getCurrentListMapNoExtraKeys!4704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151544 () Bool)

(declare-fun res!765622 () Bool)

(assert (=> b!1151544 (=> (not res!765622) (not e!655070))))

(assert (=> b!1151544 (= res!765622 (= (select (arr!35952 _keys!1208) i!673) k0!934))))

(declare-fun bm!53581 () Bool)

(assert (=> bm!53581 (= call!53586 (addStillContains!866 lt!515156 (ite (or c!114236 c!114239) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114236 c!114239) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151545 () Bool)

(assert (=> b!1151545 call!53585))

(declare-fun lt!515142 () Unit!37800)

(assert (=> b!1151545 (= lt!515142 call!53583)))

(assert (=> b!1151545 (= e!655064 lt!515142)))

(declare-fun b!1151546 () Bool)

(declare-fun res!765633 () Bool)

(assert (=> b!1151546 (=> (not res!765633) (not e!655067))))

(assert (=> b!1151546 (= res!765633 (arrayNoDuplicates!0 lt!515141 #b00000000000000000000000000000000 Nil!25150))))

(declare-fun b!1151547 () Bool)

(assert (=> b!1151547 (= e!655072 (= call!53581 call!53579))))

(declare-fun b!1151548 () Bool)

(assert (=> b!1151548 (= e!655061 e!655065)))

(declare-fun res!765634 () Bool)

(assert (=> b!1151548 (=> res!765634 e!655065)))

(assert (=> b!1151548 (= res!765634 (not (= (select (arr!35952 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151548 e!655072))

(declare-fun c!114237 () Bool)

(assert (=> b!1151548 (= c!114237 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515153 () Unit!37800)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 (array!74615 array!74617 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37800)

(assert (=> b!1151548 (= lt!515153 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151549 () Bool)

(declare-fun res!765632 () Bool)

(assert (=> b!1151549 (=> (not res!765632) (not e!655070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151549 (= res!765632 (validKeyInArray!0 k0!934))))

(declare-fun b!1151550 () Bool)

(declare-fun Unit!37804 () Unit!37800)

(assert (=> b!1151550 (= e!655058 Unit!37804)))

(assert (=> b!1151550 (= lt!515150 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151550 (= c!114236 (and (not lt!515150) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515155 () Unit!37800)

(assert (=> b!1151550 (= lt!515155 e!655059)))

(declare-fun lt!515158 () Unit!37800)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!461 (array!74615 array!74617 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 64) (_ BitVec 32) Int) Unit!37800)

(assert (=> b!1151550 (= lt!515158 (lemmaListMapContainsThenArrayContainsFrom!461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114238 () Bool)

(assert (=> b!1151550 (= c!114238 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765635 () Bool)

(declare-fun e!655071 () Bool)

(assert (=> b!1151550 (= res!765635 e!655071)))

(assert (=> b!1151550 (=> (not res!765635) (not e!655056))))

(assert (=> b!1151550 e!655056))

(declare-fun lt!515157 () Unit!37800)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74615 (_ BitVec 32) (_ BitVec 32)) Unit!37800)

(assert (=> b!1151550 (= lt!515157 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151550 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25150)))

(declare-fun lt!515145 () Unit!37800)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74615 (_ BitVec 64) (_ BitVec 32) List!25153) Unit!37800)

(assert (=> b!1151550 (= lt!515145 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25150))))

(assert (=> b!1151550 false))

(declare-fun b!1151551 () Bool)

(declare-fun res!765629 () Bool)

(assert (=> b!1151551 (=> (not res!765629) (not e!655070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151551 (= res!765629 (validMask!0 mask!1564))))

(declare-fun bm!53582 () Bool)

(assert (=> bm!53582 (= call!53580 (contains!6739 (ite c!114236 lt!515147 call!53582) k0!934))))

(declare-fun b!1151552 () Bool)

(assert (=> b!1151552 (= e!655070 e!655067)))

(declare-fun res!765624 () Bool)

(assert (=> b!1151552 (=> (not res!765624) (not e!655067))))

(assert (=> b!1151552 (= res!765624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515141 mask!1564))))

(assert (=> b!1151552 (= lt!515141 (array!74616 (store (arr!35952 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36489 _keys!1208)))))

(declare-fun b!1151553 () Bool)

(assert (=> b!1151553 (= e!655071 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515150) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151554 () Bool)

(assert (=> b!1151554 (= e!655062 (and e!655063 mapRes!45116))))

(declare-fun condMapEmpty!45116 () Bool)

(declare-fun mapDefault!45116 () ValueCell!13721)

(assert (=> b!1151554 (= condMapEmpty!45116 (= (arr!35953 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13721)) mapDefault!45116)))))

(declare-fun b!1151555 () Bool)

(declare-fun res!765626 () Bool)

(assert (=> b!1151555 (=> (not res!765626) (not e!655070))))

(assert (=> b!1151555 (= res!765626 (and (= (size!36490 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36489 _keys!1208) (size!36490 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151556 () Bool)

(assert (=> b!1151556 (= e!655071 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53583 () Bool)

(assert (=> bm!53583 (= call!53583 call!53586)))

(assert (= (and start!98962 res!765628) b!1151551))

(assert (= (and b!1151551 res!765629) b!1151555))

(assert (= (and b!1151555 res!765626) b!1151531))

(assert (= (and b!1151531 res!765631) b!1151527))

(assert (= (and b!1151527 res!765625) b!1151537))

(assert (= (and b!1151537 res!765630) b!1151549))

(assert (= (and b!1151549 res!765632) b!1151544))

(assert (= (and b!1151544 res!765622) b!1151552))

(assert (= (and b!1151552 res!765624) b!1151546))

(assert (= (and b!1151546 res!765633) b!1151542))

(assert (= (and b!1151542 (not res!765627)) b!1151535))

(assert (= (and b!1151535 (not res!765636)) b!1151548))

(assert (= (and b!1151548 c!114237) b!1151540))

(assert (= (and b!1151548 (not c!114237)) b!1151547))

(assert (= (or b!1151540 b!1151547) bm!53579))

(assert (= (or b!1151540 b!1151547) bm!53578))

(assert (= (and b!1151548 (not res!765634)) b!1151543))

(assert (= (and b!1151543 c!114235) b!1151550))

(assert (= (and b!1151543 (not c!114235)) b!1151528))

(assert (= (and b!1151550 c!114236) b!1151532))

(assert (= (and b!1151550 (not c!114236)) b!1151530))

(assert (= (and b!1151530 c!114239) b!1151533))

(assert (= (and b!1151530 (not c!114239)) b!1151529))

(assert (= (and b!1151529 c!114240) b!1151545))

(assert (= (and b!1151529 (not c!114240)) b!1151538))

(assert (= (or b!1151533 b!1151545) bm!53583))

(assert (= (or b!1151533 b!1151545) bm!53577))

(assert (= (or b!1151533 b!1151545) bm!53580))

(assert (= (or b!1151532 bm!53580) bm!53582))

(assert (= (or b!1151532 bm!53583) bm!53581))

(assert (= (or b!1151532 bm!53577) bm!53576))

(assert (= (and b!1151550 c!114238) b!1151556))

(assert (= (and b!1151550 (not c!114238)) b!1151553))

(assert (= (and b!1151550 res!765635) b!1151539))

(assert (= (and b!1151543 res!765623) b!1151536))

(assert (= (and b!1151554 condMapEmpty!45116) mapIsEmpty!45116))

(assert (= (and b!1151554 (not condMapEmpty!45116)) mapNonEmpty!45116))

(get-info :version)

(assert (= (and mapNonEmpty!45116 ((_ is ValueCellFull!13721) mapValue!45116)) b!1151534))

(assert (= (and b!1151554 ((_ is ValueCellFull!13721) mapDefault!45116)) b!1151541))

(assert (= start!98962 b!1151554))

(declare-fun b_lambda!19431 () Bool)

(assert (=> (not b_lambda!19431) (not b!1151535)))

(declare-fun t!36467 () Bool)

(declare-fun tb!9135 () Bool)

(assert (=> (and start!98962 (= defaultEntry!1004 defaultEntry!1004) t!36467) tb!9135))

(declare-fun result!18843 () Bool)

(assert (=> tb!9135 (= result!18843 tp_is_empty!28861)))

(assert (=> b!1151535 t!36467))

(declare-fun b_and!39515 () Bool)

(assert (= b_and!39513 (and (=> t!36467 result!18843) b_and!39515)))

(declare-fun m!1062073 () Bool)

(assert (=> b!1151531 m!1062073))

(declare-fun m!1062075 () Bool)

(assert (=> b!1151556 m!1062075))

(declare-fun m!1062077 () Bool)

(assert (=> bm!53576 m!1062077))

(declare-fun m!1062079 () Bool)

(assert (=> start!98962 m!1062079))

(declare-fun m!1062081 () Bool)

(assert (=> start!98962 m!1062081))

(declare-fun m!1062083 () Bool)

(assert (=> b!1151546 m!1062083))

(assert (=> b!1151539 m!1062075))

(declare-fun m!1062085 () Bool)

(assert (=> bm!53578 m!1062085))

(declare-fun m!1062087 () Bool)

(assert (=> bm!53582 m!1062087))

(declare-fun m!1062089 () Bool)

(assert (=> b!1151548 m!1062089))

(declare-fun m!1062091 () Bool)

(assert (=> b!1151548 m!1062091))

(declare-fun m!1062093 () Bool)

(assert (=> b!1151542 m!1062093))

(declare-fun m!1062095 () Bool)

(assert (=> b!1151542 m!1062095))

(declare-fun m!1062097 () Bool)

(assert (=> b!1151532 m!1062097))

(assert (=> b!1151532 m!1062097))

(declare-fun m!1062099 () Bool)

(assert (=> b!1151532 m!1062099))

(declare-fun m!1062101 () Bool)

(assert (=> b!1151532 m!1062101))

(declare-fun m!1062103 () Bool)

(assert (=> b!1151549 m!1062103))

(declare-fun m!1062105 () Bool)

(assert (=> b!1151544 m!1062105))

(declare-fun m!1062107 () Bool)

(assert (=> bm!53579 m!1062107))

(declare-fun m!1062109 () Bool)

(assert (=> b!1151527 m!1062109))

(declare-fun m!1062111 () Bool)

(assert (=> b!1151550 m!1062111))

(declare-fun m!1062113 () Bool)

(assert (=> b!1151550 m!1062113))

(declare-fun m!1062115 () Bool)

(assert (=> b!1151550 m!1062115))

(declare-fun m!1062117 () Bool)

(assert (=> b!1151550 m!1062117))

(declare-fun m!1062119 () Bool)

(assert (=> b!1151540 m!1062119))

(assert (=> b!1151543 m!1062085))

(declare-fun m!1062121 () Bool)

(assert (=> b!1151543 m!1062121))

(assert (=> b!1151543 m!1062089))

(declare-fun m!1062123 () Bool)

(assert (=> b!1151543 m!1062123))

(declare-fun m!1062125 () Bool)

(assert (=> b!1151543 m!1062125))

(assert (=> b!1151543 m!1062121))

(declare-fun m!1062127 () Bool)

(assert (=> b!1151543 m!1062127))

(declare-fun m!1062129 () Bool)

(assert (=> b!1151543 m!1062129))

(assert (=> b!1151543 m!1062089))

(declare-fun m!1062131 () Bool)

(assert (=> b!1151543 m!1062131))

(assert (=> b!1151543 m!1062089))

(declare-fun m!1062133 () Bool)

(assert (=> b!1151543 m!1062133))

(assert (=> b!1151543 m!1062129))

(declare-fun m!1062135 () Bool)

(assert (=> b!1151535 m!1062135))

(declare-fun m!1062137 () Bool)

(assert (=> b!1151535 m!1062137))

(declare-fun m!1062139 () Bool)

(assert (=> b!1151535 m!1062139))

(declare-fun m!1062141 () Bool)

(assert (=> b!1151535 m!1062141))

(assert (=> b!1151536 m!1062107))

(declare-fun m!1062143 () Bool)

(assert (=> bm!53581 m!1062143))

(declare-fun m!1062145 () Bool)

(assert (=> b!1151552 m!1062145))

(declare-fun m!1062147 () Bool)

(assert (=> b!1151552 m!1062147))

(declare-fun m!1062149 () Bool)

(assert (=> b!1151551 m!1062149))

(declare-fun m!1062151 () Bool)

(assert (=> mapNonEmpty!45116 m!1062151))

(check-sat (not bm!53579) (not b_lambda!19431) (not b!1151548) tp_is_empty!28861 (not b!1151540) (not b!1151527) (not bm!53578) (not bm!53581) (not b!1151543) (not b_next!24331) (not b!1151556) (not b!1151551) b_and!39515 (not b!1151532) (not b!1151549) (not b!1151539) (not mapNonEmpty!45116) (not b!1151535) (not b!1151531) (not b!1151536) (not b!1151552) (not b!1151542) (not bm!53582) (not bm!53576) (not b!1151550) (not start!98962) (not b!1151546))
(check-sat b_and!39515 (not b_next!24331))
