; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99070 () Bool)

(assert start!99070)

(declare-fun b_free!24439 () Bool)

(declare-fun b_next!24439 () Bool)

(assert (=> start!99070 (= b_free!24439 (not b_next!24439))))

(declare-fun tp!86028 () Bool)

(declare-fun b_and!39729 () Bool)

(assert (=> start!99070 (= tp!86028 b_and!39729)))

(declare-fun b!1156495 () Bool)

(declare-fun res!768061 () Bool)

(declare-fun e!657815 () Bool)

(assert (=> b!1156495 (=> (not res!768061) (not e!657815))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74829 0))(
  ( (array!74830 (arr!36059 (Array (_ BitVec 32) (_ BitVec 64))) (size!36596 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74829)

(assert (=> b!1156495 (= res!768061 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36596 _keys!1208))))))

(declare-fun b!1156496 () Bool)

(declare-fun e!657811 () Bool)

(assert (=> b!1156496 (= e!657815 e!657811)))

(declare-fun res!768062 () Bool)

(assert (=> b!1156496 (=> (not res!768062) (not e!657811))))

(declare-fun lt!518724 () array!74829)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74829 (_ BitVec 32)) Bool)

(assert (=> b!1156496 (= res!768062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518724 mask!1564))))

(assert (=> b!1156496 (= lt!518724 (array!74830 (store (arr!36059 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36596 _keys!1208)))))

(declare-fun b!1156497 () Bool)

(declare-fun res!768058 () Bool)

(assert (=> b!1156497 (=> (not res!768058) (not e!657815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156497 (= res!768058 (validMask!0 mask!1564))))

(declare-fun b!1156499 () Bool)

(declare-fun e!657820 () Bool)

(declare-datatypes ((V!43753 0))(
  ( (V!43754 (val!14541 Int)) )
))
(declare-datatypes ((tuple2!18508 0))(
  ( (tuple2!18509 (_1!9265 (_ BitVec 64)) (_2!9265 V!43753)) )
))
(declare-datatypes ((List!25252 0))(
  ( (Nil!25249) (Cons!25248 (h!26466 tuple2!18508) (t!36675 List!25252)) )
))
(declare-datatypes ((ListLongMap!16485 0))(
  ( (ListLongMap!16486 (toList!8258 List!25252)) )
))
(declare-fun call!54881 () ListLongMap!16485)

(declare-fun call!54880 () ListLongMap!16485)

(assert (=> b!1156499 (= e!657820 (= call!54881 call!54880))))

(declare-fun b!1156500 () Bool)

(declare-fun e!657821 () Bool)

(declare-fun e!657823 () Bool)

(declare-fun mapRes!45278 () Bool)

(assert (=> b!1156500 (= e!657821 (and e!657823 mapRes!45278))))

(declare-fun condMapEmpty!45278 () Bool)

(declare-datatypes ((ValueCell!13775 0))(
  ( (ValueCellFull!13775 (v!17174 V!43753)) (EmptyCell!13775) )
))
(declare-datatypes ((array!74831 0))(
  ( (array!74832 (arr!36060 (Array (_ BitVec 32) ValueCell!13775)) (size!36597 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74831)

(declare-fun mapDefault!45278 () ValueCell!13775)

(assert (=> b!1156500 (= condMapEmpty!45278 (= (arr!36060 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13775)) mapDefault!45278)))))

(declare-fun b!1156501 () Bool)

(declare-fun res!768065 () Bool)

(assert (=> b!1156501 (=> (not res!768065) (not e!657815))))

(declare-datatypes ((List!25253 0))(
  ( (Nil!25250) (Cons!25249 (h!26467 (_ BitVec 64)) (t!36676 List!25253)) )
))
(declare-fun arrayNoDuplicates!0 (array!74829 (_ BitVec 32) List!25253) Bool)

(assert (=> b!1156501 (= res!768065 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25250))))

(declare-fun bm!54872 () Bool)

(declare-datatypes ((Unit!38015 0))(
  ( (Unit!38016) )
))
(declare-fun call!54878 () Unit!38015)

(declare-fun call!54875 () Unit!38015)

(assert (=> bm!54872 (= call!54878 call!54875)))

(declare-fun mapIsEmpty!45278 () Bool)

(assert (=> mapIsEmpty!45278 mapRes!45278))

(declare-fun b!1156502 () Bool)

(declare-fun res!768054 () Bool)

(assert (=> b!1156502 (=> (not res!768054) (not e!657815))))

(assert (=> b!1156502 (= res!768054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54873 () Bool)

(declare-fun call!54877 () ListLongMap!16485)

(declare-fun call!54876 () ListLongMap!16485)

(assert (=> bm!54873 (= call!54877 call!54876)))

(declare-fun b!1156503 () Bool)

(declare-fun call!54882 () Bool)

(assert (=> b!1156503 call!54882))

(declare-fun lt!518711 () Unit!38015)

(assert (=> b!1156503 (= lt!518711 call!54878)))

(declare-fun e!657824 () Unit!38015)

(assert (=> b!1156503 (= e!657824 lt!518711)))

(declare-fun b!1156504 () Bool)

(declare-fun Unit!38017 () Unit!38015)

(assert (=> b!1156504 (= e!657824 Unit!38017)))

(declare-fun call!54879 () Bool)

(declare-fun lt!518714 () ListLongMap!16485)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!54874 () Bool)

(declare-fun c!115210 () Bool)

(declare-fun contains!6783 (ListLongMap!16485 (_ BitVec 64)) Bool)

(assert (=> bm!54874 (= call!54879 (contains!6783 (ite c!115210 lt!518714 call!54877) k0!934))))

(declare-fun b!1156505 () Bool)

(declare-fun res!768057 () Bool)

(assert (=> b!1156505 (=> (not res!768057) (not e!657815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156505 (= res!768057 (validKeyInArray!0 k0!934))))

(declare-fun b!1156506 () Bool)

(assert (=> b!1156506 (contains!6783 call!54876 k0!934)))

(declare-fun lt!518705 () Unit!38015)

(declare-fun minValue!944 () V!43753)

(declare-fun addStillContains!905 (ListLongMap!16485 (_ BitVec 64) V!43753 (_ BitVec 64)) Unit!38015)

(assert (=> b!1156506 (= lt!518705 (addStillContains!905 lt!518714 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1156506 call!54879))

(declare-fun lt!518720 () ListLongMap!16485)

(declare-fun zeroValue!944 () V!43753)

(declare-fun +!3683 (ListLongMap!16485 tuple2!18508) ListLongMap!16485)

(assert (=> b!1156506 (= lt!518714 (+!3683 lt!518720 (tuple2!18509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518719 () Unit!38015)

(assert (=> b!1156506 (= lt!518719 call!54875)))

(declare-fun e!657812 () Unit!38015)

(assert (=> b!1156506 (= e!657812 lt!518705)))

(declare-fun mapNonEmpty!45278 () Bool)

(declare-fun tp!86027 () Bool)

(declare-fun e!657825 () Bool)

(assert (=> mapNonEmpty!45278 (= mapRes!45278 (and tp!86027 e!657825))))

(declare-fun mapValue!45278 () ValueCell!13775)

(declare-fun mapKey!45278 () (_ BitVec 32))

(declare-fun mapRest!45278 () (Array (_ BitVec 32) ValueCell!13775))

(assert (=> mapNonEmpty!45278 (= (arr!36060 _values!996) (store mapRest!45278 mapKey!45278 mapValue!45278))))

(declare-fun b!1156507 () Bool)

(declare-fun e!657817 () Bool)

(declare-fun e!657819 () Bool)

(assert (=> b!1156507 (= e!657817 e!657819)))

(declare-fun res!768066 () Bool)

(assert (=> b!1156507 (=> res!768066 e!657819)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1156507 (= res!768066 (not (= (select (arr!36059 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156507 e!657820))

(declare-fun c!115212 () Bool)

(assert (=> b!1156507 (= c!115212 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518704 () Unit!38015)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!604 (array!74829 array!74831 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38015)

(assert (=> b!1156507 (= lt!518704 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54875 () Bool)

(assert (=> bm!54875 (= call!54882 call!54879)))

(declare-fun b!1156508 () Bool)

(declare-fun e!657813 () Unit!38015)

(declare-fun Unit!38018 () Unit!38015)

(assert (=> b!1156508 (= e!657813 Unit!38018)))

(declare-fun lt!518707 () Bool)

(assert (=> b!1156508 (= lt!518707 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156508 (= c!115210 (and (not lt!518707) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518709 () Unit!38015)

(assert (=> b!1156508 (= lt!518709 e!657812)))

(declare-fun lt!518706 () Unit!38015)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!498 (array!74829 array!74831 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 64) (_ BitVec 32) Int) Unit!38015)

(assert (=> b!1156508 (= lt!518706 (lemmaListMapContainsThenArrayContainsFrom!498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115211 () Bool)

(assert (=> b!1156508 (= c!115211 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768053 () Bool)

(declare-fun e!657810 () Bool)

(assert (=> b!1156508 (= res!768053 e!657810)))

(declare-fun e!657816 () Bool)

(assert (=> b!1156508 (=> (not res!768053) (not e!657816))))

(assert (=> b!1156508 e!657816))

(declare-fun lt!518725 () Unit!38015)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74829 (_ BitVec 32) (_ BitVec 32)) Unit!38015)

(assert (=> b!1156508 (= lt!518725 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156508 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25250)))

(declare-fun lt!518718 () Unit!38015)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74829 (_ BitVec 64) (_ BitVec 32) List!25253) Unit!38015)

(assert (=> b!1156508 (= lt!518718 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25250))))

(assert (=> b!1156508 false))

(declare-fun b!1156509 () Bool)

(declare-fun e!657818 () Bool)

(assert (=> b!1156509 (= e!657818 e!657817)))

(declare-fun res!768063 () Bool)

(assert (=> b!1156509 (=> res!768063 e!657817)))

(assert (=> b!1156509 (= res!768063 (not (= from!1455 i!673)))))

(declare-fun lt!518713 () array!74831)

(declare-fun lt!518708 () ListLongMap!16485)

(declare-fun getCurrentListMapNoExtraKeys!4752 (array!74829 array!74831 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 32) Int) ListLongMap!16485)

(assert (=> b!1156509 (= lt!518708 (getCurrentListMapNoExtraKeys!4752 lt!518724 lt!518713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518716 () V!43753)

(assert (=> b!1156509 (= lt!518713 (array!74832 (store (arr!36060 _values!996) i!673 (ValueCellFull!13775 lt!518716)) (size!36597 _values!996)))))

(declare-fun dynLambda!2767 (Int (_ BitVec 64)) V!43753)

(assert (=> b!1156509 (= lt!518716 (dynLambda!2767 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518722 () ListLongMap!16485)

(assert (=> b!1156509 (= lt!518722 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156510 () Bool)

(declare-fun -!1364 (ListLongMap!16485 (_ BitVec 64)) ListLongMap!16485)

(assert (=> b!1156510 (= e!657820 (= call!54881 (-!1364 call!54880 k0!934)))))

(declare-fun b!1156498 () Bool)

(declare-fun tp_is_empty!28969 () Bool)

(assert (=> b!1156498 (= e!657823 tp_is_empty!28969)))

(declare-fun res!768055 () Bool)

(assert (=> start!99070 (=> (not res!768055) (not e!657815))))

(assert (=> start!99070 (= res!768055 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36596 _keys!1208))))))

(assert (=> start!99070 e!657815))

(assert (=> start!99070 tp_is_empty!28969))

(declare-fun array_inv!27654 (array!74829) Bool)

(assert (=> start!99070 (array_inv!27654 _keys!1208)))

(assert (=> start!99070 true))

(assert (=> start!99070 tp!86028))

(declare-fun array_inv!27655 (array!74831) Bool)

(assert (=> start!99070 (and (array_inv!27655 _values!996) e!657821)))

(declare-fun bm!54876 () Bool)

(declare-fun c!115207 () Bool)

(assert (=> bm!54876 (= call!54876 (+!3683 (ite c!115210 lt!518714 lt!518720) (ite c!115210 (tuple2!18509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115207 (tuple2!18509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1156511 () Bool)

(assert (=> b!1156511 (= e!657825 tp_is_empty!28969)))

(declare-fun bm!54877 () Bool)

(assert (=> bm!54877 (= call!54880 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156512 () Bool)

(assert (=> b!1156512 (= e!657819 true)))

(declare-fun e!657822 () Bool)

(assert (=> b!1156512 e!657822))

(declare-fun res!768056 () Bool)

(assert (=> b!1156512 (=> (not res!768056) (not e!657822))))

(declare-fun lt!518712 () ListLongMap!16485)

(assert (=> b!1156512 (= res!768056 (= lt!518712 lt!518720))))

(assert (=> b!1156512 (= lt!518712 (-!1364 lt!518722 k0!934))))

(declare-fun lt!518723 () V!43753)

(assert (=> b!1156512 (= (-!1364 (+!3683 lt!518720 (tuple2!18509 (select (arr!36059 _keys!1208) from!1455) lt!518723)) (select (arr!36059 _keys!1208) from!1455)) lt!518720)))

(declare-fun lt!518721 () Unit!38015)

(declare-fun addThenRemoveForNewKeyIsSame!204 (ListLongMap!16485 (_ BitVec 64) V!43753) Unit!38015)

(assert (=> b!1156512 (= lt!518721 (addThenRemoveForNewKeyIsSame!204 lt!518720 (select (arr!36059 _keys!1208) from!1455) lt!518723))))

(declare-fun get!18395 (ValueCell!13775 V!43753) V!43753)

(assert (=> b!1156512 (= lt!518723 (get!18395 (select (arr!36060 _values!996) from!1455) lt!518716))))

(declare-fun lt!518710 () Unit!38015)

(assert (=> b!1156512 (= lt!518710 e!657813)))

(declare-fun c!115208 () Bool)

(assert (=> b!1156512 (= c!115208 (contains!6783 lt!518720 k0!934))))

(assert (=> b!1156512 (= lt!518720 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156513 () Bool)

(assert (=> b!1156513 (= e!657822 (= lt!518712 (getCurrentListMapNoExtraKeys!4752 lt!518724 lt!518713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156514 () Bool)

(assert (=> b!1156514 (= e!657810 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518707) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156515 () Bool)

(assert (=> b!1156515 (= e!657811 (not e!657818))))

(declare-fun res!768052 () Bool)

(assert (=> b!1156515 (=> res!768052 e!657818)))

(assert (=> b!1156515 (= res!768052 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156515 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518715 () Unit!38015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74829 (_ BitVec 64) (_ BitVec 32)) Unit!38015)

(assert (=> b!1156515 (= lt!518715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156516 () Bool)

(declare-fun Unit!38019 () Unit!38015)

(assert (=> b!1156516 (= e!657813 Unit!38019)))

(declare-fun bm!54878 () Bool)

(assert (=> bm!54878 (= call!54875 (addStillContains!905 lt!518720 (ite (or c!115210 c!115207) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115210 c!115207) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1156517 () Bool)

(declare-fun res!768060 () Bool)

(assert (=> b!1156517 (=> (not res!768060) (not e!657815))))

(assert (=> b!1156517 (= res!768060 (= (select (arr!36059 _keys!1208) i!673) k0!934))))

(declare-fun b!1156518 () Bool)

(declare-fun e!657826 () Unit!38015)

(assert (=> b!1156518 (= e!657826 e!657824)))

(declare-fun c!115209 () Bool)

(assert (=> b!1156518 (= c!115209 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518707))))

(declare-fun b!1156519 () Bool)

(assert (=> b!1156519 (= e!657816 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156520 () Bool)

(assert (=> b!1156520 (= c!115207 (and (not lt!518707) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156520 (= e!657812 e!657826)))

(declare-fun b!1156521 () Bool)

(assert (=> b!1156521 (= e!657810 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156522 () Bool)

(declare-fun res!768064 () Bool)

(assert (=> b!1156522 (=> (not res!768064) (not e!657815))))

(assert (=> b!1156522 (= res!768064 (and (= (size!36597 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36596 _keys!1208) (size!36597 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156523 () Bool)

(declare-fun lt!518717 () Unit!38015)

(assert (=> b!1156523 (= e!657826 lt!518717)))

(assert (=> b!1156523 (= lt!518717 call!54878)))

(assert (=> b!1156523 call!54882))

(declare-fun b!1156524 () Bool)

(declare-fun res!768059 () Bool)

(assert (=> b!1156524 (=> (not res!768059) (not e!657811))))

(assert (=> b!1156524 (= res!768059 (arrayNoDuplicates!0 lt!518724 #b00000000000000000000000000000000 Nil!25250))))

(declare-fun bm!54879 () Bool)

(assert (=> bm!54879 (= call!54881 (getCurrentListMapNoExtraKeys!4752 lt!518724 lt!518713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99070 res!768055) b!1156497))

(assert (= (and b!1156497 res!768058) b!1156522))

(assert (= (and b!1156522 res!768064) b!1156502))

(assert (= (and b!1156502 res!768054) b!1156501))

(assert (= (and b!1156501 res!768065) b!1156495))

(assert (= (and b!1156495 res!768061) b!1156505))

(assert (= (and b!1156505 res!768057) b!1156517))

(assert (= (and b!1156517 res!768060) b!1156496))

(assert (= (and b!1156496 res!768062) b!1156524))

(assert (= (and b!1156524 res!768059) b!1156515))

(assert (= (and b!1156515 (not res!768052)) b!1156509))

(assert (= (and b!1156509 (not res!768063)) b!1156507))

(assert (= (and b!1156507 c!115212) b!1156510))

(assert (= (and b!1156507 (not c!115212)) b!1156499))

(assert (= (or b!1156510 b!1156499) bm!54879))

(assert (= (or b!1156510 b!1156499) bm!54877))

(assert (= (and b!1156507 (not res!768066)) b!1156512))

(assert (= (and b!1156512 c!115208) b!1156508))

(assert (= (and b!1156512 (not c!115208)) b!1156516))

(assert (= (and b!1156508 c!115210) b!1156506))

(assert (= (and b!1156508 (not c!115210)) b!1156520))

(assert (= (and b!1156520 c!115207) b!1156523))

(assert (= (and b!1156520 (not c!115207)) b!1156518))

(assert (= (and b!1156518 c!115209) b!1156503))

(assert (= (and b!1156518 (not c!115209)) b!1156504))

(assert (= (or b!1156523 b!1156503) bm!54872))

(assert (= (or b!1156523 b!1156503) bm!54873))

(assert (= (or b!1156523 b!1156503) bm!54875))

(assert (= (or b!1156506 bm!54875) bm!54874))

(assert (= (or b!1156506 bm!54872) bm!54878))

(assert (= (or b!1156506 bm!54873) bm!54876))

(assert (= (and b!1156508 c!115211) b!1156521))

(assert (= (and b!1156508 (not c!115211)) b!1156514))

(assert (= (and b!1156508 res!768053) b!1156519))

(assert (= (and b!1156512 res!768056) b!1156513))

(assert (= (and b!1156500 condMapEmpty!45278) mapIsEmpty!45278))

(assert (= (and b!1156500 (not condMapEmpty!45278)) mapNonEmpty!45278))

(get-info :version)

(assert (= (and mapNonEmpty!45278 ((_ is ValueCellFull!13775) mapValue!45278)) b!1156511))

(assert (= (and b!1156500 ((_ is ValueCellFull!13775) mapDefault!45278)) b!1156498))

(assert (= start!99070 b!1156500))

(declare-fun b_lambda!19539 () Bool)

(assert (=> (not b_lambda!19539) (not b!1156509)))

(declare-fun t!36674 () Bool)

(declare-fun tb!9243 () Bool)

(assert (=> (and start!99070 (= defaultEntry!1004 defaultEntry!1004) t!36674) tb!9243))

(declare-fun result!19059 () Bool)

(assert (=> tb!9243 (= result!19059 tp_is_empty!28969)))

(assert (=> b!1156509 t!36674))

(declare-fun b_and!39731 () Bool)

(assert (= b_and!39729 (and (=> t!36674 result!19059) b_and!39731)))

(declare-fun m!1066397 () Bool)

(assert (=> b!1156497 m!1066397))

(declare-fun m!1066399 () Bool)

(assert (=> b!1156512 m!1066399))

(declare-fun m!1066401 () Bool)

(assert (=> b!1156512 m!1066401))

(declare-fun m!1066403 () Bool)

(assert (=> b!1156512 m!1066403))

(assert (=> b!1156512 m!1066401))

(declare-fun m!1066405 () Bool)

(assert (=> b!1156512 m!1066405))

(declare-fun m!1066407 () Bool)

(assert (=> b!1156512 m!1066407))

(declare-fun m!1066409 () Bool)

(assert (=> b!1156512 m!1066409))

(declare-fun m!1066411 () Bool)

(assert (=> b!1156512 m!1066411))

(assert (=> b!1156512 m!1066403))

(assert (=> b!1156512 m!1066407))

(declare-fun m!1066413 () Bool)

(assert (=> b!1156512 m!1066413))

(declare-fun m!1066415 () Bool)

(assert (=> b!1156512 m!1066415))

(assert (=> b!1156512 m!1066407))

(declare-fun m!1066417 () Bool)

(assert (=> start!99070 m!1066417))

(declare-fun m!1066419 () Bool)

(assert (=> start!99070 m!1066419))

(declare-fun m!1066421 () Bool)

(assert (=> bm!54878 m!1066421))

(assert (=> b!1156507 m!1066407))

(declare-fun m!1066423 () Bool)

(assert (=> b!1156507 m!1066423))

(declare-fun m!1066425 () Bool)

(assert (=> mapNonEmpty!45278 m!1066425))

(declare-fun m!1066427 () Bool)

(assert (=> b!1156506 m!1066427))

(declare-fun m!1066429 () Bool)

(assert (=> b!1156506 m!1066429))

(declare-fun m!1066431 () Bool)

(assert (=> b!1156506 m!1066431))

(declare-fun m!1066433 () Bool)

(assert (=> b!1156513 m!1066433))

(declare-fun m!1066435 () Bool)

(assert (=> b!1156519 m!1066435))

(assert (=> bm!54879 m!1066433))

(assert (=> b!1156521 m!1066435))

(declare-fun m!1066437 () Bool)

(assert (=> bm!54876 m!1066437))

(declare-fun m!1066439 () Bool)

(assert (=> b!1156501 m!1066439))

(declare-fun m!1066441 () Bool)

(assert (=> b!1156505 m!1066441))

(declare-fun m!1066443 () Bool)

(assert (=> b!1156508 m!1066443))

(declare-fun m!1066445 () Bool)

(assert (=> b!1156508 m!1066445))

(declare-fun m!1066447 () Bool)

(assert (=> b!1156508 m!1066447))

(declare-fun m!1066449 () Bool)

(assert (=> b!1156508 m!1066449))

(declare-fun m!1066451 () Bool)

(assert (=> b!1156496 m!1066451))

(declare-fun m!1066453 () Bool)

(assert (=> b!1156496 m!1066453))

(declare-fun m!1066455 () Bool)

(assert (=> b!1156515 m!1066455))

(declare-fun m!1066457 () Bool)

(assert (=> b!1156515 m!1066457))

(declare-fun m!1066459 () Bool)

(assert (=> b!1156517 m!1066459))

(declare-fun m!1066461 () Bool)

(assert (=> b!1156502 m!1066461))

(assert (=> bm!54877 m!1066399))

(declare-fun m!1066463 () Bool)

(assert (=> b!1156524 m!1066463))

(declare-fun m!1066465 () Bool)

(assert (=> b!1156509 m!1066465))

(declare-fun m!1066467 () Bool)

(assert (=> b!1156509 m!1066467))

(declare-fun m!1066469 () Bool)

(assert (=> b!1156509 m!1066469))

(declare-fun m!1066471 () Bool)

(assert (=> b!1156509 m!1066471))

(declare-fun m!1066473 () Bool)

(assert (=> bm!54874 m!1066473))

(declare-fun m!1066475 () Bool)

(assert (=> b!1156510 m!1066475))

(check-sat (not b!1156513) tp_is_empty!28969 (not b!1156515) (not b!1156502) (not bm!54874) (not b!1156507) (not b!1156501) (not b!1156521) (not bm!54877) (not b_next!24439) (not b!1156510) (not b!1156524) (not b!1156509) (not b!1156496) (not b!1156508) (not bm!54879) (not start!99070) (not bm!54878) b_and!39731 (not b!1156497) (not b!1156505) (not b!1156512) (not mapNonEmpty!45278) (not b_lambda!19539) (not bm!54876) (not b!1156519) (not b!1156506))
(check-sat b_and!39731 (not b_next!24439))
