; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98590 () Bool)

(assert start!98590)

(declare-fun b_free!24195 () Bool)

(declare-fun b_next!24195 () Bool)

(assert (=> start!98590 (= b_free!24195 (not b_next!24195))))

(declare-fun tp!85296 () Bool)

(declare-fun b_and!39239 () Bool)

(assert (=> start!98590 (= tp!85296 b_and!39239)))

(declare-fun b!1143986 () Bool)

(declare-fun e!650775 () Bool)

(declare-fun e!650764 () Bool)

(assert (=> b!1143986 (= e!650775 (not e!650764))))

(declare-fun res!762062 () Bool)

(assert (=> b!1143986 (=> res!762062 e!650764)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143986 (= res!762062 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74303 0))(
  ( (array!74304 (arr!35802 (Array (_ BitVec 32) (_ BitVec 64))) (size!36338 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74303)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143986 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37543 0))(
  ( (Unit!37544) )
))
(declare-fun lt!510354 () Unit!37543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74303 (_ BitVec 64) (_ BitVec 32)) Unit!37543)

(assert (=> b!1143986 (= lt!510354 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143987 () Bool)

(declare-fun e!650761 () Bool)

(assert (=> b!1143987 (= e!650764 e!650761)))

(declare-fun res!762063 () Bool)

(assert (=> b!1143987 (=> res!762063 e!650761)))

(assert (=> b!1143987 (= res!762063 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43427 0))(
  ( (V!43428 (val!14419 Int)) )
))
(declare-fun zeroValue!944 () V!43427)

(declare-fun lt!510334 () array!74303)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18258 0))(
  ( (tuple2!18259 (_1!9140 (_ BitVec 64)) (_2!9140 V!43427)) )
))
(declare-datatypes ((List!25010 0))(
  ( (Nil!25007) (Cons!25006 (h!26215 tuple2!18258) (t!36197 List!25010)) )
))
(declare-datatypes ((ListLongMap!16227 0))(
  ( (ListLongMap!16228 (toList!8129 List!25010)) )
))
(declare-fun lt!510339 () ListLongMap!16227)

(declare-fun minValue!944 () V!43427)

(declare-datatypes ((ValueCell!13653 0))(
  ( (ValueCellFull!13653 (v!17056 V!43427)) (EmptyCell!13653) )
))
(declare-datatypes ((array!74305 0))(
  ( (array!74306 (arr!35803 (Array (_ BitVec 32) ValueCell!13653)) (size!36339 (_ BitVec 32))) )
))
(declare-fun lt!510349 () array!74305)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4607 (array!74303 array!74305 (_ BitVec 32) (_ BitVec 32) V!43427 V!43427 (_ BitVec 32) Int) ListLongMap!16227)

