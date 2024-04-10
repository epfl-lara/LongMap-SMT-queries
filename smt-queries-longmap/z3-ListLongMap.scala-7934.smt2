; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98446 () Bool)

(assert start!98446)

(declare-fun b_free!24051 () Bool)

(declare-fun b_next!24051 () Bool)

(assert (=> start!98446 (= b_free!24051 (not b_next!24051))))

(declare-fun tp!84864 () Bool)

(declare-fun b_and!38951 () Bool)

(assert (=> start!98446 (= tp!84864 b_and!38951)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!647308 () Bool)

(declare-fun b!1137578 () Bool)

(declare-fun lt!505979 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1137578 (= e!647308 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505979) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!43235 0))(
  ( (V!43236 (val!14347 Int)) )
))
(declare-fun zeroValue!944 () V!43235)

(declare-datatypes ((array!74023 0))(
  ( (array!74024 (arr!35662 (Array (_ BitVec 32) (_ BitVec 64))) (size!36198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74023)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!50151 () Bool)

(declare-fun minValue!944 () V!43235)

(declare-datatypes ((ValueCell!13581 0))(
  ( (ValueCellFull!13581 (v!16984 V!43235)) (EmptyCell!13581) )
))
(declare-datatypes ((array!74025 0))(
  ( (array!74026 (arr!35663 (Array (_ BitVec 32) ValueCell!13581)) (size!36199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74025)

(declare-datatypes ((tuple2!18122 0))(
  ( (tuple2!18123 (_1!9072 (_ BitVec 64)) (_2!9072 V!43235)) )
))
(declare-datatypes ((List!24879 0))(
  ( (Nil!24876) (Cons!24875 (h!26084 tuple2!18122) (t!35922 List!24879)) )
))
(declare-datatypes ((ListLongMap!16091 0))(
  ( (ListLongMap!16092 (toList!8061 List!24879)) )
))
(declare-fun call!50160 () ListLongMap!16091)

(declare-fun getCurrentListMapNoExtraKeys!4545 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43235 V!43235 (_ BitVec 32) Int) ListLongMap!16091)

(assert (=> bm!50151 (= call!50160 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50152 () Bool)

(declare-datatypes ((Unit!37263 0))(
  ( (Unit!37264) )
))
(declare-fun call!50159 () Unit!37263)

(declare-fun call!50157 () Unit!37263)

(assert (=> bm!50152 (= call!50159 call!50157)))

(declare-fun b!1137579 () Bool)

(declare-fun e!647310 () Bool)

(declare-fun tp_is_empty!28581 () Bool)

(assert (=> b!1137579 (= e!647310 tp_is_empty!28581)))

(declare-fun b!1137580 () Bool)

(declare-fun arrayContainsKey!0 (array!74023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137580 (= e!647308 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137582 () Bool)

(declare-fun call!50156 () ListLongMap!16091)

(declare-fun contains!6599 (ListLongMap!16091 (_ BitVec 64)) Bool)

(assert (=> b!1137582 (contains!6599 call!50156 k0!934)))

(declare-fun lt!505977 () Unit!37263)

(assert (=> b!1137582 (= lt!505977 call!50157)))

(declare-fun call!50154 () Bool)

(assert (=> b!1137582 call!50154))

(declare-fun lt!505964 () ListLongMap!16091)

(declare-fun lt!505966 () ListLongMap!16091)

(declare-fun +!3496 (ListLongMap!16091 tuple2!18122) ListLongMap!16091)

(assert (=> b!1137582 (= lt!505964 (+!3496 lt!505966 (tuple2!18123 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505965 () Unit!37263)

(declare-fun addStillContains!756 (ListLongMap!16091 (_ BitVec 64) V!43235 (_ BitVec 64)) Unit!37263)

(assert (=> b!1137582 (= lt!505965 (addStillContains!756 lt!505966 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!647315 () Unit!37263)

(assert (=> b!1137582 (= e!647315 lt!505977)))

(declare-fun b!1137583 () Bool)

(declare-fun res!759037 () Bool)

(declare-fun e!647307 () Bool)

(assert (=> b!1137583 (=> (not res!759037) (not e!647307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137583 (= res!759037 (validMask!0 mask!1564))))

(declare-fun b!1137584 () Bool)

(declare-fun e!647306 () Unit!37263)

(declare-fun Unit!37265 () Unit!37263)

(assert (=> b!1137584 (= e!647306 Unit!37265)))

(declare-fun b!1137585 () Bool)

(declare-fun c!111319 () Bool)

(assert (=> b!1137585 (= c!111319 (and (not lt!505979) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647305 () Unit!37263)

(assert (=> b!1137585 (= e!647315 e!647305)))

(declare-fun b!1137586 () Bool)

(declare-fun res!759040 () Bool)

(assert (=> b!1137586 (=> (not res!759040) (not e!647307))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137586 (= res!759040 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36198 _keys!1208))))))

(declare-fun b!1137587 () Bool)

(declare-fun res!759042 () Bool)

(assert (=> b!1137587 (=> (not res!759042) (not e!647307))))

(assert (=> b!1137587 (= res!759042 (and (= (size!36199 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36198 _keys!1208) (size!36199 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137588 () Bool)

(declare-fun e!647313 () Unit!37263)

(declare-fun Unit!37266 () Unit!37263)

(assert (=> b!1137588 (= e!647313 Unit!37266)))

(declare-fun b!1137589 () Bool)

(declare-fun e!647314 () Bool)

(declare-fun mapRes!44696 () Bool)

(assert (=> b!1137589 (= e!647314 (and e!647310 mapRes!44696))))

(declare-fun condMapEmpty!44696 () Bool)

(declare-fun mapDefault!44696 () ValueCell!13581)

(assert (=> b!1137589 (= condMapEmpty!44696 (= (arr!35663 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13581)) mapDefault!44696)))))

(declare-fun b!1137590 () Bool)

(declare-fun e!647304 () Bool)

(declare-fun e!647312 () Bool)

(assert (=> b!1137590 (= e!647304 e!647312)))

(declare-fun res!759034 () Bool)

(assert (=> b!1137590 (=> res!759034 e!647312)))

(assert (=> b!1137590 (= res!759034 (not (= (select (arr!35662 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647319 () Bool)

(assert (=> b!1137590 e!647319))

(declare-fun c!111321 () Bool)

(assert (=> b!1137590 (= c!111321 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505967 () Unit!37263)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43235 V!43235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37263)

(assert (=> b!1137590 (= lt!505967 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111322 () Bool)

(declare-fun call!50155 () ListLongMap!16091)

(declare-fun bm!50153 () Bool)

(assert (=> bm!50153 (= call!50154 (contains!6599 (ite c!111322 lt!505964 call!50155) k0!934))))

(declare-fun b!1137591 () Bool)

(declare-fun e!647318 () Bool)

(assert (=> b!1137591 (= e!647318 tp_is_empty!28581)))

(declare-fun b!1137592 () Bool)

(declare-fun Unit!37267 () Unit!37263)

(assert (=> b!1137592 (= e!647306 Unit!37267)))

(assert (=> b!1137592 (= lt!505979 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137592 (= c!111322 (and (not lt!505979) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505970 () Unit!37263)

(assert (=> b!1137592 (= lt!505970 e!647315)))

(declare-fun lt!505974 () Unit!37263)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!358 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43235 V!43235 (_ BitVec 64) (_ BitVec 32) Int) Unit!37263)

(assert (=> b!1137592 (= lt!505974 (lemmaListMapContainsThenArrayContainsFrom!358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111320 () Bool)

(assert (=> b!1137592 (= c!111320 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759038 () Bool)

(assert (=> b!1137592 (= res!759038 e!647308)))

(declare-fun e!647309 () Bool)

(assert (=> b!1137592 (=> (not res!759038) (not e!647309))))

(assert (=> b!1137592 e!647309))

(declare-fun lt!505972 () Unit!37263)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74023 (_ BitVec 32) (_ BitVec 32)) Unit!37263)

(assert (=> b!1137592 (= lt!505972 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24880 0))(
  ( (Nil!24877) (Cons!24876 (h!26085 (_ BitVec 64)) (t!35923 List!24880)) )
))
(declare-fun arrayNoDuplicates!0 (array!74023 (_ BitVec 32) List!24880) Bool)

(assert (=> b!1137592 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24877)))

(declare-fun lt!505971 () Unit!37263)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74023 (_ BitVec 64) (_ BitVec 32) List!24880) Unit!37263)

(assert (=> b!1137592 (= lt!505971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24877))))

(assert (=> b!1137592 false))

(declare-fun b!1137593 () Bool)

(declare-fun lt!505963 () Unit!37263)

(assert (=> b!1137593 (= e!647305 lt!505963)))

(assert (=> b!1137593 (= lt!505963 call!50159)))

(declare-fun call!50158 () Bool)

(assert (=> b!1137593 call!50158))

(declare-fun b!1137594 () Bool)

(declare-fun e!647317 () Bool)

(assert (=> b!1137594 (= e!647307 e!647317)))

(declare-fun res!759044 () Bool)

(assert (=> b!1137594 (=> (not res!759044) (not e!647317))))

(declare-fun lt!505980 () array!74023)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74023 (_ BitVec 32)) Bool)

(assert (=> b!1137594 (= res!759044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505980 mask!1564))))

(assert (=> b!1137594 (= lt!505980 (array!74024 (store (arr!35662 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36198 _keys!1208)))))

(declare-fun b!1137595 () Bool)

(declare-fun call!50161 () ListLongMap!16091)

(assert (=> b!1137595 (= e!647319 (= call!50161 call!50160))))

(declare-fun bm!50154 () Bool)

(assert (=> bm!50154 (= call!50157 (addStillContains!756 (ite c!111322 lt!505964 lt!505966) (ite c!111322 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111319 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111322 minValue!944 (ite c!111319 zeroValue!944 minValue!944)) k0!934))))

(declare-fun res!759045 () Bool)

(assert (=> start!98446 (=> (not res!759045) (not e!647307))))

(assert (=> start!98446 (= res!759045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36198 _keys!1208))))))

(assert (=> start!98446 e!647307))

(assert (=> start!98446 tp_is_empty!28581))

(declare-fun array_inv!27344 (array!74023) Bool)

(assert (=> start!98446 (array_inv!27344 _keys!1208)))

(assert (=> start!98446 true))

(assert (=> start!98446 tp!84864))

(declare-fun array_inv!27345 (array!74025) Bool)

(assert (=> start!98446 (and (array_inv!27345 _values!996) e!647314)))

(declare-fun b!1137581 () Bool)

(assert (=> b!1137581 (= e!647305 e!647313)))

(declare-fun c!111318 () Bool)

(assert (=> b!1137581 (= c!111318 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505979))))

(declare-fun b!1137596 () Bool)

(declare-fun res!759035 () Bool)

(assert (=> b!1137596 (=> (not res!759035) (not e!647307))))

(assert (=> b!1137596 (= res!759035 (= (select (arr!35662 _keys!1208) i!673) k0!934))))

(declare-fun b!1137597 () Bool)

(declare-fun -!1217 (ListLongMap!16091 (_ BitVec 64)) ListLongMap!16091)

(assert (=> b!1137597 (= e!647319 (= call!50161 (-!1217 call!50160 k0!934)))))

(declare-fun b!1137598 () Bool)

(declare-fun e!647316 () Bool)

(assert (=> b!1137598 (= e!647317 (not e!647316))))

(declare-fun res!759047 () Bool)

(assert (=> b!1137598 (=> res!759047 e!647316)))

(assert (=> b!1137598 (= res!759047 (bvsgt from!1455 i!673))))

(assert (=> b!1137598 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505968 () Unit!37263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74023 (_ BitVec 64) (_ BitVec 32)) Unit!37263)

(assert (=> b!1137598 (= lt!505968 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50155 () Bool)

(assert (=> bm!50155 (= call!50156 (+!3496 (ite c!111322 lt!505964 lt!505966) (ite c!111322 (tuple2!18123 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111319 (tuple2!18123 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18123 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!44696 () Bool)

(assert (=> mapIsEmpty!44696 mapRes!44696))

(declare-fun bm!50156 () Bool)

(assert (=> bm!50156 (= call!50155 call!50156)))

(declare-fun b!1137599 () Bool)

(assert (=> b!1137599 (= e!647312 true)))

(declare-fun lt!505976 () Unit!37263)

(assert (=> b!1137599 (= lt!505976 e!647306)))

(declare-fun c!111317 () Bool)

(assert (=> b!1137599 (= c!111317 (contains!6599 lt!505966 k0!934))))

(assert (=> b!1137599 (= lt!505966 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137600 () Bool)

(declare-fun res!759043 () Bool)

(assert (=> b!1137600 (=> (not res!759043) (not e!647317))))

(assert (=> b!1137600 (= res!759043 (arrayNoDuplicates!0 lt!505980 #b00000000000000000000000000000000 Nil!24877))))

(declare-fun b!1137601 () Bool)

(assert (=> b!1137601 (= e!647309 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137602 () Bool)

(declare-fun res!759046 () Bool)

(assert (=> b!1137602 (=> (not res!759046) (not e!647307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137602 (= res!759046 (validKeyInArray!0 k0!934))))

(declare-fun b!1137603 () Bool)

(declare-fun res!759039 () Bool)

(assert (=> b!1137603 (=> (not res!759039) (not e!647307))))

(assert (=> b!1137603 (= res!759039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50157 () Bool)

(assert (=> bm!50157 (= call!50158 call!50154)))

(declare-fun b!1137604 () Bool)

(declare-fun res!759041 () Bool)

(assert (=> b!1137604 (=> (not res!759041) (not e!647307))))

(assert (=> b!1137604 (= res!759041 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24877))))

(declare-fun mapNonEmpty!44696 () Bool)

(declare-fun tp!84863 () Bool)

(assert (=> mapNonEmpty!44696 (= mapRes!44696 (and tp!84863 e!647318))))

(declare-fun mapRest!44696 () (Array (_ BitVec 32) ValueCell!13581))

(declare-fun mapKey!44696 () (_ BitVec 32))

(declare-fun mapValue!44696 () ValueCell!13581)

(assert (=> mapNonEmpty!44696 (= (arr!35663 _values!996) (store mapRest!44696 mapKey!44696 mapValue!44696))))

(declare-fun b!1137605 () Bool)

(assert (=> b!1137605 call!50158))

(declare-fun lt!505975 () Unit!37263)

(assert (=> b!1137605 (= lt!505975 call!50159)))

(assert (=> b!1137605 (= e!647313 lt!505975)))

(declare-fun bm!50158 () Bool)

(declare-fun lt!505969 () array!74025)

(assert (=> bm!50158 (= call!50161 (getCurrentListMapNoExtraKeys!4545 lt!505980 lt!505969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137606 () Bool)

(assert (=> b!1137606 (= e!647316 e!647304)))

(declare-fun res!759036 () Bool)

(assert (=> b!1137606 (=> res!759036 e!647304)))

(assert (=> b!1137606 (= res!759036 (not (= from!1455 i!673)))))

(declare-fun lt!505973 () ListLongMap!16091)

(assert (=> b!1137606 (= lt!505973 (getCurrentListMapNoExtraKeys!4545 lt!505980 lt!505969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2600 (Int (_ BitVec 64)) V!43235)

(assert (=> b!1137606 (= lt!505969 (array!74026 (store (arr!35663 _values!996) i!673 (ValueCellFull!13581 (dynLambda!2600 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36199 _values!996)))))

(declare-fun lt!505978 () ListLongMap!16091)

(assert (=> b!1137606 (= lt!505978 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98446 res!759045) b!1137583))

(assert (= (and b!1137583 res!759037) b!1137587))

(assert (= (and b!1137587 res!759042) b!1137603))

(assert (= (and b!1137603 res!759039) b!1137604))

(assert (= (and b!1137604 res!759041) b!1137586))

(assert (= (and b!1137586 res!759040) b!1137602))

(assert (= (and b!1137602 res!759046) b!1137596))

(assert (= (and b!1137596 res!759035) b!1137594))

(assert (= (and b!1137594 res!759044) b!1137600))

(assert (= (and b!1137600 res!759043) b!1137598))

(assert (= (and b!1137598 (not res!759047)) b!1137606))

(assert (= (and b!1137606 (not res!759036)) b!1137590))

(assert (= (and b!1137590 c!111321) b!1137597))

(assert (= (and b!1137590 (not c!111321)) b!1137595))

(assert (= (or b!1137597 b!1137595) bm!50158))

(assert (= (or b!1137597 b!1137595) bm!50151))

(assert (= (and b!1137590 (not res!759034)) b!1137599))

(assert (= (and b!1137599 c!111317) b!1137592))

(assert (= (and b!1137599 (not c!111317)) b!1137584))

(assert (= (and b!1137592 c!111322) b!1137582))

(assert (= (and b!1137592 (not c!111322)) b!1137585))

(assert (= (and b!1137585 c!111319) b!1137593))

(assert (= (and b!1137585 (not c!111319)) b!1137581))

(assert (= (and b!1137581 c!111318) b!1137605))

(assert (= (and b!1137581 (not c!111318)) b!1137588))

(assert (= (or b!1137593 b!1137605) bm!50152))

(assert (= (or b!1137593 b!1137605) bm!50156))

(assert (= (or b!1137593 b!1137605) bm!50157))

(assert (= (or b!1137582 bm!50157) bm!50153))

(assert (= (or b!1137582 bm!50152) bm!50154))

(assert (= (or b!1137582 bm!50156) bm!50155))

(assert (= (and b!1137592 c!111320) b!1137580))

(assert (= (and b!1137592 (not c!111320)) b!1137578))

(assert (= (and b!1137592 res!759038) b!1137601))

(assert (= (and b!1137589 condMapEmpty!44696) mapIsEmpty!44696))

(assert (= (and b!1137589 (not condMapEmpty!44696)) mapNonEmpty!44696))

(get-info :version)

(assert (= (and mapNonEmpty!44696 ((_ is ValueCellFull!13581) mapValue!44696)) b!1137591))

(assert (= (and b!1137589 ((_ is ValueCellFull!13581) mapDefault!44696)) b!1137579))

(assert (= start!98446 b!1137589))

(declare-fun b_lambda!19157 () Bool)

(assert (=> (not b_lambda!19157) (not b!1137606)))

(declare-fun t!35921 () Bool)

(declare-fun tb!8863 () Bool)

(assert (=> (and start!98446 (= defaultEntry!1004 defaultEntry!1004) t!35921) tb!8863))

(declare-fun result!18291 () Bool)

(assert (=> tb!8863 (= result!18291 tp_is_empty!28581)))

(assert (=> b!1137606 t!35921))

(declare-fun b_and!38953 () Bool)

(assert (= b_and!38951 (and (=> t!35921 result!18291) b_and!38953)))

(declare-fun m!1049633 () Bool)

(assert (=> b!1137604 m!1049633))

(declare-fun m!1049635 () Bool)

(assert (=> mapNonEmpty!44696 m!1049635))

(declare-fun m!1049637 () Bool)

(assert (=> b!1137594 m!1049637))

(declare-fun m!1049639 () Bool)

(assert (=> b!1137594 m!1049639))

(declare-fun m!1049641 () Bool)

(assert (=> b!1137590 m!1049641))

(declare-fun m!1049643 () Bool)

(assert (=> b!1137590 m!1049643))

(declare-fun m!1049645 () Bool)

(assert (=> bm!50158 m!1049645))

(declare-fun m!1049647 () Bool)

(assert (=> bm!50155 m!1049647))

(declare-fun m!1049649 () Bool)

(assert (=> start!98446 m!1049649))

(declare-fun m!1049651 () Bool)

(assert (=> start!98446 m!1049651))

(declare-fun m!1049653 () Bool)

(assert (=> b!1137597 m!1049653))

(declare-fun m!1049655 () Bool)

(assert (=> b!1137592 m!1049655))

(declare-fun m!1049657 () Bool)

(assert (=> b!1137592 m!1049657))

(declare-fun m!1049659 () Bool)

(assert (=> b!1137592 m!1049659))

(declare-fun m!1049661 () Bool)

(assert (=> b!1137592 m!1049661))

(declare-fun m!1049663 () Bool)

(assert (=> b!1137599 m!1049663))

(declare-fun m!1049665 () Bool)

(assert (=> b!1137599 m!1049665))

(declare-fun m!1049667 () Bool)

(assert (=> b!1137582 m!1049667))

(declare-fun m!1049669 () Bool)

(assert (=> b!1137582 m!1049669))

(declare-fun m!1049671 () Bool)

(assert (=> b!1137582 m!1049671))

(declare-fun m!1049673 () Bool)

(assert (=> b!1137580 m!1049673))

(declare-fun m!1049675 () Bool)

(assert (=> bm!50153 m!1049675))

(declare-fun m!1049677 () Bool)

(assert (=> b!1137583 m!1049677))

(assert (=> bm!50151 m!1049665))

(declare-fun m!1049679 () Bool)

(assert (=> b!1137602 m!1049679))

(declare-fun m!1049681 () Bool)

(assert (=> b!1137598 m!1049681))

(declare-fun m!1049683 () Bool)

(assert (=> b!1137598 m!1049683))

(declare-fun m!1049685 () Bool)

(assert (=> b!1137606 m!1049685))

(declare-fun m!1049687 () Bool)

(assert (=> b!1137606 m!1049687))

(declare-fun m!1049689 () Bool)

(assert (=> b!1137606 m!1049689))

(declare-fun m!1049691 () Bool)

(assert (=> b!1137606 m!1049691))

(declare-fun m!1049693 () Bool)

(assert (=> b!1137600 m!1049693))

(assert (=> b!1137601 m!1049673))

(declare-fun m!1049695 () Bool)

(assert (=> b!1137596 m!1049695))

(declare-fun m!1049697 () Bool)

(assert (=> bm!50154 m!1049697))

(declare-fun m!1049699 () Bool)

(assert (=> b!1137603 m!1049699))

(check-sat (not b!1137606) (not b!1137604) b_and!38953 (not b_next!24051) (not b!1137594) (not b!1137597) (not b!1137602) (not b!1137580) (not b!1137600) (not bm!50153) (not b_lambda!19157) (not b!1137603) (not mapNonEmpty!44696) (not b!1137592) (not bm!50154) (not b!1137583) (not start!98446) (not b!1137590) (not bm!50158) (not b!1137601) (not bm!50155) (not b!1137582) (not b!1137598) (not bm!50151) tp_is_empty!28581 (not b!1137599))
(check-sat b_and!38953 (not b_next!24051))
