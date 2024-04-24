; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99118 () Bool)

(assert start!99118)

(declare-fun b_free!24487 () Bool)

(declare-fun b_next!24487 () Bool)

(assert (=> start!99118 (= b_free!24487 (not b_next!24487))))

(declare-fun tp!86172 () Bool)

(declare-fun b_and!39825 () Bool)

(assert (=> start!99118 (= tp!86172 b_and!39825)))

(declare-fun b!1158703 () Bool)

(declare-fun e!659048 () Bool)

(declare-fun e!659038 () Bool)

(declare-fun mapRes!45350 () Bool)

(assert (=> b!1158703 (= e!659048 (and e!659038 mapRes!45350))))

(declare-fun condMapEmpty!45350 () Bool)

(declare-datatypes ((V!43817 0))(
  ( (V!43818 (val!14565 Int)) )
))
(declare-datatypes ((ValueCell!13799 0))(
  ( (ValueCellFull!13799 (v!17198 V!43817)) (EmptyCell!13799) )
))
(declare-datatypes ((array!74925 0))(
  ( (array!74926 (arr!36107 (Array (_ BitVec 32) ValueCell!13799)) (size!36644 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74925)

(declare-fun mapDefault!45350 () ValueCell!13799)

(assert (=> b!1158703 (= condMapEmpty!45350 (= (arr!36107 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13799)) mapDefault!45350)))))

(declare-fun b!1158704 () Bool)

(declare-datatypes ((Unit!38116 0))(
  ( (Unit!38117) )
))
(declare-fun e!659041 () Unit!38116)

(declare-fun Unit!38118 () Unit!38116)

(assert (=> b!1158704 (= e!659041 Unit!38118)))

(declare-fun b!1158705 () Bool)

(declare-fun res!769145 () Bool)

(declare-fun e!659036 () Bool)

(assert (=> b!1158705 (=> (not res!769145) (not e!659036))))

(declare-datatypes ((array!74927 0))(
  ( (array!74928 (arr!36108 (Array (_ BitVec 32) (_ BitVec 64))) (size!36645 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74927)

(declare-datatypes ((List!25298 0))(
  ( (Nil!25295) (Cons!25294 (h!26512 (_ BitVec 64)) (t!36769 List!25298)) )
))
(declare-fun arrayNoDuplicates!0 (array!74927 (_ BitVec 32) List!25298) Bool)

(assert (=> b!1158705 (= res!769145 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25295))))

(declare-fun b!1158706 () Bool)

(declare-fun e!659046 () Unit!38116)

(declare-fun lt!520289 () Unit!38116)

(assert (=> b!1158706 (= e!659046 lt!520289)))

(declare-fun call!55455 () Unit!38116)

(assert (=> b!1158706 (= lt!520289 call!55455)))

(declare-fun call!55452 () Bool)

(assert (=> b!1158706 call!55452))

(declare-fun zeroValue!944 () V!43817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun e!659047 () Bool)

(declare-fun lt!520303 () array!74927)

(declare-fun lt!520298 () array!74925)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18556 0))(
  ( (tuple2!18557 (_1!9289 (_ BitVec 64)) (_2!9289 V!43817)) )
))
(declare-datatypes ((List!25299 0))(
  ( (Nil!25296) (Cons!25295 (h!26513 tuple2!18556) (t!36770 List!25299)) )
))
(declare-datatypes ((ListLongMap!16533 0))(
  ( (ListLongMap!16534 (toList!8282 List!25299)) )
))
(declare-fun lt!520291 () ListLongMap!16533)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1158707 () Bool)

(declare-fun minValue!944 () V!43817)

(declare-fun getCurrentListMapNoExtraKeys!4775 (array!74927 array!74925 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) Int) ListLongMap!16533)

