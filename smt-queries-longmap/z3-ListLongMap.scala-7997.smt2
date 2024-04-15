; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98816 () Bool)

(assert start!98816)

(declare-fun b_free!24427 () Bool)

(declare-fun b_next!24427 () Bool)

(assert (=> start!98816 (= b_free!24427 (not b_next!24427))))

(declare-fun tp!85992 () Bool)

(declare-fun b_and!39681 () Bool)

(assert (=> start!98816 (= tp!85992 b_and!39681)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!656604 () Bool)

(declare-fun b!1154530 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!517642 () Bool)

(assert (=> b!1154530 (= e!656604 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517642) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54640 () Bool)

(declare-datatypes ((Unit!37847 0))(
  ( (Unit!37848) )
))
(declare-fun call!54646 () Unit!37847)

(declare-fun call!54645 () Unit!37847)

(assert (=> bm!54640 (= call!54646 call!54645)))

(declare-fun b!1154531 () Bool)

(declare-fun e!656608 () Unit!37847)

(declare-fun lt!517641 () Unit!37847)

(assert (=> b!1154531 (= e!656608 lt!517641)))

(assert (=> b!1154531 (= lt!517641 call!54646)))

(declare-fun call!54650 () Bool)

(assert (=> b!1154531 call!54650))

(declare-fun b!1154532 () Bool)

(declare-fun e!656603 () Bool)

(declare-fun e!656606 () Bool)

(assert (=> b!1154532 (= e!656603 e!656606)))

(declare-fun res!767217 () Bool)

(assert (=> b!1154532 (=> res!767217 e!656606)))

(declare-datatypes ((array!74678 0))(
  ( (array!74679 (arr!35990 (Array (_ BitVec 32) (_ BitVec 64))) (size!36528 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74678)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1154532 (= res!767217 (not (= (select (arr!35990 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656599 () Bool)

(assert (=> b!1154532 e!656599))

(declare-fun c!114677 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154532 (= c!114677 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43737 0))(
  ( (V!43738 (val!14535 Int)) )
))
(declare-fun zeroValue!944 () V!43737)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13769 0))(
  ( (ValueCellFull!13769 (v!17171 V!43737)) (EmptyCell!13769) )
))
(declare-datatypes ((array!74680 0))(
  ( (array!74681 (arr!35991 (Array (_ BitVec 32) ValueCell!13769)) (size!36529 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74680)

(declare-fun minValue!944 () V!43737)

(declare-fun lt!517653 () Unit!37847)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!608 (array!74678 array!74680 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37847)

(assert (=> b!1154532 (= lt!517653 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!608 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114675 () Bool)

(declare-datatypes ((tuple2!18554 0))(
  ( (tuple2!18555 (_1!9288 (_ BitVec 64)) (_2!9288 V!43737)) )
))
(declare-datatypes ((List!25284 0))(
  ( (Nil!25281) (Cons!25280 (h!26489 tuple2!18554) (t!36694 List!25284)) )
))
(declare-datatypes ((ListLongMap!16523 0))(
  ( (ListLongMap!16524 (toList!8277 List!25284)) )
))
(declare-fun lt!517650 () ListLongMap!16523)

(declare-fun call!54643 () ListLongMap!16523)

(declare-fun bm!54641 () Bool)

(declare-fun c!114679 () Bool)

(declare-fun +!3688 (ListLongMap!16523 tuple2!18554) ListLongMap!16523)

(assert (=> bm!54641 (= call!54643 (+!3688 lt!517650 (ite (or c!114675 c!114679) (tuple2!18555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1154533 () Bool)

(declare-fun e!656596 () Unit!37847)

(assert (=> b!1154533 (= e!656608 e!656596)))

(declare-fun c!114680 () Bool)

(assert (=> b!1154533 (= c!114680 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517642))))

(declare-fun b!1154534 () Bool)

(declare-fun e!656610 () Bool)

(declare-fun e!656600 () Bool)

(assert (=> b!1154534 (= e!656610 (not e!656600))))

(declare-fun res!767208 () Bool)

(assert (=> b!1154534 (=> res!767208 e!656600)))

(assert (=> b!1154534 (= res!767208 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154534 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517652 () Unit!37847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74678 (_ BitVec 64) (_ BitVec 32)) Unit!37847)

(assert (=> b!1154534 (= lt!517652 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154535 () Bool)

(assert (=> b!1154535 (= e!656604 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!54649 () ListLongMap!16523)

(declare-fun call!54644 () ListLongMap!16523)

(declare-fun b!1154536 () Bool)

(declare-fun -!1336 (ListLongMap!16523 (_ BitVec 64)) ListLongMap!16523)

(assert (=> b!1154536 (= e!656599 (= call!54644 (-!1336 call!54649 k0!934)))))

(declare-fun b!1154537 () Bool)

(declare-fun e!656605 () Bool)

(declare-fun tp_is_empty!28957 () Bool)

(assert (=> b!1154537 (= e!656605 tp_is_empty!28957)))

(declare-fun b!1154538 () Bool)

(assert (=> b!1154538 (= c!114679 (and (not lt!517642) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656607 () Unit!37847)

(assert (=> b!1154538 (= e!656607 e!656608)))

(declare-fun b!1154539 () Bool)

(assert (=> b!1154539 (= e!656600 e!656603)))

(declare-fun res!767215 () Bool)

(assert (=> b!1154539 (=> res!767215 e!656603)))

(assert (=> b!1154539 (= res!767215 (not (= from!1455 i!673)))))

(declare-fun lt!517638 () array!74680)

(declare-fun lt!517645 () ListLongMap!16523)

(declare-fun lt!517632 () array!74678)

(declare-fun getCurrentListMapNoExtraKeys!4758 (array!74678 array!74680 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 32) Int) ListLongMap!16523)

(assert (=> b!1154539 (= lt!517645 (getCurrentListMapNoExtraKeys!4758 lt!517632 lt!517638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517634 () V!43737)

(assert (=> b!1154539 (= lt!517638 (array!74681 (store (arr!35991 _values!996) i!673 (ValueCellFull!13769 lt!517634)) (size!36529 _values!996)))))

(declare-fun dynLambda!2717 (Int (_ BitVec 64)) V!43737)

(assert (=> b!1154539 (= lt!517634 (dynLambda!2717 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517648 () ListLongMap!16523)

(assert (=> b!1154539 (= lt!517648 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45260 () Bool)

(declare-fun mapRes!45260 () Bool)

(assert (=> mapIsEmpty!45260 mapRes!45260))

(declare-fun b!1154540 () Bool)

(declare-fun res!767221 () Bool)

(declare-fun e!656594 () Bool)

(assert (=> b!1154540 (=> (not res!767221) (not e!656594))))

(assert (=> b!1154540 (= res!767221 (and (= (size!36529 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36528 _keys!1208) (size!36529 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154541 () Bool)

(declare-fun res!767222 () Bool)

(assert (=> b!1154541 (=> (not res!767222) (not e!656594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74678 (_ BitVec 32)) Bool)

(assert (=> b!1154541 (= res!767222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154542 () Bool)

(declare-fun res!767220 () Bool)

(assert (=> b!1154542 (=> (not res!767220) (not e!656594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154542 (= res!767220 (validMask!0 mask!1564))))

(declare-fun b!1154543 () Bool)

(assert (=> b!1154543 (= e!656594 e!656610)))

(declare-fun res!767212 () Bool)

(assert (=> b!1154543 (=> (not res!767212) (not e!656610))))

(assert (=> b!1154543 (= res!767212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517632 mask!1564))))

(assert (=> b!1154543 (= lt!517632 (array!74679 (store (arr!35990 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36528 _keys!1208)))))

(declare-fun b!1154544 () Bool)

(assert (=> b!1154544 (= e!656606 true)))

(declare-fun e!656601 () Bool)

(assert (=> b!1154544 e!656601))

(declare-fun res!767214 () Bool)

(assert (=> b!1154544 (=> (not res!767214) (not e!656601))))

(declare-fun lt!517643 () ListLongMap!16523)

(assert (=> b!1154544 (= res!767214 (= lt!517643 lt!517650))))

(assert (=> b!1154544 (= lt!517643 (-!1336 lt!517648 k0!934))))

(declare-fun lt!517637 () V!43737)

(assert (=> b!1154544 (= (-!1336 (+!3688 lt!517650 (tuple2!18555 (select (arr!35990 _keys!1208) from!1455) lt!517637)) (select (arr!35990 _keys!1208) from!1455)) lt!517650)))

(declare-fun lt!517636 () Unit!37847)

(declare-fun addThenRemoveForNewKeyIsSame!189 (ListLongMap!16523 (_ BitVec 64) V!43737) Unit!37847)

(assert (=> b!1154544 (= lt!517636 (addThenRemoveForNewKeyIsSame!189 lt!517650 (select (arr!35990 _keys!1208) from!1455) lt!517637))))

(declare-fun get!18345 (ValueCell!13769 V!43737) V!43737)

(assert (=> b!1154544 (= lt!517637 (get!18345 (select (arr!35991 _values!996) from!1455) lt!517634))))

(declare-fun lt!517633 () Unit!37847)

(declare-fun e!656598 () Unit!37847)

(assert (=> b!1154544 (= lt!517633 e!656598)))

(declare-fun c!114676 () Bool)

(declare-fun contains!6729 (ListLongMap!16523 (_ BitVec 64)) Bool)

(assert (=> b!1154544 (= c!114676 (contains!6729 lt!517650 k0!934))))

(assert (=> b!1154544 (= lt!517650 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154545 () Bool)

(declare-fun res!767218 () Bool)

(assert (=> b!1154545 (=> (not res!767218) (not e!656594))))

(declare-datatypes ((List!25285 0))(
  ( (Nil!25282) (Cons!25281 (h!26490 (_ BitVec 64)) (t!36695 List!25285)) )
))
(declare-fun arrayNoDuplicates!0 (array!74678 (_ BitVec 32) List!25285) Bool)

(assert (=> b!1154545 (= res!767218 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25282))))

(declare-fun b!1154546 () Bool)

(assert (=> b!1154546 (= e!656599 (= call!54644 call!54649))))

(declare-fun bm!54642 () Bool)

(declare-fun lt!517647 () ListLongMap!16523)

(declare-fun addStillContains!900 (ListLongMap!16523 (_ BitVec 64) V!43737 (_ BitVec 64)) Unit!37847)

(assert (=> bm!54642 (= call!54645 (addStillContains!900 (ite c!114675 lt!517647 lt!517650) (ite c!114675 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114679 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114675 minValue!944 (ite c!114679 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1154547 () Bool)

(declare-fun res!767219 () Bool)

(assert (=> b!1154547 (=> (not res!767219) (not e!656594))))

(assert (=> b!1154547 (= res!767219 (= (select (arr!35990 _keys!1208) i!673) k0!934))))

(declare-fun b!1154548 () Bool)

(declare-fun e!656597 () Bool)

(assert (=> b!1154548 (= e!656597 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154549 () Bool)

(assert (=> b!1154549 (= e!656601 (= lt!517643 (getCurrentListMapNoExtraKeys!4758 lt!517632 lt!517638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154550 () Bool)

(declare-fun res!767209 () Bool)

(assert (=> b!1154550 (=> (not res!767209) (not e!656594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154550 (= res!767209 (validKeyInArray!0 k0!934))))

(declare-fun b!1154551 () Bool)

(declare-fun res!767210 () Bool)

(assert (=> b!1154551 (=> (not res!767210) (not e!656594))))

(assert (=> b!1154551 (= res!767210 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36528 _keys!1208))))))

(declare-fun b!1154552 () Bool)

(declare-fun e!656609 () Bool)

(assert (=> b!1154552 (= e!656609 tp_is_empty!28957)))

(declare-fun b!1154553 () Bool)

(declare-fun Unit!37849 () Unit!37847)

(assert (=> b!1154553 (= e!656598 Unit!37849)))

(declare-fun mapNonEmpty!45260 () Bool)

(declare-fun tp!85991 () Bool)

(assert (=> mapNonEmpty!45260 (= mapRes!45260 (and tp!85991 e!656609))))

(declare-fun mapValue!45260 () ValueCell!13769)

(declare-fun mapKey!45260 () (_ BitVec 32))

(declare-fun mapRest!45260 () (Array (_ BitVec 32) ValueCell!13769))

(assert (=> mapNonEmpty!45260 (= (arr!35991 _values!996) (store mapRest!45260 mapKey!45260 mapValue!45260))))

(declare-fun b!1154554 () Bool)

(assert (=> b!1154554 call!54650))

(declare-fun lt!517651 () Unit!37847)

(assert (=> b!1154554 (= lt!517651 call!54646)))

(assert (=> b!1154554 (= e!656596 lt!517651)))

(declare-fun bm!54643 () Bool)

(declare-fun call!54647 () Bool)

(assert (=> bm!54643 (= call!54650 call!54647)))

(declare-fun b!1154555 () Bool)

(declare-fun Unit!37850 () Unit!37847)

(assert (=> b!1154555 (= e!656596 Unit!37850)))

(declare-fun b!1154556 () Bool)

(declare-fun res!767213 () Bool)

(assert (=> b!1154556 (=> (not res!767213) (not e!656610))))

(assert (=> b!1154556 (= res!767213 (arrayNoDuplicates!0 lt!517632 #b00000000000000000000000000000000 Nil!25282))))

(declare-fun bm!54644 () Bool)

(assert (=> bm!54644 (= call!54644 (getCurrentListMapNoExtraKeys!4758 lt!517632 lt!517638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!54648 () ListLongMap!16523)

(declare-fun bm!54645 () Bool)

(assert (=> bm!54645 (= call!54647 (contains!6729 (ite c!114675 lt!517647 call!54648) k0!934))))

(declare-fun bm!54646 () Bool)

(assert (=> bm!54646 (= call!54649 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54647 () Bool)

(assert (=> bm!54647 (= call!54648 call!54643)))

(declare-fun b!1154557 () Bool)

(declare-fun Unit!37851 () Unit!37847)

(assert (=> b!1154557 (= e!656598 Unit!37851)))

(assert (=> b!1154557 (= lt!517642 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154557 (= c!114675 (and (not lt!517642) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517640 () Unit!37847)

(assert (=> b!1154557 (= lt!517640 e!656607)))

(declare-fun lt!517649 () Unit!37847)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!486 (array!74678 array!74680 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 64) (_ BitVec 32) Int) Unit!37847)

(assert (=> b!1154557 (= lt!517649 (lemmaListMapContainsThenArrayContainsFrom!486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114678 () Bool)

(assert (=> b!1154557 (= c!114678 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767211 () Bool)

(assert (=> b!1154557 (= res!767211 e!656604)))

(assert (=> b!1154557 (=> (not res!767211) (not e!656597))))

(assert (=> b!1154557 e!656597))

(declare-fun lt!517635 () Unit!37847)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74678 (_ BitVec 32) (_ BitVec 32)) Unit!37847)

(assert (=> b!1154557 (= lt!517635 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154557 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25282)))

(declare-fun lt!517646 () Unit!37847)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74678 (_ BitVec 64) (_ BitVec 32) List!25285) Unit!37847)

(assert (=> b!1154557 (= lt!517646 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25282))))

(assert (=> b!1154557 false))

(declare-fun b!1154558 () Bool)

(declare-fun e!656602 () Bool)

(assert (=> b!1154558 (= e!656602 (and e!656605 mapRes!45260))))

(declare-fun condMapEmpty!45260 () Bool)

(declare-fun mapDefault!45260 () ValueCell!13769)

(assert (=> b!1154558 (= condMapEmpty!45260 (= (arr!35991 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13769)) mapDefault!45260)))))

(declare-fun res!767216 () Bool)

(assert (=> start!98816 (=> (not res!767216) (not e!656594))))

(assert (=> start!98816 (= res!767216 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36528 _keys!1208))))))

(assert (=> start!98816 e!656594))

(assert (=> start!98816 tp_is_empty!28957))

(declare-fun array_inv!27656 (array!74678) Bool)

(assert (=> start!98816 (array_inv!27656 _keys!1208)))

(assert (=> start!98816 true))

(assert (=> start!98816 tp!85992))

(declare-fun array_inv!27657 (array!74680) Bool)

(assert (=> start!98816 (and (array_inv!27657 _values!996) e!656602)))

(declare-fun b!1154559 () Bool)

(assert (=> b!1154559 (contains!6729 (+!3688 lt!517647 (tuple2!18555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517644 () Unit!37847)

(assert (=> b!1154559 (= lt!517644 call!54645)))

(assert (=> b!1154559 call!54647))

(assert (=> b!1154559 (= lt!517647 call!54643)))

(declare-fun lt!517639 () Unit!37847)

(assert (=> b!1154559 (= lt!517639 (addStillContains!900 lt!517650 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154559 (= e!656607 lt!517644)))

(assert (= (and start!98816 res!767216) b!1154542))

(assert (= (and b!1154542 res!767220) b!1154540))

(assert (= (and b!1154540 res!767221) b!1154541))

(assert (= (and b!1154541 res!767222) b!1154545))

(assert (= (and b!1154545 res!767218) b!1154551))

(assert (= (and b!1154551 res!767210) b!1154550))

(assert (= (and b!1154550 res!767209) b!1154547))

(assert (= (and b!1154547 res!767219) b!1154543))

(assert (= (and b!1154543 res!767212) b!1154556))

(assert (= (and b!1154556 res!767213) b!1154534))

(assert (= (and b!1154534 (not res!767208)) b!1154539))

(assert (= (and b!1154539 (not res!767215)) b!1154532))

(assert (= (and b!1154532 c!114677) b!1154536))

(assert (= (and b!1154532 (not c!114677)) b!1154546))

(assert (= (or b!1154536 b!1154546) bm!54644))

(assert (= (or b!1154536 b!1154546) bm!54646))

(assert (= (and b!1154532 (not res!767217)) b!1154544))

(assert (= (and b!1154544 c!114676) b!1154557))

(assert (= (and b!1154544 (not c!114676)) b!1154553))

(assert (= (and b!1154557 c!114675) b!1154559))

(assert (= (and b!1154557 (not c!114675)) b!1154538))

(assert (= (and b!1154538 c!114679) b!1154531))

(assert (= (and b!1154538 (not c!114679)) b!1154533))

(assert (= (and b!1154533 c!114680) b!1154554))

(assert (= (and b!1154533 (not c!114680)) b!1154555))

(assert (= (or b!1154531 b!1154554) bm!54640))

(assert (= (or b!1154531 b!1154554) bm!54647))

(assert (= (or b!1154531 b!1154554) bm!54643))

(assert (= (or b!1154559 bm!54643) bm!54645))

(assert (= (or b!1154559 bm!54640) bm!54642))

(assert (= (or b!1154559 bm!54647) bm!54641))

(assert (= (and b!1154557 c!114678) b!1154535))

(assert (= (and b!1154557 (not c!114678)) b!1154530))

(assert (= (and b!1154557 res!767211) b!1154548))

(assert (= (and b!1154544 res!767214) b!1154549))

(assert (= (and b!1154558 condMapEmpty!45260) mapIsEmpty!45260))

(assert (= (and b!1154558 (not condMapEmpty!45260)) mapNonEmpty!45260))

(get-info :version)

(assert (= (and mapNonEmpty!45260 ((_ is ValueCellFull!13769) mapValue!45260)) b!1154552))

(assert (= (and b!1154558 ((_ is ValueCellFull!13769) mapDefault!45260)) b!1154537))

(assert (= start!98816 b!1154558))

(declare-fun b_lambda!19515 () Bool)

(assert (=> (not b_lambda!19515) (not b!1154539)))

(declare-fun t!36693 () Bool)

(declare-fun tb!9231 () Bool)

(assert (=> (and start!98816 (= defaultEntry!1004 defaultEntry!1004) t!36693) tb!9231))

(declare-fun result!19035 () Bool)

(assert (=> tb!9231 (= result!19035 tp_is_empty!28957)))

(assert (=> b!1154539 t!36693))

(declare-fun b_and!39683 () Bool)

(assert (= b_and!39681 (and (=> t!36693 result!19035) b_and!39683)))

(declare-fun m!1063747 () Bool)

(assert (=> b!1154539 m!1063747))

(declare-fun m!1063749 () Bool)

(assert (=> b!1154539 m!1063749))

(declare-fun m!1063751 () Bool)

(assert (=> b!1154539 m!1063751))

(declare-fun m!1063753 () Bool)

(assert (=> b!1154539 m!1063753))

(declare-fun m!1063755 () Bool)

(assert (=> b!1154545 m!1063755))

(declare-fun m!1063757 () Bool)

(assert (=> b!1154541 m!1063757))

(declare-fun m!1063759 () Bool)

(assert (=> bm!54641 m!1063759))

(declare-fun m!1063761 () Bool)

(assert (=> b!1154550 m!1063761))

(declare-fun m!1063763 () Bool)

(assert (=> b!1154548 m!1063763))

(declare-fun m!1063765 () Bool)

(assert (=> b!1154544 m!1063765))

(assert (=> b!1154544 m!1063765))

(declare-fun m!1063767 () Bool)

(assert (=> b!1154544 m!1063767))

(declare-fun m!1063769 () Bool)

(assert (=> b!1154544 m!1063769))

(declare-fun m!1063771 () Bool)

(assert (=> b!1154544 m!1063771))

(declare-fun m!1063773 () Bool)

(assert (=> b!1154544 m!1063773))

(declare-fun m!1063775 () Bool)

(assert (=> b!1154544 m!1063775))

(declare-fun m!1063777 () Bool)

(assert (=> b!1154544 m!1063777))

(declare-fun m!1063779 () Bool)

(assert (=> b!1154544 m!1063779))

(assert (=> b!1154544 m!1063769))

(assert (=> b!1154544 m!1063777))

(assert (=> b!1154544 m!1063769))

(declare-fun m!1063781 () Bool)

(assert (=> b!1154544 m!1063781))

(declare-fun m!1063783 () Bool)

(assert (=> b!1154542 m!1063783))

(declare-fun m!1063785 () Bool)

(assert (=> bm!54642 m!1063785))

(assert (=> b!1154535 m!1063763))

(declare-fun m!1063787 () Bool)

(assert (=> b!1154547 m!1063787))

(declare-fun m!1063789 () Bool)

(assert (=> b!1154557 m!1063789))

(declare-fun m!1063791 () Bool)

(assert (=> b!1154557 m!1063791))

(declare-fun m!1063793 () Bool)

(assert (=> b!1154557 m!1063793))

(declare-fun m!1063795 () Bool)

(assert (=> b!1154557 m!1063795))

(declare-fun m!1063797 () Bool)

(assert (=> start!98816 m!1063797))

(declare-fun m!1063799 () Bool)

(assert (=> start!98816 m!1063799))

(declare-fun m!1063801 () Bool)

(assert (=> b!1154536 m!1063801))

(declare-fun m!1063803 () Bool)

(assert (=> b!1154534 m!1063803))

(declare-fun m!1063805 () Bool)

(assert (=> b!1154534 m!1063805))

(declare-fun m!1063807 () Bool)

(assert (=> bm!54645 m!1063807))

(declare-fun m!1063809 () Bool)

(assert (=> b!1154543 m!1063809))

(declare-fun m!1063811 () Bool)

(assert (=> b!1154543 m!1063811))

(assert (=> bm!54646 m!1063779))

(declare-fun m!1063813 () Bool)

(assert (=> b!1154556 m!1063813))

(declare-fun m!1063815 () Bool)

(assert (=> mapNonEmpty!45260 m!1063815))

(declare-fun m!1063817 () Bool)

(assert (=> b!1154549 m!1063817))

(assert (=> b!1154532 m!1063769))

(declare-fun m!1063819 () Bool)

(assert (=> b!1154532 m!1063819))

(declare-fun m!1063821 () Bool)

(assert (=> b!1154559 m!1063821))

(assert (=> b!1154559 m!1063821))

(declare-fun m!1063823 () Bool)

(assert (=> b!1154559 m!1063823))

(declare-fun m!1063825 () Bool)

(assert (=> b!1154559 m!1063825))

(assert (=> bm!54644 m!1063817))

(check-sat (not b!1154535) (not b!1154559) (not b!1154557) (not mapNonEmpty!45260) (not bm!54645) (not b!1154541) (not b!1154534) (not b!1154542) (not b!1154548) (not bm!54641) (not b!1154532) (not start!98816) (not b!1154545) (not b!1154549) b_and!39683 (not bm!54646) (not b!1154539) (not b_next!24427) (not b_lambda!19515) tp_is_empty!28957 (not b!1154544) (not bm!54642) (not b!1154543) (not bm!54644) (not b!1154550) (not b!1154536) (not b!1154556))
(check-sat b_and!39683 (not b_next!24427))
