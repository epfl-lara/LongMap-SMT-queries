; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98998 () Bool)

(assert start!98998)

(declare-fun b_free!24367 () Bool)

(declare-fun b_next!24367 () Bool)

(assert (=> start!98998 (= b_free!24367 (not b_next!24367))))

(declare-fun tp!85811 () Bool)

(declare-fun b_and!39585 () Bool)

(assert (=> start!98998 (= tp!85811 b_and!39585)))

(declare-fun b!1153183 () Bool)

(declare-fun res!766443 () Bool)

(declare-fun e!655976 () Bool)

(assert (=> b!1153183 (=> (not res!766443) (not e!655976))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74687 0))(
  ( (array!74688 (arr!35988 (Array (_ BitVec 32) (_ BitVec 64))) (size!36525 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74687)

(assert (=> b!1153183 (= res!766443 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36525 _keys!1208))))))

(declare-fun b!1153184 () Bool)

(declare-datatypes ((Unit!37878 0))(
  ( (Unit!37879) )
))
(declare-fun e!655974 () Unit!37878)

(declare-fun Unit!37880 () Unit!37878)

(assert (=> b!1153184 (= e!655974 Unit!37880)))

(declare-fun mapNonEmpty!45170 () Bool)

(declare-fun mapRes!45170 () Bool)

(declare-fun tp!85812 () Bool)

(declare-fun e!655988 () Bool)

(assert (=> mapNonEmpty!45170 (= mapRes!45170 (and tp!85812 e!655988))))

(declare-datatypes ((V!43657 0))(
  ( (V!43658 (val!14505 Int)) )
))
(declare-datatypes ((ValueCell!13739 0))(
  ( (ValueCellFull!13739 (v!17138 V!43657)) (EmptyCell!13739) )
))
(declare-fun mapRest!45170 () (Array (_ BitVec 32) ValueCell!13739))

(declare-fun mapValue!45170 () ValueCell!13739)

(declare-fun mapKey!45170 () (_ BitVec 32))

