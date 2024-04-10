; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98830 () Bool)

(assert start!98830)

(declare-fun b_free!24435 () Bool)

(declare-fun b_next!24435 () Bool)

(assert (=> start!98830 (= b_free!24435 (not b_next!24435))))

(declare-fun tp!86015 () Bool)

(declare-fun b_and!39719 () Bool)

(assert (=> start!98830 (= tp!86015 b_and!39719)))

(declare-fun b!1155022 () Bool)

(declare-fun e!656886 () Bool)

(declare-fun tp_is_empty!28965 () Bool)

(assert (=> b!1155022 (= e!656886 tp_is_empty!28965)))

(declare-fun bm!54759 () Bool)

(declare-datatypes ((Unit!38030 0))(
  ( (Unit!38031) )
))
(declare-fun call!54766 () Unit!38030)

(declare-fun call!54764 () Unit!38030)

(assert (=> bm!54759 (= call!54766 call!54764)))

(declare-datatypes ((V!43747 0))(
  ( (V!43748 (val!14539 Int)) )
))
(declare-fun zeroValue!944 () V!43747)

(declare-datatypes ((tuple2!18486 0))(
  ( (tuple2!18487 (_1!9254 (_ BitVec 64)) (_2!9254 V!43747)) )
))
(declare-datatypes ((List!25230 0))(
  ( (Nil!25227) (Cons!25226 (h!26435 tuple2!18486) (t!36657 List!25230)) )
))
(declare-datatypes ((ListLongMap!16455 0))(
  ( (ListLongMap!16456 (toList!8243 List!25230)) )
))
(declare-fun call!54763 () ListLongMap!16455)

(declare-fun lt!518094 () ListLongMap!16455)

(declare-fun bm!54760 () Bool)

(declare-fun c!114776 () Bool)

(declare-fun c!114778 () Bool)

(declare-fun minValue!944 () V!43747)

(declare-fun +!3656 (ListLongMap!16455 tuple2!18486) ListLongMap!16455)

