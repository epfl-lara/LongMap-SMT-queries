; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99160 () Bool)

(assert start!99160)

(declare-fun b_free!24529 () Bool)

(declare-fun b_next!24529 () Bool)

(assert (=> start!99160 (= b_free!24529 (not b_next!24529))))

(declare-fun tp!86297 () Bool)

(declare-fun b_and!39909 () Bool)

(assert (=> start!99160 (= tp!86297 b_and!39909)))

(declare-fun bm!55952 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43873 0))(
  ( (V!43874 (val!14586 Int)) )
))
(declare-datatypes ((ValueCell!13820 0))(
  ( (ValueCellFull!13820 (v!17219 V!43873)) (EmptyCell!13820) )
))
(declare-datatypes ((array!75007 0))(
  ( (array!75008 (arr!36148 (Array (_ BitVec 32) ValueCell!13820)) (size!36685 (_ BitVec 32))) )
))
(declare-fun lt!521680 () array!75007)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18596 0))(
  ( (tuple2!18597 (_1!9309 (_ BitVec 64)) (_2!9309 V!43873)) )
))
(declare-datatypes ((List!25335 0))(
  ( (Nil!25332) (Cons!25331 (h!26549 tuple2!18596) (t!36848 List!25335)) )
))
(declare-datatypes ((ListLongMap!16573 0))(
  ( (ListLongMap!16574 (toList!8302 List!25335)) )
))
(declare-fun call!55961 () ListLongMap!16573)

(declare-fun minValue!944 () V!43873)

(declare-datatypes ((array!75009 0))(
  ( (array!75010 (arr!36149 (Array (_ BitVec 32) (_ BitVec 64))) (size!36686 (_ BitVec 32))) )
))
(declare-fun lt!521677 () array!75009)

(declare-fun zeroValue!944 () V!43873)

(declare-fun getCurrentListMapNoExtraKeys!4794 (array!75009 array!75007 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 32) Int) ListLongMap!16573)

