; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98906 () Bool)

(assert start!98906)

(declare-fun b_free!24517 () Bool)

(declare-fun b_next!24517 () Bool)

(assert (=> start!98906 (= b_free!24517 (not b_next!24517))))

(declare-fun tp!86261 () Bool)

(declare-fun b_and!39861 () Bool)

(assert (=> start!98906 (= tp!86261 b_and!39861)))

(declare-fun b!1158670 () Bool)

(declare-fun res!769239 () Bool)

(declare-fun e!658905 () Bool)

(assert (=> b!1158670 (=> (not res!769239) (not e!658905))))

(declare-datatypes ((array!74856 0))(
  ( (array!74857 (arr!36079 (Array (_ BitVec 32) (_ BitVec 64))) (size!36617 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74856)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43857 0))(
  ( (V!43858 (val!14580 Int)) )
))
(declare-datatypes ((ValueCell!13814 0))(
  ( (ValueCellFull!13814 (v!17216 V!43857)) (EmptyCell!13814) )
))
(declare-datatypes ((array!74858 0))(
  ( (array!74859 (arr!36080 (Array (_ BitVec 32) ValueCell!13814)) (size!36618 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74858)

(assert (=> b!1158670 (= res!769239 (and (= (size!36618 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36617 _keys!1208) (size!36618 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158671 () Bool)

(declare-fun e!658902 () Bool)

(declare-fun e!658891 () Bool)

(assert (=> b!1158671 (= e!658902 e!658891)))

(declare-fun res!769235 () Bool)

(assert (=> b!1158671 (=> res!769235 e!658891)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158671 (= res!769235 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43857)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!520609 () array!74858)

(declare-datatypes ((tuple2!18644 0))(
  ( (tuple2!18645 (_1!9333 (_ BitVec 64)) (_2!9333 V!43857)) )
))
(declare-datatypes ((List!25367 0))(
  ( (Nil!25364) (Cons!25363 (h!26572 tuple2!18644) (t!36867 List!25367)) )
))
(declare-datatypes ((ListLongMap!16613 0))(
  ( (ListLongMap!16614 (toList!8322 List!25367)) )
))
(declare-fun lt!520623 () ListLongMap!16613)

(declare-fun minValue!944 () V!43857)

(declare-fun lt!520613 () array!74856)

(declare-fun getCurrentListMapNoExtraKeys!4802 (array!74856 array!74858 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 32) Int) ListLongMap!16613)

(assert (=> b!1158671 (= lt!520623 (getCurrentListMapNoExtraKeys!4802 lt!520613 lt!520609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520611 () V!43857)

(assert (=> b!1158671 (= lt!520609 (array!74859 (store (arr!36080 _values!996) i!673 (ValueCellFull!13814 lt!520611)) (size!36618 _values!996)))))

(declare-fun dynLambda!2750 (Int (_ BitVec 64)) V!43857)

(assert (=> b!1158671 (= lt!520611 (dynLambda!2750 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520617 () ListLongMap!16613)

(assert (=> b!1158671 (= lt!520617 (getCurrentListMapNoExtraKeys!4802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158672 () Bool)

(declare-fun res!769245 () Bool)

(assert (=> b!1158672 (=> (not res!769245) (not e!658905))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1158672 (= res!769245 (= (select (arr!36079 _keys!1208) i!673) k0!934))))

(declare-fun b!1158673 () Bool)

(declare-fun res!769233 () Bool)

(assert (=> b!1158673 (=> (not res!769233) (not e!658905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158673 (= res!769233 (validMask!0 mask!1564))))

(declare-fun call!55723 () ListLongMap!16613)

(declare-fun e!658896 () Bool)

(declare-fun call!55728 () ListLongMap!16613)

(declare-fun b!1158674 () Bool)

(declare-fun -!1376 (ListLongMap!16613 (_ BitVec 64)) ListLongMap!16613)

(assert (=> b!1158674 (= e!658896 (= call!55723 (-!1376 call!55728 k0!934)))))

(declare-fun b!1158675 () Bool)

(declare-fun res!769242 () Bool)

(assert (=> b!1158675 (=> (not res!769242) (not e!658905))))

(declare-datatypes ((List!25368 0))(
  ( (Nil!25365) (Cons!25364 (h!26573 (_ BitVec 64)) (t!36868 List!25368)) )
))
(declare-fun arrayNoDuplicates!0 (array!74856 (_ BitVec 32) List!25368) Bool)

(assert (=> b!1158675 (= res!769242 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25365))))

(declare-fun b!1158676 () Bool)

(declare-fun res!769246 () Bool)

(assert (=> b!1158676 (=> (not res!769246) (not e!658905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74856 (_ BitVec 32)) Bool)

(assert (=> b!1158676 (= res!769246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158677 () Bool)

(declare-fun e!658895 () Bool)

(declare-fun tp_is_empty!29047 () Bool)

(assert (=> b!1158677 (= e!658895 tp_is_empty!29047)))

(declare-fun b!1158678 () Bool)

(declare-fun c!115486 () Bool)

(declare-fun lt!520621 () Bool)

(assert (=> b!1158678 (= c!115486 (and (not lt!520621) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38031 0))(
  ( (Unit!38032) )
))
(declare-fun e!658893 () Unit!38031)

(declare-fun e!658900 () Unit!38031)

(assert (=> b!1158678 (= e!658893 e!658900)))

(declare-fun bm!55720 () Bool)

(declare-fun call!55727 () Bool)

(declare-fun call!55726 () Bool)

(assert (=> bm!55720 (= call!55727 call!55726)))

(declare-fun b!1158679 () Bool)

(declare-fun e!658890 () Bool)

(declare-fun arrayContainsKey!0 (array!74856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158679 (= e!658890 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!520607 () ListLongMap!16613)

(declare-fun b!1158680 () Bool)

(declare-fun e!658899 () Bool)

(assert (=> b!1158680 (= e!658899 (= lt!520607 (getCurrentListMapNoExtraKeys!4802 lt!520613 lt!520609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158681 () Bool)

(assert (=> b!1158681 (= e!658896 (= call!55723 call!55728))))

(declare-fun b!1158682 () Bool)

(declare-fun res!769243 () Bool)

(declare-fun e!658889 () Bool)

(assert (=> b!1158682 (=> (not res!769243) (not e!658889))))

(assert (=> b!1158682 (= res!769243 (arrayNoDuplicates!0 lt!520613 #b00000000000000000000000000000000 Nil!25365))))

(declare-fun b!1158683 () Bool)

(declare-fun lt!520620 () Unit!38031)

(assert (=> b!1158683 (= e!658900 lt!520620)))

(declare-fun call!55730 () Unit!38031)

(assert (=> b!1158683 (= lt!520620 call!55730)))

(assert (=> b!1158683 call!55727))

(declare-fun b!1158684 () Bool)

(declare-fun call!55729 () ListLongMap!16613)

(declare-fun contains!6773 (ListLongMap!16613 (_ BitVec 64)) Bool)

(assert (=> b!1158684 (contains!6773 call!55729 k0!934)))

(declare-fun lt!520618 () Unit!38031)

(declare-fun call!55725 () Unit!38031)

(assert (=> b!1158684 (= lt!520618 call!55725)))

(assert (=> b!1158684 call!55726))

(declare-fun lt!520602 () ListLongMap!16613)

(declare-fun lt!520619 () ListLongMap!16613)

(declare-fun +!3730 (ListLongMap!16613 tuple2!18644) ListLongMap!16613)

(assert (=> b!1158684 (= lt!520602 (+!3730 lt!520619 (tuple2!18645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520616 () Unit!38031)

(declare-fun addStillContains!938 (ListLongMap!16613 (_ BitVec 64) V!43857 (_ BitVec 64)) Unit!38031)

(assert (=> b!1158684 (= lt!520616 (addStillContains!938 lt!520619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1158684 (= e!658893 lt!520618)))

(declare-fun b!1158685 () Bool)

(declare-fun e!658898 () Bool)

(assert (=> b!1158685 (= e!658898 true)))

(assert (=> b!1158685 e!658899))

(declare-fun res!769240 () Bool)

(assert (=> b!1158685 (=> (not res!769240) (not e!658899))))

(assert (=> b!1158685 (= res!769240 (= lt!520607 lt!520619))))

(assert (=> b!1158685 (= lt!520607 (-!1376 lt!520617 k0!934))))

(declare-fun lt!520615 () V!43857)

(assert (=> b!1158685 (= (-!1376 (+!3730 lt!520619 (tuple2!18645 (select (arr!36079 _keys!1208) from!1455) lt!520615)) (select (arr!36079 _keys!1208) from!1455)) lt!520619)))

(declare-fun lt!520612 () Unit!38031)

(declare-fun addThenRemoveForNewKeyIsSame!225 (ListLongMap!16613 (_ BitVec 64) V!43857) Unit!38031)

(assert (=> b!1158685 (= lt!520612 (addThenRemoveForNewKeyIsSame!225 lt!520619 (select (arr!36079 _keys!1208) from!1455) lt!520615))))

(declare-fun get!18411 (ValueCell!13814 V!43857) V!43857)

(assert (=> b!1158685 (= lt!520615 (get!18411 (select (arr!36080 _values!996) from!1455) lt!520611))))

(declare-fun lt!520606 () Unit!38031)

(declare-fun e!658903 () Unit!38031)

(assert (=> b!1158685 (= lt!520606 e!658903)))

(declare-fun c!115489 () Bool)

(assert (=> b!1158685 (= c!115489 (contains!6773 lt!520619 k0!934))))

(assert (=> b!1158685 (= lt!520619 (getCurrentListMapNoExtraKeys!4802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158686 () Bool)

(declare-fun res!769234 () Bool)

(assert (=> b!1158686 (=> (not res!769234) (not e!658905))))

(assert (=> b!1158686 (= res!769234 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36617 _keys!1208))))))

(declare-fun bm!55721 () Bool)

(declare-fun c!115490 () Bool)

(assert (=> bm!55721 (= call!55729 (+!3730 (ite c!115490 lt!520602 lt!520619) (ite c!115490 (tuple2!18645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115486 (tuple2!18645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158687 () Bool)

(declare-fun Unit!38033 () Unit!38031)

(assert (=> b!1158687 (= e!658903 Unit!38033)))

(assert (=> b!1158687 (= lt!520621 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158687 (= c!115490 (and (not lt!520621) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520605 () Unit!38031)

(assert (=> b!1158687 (= lt!520605 e!658893)))

(declare-fun lt!520610 () Unit!38031)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!517 (array!74856 array!74858 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 64) (_ BitVec 32) Int) Unit!38031)

(assert (=> b!1158687 (= lt!520610 (lemmaListMapContainsThenArrayContainsFrom!517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115488 () Bool)

(assert (=> b!1158687 (= c!115488 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769237 () Bool)

(assert (=> b!1158687 (= res!769237 e!658890)))

(declare-fun e!658897 () Bool)

(assert (=> b!1158687 (=> (not res!769237) (not e!658897))))

(assert (=> b!1158687 e!658897))

(declare-fun lt!520604 () Unit!38031)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74856 (_ BitVec 32) (_ BitVec 32)) Unit!38031)

(assert (=> b!1158687 (= lt!520604 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158687 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25365)))

(declare-fun lt!520603 () Unit!38031)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74856 (_ BitVec 64) (_ BitVec 32) List!25368) Unit!38031)

(assert (=> b!1158687 (= lt!520603 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25365))))

(assert (=> b!1158687 false))

(declare-fun mapNonEmpty!45395 () Bool)

(declare-fun mapRes!45395 () Bool)

(declare-fun tp!86262 () Bool)

(declare-fun e!658901 () Bool)

(assert (=> mapNonEmpty!45395 (= mapRes!45395 (and tp!86262 e!658901))))

(declare-fun mapKey!45395 () (_ BitVec 32))

(declare-fun mapRest!45395 () (Array (_ BitVec 32) ValueCell!13814))

(declare-fun mapValue!45395 () ValueCell!13814)

(assert (=> mapNonEmpty!45395 (= (arr!36080 _values!996) (store mapRest!45395 mapKey!45395 mapValue!45395))))

(declare-fun mapIsEmpty!45395 () Bool)

(assert (=> mapIsEmpty!45395 mapRes!45395))

(declare-fun call!55724 () ListLongMap!16613)

(declare-fun bm!55722 () Bool)

(assert (=> bm!55722 (= call!55726 (contains!6773 (ite c!115490 lt!520602 call!55724) k0!934))))

(declare-fun b!1158688 () Bool)

(declare-fun res!769236 () Bool)

(assert (=> b!1158688 (=> (not res!769236) (not e!658905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158688 (= res!769236 (validKeyInArray!0 k0!934))))

(declare-fun b!1158689 () Bool)

(assert (=> b!1158689 call!55727))

(declare-fun lt!520614 () Unit!38031)

(assert (=> b!1158689 (= lt!520614 call!55730)))

(declare-fun e!658894 () Unit!38031)

(assert (=> b!1158689 (= e!658894 lt!520614)))

(declare-fun b!1158690 () Bool)

(declare-fun Unit!38034 () Unit!38031)

(assert (=> b!1158690 (= e!658903 Unit!38034)))

(declare-fun b!1158691 () Bool)

(declare-fun Unit!38035 () Unit!38031)

(assert (=> b!1158691 (= e!658894 Unit!38035)))

(declare-fun b!1158692 () Bool)

(assert (=> b!1158692 (= e!658890 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520621) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55723 () Bool)

(assert (=> bm!55723 (= call!55728 (getCurrentListMapNoExtraKeys!4802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158693 () Bool)

(assert (=> b!1158693 (= e!658901 tp_is_empty!29047)))

(declare-fun b!1158694 () Bool)

(assert (=> b!1158694 (= e!658900 e!658894)))

(declare-fun c!115485 () Bool)

(assert (=> b!1158694 (= c!115485 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520621))))

(declare-fun bm!55724 () Bool)

(assert (=> bm!55724 (= call!55725 (addStillContains!938 (ite c!115490 lt!520602 lt!520619) (ite c!115490 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115486 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115490 minValue!944 (ite c!115486 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158695 () Bool)

(assert (=> b!1158695 (= e!658889 (not e!658902))))

(declare-fun res!769238 () Bool)

(assert (=> b!1158695 (=> res!769238 e!658902)))

(assert (=> b!1158695 (= res!769238 (bvsgt from!1455 i!673))))

(assert (=> b!1158695 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520608 () Unit!38031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74856 (_ BitVec 64) (_ BitVec 32)) Unit!38031)

(assert (=> b!1158695 (= lt!520608 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158696 () Bool)

(declare-fun e!658892 () Bool)

(assert (=> b!1158696 (= e!658892 (and e!658895 mapRes!45395))))

(declare-fun condMapEmpty!45395 () Bool)

(declare-fun mapDefault!45395 () ValueCell!13814)

(assert (=> b!1158696 (= condMapEmpty!45395 (= (arr!36080 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13814)) mapDefault!45395)))))

(declare-fun bm!55725 () Bool)

(assert (=> bm!55725 (= call!55730 call!55725)))

(declare-fun b!1158697 () Bool)

(assert (=> b!1158697 (= e!658891 e!658898)))

(declare-fun res!769247 () Bool)

(assert (=> b!1158697 (=> res!769247 e!658898)))

(assert (=> b!1158697 (= res!769247 (not (= (select (arr!36079 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158697 e!658896))

(declare-fun c!115487 () Bool)

(assert (=> b!1158697 (= c!115487 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520622 () Unit!38031)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 (array!74856 array!74858 (_ BitVec 32) (_ BitVec 32) V!43857 V!43857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38031)

(assert (=> b!1158697 (= lt!520622 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158698 () Bool)

(assert (=> b!1158698 (= e!658897 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!769241 () Bool)

(assert (=> start!98906 (=> (not res!769241) (not e!658905))))

(assert (=> start!98906 (= res!769241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36617 _keys!1208))))))

(assert (=> start!98906 e!658905))

(assert (=> start!98906 tp_is_empty!29047))

(declare-fun array_inv!27722 (array!74856) Bool)

(assert (=> start!98906 (array_inv!27722 _keys!1208)))

(assert (=> start!98906 true))

(assert (=> start!98906 tp!86261))

(declare-fun array_inv!27723 (array!74858) Bool)

(assert (=> start!98906 (and (array_inv!27723 _values!996) e!658892)))

(declare-fun bm!55726 () Bool)

(assert (=> bm!55726 (= call!55723 (getCurrentListMapNoExtraKeys!4802 lt!520613 lt!520609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158699 () Bool)

(assert (=> b!1158699 (= e!658905 e!658889)))

(declare-fun res!769244 () Bool)

(assert (=> b!1158699 (=> (not res!769244) (not e!658889))))

(assert (=> b!1158699 (= res!769244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520613 mask!1564))))

(assert (=> b!1158699 (= lt!520613 (array!74857 (store (arr!36079 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36617 _keys!1208)))))

(declare-fun bm!55727 () Bool)

(assert (=> bm!55727 (= call!55724 call!55729)))

(assert (= (and start!98906 res!769241) b!1158673))

(assert (= (and b!1158673 res!769233) b!1158670))

(assert (= (and b!1158670 res!769239) b!1158676))

(assert (= (and b!1158676 res!769246) b!1158675))

(assert (= (and b!1158675 res!769242) b!1158686))

(assert (= (and b!1158686 res!769234) b!1158688))

(assert (= (and b!1158688 res!769236) b!1158672))

(assert (= (and b!1158672 res!769245) b!1158699))

(assert (= (and b!1158699 res!769244) b!1158682))

(assert (= (and b!1158682 res!769243) b!1158695))

(assert (= (and b!1158695 (not res!769238)) b!1158671))

(assert (= (and b!1158671 (not res!769235)) b!1158697))

(assert (= (and b!1158697 c!115487) b!1158674))

(assert (= (and b!1158697 (not c!115487)) b!1158681))

(assert (= (or b!1158674 b!1158681) bm!55726))

(assert (= (or b!1158674 b!1158681) bm!55723))

(assert (= (and b!1158697 (not res!769247)) b!1158685))

(assert (= (and b!1158685 c!115489) b!1158687))

(assert (= (and b!1158685 (not c!115489)) b!1158690))

(assert (= (and b!1158687 c!115490) b!1158684))

(assert (= (and b!1158687 (not c!115490)) b!1158678))

(assert (= (and b!1158678 c!115486) b!1158683))

(assert (= (and b!1158678 (not c!115486)) b!1158694))

(assert (= (and b!1158694 c!115485) b!1158689))

(assert (= (and b!1158694 (not c!115485)) b!1158691))

(assert (= (or b!1158683 b!1158689) bm!55725))

(assert (= (or b!1158683 b!1158689) bm!55727))

(assert (= (or b!1158683 b!1158689) bm!55720))

(assert (= (or b!1158684 bm!55720) bm!55722))

(assert (= (or b!1158684 bm!55725) bm!55724))

(assert (= (or b!1158684 bm!55727) bm!55721))

(assert (= (and b!1158687 c!115488) b!1158679))

(assert (= (and b!1158687 (not c!115488)) b!1158692))

(assert (= (and b!1158687 res!769237) b!1158698))

(assert (= (and b!1158685 res!769240) b!1158680))

(assert (= (and b!1158696 condMapEmpty!45395) mapIsEmpty!45395))

(assert (= (and b!1158696 (not condMapEmpty!45395)) mapNonEmpty!45395))

(get-info :version)

(assert (= (and mapNonEmpty!45395 ((_ is ValueCellFull!13814) mapValue!45395)) b!1158693))

(assert (= (and b!1158696 ((_ is ValueCellFull!13814) mapDefault!45395)) b!1158677))

(assert (= start!98906 b!1158696))

(declare-fun b_lambda!19605 () Bool)

(assert (=> (not b_lambda!19605) (not b!1158671)))

(declare-fun t!36866 () Bool)

(declare-fun tb!9321 () Bool)

(assert (=> (and start!98906 (= defaultEntry!1004 defaultEntry!1004) t!36866) tb!9321))

(declare-fun result!19215 () Bool)

(assert (=> tb!9321 (= result!19215 tp_is_empty!29047)))

(assert (=> b!1158671 t!36866))

(declare-fun b_and!39863 () Bool)

(assert (= b_and!39861 (and (=> t!36866 result!19215) b_and!39863)))

(declare-fun m!1067355 () Bool)

(assert (=> b!1158675 m!1067355))

(declare-fun m!1067357 () Bool)

(assert (=> b!1158687 m!1067357))

(declare-fun m!1067359 () Bool)

(assert (=> b!1158687 m!1067359))

(declare-fun m!1067361 () Bool)

(assert (=> b!1158687 m!1067361))

(declare-fun m!1067363 () Bool)

(assert (=> b!1158687 m!1067363))

(declare-fun m!1067365 () Bool)

(assert (=> b!1158697 m!1067365))

(declare-fun m!1067367 () Bool)

(assert (=> b!1158697 m!1067367))

(declare-fun m!1067369 () Bool)

(assert (=> bm!55722 m!1067369))

(declare-fun m!1067371 () Bool)

(assert (=> b!1158688 m!1067371))

(declare-fun m!1067373 () Bool)

(assert (=> bm!55723 m!1067373))

(declare-fun m!1067375 () Bool)

(assert (=> bm!55726 m!1067375))

(declare-fun m!1067377 () Bool)

(assert (=> b!1158695 m!1067377))

(declare-fun m!1067379 () Bool)

(assert (=> b!1158695 m!1067379))

(declare-fun m!1067381 () Bool)

(assert (=> b!1158674 m!1067381))

(declare-fun m!1067383 () Bool)

(assert (=> bm!55721 m!1067383))

(declare-fun m!1067385 () Bool)

(assert (=> b!1158672 m!1067385))

(declare-fun m!1067387 () Bool)

(assert (=> b!1158698 m!1067387))

(declare-fun m!1067389 () Bool)

(assert (=> start!98906 m!1067389))

(declare-fun m!1067391 () Bool)

(assert (=> start!98906 m!1067391))

(assert (=> b!1158680 m!1067375))

(declare-fun m!1067393 () Bool)

(assert (=> b!1158699 m!1067393))

(declare-fun m!1067395 () Bool)

(assert (=> b!1158699 m!1067395))

(declare-fun m!1067397 () Bool)

(assert (=> b!1158676 m!1067397))

(declare-fun m!1067399 () Bool)

(assert (=> b!1158684 m!1067399))

(declare-fun m!1067401 () Bool)

(assert (=> b!1158684 m!1067401))

(declare-fun m!1067403 () Bool)

(assert (=> b!1158684 m!1067403))

(assert (=> b!1158679 m!1067387))

(declare-fun m!1067405 () Bool)

(assert (=> b!1158673 m!1067405))

(assert (=> b!1158685 m!1067373))

(declare-fun m!1067407 () Bool)

(assert (=> b!1158685 m!1067407))

(assert (=> b!1158685 m!1067407))

(declare-fun m!1067409 () Bool)

(assert (=> b!1158685 m!1067409))

(assert (=> b!1158685 m!1067365))

(declare-fun m!1067411 () Bool)

(assert (=> b!1158685 m!1067411))

(declare-fun m!1067413 () Bool)

(assert (=> b!1158685 m!1067413))

(declare-fun m!1067415 () Bool)

(assert (=> b!1158685 m!1067415))

(declare-fun m!1067417 () Bool)

(assert (=> b!1158685 m!1067417))

(assert (=> b!1158685 m!1067365))

(declare-fun m!1067419 () Bool)

(assert (=> b!1158685 m!1067419))

(assert (=> b!1158685 m!1067365))

(assert (=> b!1158685 m!1067417))

(declare-fun m!1067421 () Bool)

(assert (=> b!1158682 m!1067421))

(declare-fun m!1067423 () Bool)

(assert (=> b!1158671 m!1067423))

(declare-fun m!1067425 () Bool)

(assert (=> b!1158671 m!1067425))

(declare-fun m!1067427 () Bool)

(assert (=> b!1158671 m!1067427))

(declare-fun m!1067429 () Bool)

(assert (=> b!1158671 m!1067429))

(declare-fun m!1067431 () Bool)

(assert (=> bm!55724 m!1067431))

(declare-fun m!1067433 () Bool)

(assert (=> mapNonEmpty!45395 m!1067433))

(check-sat (not bm!55722) (not b!1158673) b_and!39863 (not b_next!24517) (not mapNonEmpty!45395) (not b!1158676) (not bm!55721) (not b!1158674) (not b!1158685) (not b!1158695) (not b!1158679) (not b!1158684) (not b!1158687) (not b!1158680) (not b!1158698) (not bm!55726) (not b!1158688) (not b!1158675) (not b!1158697) (not b!1158682) (not b_lambda!19605) (not b!1158671) (not bm!55724) tp_is_empty!29047 (not start!98906) (not bm!55723) (not b!1158699))
(check-sat b_and!39863 (not b_next!24517))