(assert (=> bm!54760 (= call!54763 (+!3656 lt!518094 (ite (or c!114778 c!114776) (tuple2!18487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155023 () Bool)

(declare-fun e!656892 () Unit!38030)

(declare-fun e!656881 () Unit!38030)

(assert (=> b!1155023 (= e!656892 e!656881)))

(declare-fun c!114775 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!518097 () Bool)

(assert (=> b!1155023 (= c!114775 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518097))))

(declare-fun b!1155024 () Bool)

(declare-fun res!767464 () Bool)

(declare-fun e!656885 () Bool)

(assert (=> b!1155024 (=> (not res!767464) (not e!656885))))

(declare-datatypes ((array!74777 0))(
  ( (array!74778 (arr!36039 (Array (_ BitVec 32) (_ BitVec 64))) (size!36575 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74777)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74777 (_ BitVec 32)) Bool)

(assert (=> b!1155024 (= res!767464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!656890 () Bool)

(declare-fun b!1155025 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155025 (= e!656890 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155026 () Bool)

(declare-fun e!656884 () Bool)

(assert (=> b!1155026 (= e!656884 tp_is_empty!28965)))

(declare-fun e!656878 () Bool)

(declare-fun call!54767 () ListLongMap!16455)

(declare-fun call!54765 () ListLongMap!16455)

(declare-fun b!1155027 () Bool)

(declare-fun -!1363 (ListLongMap!16455 (_ BitVec 64)) ListLongMap!16455)

(assert (=> b!1155027 (= e!656878 (= call!54767 (-!1363 call!54765 k0!934)))))

(declare-fun b!1155028 () Bool)

(declare-fun res!767461 () Bool)

(assert (=> b!1155028 (=> (not res!767461) (not e!656885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155028 (= res!767461 (validKeyInArray!0 k0!934))))

(declare-fun res!767462 () Bool)

(assert (=> start!98830 (=> (not res!767462) (not e!656885))))

(assert (=> start!98830 (= res!767462 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36575 _keys!1208))))))

(assert (=> start!98830 e!656885))

(assert (=> start!98830 tp_is_empty!28965))

(declare-fun array_inv!27582 (array!74777) Bool)

(assert (=> start!98830 (array_inv!27582 _keys!1208)))

(assert (=> start!98830 true))

(assert (=> start!98830 tp!86015))

(declare-datatypes ((ValueCell!13773 0))(
  ( (ValueCellFull!13773 (v!17176 V!43747)) (EmptyCell!13773) )
))
(declare-datatypes ((array!74779 0))(
  ( (array!74780 (arr!36040 (Array (_ BitVec 32) ValueCell!13773)) (size!36576 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74779)

(declare-fun e!656883 () Bool)

(declare-fun array_inv!27583 (array!74779) Bool)

(assert (=> start!98830 (and (array_inv!27583 _values!996) e!656883)))

(declare-fun b!1155029 () Bool)

(declare-fun e!656882 () Bool)

(assert (=> b!1155029 (= e!656882 true)))

(declare-fun e!656879 () Bool)

(assert (=> b!1155029 e!656879))

(declare-fun res!767459 () Bool)

(assert (=> b!1155029 (=> (not res!767459) (not e!656879))))

(declare-fun lt!518091 () ListLongMap!16455)

(assert (=> b!1155029 (= res!767459 (= lt!518091 lt!518094))))

(declare-fun lt!518093 () ListLongMap!16455)

(assert (=> b!1155029 (= lt!518091 (-!1363 lt!518093 k0!934))))

(declare-fun lt!518102 () V!43747)

(assert (=> b!1155029 (= (-!1363 (+!3656 lt!518094 (tuple2!18487 (select (arr!36039 _keys!1208) from!1455) lt!518102)) (select (arr!36039 _keys!1208) from!1455)) lt!518094)))

(declare-fun lt!518100 () Unit!38030)

(declare-fun addThenRemoveForNewKeyIsSame!203 (ListLongMap!16455 (_ BitVec 64) V!43747) Unit!38030)

(assert (=> b!1155029 (= lt!518100 (addThenRemoveForNewKeyIsSame!203 lt!518094 (select (arr!36039 _keys!1208) from!1455) lt!518102))))

(declare-fun lt!518104 () V!43747)

(declare-fun get!18361 (ValueCell!13773 V!43747) V!43747)

(assert (=> b!1155029 (= lt!518102 (get!18361 (select (arr!36040 _values!996) from!1455) lt!518104))))

(declare-fun lt!518092 () Unit!38030)

(declare-fun e!656880 () Unit!38030)

(assert (=> b!1155029 (= lt!518092 e!656880)))

(declare-fun c!114777 () Bool)

(declare-fun contains!6756 (ListLongMap!16455 (_ BitVec 64)) Bool)

(assert (=> b!1155029 (= c!114777 (contains!6756 lt!518094 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4712 (array!74777 array!74779 (_ BitVec 32) (_ BitVec 32) V!43747 V!43747 (_ BitVec 32) Int) ListLongMap!16455)

(assert (=> b!1155029 (= lt!518094 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155030 () Bool)

(declare-fun Unit!38032 () Unit!38030)

(assert (=> b!1155030 (= e!656880 Unit!38032)))

(declare-fun b!1155031 () Bool)

(assert (=> b!1155031 (= e!656878 (= call!54767 call!54765))))

(declare-fun b!1155032 () Bool)

(declare-fun call!54768 () Bool)

(assert (=> b!1155032 call!54768))

(declare-fun lt!518088 () Unit!38030)

(assert (=> b!1155032 (= lt!518088 call!54766)))

(assert (=> b!1155032 (= e!656881 lt!518088)))

(declare-fun b!1155033 () Bool)

(assert (=> b!1155033 (= e!656890 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518097) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518090 () array!74779)

(declare-fun lt!518105 () array!74777)

(declare-fun bm!54761 () Bool)

(assert (=> bm!54761 (= call!54767 (getCurrentListMapNoExtraKeys!4712 lt!518105 lt!518090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45272 () Bool)

(declare-fun mapRes!45272 () Bool)

(declare-fun tp!86016 () Bool)

(assert (=> mapNonEmpty!45272 (= mapRes!45272 (and tp!86016 e!656886))))

(declare-fun mapValue!45272 () ValueCell!13773)

(declare-fun mapRest!45272 () (Array (_ BitVec 32) ValueCell!13773))

(declare-fun mapKey!45272 () (_ BitVec 32))

(assert (=> mapNonEmpty!45272 (= (arr!36040 _values!996) (store mapRest!45272 mapKey!45272 mapValue!45272))))

(declare-fun bm!54762 () Bool)

(declare-fun call!54769 () Bool)

(assert (=> bm!54762 (= call!54768 call!54769)))

(declare-fun b!1155034 () Bool)

(declare-fun e!656888 () Bool)

(declare-fun e!656877 () Bool)

(assert (=> b!1155034 (= e!656888 (not e!656877))))

(declare-fun res!767455 () Bool)

(assert (=> b!1155034 (=> res!767455 e!656877)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155034 (= res!767455 (bvsgt from!1455 i!673))))

(assert (=> b!1155034 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518095 () Unit!38030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74777 (_ BitVec 64) (_ BitVec 32)) Unit!38030)

(assert (=> b!1155034 (= lt!518095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155035 () Bool)

(assert (=> b!1155035 (= e!656879 (= lt!518091 (getCurrentListMapNoExtraKeys!4712 lt!518105 lt!518090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155036 () Bool)

(declare-fun res!767468 () Bool)

(assert (=> b!1155036 (=> (not res!767468) (not e!656885))))

(declare-datatypes ((List!25231 0))(
  ( (Nil!25228) (Cons!25227 (h!26436 (_ BitVec 64)) (t!36658 List!25231)) )
))
(declare-fun arrayNoDuplicates!0 (array!74777 (_ BitVec 32) List!25231) Bool)

(assert (=> b!1155036 (= res!767468 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25228))))

(declare-fun bm!54763 () Bool)

(assert (=> bm!54763 (= call!54765 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155037 () Bool)

(declare-fun Unit!38033 () Unit!38030)

(assert (=> b!1155037 (= e!656880 Unit!38033)))

(assert (=> b!1155037 (= lt!518097 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155037 (= c!114778 (and (not lt!518097) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518089 () Unit!38030)

(declare-fun e!656889 () Unit!38030)

(assert (=> b!1155037 (= lt!518089 e!656889)))

(declare-fun lt!518101 () Unit!38030)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!491 (array!74777 array!74779 (_ BitVec 32) (_ BitVec 32) V!43747 V!43747 (_ BitVec 64) (_ BitVec 32) Int) Unit!38030)

(assert (=> b!1155037 (= lt!518101 (lemmaListMapContainsThenArrayContainsFrom!491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114773 () Bool)

(assert (=> b!1155037 (= c!114773 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767457 () Bool)

(assert (=> b!1155037 (= res!767457 e!656890)))

(declare-fun e!656876 () Bool)

(assert (=> b!1155037 (=> (not res!767457) (not e!656876))))

(assert (=> b!1155037 e!656876))

(declare-fun lt!518108 () Unit!38030)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74777 (_ BitVec 32) (_ BitVec 32)) Unit!38030)

(assert (=> b!1155037 (= lt!518108 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155037 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25228)))

(declare-fun lt!518106 () Unit!38030)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74777 (_ BitVec 64) (_ BitVec 32) List!25231) Unit!38030)

(assert (=> b!1155037 (= lt!518106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25228))))

(assert (=> b!1155037 false))

(declare-fun b!1155038 () Bool)

(declare-fun res!767454 () Bool)

(assert (=> b!1155038 (=> (not res!767454) (not e!656885))))

(assert (=> b!1155038 (= res!767454 (= (select (arr!36039 _keys!1208) i!673) k0!934))))

(declare-fun b!1155039 () Bool)

(declare-fun lt!518103 () ListLongMap!16455)

(assert (=> b!1155039 (contains!6756 (+!3656 lt!518103 (tuple2!18487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!518107 () Unit!38030)

(assert (=> b!1155039 (= lt!518107 call!54764)))

(assert (=> b!1155039 call!54769))

(assert (=> b!1155039 (= lt!518103 call!54763)))

(declare-fun lt!518098 () Unit!38030)

(declare-fun addStillContains!901 (ListLongMap!16455 (_ BitVec 64) V!43747 (_ BitVec 64)) Unit!38030)

(assert (=> b!1155039 (= lt!518098 (addStillContains!901 lt!518094 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1155039 (= e!656889 lt!518107)))

(declare-fun bm!54764 () Bool)

(assert (=> bm!54764 (= call!54764 (addStillContains!901 (ite c!114778 lt!518103 lt!518094) (ite c!114778 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114776 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114778 minValue!944 (ite c!114776 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155040 () Bool)

(declare-fun e!656891 () Bool)

(assert (=> b!1155040 (= e!656877 e!656891)))

(declare-fun res!767466 () Bool)

(assert (=> b!1155040 (=> res!767466 e!656891)))

(assert (=> b!1155040 (= res!767466 (not (= from!1455 i!673)))))

(declare-fun lt!518096 () ListLongMap!16455)

(assert (=> b!1155040 (= lt!518096 (getCurrentListMapNoExtraKeys!4712 lt!518105 lt!518090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155040 (= lt!518090 (array!74780 (store (arr!36040 _values!996) i!673 (ValueCellFull!13773 lt!518104)) (size!36576 _values!996)))))

(declare-fun dynLambda!2723 (Int (_ BitVec 64)) V!43747)

(assert (=> b!1155040 (= lt!518104 (dynLambda!2723 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155040 (= lt!518093 (getCurrentListMapNoExtraKeys!4712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45272 () Bool)

(assert (=> mapIsEmpty!45272 mapRes!45272))

(declare-fun b!1155041 () Bool)

(declare-fun res!767463 () Bool)

(assert (=> b!1155041 (=> (not res!767463) (not e!656888))))

(assert (=> b!1155041 (= res!767463 (arrayNoDuplicates!0 lt!518105 #b00000000000000000000000000000000 Nil!25228))))

(declare-fun b!1155042 () Bool)

(declare-fun res!767458 () Bool)

(assert (=> b!1155042 (=> (not res!767458) (not e!656885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155042 (= res!767458 (validMask!0 mask!1564))))

(declare-fun b!1155043 () Bool)

(assert (=> b!1155043 (= e!656891 e!656882)))

(declare-fun res!767467 () Bool)

(assert (=> b!1155043 (=> res!767467 e!656882)))

(assert (=> b!1155043 (= res!767467 (not (= (select (arr!36039 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155043 e!656878))

(declare-fun c!114774 () Bool)

(assert (=> b!1155043 (= c!114774 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518109 () Unit!38030)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!596 (array!74777 array!74779 (_ BitVec 32) (_ BitVec 32) V!43747 V!43747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38030)

(assert (=> b!1155043 (= lt!518109 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54765 () Bool)

(declare-fun call!54762 () ListLongMap!16455)

(assert (=> bm!54765 (= call!54762 call!54763)))

(declare-fun b!1155044 () Bool)

(assert (=> b!1155044 (= e!656876 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155045 () Bool)

(declare-fun res!767465 () Bool)

(assert (=> b!1155045 (=> (not res!767465) (not e!656885))))

(assert (=> b!1155045 (= res!767465 (and (= (size!36576 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36575 _keys!1208) (size!36576 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1155046 () Bool)

(declare-fun res!767456 () Bool)

(assert (=> b!1155046 (=> (not res!767456) (not e!656885))))

(assert (=> b!1155046 (= res!767456 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36575 _keys!1208))))))

(declare-fun b!1155047 () Bool)

(assert (=> b!1155047 (= c!114776 (and (not lt!518097) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155047 (= e!656889 e!656892)))

(declare-fun b!1155048 () Bool)

(assert (=> b!1155048 (= e!656885 e!656888)))

(declare-fun res!767460 () Bool)

(assert (=> b!1155048 (=> (not res!767460) (not e!656888))))

(assert (=> b!1155048 (= res!767460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518105 mask!1564))))

(assert (=> b!1155048 (= lt!518105 (array!74778 (store (arr!36039 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36575 _keys!1208)))))

(declare-fun bm!54766 () Bool)

(assert (=> bm!54766 (= call!54769 (contains!6756 (ite c!114778 lt!518103 call!54762) k0!934))))

(declare-fun b!1155049 () Bool)

(declare-fun Unit!38034 () Unit!38030)

(assert (=> b!1155049 (= e!656881 Unit!38034)))

(declare-fun b!1155050 () Bool)

(declare-fun lt!518099 () Unit!38030)

(assert (=> b!1155050 (= e!656892 lt!518099)))

(assert (=> b!1155050 (= lt!518099 call!54766)))

(assert (=> b!1155050 call!54768))

(declare-fun b!1155051 () Bool)

(assert (=> b!1155051 (= e!656883 (and e!656884 mapRes!45272))))

(declare-fun condMapEmpty!45272 () Bool)

(declare-fun mapDefault!45272 () ValueCell!13773)

(assert (=> b!1155051 (= condMapEmpty!45272 (= (arr!36040 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13773)) mapDefault!45272)))))

(assert (= (and start!98830 res!767462) b!1155042))

(assert (= (and b!1155042 res!767458) b!1155045))

(assert (= (and b!1155045 res!767465) b!1155024))

(assert (= (and b!1155024 res!767464) b!1155036))

(assert (= (and b!1155036 res!767468) b!1155046))

(assert (= (and b!1155046 res!767456) b!1155028))

(assert (= (and b!1155028 res!767461) b!1155038))

(assert (= (and b!1155038 res!767454) b!1155048))

(assert (= (and b!1155048 res!767460) b!1155041))

(assert (= (and b!1155041 res!767463) b!1155034))

(assert (= (and b!1155034 (not res!767455)) b!1155040))

(assert (= (and b!1155040 (not res!767466)) b!1155043))

(assert (= (and b!1155043 c!114774) b!1155027))

(assert (= (and b!1155043 (not c!114774)) b!1155031))

(assert (= (or b!1155027 b!1155031) bm!54761))

(assert (= (or b!1155027 b!1155031) bm!54763))

(assert (= (and b!1155043 (not res!767467)) b!1155029))

(assert (= (and b!1155029 c!114777) b!1155037))

(assert (= (and b!1155029 (not c!114777)) b!1155030))

(assert (= (and b!1155037 c!114778) b!1155039))

(assert (= (and b!1155037 (not c!114778)) b!1155047))

(assert (= (and b!1155047 c!114776) b!1155050))

(assert (= (and b!1155047 (not c!114776)) b!1155023))

(assert (= (and b!1155023 c!114775) b!1155032))

(assert (= (and b!1155023 (not c!114775)) b!1155049))

(assert (= (or b!1155050 b!1155032) bm!54759))

(assert (= (or b!1155050 b!1155032) bm!54765))

(assert (= (or b!1155050 b!1155032) bm!54762))

(assert (= (or b!1155039 bm!54762) bm!54766))

(assert (= (or b!1155039 bm!54759) bm!54764))

(assert (= (or b!1155039 bm!54765) bm!54760))

(assert (= (and b!1155037 c!114773) b!1155025))

(assert (= (and b!1155037 (not c!114773)) b!1155033))

(assert (= (and b!1155037 res!767457) b!1155044))

(assert (= (and b!1155029 res!767459) b!1155035))

(assert (= (and b!1155051 condMapEmpty!45272) mapIsEmpty!45272))

(assert (= (and b!1155051 (not condMapEmpty!45272)) mapNonEmpty!45272))

(get-info :version)

(assert (= (and mapNonEmpty!45272 ((_ is ValueCellFull!13773) mapValue!45272)) b!1155022))

(assert (= (and b!1155051 ((_ is ValueCellFull!13773) mapDefault!45272)) b!1155026))

(assert (= start!98830 b!1155051))

(declare-fun b_lambda!19541 () Bool)

(assert (=> (not b_lambda!19541) (not b!1155040)))

(declare-fun t!36656 () Bool)

(declare-fun tb!9247 () Bool)

(assert (=> (and start!98830 (= defaultEntry!1004 defaultEntry!1004) t!36656) tb!9247))

(declare-fun result!19059 () Bool)

(assert (=> tb!9247 (= result!19059 tp_is_empty!28965)))

(assert (=> b!1155040 t!36656))

(declare-fun b_and!39721 () Bool)

(assert (= b_and!39719 (and (=> t!36656 result!19059) b_and!39721)))

(declare-fun m!1064665 () Bool)

(assert (=> b!1155044 m!1064665))

(assert (=> b!1155025 m!1064665))

(declare-fun m!1064667 () Bool)

(assert (=> b!1155043 m!1064667))

(declare-fun m!1064669 () Bool)

(assert (=> b!1155043 m!1064669))

(declare-fun m!1064671 () Bool)

(assert (=> bm!54761 m!1064671))

(assert (=> b!1155035 m!1064671))

(declare-fun m!1064673 () Bool)

(assert (=> b!1155042 m!1064673))

(declare-fun m!1064675 () Bool)

(assert (=> b!1155029 m!1064675))

(declare-fun m!1064677 () Bool)

(assert (=> b!1155029 m!1064677))

(declare-fun m!1064679 () Bool)

(assert (=> b!1155029 m!1064679))

(assert (=> b!1155029 m!1064679))

(declare-fun m!1064681 () Bool)

(assert (=> b!1155029 m!1064681))

(assert (=> b!1155029 m!1064667))

(declare-fun m!1064683 () Bool)

(assert (=> b!1155029 m!1064683))

(declare-fun m!1064685 () Bool)

(assert (=> b!1155029 m!1064685))

(assert (=> b!1155029 m!1064667))

(declare-fun m!1064687 () Bool)

(assert (=> b!1155029 m!1064687))

(assert (=> b!1155029 m!1064685))

(declare-fun m!1064689 () Bool)

(assert (=> b!1155029 m!1064689))

(assert (=> b!1155029 m!1064667))

(declare-fun m!1064691 () Bool)

(assert (=> b!1155037 m!1064691))

(declare-fun m!1064693 () Bool)

(assert (=> b!1155037 m!1064693))

(declare-fun m!1064695 () Bool)

(assert (=> b!1155037 m!1064695))

(declare-fun m!1064697 () Bool)

(assert (=> b!1155037 m!1064697))

(declare-fun m!1064699 () Bool)

(assert (=> b!1155036 m!1064699))

(declare-fun m!1064701 () Bool)

(assert (=> b!1155040 m!1064701))

(declare-fun m!1064703 () Bool)

(assert (=> b!1155040 m!1064703))

(declare-fun m!1064705 () Bool)

(assert (=> b!1155040 m!1064705))

(declare-fun m!1064707 () Bool)

(assert (=> b!1155040 m!1064707))

(declare-fun m!1064709 () Bool)

(assert (=> b!1155027 m!1064709))

(declare-fun m!1064711 () Bool)

(assert (=> mapNonEmpty!45272 m!1064711))

(declare-fun m!1064713 () Bool)

(assert (=> b!1155038 m!1064713))

(declare-fun m!1064715 () Bool)

(assert (=> b!1155034 m!1064715))

(declare-fun m!1064717 () Bool)

(assert (=> b!1155034 m!1064717))

(assert (=> bm!54763 m!1064675))

(declare-fun m!1064719 () Bool)

(assert (=> bm!54766 m!1064719))

(declare-fun m!1064721 () Bool)

(assert (=> b!1155048 m!1064721))

(declare-fun m!1064723 () Bool)

(assert (=> b!1155048 m!1064723))

(declare-fun m!1064725 () Bool)

(assert (=> b!1155039 m!1064725))

(assert (=> b!1155039 m!1064725))

(declare-fun m!1064727 () Bool)

(assert (=> b!1155039 m!1064727))

(declare-fun m!1064729 () Bool)

(assert (=> b!1155039 m!1064729))

(declare-fun m!1064731 () Bool)

(assert (=> b!1155028 m!1064731))

(declare-fun m!1064733 () Bool)

(assert (=> start!98830 m!1064733))

(declare-fun m!1064735 () Bool)

(assert (=> start!98830 m!1064735))

(declare-fun m!1064737 () Bool)

(assert (=> b!1155041 m!1064737))

(declare-fun m!1064739 () Bool)

(assert (=> bm!54760 m!1064739))

(declare-fun m!1064741 () Bool)

(assert (=> b!1155024 m!1064741))

(declare-fun m!1064743 () Bool)

(assert (=> bm!54764 m!1064743))

(check-sat (not b!1155034) tp_is_empty!28965 (not start!98830) (not b!1155039) (not b!1155036) (not bm!54764) (not b!1155044) (not bm!54761) (not b!1155025) (not b!1155027) (not bm!54760) (not bm!54763) b_and!39721 (not b_lambda!19541) (not b!1155042) (not b!1155024) (not b!1155035) (not b!1155028) (not b!1155029) (not bm!54766) (not b!1155040) (not b!1155041) (not b!1155037) (not b_next!24435) (not b!1155048) (not mapNonEmpty!45272) (not b!1155043))
(check-sat b_and!39721 (not b_next!24435))