(assert (=> b!1158707 (= e!659047 (= lt!520291 (getCurrentListMapNoExtraKeys!4775 lt!520303 lt!520298 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158708 () Bool)

(declare-fun res!769137 () Bool)

(assert (=> b!1158708 (=> (not res!769137) (not e!659036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158708 (= res!769137 (validMask!0 mask!1564))))

(declare-fun call!55456 () Bool)

(declare-fun bm!55448 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!520300 () ListLongMap!16533)

(declare-fun c!115641 () Bool)

(declare-fun call!55451 () ListLongMap!16533)

(declare-fun contains!6805 (ListLongMap!16533 (_ BitVec 64)) Bool)

(assert (=> bm!55448 (= call!55456 (contains!6805 (ite c!115641 lt!520300 call!55451) k0!934))))

(declare-fun b!1158709 () Bool)

(declare-fun e!659043 () Bool)

(declare-fun e!659034 () Bool)

(assert (=> b!1158709 (= e!659043 e!659034)))

(declare-fun res!769132 () Bool)

(assert (=> b!1158709 (=> res!769132 e!659034)))

(assert (=> b!1158709 (= res!769132 (not (= (select (arr!36108 _keys!1208) from!1455) k0!934)))))

(declare-fun e!659044 () Bool)

(assert (=> b!1158709 e!659044))

(declare-fun c!115639 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158709 (= c!115639 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520297 () Unit!38116)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!625 (array!74927 array!74925 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38116)

(assert (=> b!1158709 (= lt!520297 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158710 () Bool)

(declare-fun call!55454 () ListLongMap!16533)

(assert (=> b!1158710 (contains!6805 call!55454 k0!934)))

(declare-fun lt!520306 () Unit!38116)

(declare-fun call!55457 () Unit!38116)

(assert (=> b!1158710 (= lt!520306 call!55457)))

(assert (=> b!1158710 call!55456))

(declare-fun lt!520294 () ListLongMap!16533)

(declare-fun +!3704 (ListLongMap!16533 tuple2!18556) ListLongMap!16533)

(assert (=> b!1158710 (= lt!520300 (+!3704 lt!520294 (tuple2!18557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520304 () Unit!38116)

(declare-fun addStillContains!926 (ListLongMap!16533 (_ BitVec 64) V!43817 (_ BitVec 64)) Unit!38116)

(assert (=> b!1158710 (= lt!520304 (addStillContains!926 lt!520294 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659042 () Unit!38116)

(assert (=> b!1158710 (= e!659042 lt!520306)))

(declare-fun mapNonEmpty!45350 () Bool)

(declare-fun tp!86171 () Bool)

(declare-fun e!659039 () Bool)

(assert (=> mapNonEmpty!45350 (= mapRes!45350 (and tp!86171 e!659039))))

(declare-fun mapValue!45350 () ValueCell!13799)

(declare-fun mapKey!45350 () (_ BitVec 32))

(declare-fun mapRest!45350 () (Array (_ BitVec 32) ValueCell!13799))

(assert (=> mapNonEmpty!45350 (= (arr!36107 _values!996) (store mapRest!45350 mapKey!45350 mapValue!45350))))

(declare-fun b!1158711 () Bool)

(declare-fun res!769136 () Bool)

(assert (=> b!1158711 (=> (not res!769136) (not e!659036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74927 (_ BitVec 32)) Bool)

(assert (=> b!1158711 (= res!769136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158712 () Bool)

(declare-fun tp_is_empty!29017 () Bool)

(assert (=> b!1158712 (= e!659039 tp_is_empty!29017)))

(declare-fun b!1158713 () Bool)

(assert (=> b!1158713 (= e!659034 true)))

(assert (=> b!1158713 e!659047))

(declare-fun res!769138 () Bool)

(assert (=> b!1158713 (=> (not res!769138) (not e!659047))))

(assert (=> b!1158713 (= res!769138 (= lt!520291 lt!520294))))

(declare-fun lt!520293 () ListLongMap!16533)

(declare-fun -!1384 (ListLongMap!16533 (_ BitVec 64)) ListLongMap!16533)

(assert (=> b!1158713 (= lt!520291 (-!1384 lt!520293 k0!934))))

(declare-fun lt!520299 () V!43817)

(assert (=> b!1158713 (= (-!1384 (+!3704 lt!520294 (tuple2!18557 (select (arr!36108 _keys!1208) from!1455) lt!520299)) (select (arr!36108 _keys!1208) from!1455)) lt!520294)))

(declare-fun lt!520308 () Unit!38116)

(declare-fun addThenRemoveForNewKeyIsSame!220 (ListLongMap!16533 (_ BitVec 64) V!43817) Unit!38116)

(assert (=> b!1158713 (= lt!520308 (addThenRemoveForNewKeyIsSame!220 lt!520294 (select (arr!36108 _keys!1208) from!1455) lt!520299))))

(declare-fun lt!520307 () V!43817)

(declare-fun get!18427 (ValueCell!13799 V!43817) V!43817)

(assert (=> b!1158713 (= lt!520299 (get!18427 (select (arr!36107 _values!996) from!1455) lt!520307))))

(declare-fun lt!520295 () Unit!38116)

(declare-fun e!659040 () Unit!38116)

(assert (=> b!1158713 (= lt!520295 e!659040)))

(declare-fun c!115643 () Bool)

(assert (=> b!1158713 (= c!115643 (contains!6805 lt!520294 k0!934))))

(assert (=> b!1158713 (= lt!520294 (getCurrentListMapNoExtraKeys!4775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158714 () Bool)

(declare-fun e!659050 () Bool)

(assert (=> b!1158714 (= e!659036 e!659050)))

(declare-fun res!769140 () Bool)

(assert (=> b!1158714 (=> (not res!769140) (not e!659050))))

(assert (=> b!1158714 (= res!769140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520303 mask!1564))))

(assert (=> b!1158714 (= lt!520303 (array!74928 (store (arr!36108 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36645 _keys!1208)))))

(declare-fun res!769133 () Bool)

(assert (=> start!99118 (=> (not res!769133) (not e!659036))))

(assert (=> start!99118 (= res!769133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36645 _keys!1208))))))

(assert (=> start!99118 e!659036))

(assert (=> start!99118 tp_is_empty!29017))

(declare-fun array_inv!27698 (array!74927) Bool)

(assert (=> start!99118 (array_inv!27698 _keys!1208)))

(assert (=> start!99118 true))

(assert (=> start!99118 tp!86172))

(declare-fun array_inv!27699 (array!74925) Bool)

(assert (=> start!99118 (and (array_inv!27699 _values!996) e!659048)))

(declare-fun e!659035 () Bool)

(declare-fun b!1158715 () Bool)

(declare-fun arrayContainsKey!0 (array!74927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158715 (= e!659035 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!115640 () Bool)

(declare-fun bm!55449 () Bool)

(assert (=> bm!55449 (= call!55457 (addStillContains!926 (ite c!115641 lt!520300 lt!520294) (ite c!115641 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115640 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115641 minValue!944 (ite c!115640 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158716 () Bool)

(declare-fun res!769139 () Bool)

(assert (=> b!1158716 (=> (not res!769139) (not e!659036))))

(assert (=> b!1158716 (= res!769139 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36645 _keys!1208))))))

(declare-fun b!1158717 () Bool)

(declare-fun e!659037 () Bool)

(assert (=> b!1158717 (= e!659037 e!659043)))

(declare-fun res!769135 () Bool)

(assert (=> b!1158717 (=> res!769135 e!659043)))

(assert (=> b!1158717 (= res!769135 (not (= from!1455 i!673)))))

(declare-fun lt!520302 () ListLongMap!16533)

(assert (=> b!1158717 (= lt!520302 (getCurrentListMapNoExtraKeys!4775 lt!520303 lt!520298 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1158717 (= lt!520298 (array!74926 (store (arr!36107 _values!996) i!673 (ValueCellFull!13799 lt!520307)) (size!36644 _values!996)))))

(declare-fun dynLambda!2788 (Int (_ BitVec 64)) V!43817)

(assert (=> b!1158717 (= lt!520307 (dynLambda!2788 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1158717 (= lt!520293 (getCurrentListMapNoExtraKeys!4775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!659049 () Bool)

(declare-fun b!1158718 () Bool)

(assert (=> b!1158718 (= e!659049 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158719 () Bool)

(declare-fun res!769141 () Bool)

(assert (=> b!1158719 (=> (not res!769141) (not e!659036))))

(assert (=> b!1158719 (= res!769141 (= (select (arr!36108 _keys!1208) i!673) k0!934))))

(declare-fun call!55458 () ListLongMap!16533)

(declare-fun bm!55450 () Bool)

(assert (=> bm!55450 (= call!55458 (getCurrentListMapNoExtraKeys!4775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158720 () Bool)

(assert (=> b!1158720 (= e!659050 (not e!659037))))

(declare-fun res!769134 () Bool)

(assert (=> b!1158720 (=> res!769134 e!659037)))

(assert (=> b!1158720 (= res!769134 (bvsgt from!1455 i!673))))

(assert (=> b!1158720 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520290 () Unit!38116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74927 (_ BitVec 64) (_ BitVec 32)) Unit!38116)

(assert (=> b!1158720 (= lt!520290 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158721 () Bool)

(declare-fun Unit!38119 () Unit!38116)

(assert (=> b!1158721 (= e!659040 Unit!38119)))

(declare-fun b!1158722 () Bool)

(declare-fun lt!520301 () Bool)

(assert (=> b!1158722 (= c!115640 (and (not lt!520301) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158722 (= e!659042 e!659046)))

(declare-fun b!1158723 () Bool)

(declare-fun call!55453 () ListLongMap!16533)

(assert (=> b!1158723 (= e!659044 (= call!55453 (-!1384 call!55458 k0!934)))))

(declare-fun b!1158724 () Bool)

(assert (=> b!1158724 call!55452))

(declare-fun lt!520296 () Unit!38116)

(assert (=> b!1158724 (= lt!520296 call!55455)))

(assert (=> b!1158724 (= e!659041 lt!520296)))

(declare-fun bm!55451 () Bool)

(assert (=> bm!55451 (= call!55454 (+!3704 (ite c!115641 lt!520300 lt!520294) (ite c!115641 (tuple2!18557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115640 (tuple2!18557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!45350 () Bool)

(assert (=> mapIsEmpty!45350 mapRes!45350))

(declare-fun b!1158725 () Bool)

(declare-fun res!769144 () Bool)

(assert (=> b!1158725 (=> (not res!769144) (not e!659036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158725 (= res!769144 (validKeyInArray!0 k0!934))))

(declare-fun bm!55452 () Bool)

(assert (=> bm!55452 (= call!55451 call!55454)))

(declare-fun b!1158726 () Bool)

(declare-fun Unit!38120 () Unit!38116)

(assert (=> b!1158726 (= e!659040 Unit!38120)))

(assert (=> b!1158726 (= lt!520301 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158726 (= c!115641 (and (not lt!520301) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520305 () Unit!38116)

(assert (=> b!1158726 (= lt!520305 e!659042)))

(declare-fun lt!520288 () Unit!38116)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!514 (array!74927 array!74925 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 64) (_ BitVec 32) Int) Unit!38116)

(assert (=> b!1158726 (= lt!520288 (lemmaListMapContainsThenArrayContainsFrom!514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115644 () Bool)

(assert (=> b!1158726 (= c!115644 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769142 () Bool)

(assert (=> b!1158726 (= res!769142 e!659049)))

(assert (=> b!1158726 (=> (not res!769142) (not e!659035))))

(assert (=> b!1158726 e!659035))

(declare-fun lt!520292 () Unit!38116)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74927 (_ BitVec 32) (_ BitVec 32)) Unit!38116)

(assert (=> b!1158726 (= lt!520292 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158726 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25295)))

(declare-fun lt!520309 () Unit!38116)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74927 (_ BitVec 64) (_ BitVec 32) List!25298) Unit!38116)

(assert (=> b!1158726 (= lt!520309 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25295))))

(assert (=> b!1158726 false))

(declare-fun b!1158727 () Bool)

(declare-fun res!769146 () Bool)

(assert (=> b!1158727 (=> (not res!769146) (not e!659036))))

(assert (=> b!1158727 (= res!769146 (and (= (size!36644 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36645 _keys!1208) (size!36644 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158728 () Bool)

(assert (=> b!1158728 (= e!659044 (= call!55453 call!55458))))

(declare-fun b!1158729 () Bool)

(assert (=> b!1158729 (= e!659046 e!659041)))

(declare-fun c!115642 () Bool)

(assert (=> b!1158729 (= c!115642 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520301))))

(declare-fun bm!55453 () Bool)

(assert (=> bm!55453 (= call!55453 (getCurrentListMapNoExtraKeys!4775 lt!520303 lt!520298 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158730 () Bool)

(assert (=> b!1158730 (= e!659049 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520301) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158731 () Bool)

(declare-fun res!769143 () Bool)

(assert (=> b!1158731 (=> (not res!769143) (not e!659050))))

(assert (=> b!1158731 (= res!769143 (arrayNoDuplicates!0 lt!520303 #b00000000000000000000000000000000 Nil!25295))))

(declare-fun b!1158732 () Bool)

(assert (=> b!1158732 (= e!659038 tp_is_empty!29017)))

(declare-fun bm!55454 () Bool)

(assert (=> bm!55454 (= call!55452 call!55456)))

(declare-fun bm!55455 () Bool)

(assert (=> bm!55455 (= call!55455 call!55457)))

(assert (= (and start!99118 res!769133) b!1158708))

(assert (= (and b!1158708 res!769137) b!1158727))

(assert (= (and b!1158727 res!769146) b!1158711))

(assert (= (and b!1158711 res!769136) b!1158705))

(assert (= (and b!1158705 res!769145) b!1158716))

(assert (= (and b!1158716 res!769139) b!1158725))

(assert (= (and b!1158725 res!769144) b!1158719))

(assert (= (and b!1158719 res!769141) b!1158714))

(assert (= (and b!1158714 res!769140) b!1158731))

(assert (= (and b!1158731 res!769143) b!1158720))

(assert (= (and b!1158720 (not res!769134)) b!1158717))

(assert (= (and b!1158717 (not res!769135)) b!1158709))

(assert (= (and b!1158709 c!115639) b!1158723))

(assert (= (and b!1158709 (not c!115639)) b!1158728))

(assert (= (or b!1158723 b!1158728) bm!55453))

(assert (= (or b!1158723 b!1158728) bm!55450))

(assert (= (and b!1158709 (not res!769132)) b!1158713))

(assert (= (and b!1158713 c!115643) b!1158726))

(assert (= (and b!1158713 (not c!115643)) b!1158721))

(assert (= (and b!1158726 c!115641) b!1158710))

(assert (= (and b!1158726 (not c!115641)) b!1158722))

(assert (= (and b!1158722 c!115640) b!1158706))

(assert (= (and b!1158722 (not c!115640)) b!1158729))

(assert (= (and b!1158729 c!115642) b!1158724))

(assert (= (and b!1158729 (not c!115642)) b!1158704))

(assert (= (or b!1158706 b!1158724) bm!55455))

(assert (= (or b!1158706 b!1158724) bm!55452))

(assert (= (or b!1158706 b!1158724) bm!55454))

(assert (= (or b!1158710 bm!55454) bm!55448))

(assert (= (or b!1158710 bm!55455) bm!55449))

(assert (= (or b!1158710 bm!55452) bm!55451))

(assert (= (and b!1158726 c!115644) b!1158718))

(assert (= (and b!1158726 (not c!115644)) b!1158730))

(assert (= (and b!1158726 res!769142) b!1158715))

(assert (= (and b!1158713 res!769138) b!1158707))

(assert (= (and b!1158703 condMapEmpty!45350) mapIsEmpty!45350))

(assert (= (and b!1158703 (not condMapEmpty!45350)) mapNonEmpty!45350))

(get-info :version)

(assert (= (and mapNonEmpty!45350 ((_ is ValueCellFull!13799) mapValue!45350)) b!1158712))

(assert (= (and b!1158703 ((_ is ValueCellFull!13799) mapDefault!45350)) b!1158732))

(assert (= start!99118 b!1158703))

(declare-fun b_lambda!19587 () Bool)

(assert (=> (not b_lambda!19587) (not b!1158717)))

(declare-fun t!36768 () Bool)

(declare-fun tb!9291 () Bool)

(assert (=> (and start!99118 (= defaultEntry!1004 defaultEntry!1004) t!36768) tb!9291))

(declare-fun result!19155 () Bool)

(assert (=> tb!9291 (= result!19155 tp_is_empty!29017)))

(assert (=> b!1158717 t!36768))

(declare-fun b_and!39827 () Bool)

(assert (= b_and!39825 (and (=> t!36768 result!19155) b_and!39827)))

(declare-fun m!1068317 () Bool)

(assert (=> b!1158718 m!1068317))

(declare-fun m!1068319 () Bool)

(assert (=> bm!55449 m!1068319))

(declare-fun m!1068321 () Bool)

(assert (=> start!99118 m!1068321))

(declare-fun m!1068323 () Bool)

(assert (=> start!99118 m!1068323))

(declare-fun m!1068325 () Bool)

(assert (=> b!1158720 m!1068325))

(declare-fun m!1068327 () Bool)

(assert (=> b!1158720 m!1068327))

(declare-fun m!1068329 () Bool)

(assert (=> b!1158705 m!1068329))

(declare-fun m!1068331 () Bool)

(assert (=> b!1158709 m!1068331))

(declare-fun m!1068333 () Bool)

(assert (=> b!1158709 m!1068333))

(declare-fun m!1068335 () Bool)

(assert (=> bm!55453 m!1068335))

(declare-fun m!1068337 () Bool)

(assert (=> bm!55450 m!1068337))

(declare-fun m!1068339 () Bool)

(assert (=> b!1158725 m!1068339))

(declare-fun m!1068341 () Bool)

(assert (=> mapNonEmpty!45350 m!1068341))

(declare-fun m!1068343 () Bool)

(assert (=> b!1158731 m!1068343))

(declare-fun m!1068345 () Bool)

(assert (=> b!1158714 m!1068345))

(declare-fun m!1068347 () Bool)

(assert (=> b!1158714 m!1068347))

(assert (=> b!1158713 m!1068337))

(declare-fun m!1068349 () Bool)

(assert (=> b!1158713 m!1068349))

(declare-fun m!1068351 () Bool)

(assert (=> b!1158713 m!1068351))

(declare-fun m!1068353 () Bool)

(assert (=> b!1158713 m!1068353))

(assert (=> b!1158713 m!1068331))

(declare-fun m!1068355 () Bool)

(assert (=> b!1158713 m!1068355))

(declare-fun m!1068357 () Bool)

(assert (=> b!1158713 m!1068357))

(assert (=> b!1158713 m!1068331))

(declare-fun m!1068359 () Bool)

(assert (=> b!1158713 m!1068359))

(assert (=> b!1158713 m!1068349))

(assert (=> b!1158713 m!1068353))

(assert (=> b!1158713 m!1068331))

(declare-fun m!1068361 () Bool)

(assert (=> b!1158713 m!1068361))

(declare-fun m!1068363 () Bool)

(assert (=> b!1158708 m!1068363))

(declare-fun m!1068365 () Bool)

(assert (=> b!1158723 m!1068365))

(declare-fun m!1068367 () Bool)

(assert (=> bm!55451 m!1068367))

(declare-fun m!1068369 () Bool)

(assert (=> b!1158726 m!1068369))

(declare-fun m!1068371 () Bool)

(assert (=> b!1158726 m!1068371))

(declare-fun m!1068373 () Bool)

(assert (=> b!1158726 m!1068373))

(declare-fun m!1068375 () Bool)

(assert (=> b!1158726 m!1068375))

(declare-fun m!1068377 () Bool)

(assert (=> b!1158711 m!1068377))

(declare-fun m!1068379 () Bool)

(assert (=> b!1158710 m!1068379))

(declare-fun m!1068381 () Bool)

(assert (=> b!1158710 m!1068381))

(declare-fun m!1068383 () Bool)

(assert (=> b!1158710 m!1068383))

(declare-fun m!1068385 () Bool)

(assert (=> bm!55448 m!1068385))

(declare-fun m!1068387 () Bool)

(assert (=> b!1158717 m!1068387))

(declare-fun m!1068389 () Bool)

(assert (=> b!1158717 m!1068389))

(declare-fun m!1068391 () Bool)

(assert (=> b!1158717 m!1068391))

(declare-fun m!1068393 () Bool)

(assert (=> b!1158717 m!1068393))

(assert (=> b!1158707 m!1068335))

(declare-fun m!1068395 () Bool)

(assert (=> b!1158719 m!1068395))

(assert (=> b!1158715 m!1068317))

(check-sat (not b!1158720) (not b!1158715) (not b!1158709) (not b!1158726) (not b!1158708) (not b!1158710) (not mapNonEmpty!45350) (not b!1158714) tp_is_empty!29017 (not b!1158725) (not b!1158717) (not b!1158718) (not b!1158731) (not bm!55450) (not b!1158713) (not b!1158705) (not b!1158707) (not bm!55449) (not b_lambda!19587) (not bm!55453) (not start!99118) (not bm!55451) (not bm!55448) (not b!1158711) (not b!1158723) b_and!39827 (not b_next!24487))
(check-sat b_and!39827 (not b_next!24487))