(assert (=> bm!55952 (= call!55961 (getCurrentListMapNoExtraKeys!4794 lt!521677 lt!521680 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160635 () Bool)

(declare-fun c!116019 () Bool)

(declare-fun lt!521691 () Bool)

(assert (=> b!1160635 (= c!116019 (and (not lt!521691) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38200 0))(
  ( (Unit!38201) )
))
(declare-fun e!660109 () Unit!38200)

(declare-fun e!660116 () Unit!38200)

(assert (=> b!1160635 (= e!660109 e!660116)))

(declare-fun b!1160636 () Bool)

(declare-fun res!770084 () Bool)

(declare-fun e!660114 () Bool)

(assert (=> b!1160636 (=> (not res!770084) (not e!660114))))

(declare-fun _keys!1208 () array!75009)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1160636 (= res!770084 (= (select (arr!36149 _keys!1208) i!673) k0!934))))

(declare-fun b!1160637 () Bool)

(declare-fun lt!521688 () ListLongMap!16573)

(declare-fun e!660110 () Bool)

(assert (=> b!1160637 (= e!660110 (= lt!521688 (getCurrentListMapNoExtraKeys!4794 lt!521677 lt!521680 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160638 () Bool)

(declare-fun e!660111 () Bool)

(declare-fun e!660107 () Bool)

(assert (=> b!1160638 (= e!660111 e!660107)))

(declare-fun res!770077 () Bool)

(assert (=> b!1160638 (=> res!770077 e!660107)))

(assert (=> b!1160638 (= res!770077 (not (= from!1455 i!673)))))

(declare-fun lt!521678 () ListLongMap!16573)

(assert (=> b!1160638 (= lt!521678 (getCurrentListMapNoExtraKeys!4794 lt!521677 lt!521680 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521675 () V!43873)

(declare-fun _values!996 () array!75007)

(assert (=> b!1160638 (= lt!521680 (array!75008 (store (arr!36148 _values!996) i!673 (ValueCellFull!13820 lt!521675)) (size!36685 _values!996)))))

(declare-fun dynLambda!2801 (Int (_ BitVec 64)) V!43873)

(assert (=> b!1160638 (= lt!521675 (dynLambda!2801 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521687 () ListLongMap!16573)

(assert (=> b!1160638 (= lt!521687 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55953 () Bool)

(declare-fun call!55956 () Unit!38200)

(declare-fun call!55958 () Unit!38200)

(assert (=> bm!55953 (= call!55956 call!55958)))

(declare-fun b!1160639 () Bool)

(declare-fun e!660120 () Bool)

(assert (=> b!1160639 (= e!660120 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521691) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160640 () Bool)

(declare-fun e!660112 () Bool)

(assert (=> b!1160640 (= e!660114 e!660112)))

(declare-fun res!770083 () Bool)

(assert (=> b!1160640 (=> (not res!770083) (not e!660112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75009 (_ BitVec 32)) Bool)

(assert (=> b!1160640 (= res!770083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521677 mask!1564))))

(assert (=> b!1160640 (= lt!521677 (array!75010 (store (arr!36149 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36686 _keys!1208)))))

(declare-fun call!55960 () ListLongMap!16573)

(declare-fun bm!55955 () Bool)

(declare-fun lt!521695 () ListLongMap!16573)

(declare-fun c!116020 () Bool)

(declare-fun +!3721 (ListLongMap!16573 tuple2!18596) ListLongMap!16573)

(assert (=> bm!55955 (= call!55960 (+!3721 lt!521695 (ite (or c!116020 c!116019) (tuple2!18597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1160641 () Bool)

(declare-fun res!770091 () Bool)

(assert (=> b!1160641 (=> (not res!770091) (not e!660114))))

(assert (=> b!1160641 (= res!770091 (and (= (size!36685 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36686 _keys!1208) (size!36685 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160642 () Bool)

(declare-fun e!660113 () Bool)

(declare-fun tp_is_empty!29059 () Bool)

(assert (=> b!1160642 (= e!660113 tp_is_empty!29059)))

(declare-fun mapIsEmpty!45413 () Bool)

(declare-fun mapRes!45413 () Bool)

(assert (=> mapIsEmpty!45413 mapRes!45413))

(declare-fun call!55955 () ListLongMap!16573)

(declare-fun bm!55956 () Bool)

(assert (=> bm!55956 (= call!55955 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55957 () Bool)

(declare-fun addStillContains!941 (ListLongMap!16573 (_ BitVec 64) V!43873 (_ BitVec 64)) Unit!38200)

(assert (=> bm!55957 (= call!55958 (addStillContains!941 lt!521695 (ite (or c!116020 c!116019) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116020 c!116019) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160643 () Bool)

(assert (=> b!1160643 (= e!660112 (not e!660111))))

(declare-fun res!770088 () Bool)

(assert (=> b!1160643 (=> res!770088 e!660111)))

(assert (=> b!1160643 (= res!770088 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160643 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521682 () Unit!38200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75009 (_ BitVec 64) (_ BitVec 32)) Unit!38200)

(assert (=> b!1160643 (= lt!521682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!660108 () Bool)

(declare-fun b!1160644 () Bool)

(declare-fun -!1401 (ListLongMap!16573 (_ BitVec 64)) ListLongMap!16573)

(assert (=> b!1160644 (= e!660108 (= call!55961 (-!1401 call!55955 k0!934)))))

(declare-fun b!1160645 () Bool)

(assert (=> b!1160645 (= e!660108 (= call!55961 call!55955))))

(declare-fun b!1160646 () Bool)

(declare-fun lt!521681 () Unit!38200)

(assert (=> b!1160646 (= e!660116 lt!521681)))

(assert (=> b!1160646 (= lt!521681 call!55956)))

(declare-fun call!55959 () Bool)

(assert (=> b!1160646 call!55959))

(declare-fun b!1160647 () Bool)

(declare-fun e!660118 () Bool)

(assert (=> b!1160647 (= e!660118 true)))

(assert (=> b!1160647 e!660110))

(declare-fun res!770089 () Bool)

(assert (=> b!1160647 (=> (not res!770089) (not e!660110))))

(assert (=> b!1160647 (= res!770089 (= lt!521688 lt!521695))))

(assert (=> b!1160647 (= lt!521688 (-!1401 lt!521687 k0!934))))

(declare-fun lt!521692 () V!43873)

(assert (=> b!1160647 (= (-!1401 (+!3721 lt!521695 (tuple2!18597 (select (arr!36149 _keys!1208) from!1455) lt!521692)) (select (arr!36149 _keys!1208) from!1455)) lt!521695)))

(declare-fun lt!521685 () Unit!38200)

(declare-fun addThenRemoveForNewKeyIsSame!232 (ListLongMap!16573 (_ BitVec 64) V!43873) Unit!38200)

(assert (=> b!1160647 (= lt!521685 (addThenRemoveForNewKeyIsSame!232 lt!521695 (select (arr!36149 _keys!1208) from!1455) lt!521692))))

(declare-fun get!18453 (ValueCell!13820 V!43873) V!43873)

(assert (=> b!1160647 (= lt!521692 (get!18453 (select (arr!36148 _values!996) from!1455) lt!521675))))

(declare-fun lt!521684 () Unit!38200)

(declare-fun e!660117 () Unit!38200)

(assert (=> b!1160647 (= lt!521684 e!660117)))

(declare-fun c!116022 () Bool)

(declare-fun contains!6822 (ListLongMap!16573 (_ BitVec 64)) Bool)

(assert (=> b!1160647 (= c!116022 (contains!6822 lt!521695 k0!934))))

(assert (=> b!1160647 (= lt!521695 (getCurrentListMapNoExtraKeys!4794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!660119 () Bool)

(declare-fun b!1160648 () Bool)

(assert (=> b!1160648 (= e!660119 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160649 () Bool)

(declare-fun res!770082 () Bool)

(assert (=> b!1160649 (=> (not res!770082) (not e!660112))))

(declare-datatypes ((List!25336 0))(
  ( (Nil!25333) (Cons!25332 (h!26550 (_ BitVec 64)) (t!36849 List!25336)) )
))
(declare-fun arrayNoDuplicates!0 (array!75009 (_ BitVec 32) List!25336) Bool)

(assert (=> b!1160649 (= res!770082 (arrayNoDuplicates!0 lt!521677 #b00000000000000000000000000000000 Nil!25333))))

(declare-fun bm!55954 () Bool)

(declare-fun call!55957 () Bool)

(assert (=> bm!55954 (= call!55959 call!55957)))

(declare-fun res!770087 () Bool)

(assert (=> start!99160 (=> (not res!770087) (not e!660114))))

(assert (=> start!99160 (= res!770087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36686 _keys!1208))))))

(assert (=> start!99160 e!660114))

(assert (=> start!99160 tp_is_empty!29059))

(declare-fun array_inv!27730 (array!75009) Bool)

(assert (=> start!99160 (array_inv!27730 _keys!1208)))

(assert (=> start!99160 true))

(assert (=> start!99160 tp!86297))

(declare-fun e!660105 () Bool)

(declare-fun array_inv!27731 (array!75007) Bool)

(assert (=> start!99160 (and (array_inv!27731 _values!996) e!660105)))

(declare-fun b!1160650 () Bool)

(assert (=> b!1160650 (= e!660120 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160651 () Bool)

(declare-fun res!770085 () Bool)

(assert (=> b!1160651 (=> (not res!770085) (not e!660114))))

(assert (=> b!1160651 (= res!770085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25333))))

(declare-fun b!1160652 () Bool)

(declare-fun res!770080 () Bool)

(assert (=> b!1160652 (=> (not res!770080) (not e!660114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160652 (= res!770080 (validMask!0 mask!1564))))

(declare-fun b!1160653 () Bool)

(declare-fun e!660106 () Unit!38200)

(declare-fun Unit!38202 () Unit!38200)

(assert (=> b!1160653 (= e!660106 Unit!38202)))

(declare-fun b!1160654 () Bool)

(assert (=> b!1160654 call!55959))

(declare-fun lt!521694 () Unit!38200)

(assert (=> b!1160654 (= lt!521694 call!55956)))

(assert (=> b!1160654 (= e!660106 lt!521694)))

(declare-fun b!1160655 () Bool)

(declare-fun e!660115 () Bool)

(assert (=> b!1160655 (= e!660115 tp_is_empty!29059)))

(declare-fun mapNonEmpty!45413 () Bool)

(declare-fun tp!86298 () Bool)

(assert (=> mapNonEmpty!45413 (= mapRes!45413 (and tp!86298 e!660115))))

(declare-fun mapRest!45413 () (Array (_ BitVec 32) ValueCell!13820))

(declare-fun mapKey!45413 () (_ BitVec 32))

(declare-fun mapValue!45413 () ValueCell!13820)

(assert (=> mapNonEmpty!45413 (= (arr!36148 _values!996) (store mapRest!45413 mapKey!45413 mapValue!45413))))

(declare-fun call!55962 () ListLongMap!16573)

(declare-fun lt!521693 () ListLongMap!16573)

(declare-fun bm!55958 () Bool)

(assert (=> bm!55958 (= call!55957 (contains!6822 (ite c!116020 lt!521693 call!55962) k0!934))))

(declare-fun b!1160656 () Bool)

(assert (=> b!1160656 (= e!660105 (and e!660113 mapRes!45413))))

(declare-fun condMapEmpty!45413 () Bool)

(declare-fun mapDefault!45413 () ValueCell!13820)

(assert (=> b!1160656 (= condMapEmpty!45413 (= (arr!36148 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13820)) mapDefault!45413)))))

(declare-fun b!1160657 () Bool)

(declare-fun res!770081 () Bool)

(assert (=> b!1160657 (=> (not res!770081) (not e!660114))))

(assert (=> b!1160657 (= res!770081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160658 () Bool)

(assert (=> b!1160658 (= e!660116 e!660106)))

(declare-fun c!116017 () Bool)

(assert (=> b!1160658 (= c!116017 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521691))))

(declare-fun b!1160659 () Bool)

(declare-fun Unit!38203 () Unit!38200)

(assert (=> b!1160659 (= e!660117 Unit!38203)))

(assert (=> b!1160659 (= lt!521691 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160659 (= c!116020 (and (not lt!521691) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521679 () Unit!38200)

(assert (=> b!1160659 (= lt!521679 e!660109)))

(declare-fun lt!521674 () Unit!38200)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!529 (array!75009 array!75007 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 64) (_ BitVec 32) Int) Unit!38200)

(assert (=> b!1160659 (= lt!521674 (lemmaListMapContainsThenArrayContainsFrom!529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116021 () Bool)

(assert (=> b!1160659 (= c!116021 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770078 () Bool)

(assert (=> b!1160659 (= res!770078 e!660120)))

(assert (=> b!1160659 (=> (not res!770078) (not e!660119))))

(assert (=> b!1160659 e!660119))

(declare-fun lt!521690 () Unit!38200)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75009 (_ BitVec 32) (_ BitVec 32)) Unit!38200)

(assert (=> b!1160659 (= lt!521690 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160659 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25333)))

(declare-fun lt!521683 () Unit!38200)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75009 (_ BitVec 64) (_ BitVec 32) List!25336) Unit!38200)

(assert (=> b!1160659 (= lt!521683 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25333))))

(assert (=> b!1160659 false))

(declare-fun b!1160660 () Bool)

(declare-fun Unit!38204 () Unit!38200)

(assert (=> b!1160660 (= e!660117 Unit!38204)))

(declare-fun b!1160661 () Bool)

(assert (=> b!1160661 (= e!660107 e!660118)))

(declare-fun res!770079 () Bool)

(assert (=> b!1160661 (=> res!770079 e!660118)))

(assert (=> b!1160661 (= res!770079 (not (= (select (arr!36149 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160661 e!660108))

(declare-fun c!116018 () Bool)

(assert (=> b!1160661 (= c!116018 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521686 () Unit!38200)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 (array!75009 array!75007 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38200)

(assert (=> b!1160661 (= lt!521686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160662 () Bool)

(declare-fun res!770090 () Bool)

(assert (=> b!1160662 (=> (not res!770090) (not e!660114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160662 (= res!770090 (validKeyInArray!0 k0!934))))

(declare-fun b!1160663 () Bool)

(declare-fun res!770086 () Bool)

(assert (=> b!1160663 (=> (not res!770086) (not e!660114))))

(assert (=> b!1160663 (= res!770086 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36686 _keys!1208))))))

(declare-fun bm!55959 () Bool)

(assert (=> bm!55959 (= call!55962 call!55960)))

(declare-fun b!1160664 () Bool)

(assert (=> b!1160664 (contains!6822 (+!3721 lt!521693 (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521676 () Unit!38200)

(assert (=> b!1160664 (= lt!521676 (addStillContains!941 lt!521693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160664 call!55957))

(assert (=> b!1160664 (= lt!521693 call!55960)))

(declare-fun lt!521689 () Unit!38200)

(assert (=> b!1160664 (= lt!521689 call!55958)))

(assert (=> b!1160664 (= e!660109 lt!521676)))

(assert (= (and start!99160 res!770087) b!1160652))

(assert (= (and b!1160652 res!770080) b!1160641))

(assert (= (and b!1160641 res!770091) b!1160657))

(assert (= (and b!1160657 res!770081) b!1160651))

(assert (= (and b!1160651 res!770085) b!1160663))

(assert (= (and b!1160663 res!770086) b!1160662))

(assert (= (and b!1160662 res!770090) b!1160636))

(assert (= (and b!1160636 res!770084) b!1160640))

(assert (= (and b!1160640 res!770083) b!1160649))

(assert (= (and b!1160649 res!770082) b!1160643))

(assert (= (and b!1160643 (not res!770088)) b!1160638))

(assert (= (and b!1160638 (not res!770077)) b!1160661))

(assert (= (and b!1160661 c!116018) b!1160644))

(assert (= (and b!1160661 (not c!116018)) b!1160645))

(assert (= (or b!1160644 b!1160645) bm!55952))

(assert (= (or b!1160644 b!1160645) bm!55956))

(assert (= (and b!1160661 (not res!770079)) b!1160647))

(assert (= (and b!1160647 c!116022) b!1160659))

(assert (= (and b!1160647 (not c!116022)) b!1160660))

(assert (= (and b!1160659 c!116020) b!1160664))

(assert (= (and b!1160659 (not c!116020)) b!1160635))

(assert (= (and b!1160635 c!116019) b!1160646))

(assert (= (and b!1160635 (not c!116019)) b!1160658))

(assert (= (and b!1160658 c!116017) b!1160654))

(assert (= (and b!1160658 (not c!116017)) b!1160653))

(assert (= (or b!1160646 b!1160654) bm!55953))

(assert (= (or b!1160646 b!1160654) bm!55959))

(assert (= (or b!1160646 b!1160654) bm!55954))

(assert (= (or b!1160664 bm!55954) bm!55958))

(assert (= (or b!1160664 bm!55953) bm!55957))

(assert (= (or b!1160664 bm!55959) bm!55955))

(assert (= (and b!1160659 c!116021) b!1160650))

(assert (= (and b!1160659 (not c!116021)) b!1160639))

(assert (= (and b!1160659 res!770078) b!1160648))

(assert (= (and b!1160647 res!770089) b!1160637))

(assert (= (and b!1160656 condMapEmpty!45413) mapIsEmpty!45413))

(assert (= (and b!1160656 (not condMapEmpty!45413)) mapNonEmpty!45413))

(get-info :version)

(assert (= (and mapNonEmpty!45413 ((_ is ValueCellFull!13820) mapValue!45413)) b!1160655))

(assert (= (and b!1160656 ((_ is ValueCellFull!13820) mapDefault!45413)) b!1160642))

(assert (= start!99160 b!1160656))

(declare-fun b_lambda!19629 () Bool)

(assert (=> (not b_lambda!19629) (not b!1160638)))

(declare-fun t!36847 () Bool)

(declare-fun tb!9333 () Bool)

(assert (=> (and start!99160 (= defaultEntry!1004 defaultEntry!1004) t!36847) tb!9333))

(declare-fun result!19239 () Bool)

(assert (=> tb!9333 (= result!19239 tp_is_empty!29059)))

(assert (=> b!1160638 t!36847))

(declare-fun b_and!39911 () Bool)

(assert (= b_and!39909 (and (=> t!36847 result!19239) b_and!39911)))

(declare-fun m!1070001 () Bool)

(assert (=> bm!55955 m!1070001))

(declare-fun m!1070003 () Bool)

(assert (=> bm!55952 m!1070003))

(declare-fun m!1070005 () Bool)

(assert (=> mapNonEmpty!45413 m!1070005))

(declare-fun m!1070007 () Bool)

(assert (=> b!1160651 m!1070007))

(declare-fun m!1070009 () Bool)

(assert (=> b!1160644 m!1070009))

(declare-fun m!1070011 () Bool)

(assert (=> b!1160638 m!1070011))

(declare-fun m!1070013 () Bool)

(assert (=> b!1160638 m!1070013))

(declare-fun m!1070015 () Bool)

(assert (=> b!1160638 m!1070015))

(declare-fun m!1070017 () Bool)

(assert (=> b!1160638 m!1070017))

(declare-fun m!1070019 () Bool)

(assert (=> b!1160652 m!1070019))

(declare-fun m!1070021 () Bool)

(assert (=> b!1160636 m!1070021))

(declare-fun m!1070023 () Bool)

(assert (=> bm!55957 m!1070023))

(assert (=> b!1160637 m!1070003))

(declare-fun m!1070025 () Bool)

(assert (=> b!1160664 m!1070025))

(assert (=> b!1160664 m!1070025))

(declare-fun m!1070027 () Bool)

(assert (=> b!1160664 m!1070027))

(declare-fun m!1070029 () Bool)

(assert (=> b!1160664 m!1070029))

(declare-fun m!1070031 () Bool)

(assert (=> b!1160657 m!1070031))

(declare-fun m!1070033 () Bool)

(assert (=> b!1160661 m!1070033))

(declare-fun m!1070035 () Bool)

(assert (=> b!1160661 m!1070035))

(declare-fun m!1070037 () Bool)

(assert (=> b!1160643 m!1070037))

(declare-fun m!1070039 () Bool)

(assert (=> b!1160643 m!1070039))

(declare-fun m!1070041 () Bool)

(assert (=> bm!55956 m!1070041))

(declare-fun m!1070043 () Bool)

(assert (=> b!1160649 m!1070043))

(declare-fun m!1070045 () Bool)

(assert (=> bm!55958 m!1070045))

(declare-fun m!1070047 () Bool)

(assert (=> b!1160648 m!1070047))

(declare-fun m!1070049 () Bool)

(assert (=> start!99160 m!1070049))

(declare-fun m!1070051 () Bool)

(assert (=> start!99160 m!1070051))

(declare-fun m!1070053 () Bool)

(assert (=> b!1160659 m!1070053))

(declare-fun m!1070055 () Bool)

(assert (=> b!1160659 m!1070055))

(declare-fun m!1070057 () Bool)

(assert (=> b!1160659 m!1070057))

(declare-fun m!1070059 () Bool)

(assert (=> b!1160659 m!1070059))

(assert (=> b!1160650 m!1070047))

(declare-fun m!1070061 () Bool)

(assert (=> b!1160662 m!1070061))

(assert (=> b!1160647 m!1070041))

(declare-fun m!1070063 () Bool)

(assert (=> b!1160647 m!1070063))

(declare-fun m!1070065 () Bool)

(assert (=> b!1160647 m!1070065))

(assert (=> b!1160647 m!1070065))

(declare-fun m!1070067 () Bool)

(assert (=> b!1160647 m!1070067))

(assert (=> b!1160647 m!1070063))

(assert (=> b!1160647 m!1070033))

(declare-fun m!1070069 () Bool)

(assert (=> b!1160647 m!1070069))

(assert (=> b!1160647 m!1070033))

(declare-fun m!1070071 () Bool)

(assert (=> b!1160647 m!1070071))

(assert (=> b!1160647 m!1070033))

(declare-fun m!1070073 () Bool)

(assert (=> b!1160647 m!1070073))

(declare-fun m!1070075 () Bool)

(assert (=> b!1160647 m!1070075))

(declare-fun m!1070077 () Bool)

(assert (=> b!1160640 m!1070077))

(declare-fun m!1070079 () Bool)

(assert (=> b!1160640 m!1070079))

(check-sat (not b!1160647) (not bm!55955) (not b_lambda!19629) (not b!1160648) (not bm!55952) (not b!1160659) (not b_next!24529) (not bm!55957) (not b!1160644) (not start!99160) (not b!1160640) (not b!1160643) (not b!1160638) (not b!1160657) (not bm!55958) (not b!1160651) (not b!1160650) b_and!39911 (not b!1160664) (not b!1160637) tp_is_empty!29059 (not b!1160662) (not mapNonEmpty!45413) (not b!1160652) (not b!1160649) (not bm!55956) (not b!1160661))
(check-sat b_and!39911 (not b_next!24529))