(declare-datatypes ((array!74689 0))(
  ( (array!74690 (arr!35989 (Array (_ BitVec 32) ValueCell!13739)) (size!36526 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74689)

(assert (=> mapNonEmpty!45170 (= (arr!35989 _values!996) (store mapRest!45170 mapKey!45170 mapValue!45170))))

(declare-fun b!1153185 () Bool)

(declare-fun res!766442 () Bool)

(assert (=> b!1153185 (=> (not res!766442) (not e!655976))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74687 (_ BitVec 32)) Bool)

(assert (=> b!1153185 (= res!766442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54008 () Bool)

(declare-datatypes ((tuple2!18436 0))(
  ( (tuple2!18437 (_1!9229 (_ BitVec 64)) (_2!9229 V!43657)) )
))
(declare-datatypes ((List!25188 0))(
  ( (Nil!25185) (Cons!25184 (h!26402 tuple2!18436) (t!36539 List!25188)) )
))
(declare-datatypes ((ListLongMap!16413 0))(
  ( (ListLongMap!16414 (toList!8222 List!25188)) )
))
(declare-fun lt!516347 () ListLongMap!16413)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!54012 () Bool)

(declare-fun c!114559 () Bool)

(declare-fun call!54011 () ListLongMap!16413)

(declare-fun contains!6755 (ListLongMap!16413 (_ BitVec 64)) Bool)

(assert (=> bm!54008 (= call!54012 (contains!6755 (ite c!114559 lt!516347 call!54011) k0!934))))

(declare-fun b!1153186 () Bool)

(declare-fun res!766446 () Bool)

(declare-fun e!655981 () Bool)

(assert (=> b!1153186 (=> (not res!766446) (not e!655981))))

(declare-fun lt!516331 () array!74687)

(declare-datatypes ((List!25189 0))(
  ( (Nil!25186) (Cons!25185 (h!26403 (_ BitVec 64)) (t!36540 List!25189)) )
))
(declare-fun arrayNoDuplicates!0 (array!74687 (_ BitVec 32) List!25189) Bool)

(assert (=> b!1153186 (= res!766446 (arrayNoDuplicates!0 lt!516331 #b00000000000000000000000000000000 Nil!25186))))

(declare-fun bm!54009 () Bool)

(declare-fun call!54015 () ListLongMap!16413)

(assert (=> bm!54009 (= call!54011 call!54015)))

(declare-fun b!1153187 () Bool)

(declare-fun e!655989 () Bool)

(declare-fun e!655980 () Bool)

(assert (=> b!1153187 (= e!655989 (and e!655980 mapRes!45170))))

(declare-fun condMapEmpty!45170 () Bool)

(declare-fun mapDefault!45170 () ValueCell!13739)

(assert (=> b!1153187 (= condMapEmpty!45170 (= (arr!35989 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13739)) mapDefault!45170)))))

(declare-fun b!1153188 () Bool)

(declare-fun e!655984 () Bool)

(declare-fun e!655978 () Bool)

(assert (=> b!1153188 (= e!655984 e!655978)))

(declare-fun res!766439 () Bool)

(assert (=> b!1153188 (=> res!766439 e!655978)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1153188 (= res!766439 (not (= (select (arr!35988 _keys!1208) from!1455) k0!934)))))

(declare-fun e!655975 () Bool)

(assert (=> b!1153188 e!655975))

(declare-fun c!114560 () Bool)

(assert (=> b!1153188 (= c!114560 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516330 () Unit!37878)

(declare-fun minValue!944 () V!43657)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!583 (array!74687 array!74689 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37878)

(assert (=> b!1153188 (= lt!516330 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153189 () Bool)

(declare-fun tp_is_empty!28897 () Bool)

(assert (=> b!1153189 (= e!655988 tp_is_empty!28897)))

(declare-fun b!1153190 () Bool)

(declare-fun res!766434 () Bool)

(assert (=> b!1153190 (=> (not res!766434) (not e!655976))))

(assert (=> b!1153190 (= res!766434 (= (select (arr!35988 _keys!1208) i!673) k0!934))))

(declare-fun b!1153191 () Bool)

(assert (=> b!1153191 (contains!6755 call!54015 k0!934)))

(declare-fun lt!516349 () Unit!37878)

(declare-fun addStillContains!880 (ListLongMap!16413 (_ BitVec 64) V!43657 (_ BitVec 64)) Unit!37878)

(assert (=> b!1153191 (= lt!516349 (addStillContains!880 lt!516347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1153191 call!54012))

(declare-fun lt!516337 () ListLongMap!16413)

(declare-fun +!3655 (ListLongMap!16413 tuple2!18436) ListLongMap!16413)

(assert (=> b!1153191 (= lt!516347 (+!3655 lt!516337 (tuple2!18437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516341 () Unit!37878)

(declare-fun call!54016 () Unit!37878)

(assert (=> b!1153191 (= lt!516341 call!54016)))

(declare-fun e!655977 () Unit!37878)

(assert (=> b!1153191 (= e!655977 lt!516349)))

(declare-fun b!1153192 () Bool)

(assert (=> b!1153192 (= e!655976 e!655981)))

(declare-fun res!766440 () Bool)

(assert (=> b!1153192 (=> (not res!766440) (not e!655981))))

(assert (=> b!1153192 (= res!766440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516331 mask!1564))))

(assert (=> b!1153192 (= lt!516331 (array!74688 (store (arr!35988 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36525 _keys!1208)))))

(declare-fun mapIsEmpty!45170 () Bool)

(assert (=> mapIsEmpty!45170 mapRes!45170))

(declare-fun b!1153193 () Bool)

(assert (=> b!1153193 (= e!655978 true)))

(declare-fun e!655982 () Bool)

(assert (=> b!1153193 e!655982))

(declare-fun res!766432 () Bool)

(assert (=> b!1153193 (=> (not res!766432) (not e!655982))))

(declare-fun lt!516348 () ListLongMap!16413)

(assert (=> b!1153193 (= res!766432 (= lt!516348 lt!516337))))

(declare-fun lt!516346 () ListLongMap!16413)

(declare-fun -!1340 (ListLongMap!16413 (_ BitVec 64)) ListLongMap!16413)

(assert (=> b!1153193 (= lt!516348 (-!1340 lt!516346 k0!934))))

(declare-fun lt!516336 () V!43657)

(assert (=> b!1153193 (= (-!1340 (+!3655 lt!516337 (tuple2!18437 (select (arr!35988 _keys!1208) from!1455) lt!516336)) (select (arr!35988 _keys!1208) from!1455)) lt!516337)))

(declare-fun lt!516345 () Unit!37878)

(declare-fun addThenRemoveForNewKeyIsSame!184 (ListLongMap!16413 (_ BitVec 64) V!43657) Unit!37878)

(assert (=> b!1153193 (= lt!516345 (addThenRemoveForNewKeyIsSame!184 lt!516337 (select (arr!35988 _keys!1208) from!1455) lt!516336))))

(declare-fun lt!516340 () V!43657)

(declare-fun get!18351 (ValueCell!13739 V!43657) V!43657)

(assert (=> b!1153193 (= lt!516336 (get!18351 (select (arr!35989 _values!996) from!1455) lt!516340))))

(declare-fun lt!516338 () Unit!37878)

(assert (=> b!1153193 (= lt!516338 e!655974)))

(declare-fun c!114563 () Bool)

(assert (=> b!1153193 (= c!114563 (contains!6755 lt!516337 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4721 (array!74687 array!74689 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) Int) ListLongMap!16413)

(assert (=> b!1153193 (= lt!516337 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54011 () Bool)

(declare-fun c!114564 () Bool)

(assert (=> bm!54011 (= call!54015 (+!3655 (ite c!114559 lt!516347 lt!516337) (ite c!114559 (tuple2!18437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114564 (tuple2!18437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153194 () Bool)

(declare-fun lt!516333 () Bool)

(declare-fun e!655986 () Bool)

(assert (=> b!1153194 (= e!655986 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516333) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!54018 () ListLongMap!16413)

(declare-fun bm!54012 () Bool)

(assert (=> bm!54012 (= call!54018 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153195 () Bool)

(declare-fun lt!516344 () array!74689)

(assert (=> b!1153195 (= e!655982 (= lt!516348 (getCurrentListMapNoExtraKeys!4721 lt!516331 lt!516344 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153196 () Bool)

(declare-fun e!655987 () Unit!37878)

(declare-fun lt!516335 () Unit!37878)

(assert (=> b!1153196 (= e!655987 lt!516335)))

(declare-fun call!54014 () Unit!37878)

(assert (=> b!1153196 (= lt!516335 call!54014)))

(declare-fun call!54013 () Bool)

(assert (=> b!1153196 call!54013))

(declare-fun b!1153197 () Bool)

(declare-fun res!766436 () Bool)

(assert (=> b!1153197 (=> (not res!766436) (not e!655976))))

(assert (=> b!1153197 (= res!766436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25186))))

(declare-fun b!1153198 () Bool)

(declare-fun e!655985 () Bool)

(assert (=> b!1153198 (= e!655981 (not e!655985))))

(declare-fun res!766437 () Bool)

(assert (=> b!1153198 (=> res!766437 e!655985)))

(assert (=> b!1153198 (= res!766437 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153198 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516342 () Unit!37878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74687 (_ BitVec 64) (_ BitVec 32)) Unit!37878)

(assert (=> b!1153198 (= lt!516342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153199 () Bool)

(assert (=> b!1153199 (= e!655980 tp_is_empty!28897)))

(declare-fun b!1153200 () Bool)

(declare-fun res!766445 () Bool)

(assert (=> b!1153200 (=> (not res!766445) (not e!655976))))

(assert (=> b!1153200 (= res!766445 (and (= (size!36526 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36525 _keys!1208) (size!36526 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153201 () Bool)

(declare-fun e!655979 () Bool)

(assert (=> b!1153201 (= e!655979 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153202 () Bool)

(declare-fun e!655990 () Unit!37878)

(assert (=> b!1153202 (= e!655987 e!655990)))

(declare-fun c!114562 () Bool)

(assert (=> b!1153202 (= c!114562 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516333))))

(declare-fun b!1153203 () Bool)

(assert (=> b!1153203 (= c!114564 (and (not lt!516333) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153203 (= e!655977 e!655987)))

(declare-fun b!1153204 () Bool)

(assert (=> b!1153204 (= e!655986 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153205 () Bool)

(declare-fun call!54017 () ListLongMap!16413)

(assert (=> b!1153205 (= e!655975 (= call!54017 call!54018))))

(declare-fun bm!54013 () Bool)

(assert (=> bm!54013 (= call!54016 (addStillContains!880 lt!516337 (ite (or c!114559 c!114564) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114559 c!114564) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1153206 () Bool)

(declare-fun res!766435 () Bool)

(assert (=> b!1153206 (=> (not res!766435) (not e!655976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153206 (= res!766435 (validMask!0 mask!1564))))

(declare-fun res!766441 () Bool)

(assert (=> start!98998 (=> (not res!766441) (not e!655976))))

(assert (=> start!98998 (= res!766441 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36525 _keys!1208))))))

(assert (=> start!98998 e!655976))

(assert (=> start!98998 tp_is_empty!28897))

(declare-fun array_inv!27614 (array!74687) Bool)

(assert (=> start!98998 (array_inv!27614 _keys!1208)))

(assert (=> start!98998 true))

(assert (=> start!98998 tp!85811))

(declare-fun array_inv!27615 (array!74689) Bool)

(assert (=> start!98998 (and (array_inv!27615 _values!996) e!655989)))

(declare-fun bm!54010 () Bool)

(assert (=> bm!54010 (= call!54014 call!54016)))

(declare-fun b!1153207 () Bool)

(assert (=> b!1153207 (= e!655975 (= call!54017 (-!1340 call!54018 k0!934)))))

(declare-fun b!1153208 () Bool)

(assert (=> b!1153208 (= e!655985 e!655984)))

(declare-fun res!766433 () Bool)

(assert (=> b!1153208 (=> res!766433 e!655984)))

(assert (=> b!1153208 (= res!766433 (not (= from!1455 i!673)))))

(declare-fun lt!516328 () ListLongMap!16413)

(assert (=> b!1153208 (= lt!516328 (getCurrentListMapNoExtraKeys!4721 lt!516331 lt!516344 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153208 (= lt!516344 (array!74690 (store (arr!35989 _values!996) i!673 (ValueCellFull!13739 lt!516340)) (size!36526 _values!996)))))

(declare-fun dynLambda!2744 (Int (_ BitVec 64)) V!43657)

(assert (=> b!1153208 (= lt!516340 (dynLambda!2744 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153208 (= lt!516346 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54014 () Bool)

(assert (=> bm!54014 (= call!54013 call!54012)))

(declare-fun bm!54015 () Bool)

(assert (=> bm!54015 (= call!54017 (getCurrentListMapNoExtraKeys!4721 lt!516331 lt!516344 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153209 () Bool)

(declare-fun res!766444 () Bool)

(assert (=> b!1153209 (=> (not res!766444) (not e!655976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153209 (= res!766444 (validKeyInArray!0 k0!934))))

(declare-fun b!1153210 () Bool)

(assert (=> b!1153210 call!54013))

(declare-fun lt!516343 () Unit!37878)

(assert (=> b!1153210 (= lt!516343 call!54014)))

(assert (=> b!1153210 (= e!655990 lt!516343)))

(declare-fun b!1153211 () Bool)

(declare-fun Unit!37881 () Unit!37878)

(assert (=> b!1153211 (= e!655990 Unit!37881)))

(declare-fun b!1153212 () Bool)

(declare-fun Unit!37882 () Unit!37878)

(assert (=> b!1153212 (= e!655974 Unit!37882)))

(assert (=> b!1153212 (= lt!516333 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153212 (= c!114559 (and (not lt!516333) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516332 () Unit!37878)

(assert (=> b!1153212 (= lt!516332 e!655977)))

(declare-fun lt!516334 () Unit!37878)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!476 (array!74687 array!74689 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 64) (_ BitVec 32) Int) Unit!37878)

(assert (=> b!1153212 (= lt!516334 (lemmaListMapContainsThenArrayContainsFrom!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114561 () Bool)

(assert (=> b!1153212 (= c!114561 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766438 () Bool)

(assert (=> b!1153212 (= res!766438 e!655986)))

(assert (=> b!1153212 (=> (not res!766438) (not e!655979))))

(assert (=> b!1153212 e!655979))

(declare-fun lt!516339 () Unit!37878)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74687 (_ BitVec 32) (_ BitVec 32)) Unit!37878)

(assert (=> b!1153212 (= lt!516339 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153212 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25186)))

(declare-fun lt!516329 () Unit!37878)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74687 (_ BitVec 64) (_ BitVec 32) List!25189) Unit!37878)

(assert (=> b!1153212 (= lt!516329 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25186))))

(assert (=> b!1153212 false))

(assert (= (and start!98998 res!766441) b!1153206))

(assert (= (and b!1153206 res!766435) b!1153200))

(assert (= (and b!1153200 res!766445) b!1153185))

(assert (= (and b!1153185 res!766442) b!1153197))

(assert (= (and b!1153197 res!766436) b!1153183))

(assert (= (and b!1153183 res!766443) b!1153209))

(assert (= (and b!1153209 res!766444) b!1153190))

(assert (= (and b!1153190 res!766434) b!1153192))

(assert (= (and b!1153192 res!766440) b!1153186))

(assert (= (and b!1153186 res!766446) b!1153198))

(assert (= (and b!1153198 (not res!766437)) b!1153208))

(assert (= (and b!1153208 (not res!766433)) b!1153188))

(assert (= (and b!1153188 c!114560) b!1153207))

(assert (= (and b!1153188 (not c!114560)) b!1153205))

(assert (= (or b!1153207 b!1153205) bm!54015))

(assert (= (or b!1153207 b!1153205) bm!54012))

(assert (= (and b!1153188 (not res!766439)) b!1153193))

(assert (= (and b!1153193 c!114563) b!1153212))

(assert (= (and b!1153193 (not c!114563)) b!1153184))

(assert (= (and b!1153212 c!114559) b!1153191))

(assert (= (and b!1153212 (not c!114559)) b!1153203))

(assert (= (and b!1153203 c!114564) b!1153196))

(assert (= (and b!1153203 (not c!114564)) b!1153202))

(assert (= (and b!1153202 c!114562) b!1153210))

(assert (= (and b!1153202 (not c!114562)) b!1153211))

(assert (= (or b!1153196 b!1153210) bm!54010))

(assert (= (or b!1153196 b!1153210) bm!54009))

(assert (= (or b!1153196 b!1153210) bm!54014))

(assert (= (or b!1153191 bm!54014) bm!54008))

(assert (= (or b!1153191 bm!54010) bm!54013))

(assert (= (or b!1153191 bm!54009) bm!54011))

(assert (= (and b!1153212 c!114561) b!1153204))

(assert (= (and b!1153212 (not c!114561)) b!1153194))

(assert (= (and b!1153212 res!766438) b!1153201))

(assert (= (and b!1153193 res!766432) b!1153195))

(assert (= (and b!1153187 condMapEmpty!45170) mapIsEmpty!45170))

(assert (= (and b!1153187 (not condMapEmpty!45170)) mapNonEmpty!45170))

(get-info :version)

(assert (= (and mapNonEmpty!45170 ((_ is ValueCellFull!13739) mapValue!45170)) b!1153189))

(assert (= (and b!1153187 ((_ is ValueCellFull!13739) mapDefault!45170)) b!1153199))

(assert (= start!98998 b!1153187))

(declare-fun b_lambda!19467 () Bool)

(assert (=> (not b_lambda!19467) (not b!1153208)))

(declare-fun t!36538 () Bool)

(declare-fun tb!9171 () Bool)

(assert (=> (and start!98998 (= defaultEntry!1004 defaultEntry!1004) t!36538) tb!9171))

(declare-fun result!18915 () Bool)

(assert (=> tb!9171 (= result!18915 tp_is_empty!28897)))

(assert (=> b!1153208 t!36538))

(declare-fun b_and!39587 () Bool)

(assert (= b_and!39585 (and (=> t!36538 result!18915) b_and!39587)))

(declare-fun m!1063513 () Bool)

(assert (=> b!1153212 m!1063513))

(declare-fun m!1063515 () Bool)

(assert (=> b!1153212 m!1063515))

(declare-fun m!1063517 () Bool)

(assert (=> b!1153212 m!1063517))

(declare-fun m!1063519 () Bool)

(assert (=> b!1153212 m!1063519))

(declare-fun m!1063521 () Bool)

(assert (=> b!1153201 m!1063521))

(declare-fun m!1063523 () Bool)

(assert (=> b!1153197 m!1063523))

(declare-fun m!1063525 () Bool)

(assert (=> b!1153193 m!1063525))

(declare-fun m!1063527 () Bool)

(assert (=> b!1153193 m!1063527))

(declare-fun m!1063529 () Bool)

(assert (=> b!1153193 m!1063529))

(declare-fun m!1063531 () Bool)

(assert (=> b!1153193 m!1063531))

(assert (=> b!1153193 m!1063525))

(declare-fun m!1063533 () Bool)

(assert (=> b!1153193 m!1063533))

(declare-fun m!1063535 () Bool)

(assert (=> b!1153193 m!1063535))

(assert (=> b!1153193 m!1063535))

(assert (=> b!1153193 m!1063529))

(declare-fun m!1063537 () Bool)

(assert (=> b!1153193 m!1063537))

(assert (=> b!1153193 m!1063529))

(declare-fun m!1063539 () Bool)

(assert (=> b!1153193 m!1063539))

(declare-fun m!1063541 () Bool)

(assert (=> b!1153193 m!1063541))

(declare-fun m!1063543 () Bool)

(assert (=> b!1153191 m!1063543))

(declare-fun m!1063545 () Bool)

(assert (=> b!1153191 m!1063545))

(declare-fun m!1063547 () Bool)

(assert (=> b!1153191 m!1063547))

(declare-fun m!1063549 () Bool)

(assert (=> b!1153192 m!1063549))

(declare-fun m!1063551 () Bool)

(assert (=> b!1153192 m!1063551))

(declare-fun m!1063553 () Bool)

(assert (=> start!98998 m!1063553))

(declare-fun m!1063555 () Bool)

(assert (=> start!98998 m!1063555))

(declare-fun m!1063557 () Bool)

(assert (=> b!1153208 m!1063557))

(declare-fun m!1063559 () Bool)

(assert (=> b!1153208 m!1063559))

(declare-fun m!1063561 () Bool)

(assert (=> b!1153208 m!1063561))

(declare-fun m!1063563 () Bool)

(assert (=> b!1153208 m!1063563))

(declare-fun m!1063565 () Bool)

(assert (=> b!1153185 m!1063565))

(assert (=> b!1153204 m!1063521))

(declare-fun m!1063567 () Bool)

(assert (=> b!1153207 m!1063567))

(declare-fun m!1063569 () Bool)

(assert (=> bm!54015 m!1063569))

(declare-fun m!1063571 () Bool)

(assert (=> b!1153190 m!1063571))

(declare-fun m!1063573 () Bool)

(assert (=> bm!54008 m!1063573))

(declare-fun m!1063575 () Bool)

(assert (=> bm!54013 m!1063575))

(declare-fun m!1063577 () Bool)

(assert (=> mapNonEmpty!45170 m!1063577))

(declare-fun m!1063579 () Bool)

(assert (=> bm!54011 m!1063579))

(assert (=> b!1153195 m!1063569))

(assert (=> bm!54012 m!1063539))

(assert (=> b!1153188 m!1063529))

(declare-fun m!1063581 () Bool)

(assert (=> b!1153188 m!1063581))

(declare-fun m!1063583 () Bool)

(assert (=> b!1153206 m!1063583))

(declare-fun m!1063585 () Bool)

(assert (=> b!1153198 m!1063585))

(declare-fun m!1063587 () Bool)

(assert (=> b!1153198 m!1063587))

(declare-fun m!1063589 () Bool)

(assert (=> b!1153209 m!1063589))

(declare-fun m!1063591 () Bool)

(assert (=> b!1153186 m!1063591))

(check-sat (not b!1153198) (not bm!54008) (not b!1153185) (not b!1153207) (not bm!54015) (not b!1153209) (not b_next!24367) (not bm!54013) (not start!98998) b_and!39587 (not b!1153201) (not b!1153188) (not b!1153212) (not b!1153192) (not b!1153193) (not bm!54012) (not b!1153206) (not bm!54011) tp_is_empty!28897 (not b!1153191) (not b!1153204) (not mapNonEmpty!45170) (not b!1153195) (not b_lambda!19467) (not b!1153208) (not b!1153197) (not b!1153186))
(check-sat b_and!39587 (not b_next!24367))