(assert (=> b!1143987 (= lt!510339 (getCurrentListMapNoExtraKeys!4607 lt!510334 lt!510349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510337 () V!43427)

(declare-fun _values!996 () array!74305)

(assert (=> b!1143987 (= lt!510349 (array!74306 (store (arr!35803 _values!996) i!673 (ValueCellFull!13653 lt!510337)) (size!36339 _values!996)))))

(declare-fun dynLambda!2645 (Int (_ BitVec 64)) V!43427)

(assert (=> b!1143987 (= lt!510337 (dynLambda!2645 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510335 () ListLongMap!16227)

(assert (=> b!1143987 (= lt!510335 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143988 () Bool)

(declare-fun e!650763 () Bool)

(declare-fun tp_is_empty!28725 () Bool)

(assert (=> b!1143988 (= e!650763 tp_is_empty!28725)))

(declare-fun b!1143989 () Bool)

(declare-fun res!762060 () Bool)

(declare-fun e!650767 () Bool)

(assert (=> b!1143989 (=> (not res!762060) (not e!650767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74303 (_ BitVec 32)) Bool)

(assert (=> b!1143989 (= res!762060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!510350 () ListLongMap!16227)

(declare-fun c!112614 () Bool)

(declare-fun call!51887 () ListLongMap!16227)

(declare-fun bm!51879 () Bool)

(declare-fun c!112615 () Bool)

(declare-fun lt!510348 () ListLongMap!16227)

(declare-fun +!3556 (ListLongMap!16227 tuple2!18258) ListLongMap!16227)

(assert (=> bm!51879 (= call!51887 (+!3556 (ite c!112615 lt!510350 lt!510348) (ite c!112615 (tuple2!18259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112614 (tuple2!18259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1143990 () Bool)

(declare-fun e!650762 () Unit!37543)

(declare-fun lt!510344 () Unit!37543)

(assert (=> b!1143990 (= e!650762 lt!510344)))

(declare-fun call!51886 () Unit!37543)

(assert (=> b!1143990 (= lt!510344 call!51886)))

(declare-fun call!51882 () Bool)

(assert (=> b!1143990 call!51882))

(declare-fun b!1143991 () Bool)

(declare-fun contains!6659 (ListLongMap!16227 (_ BitVec 64)) Bool)

(assert (=> b!1143991 (contains!6659 call!51887 k0!934)))

(declare-fun lt!510340 () Unit!37543)

(declare-fun addStillContains!813 (ListLongMap!16227 (_ BitVec 64) V!43427 (_ BitVec 64)) Unit!37543)

(assert (=> b!1143991 (= lt!510340 (addStillContains!813 lt!510350 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!51885 () Bool)

(assert (=> b!1143991 call!51885))

(assert (=> b!1143991 (= lt!510350 (+!3556 lt!510348 (tuple2!18259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510341 () Unit!37543)

(declare-fun call!51884 () Unit!37543)

(assert (=> b!1143991 (= lt!510341 call!51884)))

(declare-fun e!650766 () Unit!37543)

(assert (=> b!1143991 (= e!650766 lt!510340)))

(declare-fun e!650769 () Bool)

(declare-fun call!51883 () ListLongMap!16227)

(declare-fun call!51888 () ListLongMap!16227)

(declare-fun b!1143992 () Bool)

(declare-fun -!1273 (ListLongMap!16227 (_ BitVec 64)) ListLongMap!16227)

(assert (=> b!1143992 (= e!650769 (= call!51883 (-!1273 call!51888 k0!934)))))

(declare-fun b!1143993 () Bool)

(declare-fun res!762061 () Bool)

(assert (=> b!1143993 (=> (not res!762061) (not e!650767))))

(declare-datatypes ((List!25011 0))(
  ( (Nil!25008) (Cons!25007 (h!26216 (_ BitVec 64)) (t!36198 List!25011)) )
))
(declare-fun arrayNoDuplicates!0 (array!74303 (_ BitVec 32) List!25011) Bool)

(assert (=> b!1143993 (= res!762061 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25008))))

(declare-fun b!1143994 () Bool)

(declare-fun e!650765 () Bool)

(declare-fun lt!510347 () Bool)

(assert (=> b!1143994 (= e!650765 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510347) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51880 () Bool)

(assert (=> bm!51880 (= call!51888 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51881 () Bool)

(declare-fun call!51889 () ListLongMap!16227)

(assert (=> bm!51881 (= call!51889 call!51887)))

(declare-fun b!1143995 () Bool)

(declare-fun res!762069 () Bool)

(assert (=> b!1143995 (=> (not res!762069) (not e!650767))))

(assert (=> b!1143995 (= res!762069 (= (select (arr!35802 _keys!1208) i!673) k0!934))))

(declare-fun b!1143996 () Bool)

(declare-fun res!762067 () Bool)

(assert (=> b!1143996 (=> (not res!762067) (not e!650775))))

(assert (=> b!1143996 (= res!762067 (arrayNoDuplicates!0 lt!510334 #b00000000000000000000000000000000 Nil!25008))))

(declare-fun b!1143997 () Bool)

(declare-fun res!762065 () Bool)

(assert (=> b!1143997 (=> (not res!762065) (not e!650767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143997 (= res!762065 (validMask!0 mask!1564))))

(declare-fun bm!51882 () Bool)

(assert (=> bm!51882 (= call!51885 (contains!6659 (ite c!112615 lt!510350 call!51889) k0!934))))

(declare-fun b!1143998 () Bool)

(declare-fun e!650773 () Unit!37543)

(declare-fun Unit!37545 () Unit!37543)

(assert (=> b!1143998 (= e!650773 Unit!37545)))

(declare-fun b!1143999 () Bool)

(assert (=> b!1143999 (= e!650762 e!650773)))

(declare-fun c!112613 () Bool)

(assert (=> b!1143999 (= c!112613 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510347))))

(declare-fun b!1144000 () Bool)

(declare-fun e!650771 () Unit!37543)

(declare-fun Unit!37546 () Unit!37543)

(assert (=> b!1144000 (= e!650771 Unit!37546)))

(declare-fun e!650774 () Bool)

(declare-fun b!1144001 () Bool)

(assert (=> b!1144001 (= e!650774 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144002 () Bool)

(assert (=> b!1144002 call!51882))

(declare-fun lt!510343 () Unit!37543)

(assert (=> b!1144002 (= lt!510343 call!51886)))

(assert (=> b!1144002 (= e!650773 lt!510343)))

(declare-fun b!1144003 () Bool)

(declare-fun res!762064 () Bool)

(assert (=> b!1144003 (=> (not res!762064) (not e!650767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144003 (= res!762064 (validKeyInArray!0 k0!934))))

(declare-fun b!1144004 () Bool)

(declare-fun Unit!37547 () Unit!37543)

(assert (=> b!1144004 (= e!650771 Unit!37547)))

(assert (=> b!1144004 (= lt!510347 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144004 (= c!112615 (and (not lt!510347) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510345 () Unit!37543)

(assert (=> b!1144004 (= lt!510345 e!650766)))

(declare-fun lt!510353 () Unit!37543)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!405 (array!74303 array!74305 (_ BitVec 32) (_ BitVec 32) V!43427 V!43427 (_ BitVec 64) (_ BitVec 32) Int) Unit!37543)

(assert (=> b!1144004 (= lt!510353 (lemmaListMapContainsThenArrayContainsFrom!405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112617 () Bool)

(assert (=> b!1144004 (= c!112617 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762070 () Bool)

(assert (=> b!1144004 (= res!762070 e!650765)))

(assert (=> b!1144004 (=> (not res!762070) (not e!650774))))

(assert (=> b!1144004 e!650774))

(declare-fun lt!510336 () Unit!37543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74303 (_ BitVec 32) (_ BitVec 32)) Unit!37543)

(assert (=> b!1144004 (= lt!510336 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144004 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25008)))

(declare-fun lt!510351 () Unit!37543)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74303 (_ BitVec 64) (_ BitVec 32) List!25011) Unit!37543)

(assert (=> b!1144004 (= lt!510351 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25008))))

(assert (=> b!1144004 false))

(declare-fun b!1144005 () Bool)

(declare-fun res!762071 () Bool)

(assert (=> b!1144005 (=> (not res!762071) (not e!650767))))

(assert (=> b!1144005 (= res!762071 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36338 _keys!1208))))))

(declare-fun b!1144006 () Bool)

(assert (=> b!1144006 (= e!650767 e!650775)))

(declare-fun res!762059 () Bool)

(assert (=> b!1144006 (=> (not res!762059) (not e!650775))))

(assert (=> b!1144006 (= res!762059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510334 mask!1564))))

(assert (=> b!1144006 (= lt!510334 (array!74304 (store (arr!35802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36338 _keys!1208)))))

(declare-fun res!762058 () Bool)

(assert (=> start!98590 (=> (not res!762058) (not e!650767))))

(assert (=> start!98590 (= res!762058 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36338 _keys!1208))))))

(assert (=> start!98590 e!650767))

(assert (=> start!98590 tp_is_empty!28725))

(declare-fun array_inv!27434 (array!74303) Bool)

(assert (=> start!98590 (array_inv!27434 _keys!1208)))

(assert (=> start!98590 true))

(assert (=> start!98590 tp!85296))

(declare-fun e!650768 () Bool)

(declare-fun array_inv!27435 (array!74305) Bool)

(assert (=> start!98590 (and (array_inv!27435 _values!996) e!650768)))

(declare-fun b!1144007 () Bool)

(assert (=> b!1144007 (= c!112614 (and (not lt!510347) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144007 (= e!650766 e!650762)))

(declare-fun bm!51883 () Bool)

(assert (=> bm!51883 (= call!51884 (addStillContains!813 lt!510348 (ite (or c!112615 c!112614) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112615 c!112614) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1144008 () Bool)

(declare-fun e!650772 () Bool)

(assert (=> b!1144008 (= e!650772 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36338 _keys!1208))))))

(declare-fun lt!510352 () V!43427)

(assert (=> b!1144008 (= (-!1273 (+!3556 lt!510348 (tuple2!18259 (select (arr!35802 _keys!1208) from!1455) lt!510352)) (select (arr!35802 _keys!1208) from!1455)) lt!510348)))

(declare-fun lt!510346 () Unit!37543)

(declare-fun addThenRemoveForNewKeyIsSame!124 (ListLongMap!16227 (_ BitVec 64) V!43427) Unit!37543)

(assert (=> b!1144008 (= lt!510346 (addThenRemoveForNewKeyIsSame!124 lt!510348 (select (arr!35802 _keys!1208) from!1455) lt!510352))))

(declare-fun get!18202 (ValueCell!13653 V!43427) V!43427)

(assert (=> b!1144008 (= lt!510352 (get!18202 (select (arr!35803 _values!996) from!1455) lt!510337))))

(declare-fun lt!510342 () Unit!37543)

(assert (=> b!1144008 (= lt!510342 e!650771)))

(declare-fun c!112618 () Bool)

(assert (=> b!1144008 (= c!112618 (contains!6659 lt!510348 k0!934))))

(assert (=> b!1144008 (= lt!510348 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144009 () Bool)

(declare-fun e!650760 () Bool)

(declare-fun mapRes!44912 () Bool)

(assert (=> b!1144009 (= e!650768 (and e!650760 mapRes!44912))))

(declare-fun condMapEmpty!44912 () Bool)

(declare-fun mapDefault!44912 () ValueCell!13653)

(assert (=> b!1144009 (= condMapEmpty!44912 (= (arr!35803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13653)) mapDefault!44912)))))

(declare-fun b!1144010 () Bool)

(assert (=> b!1144010 (= e!650769 (= call!51883 call!51888))))

(declare-fun b!1144011 () Bool)

(declare-fun res!762066 () Bool)

(assert (=> b!1144011 (=> (not res!762066) (not e!650767))))

(assert (=> b!1144011 (= res!762066 (and (= (size!36339 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36338 _keys!1208) (size!36339 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44912 () Bool)

(assert (=> mapIsEmpty!44912 mapRes!44912))

(declare-fun mapNonEmpty!44912 () Bool)

(declare-fun tp!85295 () Bool)

(assert (=> mapNonEmpty!44912 (= mapRes!44912 (and tp!85295 e!650763))))

(declare-fun mapRest!44912 () (Array (_ BitVec 32) ValueCell!13653))

(declare-fun mapKey!44912 () (_ BitVec 32))

(declare-fun mapValue!44912 () ValueCell!13653)

(assert (=> mapNonEmpty!44912 (= (arr!35803 _values!996) (store mapRest!44912 mapKey!44912 mapValue!44912))))

(declare-fun b!1144012 () Bool)

(assert (=> b!1144012 (= e!650765 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144013 () Bool)

(assert (=> b!1144013 (= e!650761 e!650772)))

(declare-fun res!762068 () Bool)

(assert (=> b!1144013 (=> res!762068 e!650772)))

(assert (=> b!1144013 (= res!762068 (not (= (select (arr!35802 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144013 e!650769))

(declare-fun c!112616 () Bool)

(assert (=> b!1144013 (= c!112616 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510338 () Unit!37543)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 (array!74303 array!74305 (_ BitVec 32) (_ BitVec 32) V!43427 V!43427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37543)

(assert (=> b!1144013 (= lt!510338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51884 () Bool)

(assert (=> bm!51884 (= call!51882 call!51885)))

(declare-fun bm!51885 () Bool)

(assert (=> bm!51885 (= call!51886 call!51884)))

(declare-fun b!1144014 () Bool)

(assert (=> b!1144014 (= e!650760 tp_is_empty!28725)))

(declare-fun bm!51886 () Bool)

(assert (=> bm!51886 (= call!51883 (getCurrentListMapNoExtraKeys!4607 lt!510334 lt!510349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98590 res!762058) b!1143997))

(assert (= (and b!1143997 res!762065) b!1144011))

(assert (= (and b!1144011 res!762066) b!1143989))

(assert (= (and b!1143989 res!762060) b!1143993))

(assert (= (and b!1143993 res!762061) b!1144005))

(assert (= (and b!1144005 res!762071) b!1144003))

(assert (= (and b!1144003 res!762064) b!1143995))

(assert (= (and b!1143995 res!762069) b!1144006))

(assert (= (and b!1144006 res!762059) b!1143996))

(assert (= (and b!1143996 res!762067) b!1143986))

(assert (= (and b!1143986 (not res!762062)) b!1143987))

(assert (= (and b!1143987 (not res!762063)) b!1144013))

(assert (= (and b!1144013 c!112616) b!1143992))

(assert (= (and b!1144013 (not c!112616)) b!1144010))

(assert (= (or b!1143992 b!1144010) bm!51886))

(assert (= (or b!1143992 b!1144010) bm!51880))

(assert (= (and b!1144013 (not res!762068)) b!1144008))

(assert (= (and b!1144008 c!112618) b!1144004))

(assert (= (and b!1144008 (not c!112618)) b!1144000))

(assert (= (and b!1144004 c!112615) b!1143991))

(assert (= (and b!1144004 (not c!112615)) b!1144007))

(assert (= (and b!1144007 c!112614) b!1143990))

(assert (= (and b!1144007 (not c!112614)) b!1143999))

(assert (= (and b!1143999 c!112613) b!1144002))

(assert (= (and b!1143999 (not c!112613)) b!1143998))

(assert (= (or b!1143990 b!1144002) bm!51885))

(assert (= (or b!1143990 b!1144002) bm!51881))

(assert (= (or b!1143990 b!1144002) bm!51884))

(assert (= (or b!1143991 bm!51884) bm!51882))

(assert (= (or b!1143991 bm!51885) bm!51883))

(assert (= (or b!1143991 bm!51881) bm!51879))

(assert (= (and b!1144004 c!112617) b!1144012))

(assert (= (and b!1144004 (not c!112617)) b!1143994))

(assert (= (and b!1144004 res!762070) b!1144001))

(assert (= (and b!1144009 condMapEmpty!44912) mapIsEmpty!44912))

(assert (= (and b!1144009 (not condMapEmpty!44912)) mapNonEmpty!44912))

(get-info :version)

(assert (= (and mapNonEmpty!44912 ((_ is ValueCellFull!13653) mapValue!44912)) b!1143988))

(assert (= (and b!1144009 ((_ is ValueCellFull!13653) mapDefault!44912)) b!1144014))

(assert (= start!98590 b!1144009))

(declare-fun b_lambda!19301 () Bool)

(assert (=> (not b_lambda!19301) (not b!1143987)))

(declare-fun t!36196 () Bool)

(declare-fun tb!9007 () Bool)

(assert (=> (and start!98590 (= defaultEntry!1004 defaultEntry!1004) t!36196) tb!9007))

(declare-fun result!18579 () Bool)

(assert (=> tb!9007 (= result!18579 tp_is_empty!28725)))

(assert (=> b!1143987 t!36196))

(declare-fun b_and!39241 () Bool)

(assert (= b_and!39239 (and (=> t!36196 result!18579) b_and!39241)))

(declare-fun m!1055063 () Bool)

(assert (=> start!98590 m!1055063))

(declare-fun m!1055065 () Bool)

(assert (=> start!98590 m!1055065))

(declare-fun m!1055067 () Bool)

(assert (=> b!1143992 m!1055067))

(declare-fun m!1055069 () Bool)

(assert (=> bm!51886 m!1055069))

(declare-fun m!1055071 () Bool)

(assert (=> b!1143986 m!1055071))

(declare-fun m!1055073 () Bool)

(assert (=> b!1143986 m!1055073))

(declare-fun m!1055075 () Bool)

(assert (=> b!1143995 m!1055075))

(declare-fun m!1055077 () Bool)

(assert (=> bm!51883 m!1055077))

(declare-fun m!1055079 () Bool)

(assert (=> mapNonEmpty!44912 m!1055079))

(declare-fun m!1055081 () Bool)

(assert (=> b!1144004 m!1055081))

(declare-fun m!1055083 () Bool)

(assert (=> b!1144004 m!1055083))

(declare-fun m!1055085 () Bool)

(assert (=> b!1144004 m!1055085))

(declare-fun m!1055087 () Bool)

(assert (=> b!1144004 m!1055087))

(declare-fun m!1055089 () Bool)

(assert (=> b!1143997 m!1055089))

(declare-fun m!1055091 () Bool)

(assert (=> b!1144008 m!1055091))

(declare-fun m!1055093 () Bool)

(assert (=> b!1144008 m!1055093))

(declare-fun m!1055095 () Bool)

(assert (=> b!1144008 m!1055095))

(declare-fun m!1055097 () Bool)

(assert (=> b!1144008 m!1055097))

(declare-fun m!1055099 () Bool)

(assert (=> b!1144008 m!1055099))

(declare-fun m!1055101 () Bool)

(assert (=> b!1144008 m!1055101))

(assert (=> b!1144008 m!1055093))

(declare-fun m!1055103 () Bool)

(assert (=> b!1144008 m!1055103))

(assert (=> b!1144008 m!1055099))

(assert (=> b!1144008 m!1055097))

(assert (=> b!1144008 m!1055099))

(declare-fun m!1055105 () Bool)

(assert (=> b!1144008 m!1055105))

(declare-fun m!1055107 () Bool)

(assert (=> b!1143993 m!1055107))

(assert (=> b!1144013 m!1055099))

(declare-fun m!1055109 () Bool)

(assert (=> b!1144013 m!1055109))

(declare-fun m!1055111 () Bool)

(assert (=> b!1144001 m!1055111))

(declare-fun m!1055113 () Bool)

(assert (=> b!1143996 m!1055113))

(assert (=> b!1144012 m!1055111))

(assert (=> bm!51880 m!1055091))

(declare-fun m!1055115 () Bool)

(assert (=> b!1144003 m!1055115))

(declare-fun m!1055117 () Bool)

(assert (=> b!1143989 m!1055117))

(declare-fun m!1055119 () Bool)

(assert (=> bm!51879 m!1055119))

(declare-fun m!1055121 () Bool)

(assert (=> b!1144006 m!1055121))

(declare-fun m!1055123 () Bool)

(assert (=> b!1144006 m!1055123))

(declare-fun m!1055125 () Bool)

(assert (=> bm!51882 m!1055125))

(declare-fun m!1055127 () Bool)

(assert (=> b!1143991 m!1055127))

(declare-fun m!1055129 () Bool)

(assert (=> b!1143991 m!1055129))

(declare-fun m!1055131 () Bool)

(assert (=> b!1143991 m!1055131))

(declare-fun m!1055133 () Bool)

(assert (=> b!1143987 m!1055133))

(declare-fun m!1055135 () Bool)

(assert (=> b!1143987 m!1055135))

(declare-fun m!1055137 () Bool)

(assert (=> b!1143987 m!1055137))

(declare-fun m!1055139 () Bool)

(assert (=> b!1143987 m!1055139))

(check-sat (not b!1144003) (not b_next!24195) (not b!1143991) (not bm!51879) (not b!1143996) (not b!1144004) (not b!1143992) (not b!1144013) (not start!98590) (not bm!51883) b_and!39241 (not b!1143993) (not b!1143989) (not mapNonEmpty!44912) (not b!1143986) (not b!1144008) (not bm!51886) (not b!1143997) (not b!1144012) (not b!1144001) (not b!1144006) (not b!1143987) (not b_lambda!19301) (not bm!51880) (not bm!51882) tp_is_empty!28725)
(check-sat b_and!39241 (not b_next!24195))
