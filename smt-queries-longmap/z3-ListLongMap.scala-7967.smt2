; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98636 () Bool)

(assert start!98636)

(declare-fun b_free!24247 () Bool)

(declare-fun b_next!24247 () Bool)

(assert (=> start!98636 (= b_free!24247 (not b_next!24247))))

(declare-fun tp!85452 () Bool)

(declare-fun b_and!39321 () Bool)

(assert (=> start!98636 (= tp!85452 b_and!39321)))

(declare-datatypes ((array!74326 0))(
  ( (array!74327 (arr!35814 (Array (_ BitVec 32) (_ BitVec 64))) (size!36352 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74326)

(declare-fun b!1146250 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!652009 () Bool)

(declare-fun arrayContainsKey!0 (array!74326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146250 (= e!652009 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146251 () Bool)

(declare-fun e!652014 () Bool)

(declare-fun e!652018 () Bool)

(assert (=> b!1146251 (= e!652014 (not e!652018))))

(declare-fun res!763171 () Bool)

(assert (=> b!1146251 (=> res!763171 e!652018)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146251 (= res!763171 (bvsgt from!1455 i!673))))

(assert (=> b!1146251 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37500 0))(
  ( (Unit!37501) )
))
(declare-fun lt!511800 () Unit!37500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74326 (_ BitVec 64) (_ BitVec 32)) Unit!37500)

(assert (=> b!1146251 (= lt!511800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146252 () Bool)

(declare-fun e!652007 () Unit!37500)

(declare-fun Unit!37502 () Unit!37500)

(assert (=> b!1146252 (= e!652007 Unit!37502)))

(declare-fun b!1146253 () Bool)

(declare-fun e!652010 () Unit!37500)

(declare-fun lt!511790 () Unit!37500)

(assert (=> b!1146253 (= e!652010 lt!511790)))

(declare-fun call!52484 () Unit!37500)

(assert (=> b!1146253 (= lt!511790 call!52484)))

(declare-fun call!52488 () Bool)

(assert (=> b!1146253 call!52488))

(declare-datatypes ((V!43497 0))(
  ( (V!43498 (val!14445 Int)) )
))
(declare-fun zeroValue!944 () V!43497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!52480 () Bool)

(declare-datatypes ((tuple2!18390 0))(
  ( (tuple2!18391 (_1!9206 (_ BitVec 64)) (_2!9206 V!43497)) )
))
(declare-datatypes ((List!25127 0))(
  ( (Nil!25124) (Cons!25123 (h!26332 tuple2!18390) (t!36357 List!25127)) )
))
(declare-datatypes ((ListLongMap!16359 0))(
  ( (ListLongMap!16360 (toList!8195 List!25127)) )
))
(declare-fun call!52490 () ListLongMap!16359)

(declare-datatypes ((ValueCell!13679 0))(
  ( (ValueCellFull!13679 (v!17081 V!43497)) (EmptyCell!13679) )
))
(declare-datatypes ((array!74328 0))(
  ( (array!74329 (arr!35815 (Array (_ BitVec 32) ValueCell!13679)) (size!36353 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74328)

(declare-fun minValue!944 () V!43497)

(declare-fun getCurrentListMapNoExtraKeys!4681 (array!74326 array!74328 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 32) Int) ListLongMap!16359)

(assert (=> bm!52480 (= call!52490 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146254 () Bool)

(declare-fun e!652004 () Bool)

(assert (=> b!1146254 (= e!652018 e!652004)))

(declare-fun res!763163 () Bool)

(assert (=> b!1146254 (=> res!763163 e!652004)))

(assert (=> b!1146254 (= res!763163 (not (= from!1455 i!673)))))

(declare-fun lt!511785 () array!74328)

(declare-fun lt!511784 () ListLongMap!16359)

(declare-fun lt!511789 () array!74326)

(assert (=> b!1146254 (= lt!511784 (getCurrentListMapNoExtraKeys!4681 lt!511789 lt!511785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511794 () V!43497)

(assert (=> b!1146254 (= lt!511785 (array!74329 (store (arr!35815 _values!996) i!673 (ValueCellFull!13679 lt!511794)) (size!36353 _values!996)))))

(declare-fun dynLambda!2652 (Int (_ BitVec 64)) V!43497)

(assert (=> b!1146254 (= lt!511794 (dynLambda!2652 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511792 () ListLongMap!16359)

(assert (=> b!1146254 (= lt!511792 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146256 () Bool)

(declare-fun res!763159 () Bool)

(declare-fun e!652006 () Bool)

(assert (=> b!1146256 (=> (not res!763159) (not e!652006))))

(assert (=> b!1146256 (= res!763159 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36352 _keys!1208))))))

(declare-fun call!52487 () ListLongMap!16359)

(declare-fun bm!52481 () Bool)

(assert (=> bm!52481 (= call!52487 (getCurrentListMapNoExtraKeys!4681 lt!511789 lt!511785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52482 () Bool)

(declare-fun call!52483 () Unit!37500)

(assert (=> bm!52482 (= call!52484 call!52483)))

(declare-fun b!1146257 () Bool)

(declare-fun res!763162 () Bool)

(assert (=> b!1146257 (=> (not res!763162) (not e!652006))))

(assert (=> b!1146257 (= res!763162 (and (= (size!36353 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36352 _keys!1208) (size!36353 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146258 () Bool)

(declare-fun e!652019 () Bool)

(declare-fun e!652012 () Bool)

(declare-fun mapRes!44990 () Bool)

(assert (=> b!1146258 (= e!652019 (and e!652012 mapRes!44990))))

(declare-fun condMapEmpty!44990 () Bool)

(declare-fun mapDefault!44990 () ValueCell!13679)

(assert (=> b!1146258 (= condMapEmpty!44990 (= (arr!35815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13679)) mapDefault!44990)))))

(declare-fun b!1146259 () Bool)

(declare-fun e!652020 () Bool)

(assert (=> b!1146259 (= e!652020 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146260 () Bool)

(declare-fun res!763172 () Bool)

(assert (=> b!1146260 (=> (not res!763172) (not e!652006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74326 (_ BitVec 32)) Bool)

(assert (=> b!1146260 (= res!763172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146261 () Bool)

(declare-fun e!652017 () Bool)

(declare-fun tp_is_empty!28777 () Bool)

(assert (=> b!1146261 (= e!652017 tp_is_empty!28777)))

(declare-fun b!1146262 () Bool)

(declare-fun res!763167 () Bool)

(assert (=> b!1146262 (=> (not res!763167) (not e!652014))))

(declare-datatypes ((List!25128 0))(
  ( (Nil!25125) (Cons!25124 (h!26333 (_ BitVec 64)) (t!36358 List!25128)) )
))
(declare-fun arrayNoDuplicates!0 (array!74326 (_ BitVec 32) List!25128) Bool)

(assert (=> b!1146262 (= res!763167 (arrayNoDuplicates!0 lt!511789 #b00000000000000000000000000000000 Nil!25125))))

(declare-fun b!1146263 () Bool)

(assert (=> b!1146263 (= e!652006 e!652014)))

(declare-fun res!763168 () Bool)

(assert (=> b!1146263 (=> (not res!763168) (not e!652014))))

(assert (=> b!1146263 (= res!763168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511789 mask!1564))))

(assert (=> b!1146263 (= lt!511789 (array!74327 (store (arr!35814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36352 _keys!1208)))))

(declare-fun call!52486 () Bool)

(declare-fun lt!511791 () ListLongMap!16359)

(declare-fun bm!52483 () Bool)

(declare-fun c!113058 () Bool)

(declare-fun call!52485 () ListLongMap!16359)

(declare-fun contains!6659 (ListLongMap!16359 (_ BitVec 64)) Bool)

(assert (=> bm!52483 (= call!52486 (contains!6659 (ite c!113058 lt!511791 call!52485) k0!934))))

(declare-fun e!652015 () Bool)

(declare-fun b!1146264 () Bool)

(declare-fun lt!511793 () ListLongMap!16359)

(declare-fun -!1269 (ListLongMap!16359 (_ BitVec 64)) ListLongMap!16359)

(assert (=> b!1146264 (= e!652015 (= (-!1269 lt!511792 k0!934) lt!511793))))

(declare-fun mapNonEmpty!44990 () Bool)

(declare-fun tp!85451 () Bool)

(assert (=> mapNonEmpty!44990 (= mapRes!44990 (and tp!85451 e!652017))))

(declare-fun mapKey!44990 () (_ BitVec 32))

(declare-fun mapRest!44990 () (Array (_ BitVec 32) ValueCell!13679))

(declare-fun mapValue!44990 () ValueCell!13679)

(assert (=> mapNonEmpty!44990 (= (arr!35815 _values!996) (store mapRest!44990 mapKey!44990 mapValue!44990))))

(declare-fun b!1146265 () Bool)

(declare-fun call!52489 () ListLongMap!16359)

(assert (=> b!1146265 (contains!6659 call!52489 k0!934)))

(declare-fun lt!511798 () Unit!37500)

(declare-fun addStillContains!828 (ListLongMap!16359 (_ BitVec 64) V!43497 (_ BitVec 64)) Unit!37500)

(assert (=> b!1146265 (= lt!511798 (addStillContains!828 lt!511791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1146265 call!52486))

(declare-fun +!3615 (ListLongMap!16359 tuple2!18390) ListLongMap!16359)

(assert (=> b!1146265 (= lt!511791 (+!3615 lt!511793 (tuple2!18391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511795 () Unit!37500)

(assert (=> b!1146265 (= lt!511795 call!52483)))

(declare-fun e!652016 () Unit!37500)

(assert (=> b!1146265 (= e!652016 lt!511798)))

(declare-fun bm!52484 () Bool)

(assert (=> bm!52484 (= call!52488 call!52486)))

(declare-fun e!652008 () Bool)

(declare-fun b!1146266 () Bool)

(assert (=> b!1146266 (= e!652008 (= call!52487 (-!1269 call!52490 k0!934)))))

(declare-fun b!1146267 () Bool)

(declare-fun res!763169 () Bool)

(assert (=> b!1146267 (=> (not res!763169) (not e!652006))))

(assert (=> b!1146267 (= res!763169 (= (select (arr!35814 _keys!1208) i!673) k0!934))))

(declare-fun bm!52485 () Bool)

(declare-fun c!113059 () Bool)

(assert (=> bm!52485 (= call!52483 (addStillContains!828 lt!511793 (ite (or c!113058 c!113059) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113058 c!113059) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146268 () Bool)

(declare-fun res!763164 () Bool)

(assert (=> b!1146268 (=> (not res!763164) (not e!652006))))

(assert (=> b!1146268 (= res!763164 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25125))))

(declare-fun bm!52486 () Bool)

(assert (=> bm!52486 (= call!52489 (+!3615 (ite c!113058 lt!511791 lt!511793) (ite c!113058 (tuple2!18391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113059 (tuple2!18391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1146269 () Bool)

(assert (=> b!1146269 call!52488))

(declare-fun lt!511797 () Unit!37500)

(assert (=> b!1146269 (= lt!511797 call!52484)))

(assert (=> b!1146269 (= e!652007 lt!511797)))

(declare-fun b!1146270 () Bool)

(declare-fun e!652011 () Bool)

(assert (=> b!1146270 (= e!652011 true)))

(assert (=> b!1146270 e!652015))

(declare-fun res!763166 () Bool)

(assert (=> b!1146270 (=> (not res!763166) (not e!652015))))

(declare-fun lt!511796 () V!43497)

(assert (=> b!1146270 (= res!763166 (= (-!1269 (+!3615 lt!511793 (tuple2!18391 (select (arr!35814 _keys!1208) from!1455) lt!511796)) (select (arr!35814 _keys!1208) from!1455)) lt!511793))))

(declare-fun lt!511788 () Unit!37500)

(declare-fun addThenRemoveForNewKeyIsSame!132 (ListLongMap!16359 (_ BitVec 64) V!43497) Unit!37500)

(assert (=> b!1146270 (= lt!511788 (addThenRemoveForNewKeyIsSame!132 lt!511793 (select (arr!35814 _keys!1208) from!1455) lt!511796))))

(declare-fun get!18228 (ValueCell!13679 V!43497) V!43497)

(assert (=> b!1146270 (= lt!511796 (get!18228 (select (arr!35815 _values!996) from!1455) lt!511794))))

(declare-fun lt!511787 () Unit!37500)

(declare-fun e!652005 () Unit!37500)

(assert (=> b!1146270 (= lt!511787 e!652005)))

(declare-fun c!113056 () Bool)

(assert (=> b!1146270 (= c!113056 (contains!6659 lt!511793 k0!934))))

(assert (=> b!1146270 (= lt!511793 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146271 () Bool)

(declare-fun Unit!37503 () Unit!37500)

(assert (=> b!1146271 (= e!652005 Unit!37503)))

(declare-fun lt!511799 () Bool)

(assert (=> b!1146271 (= lt!511799 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146271 (= c!113058 (and (not lt!511799) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511786 () Unit!37500)

(assert (=> b!1146271 (= lt!511786 e!652016)))

(declare-fun lt!511781 () Unit!37500)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!424 (array!74326 array!74328 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 64) (_ BitVec 32) Int) Unit!37500)

(assert (=> b!1146271 (= lt!511781 (lemmaListMapContainsThenArrayContainsFrom!424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113055 () Bool)

(assert (=> b!1146271 (= c!113055 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763160 () Bool)

(assert (=> b!1146271 (= res!763160 e!652009)))

(assert (=> b!1146271 (=> (not res!763160) (not e!652020))))

(assert (=> b!1146271 e!652020))

(declare-fun lt!511783 () Unit!37500)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74326 (_ BitVec 32) (_ BitVec 32)) Unit!37500)

(assert (=> b!1146271 (= lt!511783 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146271 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25125)))

(declare-fun lt!511782 () Unit!37500)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74326 (_ BitVec 64) (_ BitVec 32) List!25128) Unit!37500)

(assert (=> b!1146271 (= lt!511782 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25125))))

(assert (=> b!1146271 false))

(declare-fun b!1146272 () Bool)

(assert (=> b!1146272 (= e!652009 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511799) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146273 () Bool)

(assert (=> b!1146273 (= e!652004 e!652011)))

(declare-fun res!763165 () Bool)

(assert (=> b!1146273 (=> res!763165 e!652011)))

(assert (=> b!1146273 (= res!763165 (not (= (select (arr!35814 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146273 e!652008))

(declare-fun c!113057 () Bool)

(assert (=> b!1146273 (= c!113057 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511780 () Unit!37500)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 (array!74326 array!74328 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37500)

(assert (=> b!1146273 (= lt!511780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146274 () Bool)

(declare-fun res!763158 () Bool)

(assert (=> b!1146274 (=> (not res!763158) (not e!652006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146274 (= res!763158 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44990 () Bool)

(assert (=> mapIsEmpty!44990 mapRes!44990))

(declare-fun b!1146275 () Bool)

(assert (=> b!1146275 (= e!652010 e!652007)))

(declare-fun c!113060 () Bool)

(assert (=> b!1146275 (= c!113060 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511799))))

(declare-fun b!1146255 () Bool)

(assert (=> b!1146255 (= e!652008 (= call!52487 call!52490))))

(declare-fun res!763161 () Bool)

(assert (=> start!98636 (=> (not res!763161) (not e!652006))))

(assert (=> start!98636 (= res!763161 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36352 _keys!1208))))))

(assert (=> start!98636 e!652006))

(assert (=> start!98636 tp_is_empty!28777))

(declare-fun array_inv!27522 (array!74326) Bool)

(assert (=> start!98636 (array_inv!27522 _keys!1208)))

(assert (=> start!98636 true))

(assert (=> start!98636 tp!85452))

(declare-fun array_inv!27523 (array!74328) Bool)

(assert (=> start!98636 (and (array_inv!27523 _values!996) e!652019)))

(declare-fun b!1146276 () Bool)

(assert (=> b!1146276 (= c!113059 (and (not lt!511799) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146276 (= e!652016 e!652010)))

(declare-fun bm!52487 () Bool)

(assert (=> bm!52487 (= call!52485 call!52489)))

(declare-fun b!1146277 () Bool)

(declare-fun Unit!37504 () Unit!37500)

(assert (=> b!1146277 (= e!652005 Unit!37504)))

(declare-fun b!1146278 () Bool)

(declare-fun res!763170 () Bool)

(assert (=> b!1146278 (=> (not res!763170) (not e!652006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146278 (= res!763170 (validKeyInArray!0 k0!934))))

(declare-fun b!1146279 () Bool)

(assert (=> b!1146279 (= e!652012 tp_is_empty!28777)))

(assert (= (and start!98636 res!763161) b!1146274))

(assert (= (and b!1146274 res!763158) b!1146257))

(assert (= (and b!1146257 res!763162) b!1146260))

(assert (= (and b!1146260 res!763172) b!1146268))

(assert (= (and b!1146268 res!763164) b!1146256))

(assert (= (and b!1146256 res!763159) b!1146278))

(assert (= (and b!1146278 res!763170) b!1146267))

(assert (= (and b!1146267 res!763169) b!1146263))

(assert (= (and b!1146263 res!763168) b!1146262))

(assert (= (and b!1146262 res!763167) b!1146251))

(assert (= (and b!1146251 (not res!763171)) b!1146254))

(assert (= (and b!1146254 (not res!763163)) b!1146273))

(assert (= (and b!1146273 c!113057) b!1146266))

(assert (= (and b!1146273 (not c!113057)) b!1146255))

(assert (= (or b!1146266 b!1146255) bm!52481))

(assert (= (or b!1146266 b!1146255) bm!52480))

(assert (= (and b!1146273 (not res!763165)) b!1146270))

(assert (= (and b!1146270 c!113056) b!1146271))

(assert (= (and b!1146270 (not c!113056)) b!1146277))

(assert (= (and b!1146271 c!113058) b!1146265))

(assert (= (and b!1146271 (not c!113058)) b!1146276))

(assert (= (and b!1146276 c!113059) b!1146253))

(assert (= (and b!1146276 (not c!113059)) b!1146275))

(assert (= (and b!1146275 c!113060) b!1146269))

(assert (= (and b!1146275 (not c!113060)) b!1146252))

(assert (= (or b!1146253 b!1146269) bm!52482))

(assert (= (or b!1146253 b!1146269) bm!52487))

(assert (= (or b!1146253 b!1146269) bm!52484))

(assert (= (or b!1146265 bm!52484) bm!52483))

(assert (= (or b!1146265 bm!52482) bm!52485))

(assert (= (or b!1146265 bm!52487) bm!52486))

(assert (= (and b!1146271 c!113055) b!1146250))

(assert (= (and b!1146271 (not c!113055)) b!1146272))

(assert (= (and b!1146271 res!763160) b!1146259))

(assert (= (and b!1146270 res!763166) b!1146264))

(assert (= (and b!1146258 condMapEmpty!44990) mapIsEmpty!44990))

(assert (= (and b!1146258 (not condMapEmpty!44990)) mapNonEmpty!44990))

(get-info :version)

(assert (= (and mapNonEmpty!44990 ((_ is ValueCellFull!13679) mapValue!44990)) b!1146261))

(assert (= (and b!1146258 ((_ is ValueCellFull!13679) mapDefault!44990)) b!1146279))

(assert (= start!98636 b!1146258))

(declare-fun b_lambda!19335 () Bool)

(assert (=> (not b_lambda!19335) (not b!1146254)))

(declare-fun t!36356 () Bool)

(declare-fun tb!9051 () Bool)

(assert (=> (and start!98636 (= defaultEntry!1004 defaultEntry!1004) t!36356) tb!9051))

(declare-fun result!18675 () Bool)

(assert (=> tb!9051 (= result!18675 tp_is_empty!28777)))

(assert (=> b!1146254 t!36356))

(declare-fun b_and!39323 () Bool)

(assert (= b_and!39321 (and (=> t!36356 result!18675) b_and!39323)))

(declare-fun m!1056539 () Bool)

(assert (=> b!1146273 m!1056539))

(declare-fun m!1056541 () Bool)

(assert (=> b!1146273 m!1056541))

(declare-fun m!1056543 () Bool)

(assert (=> bm!52483 m!1056543))

(declare-fun m!1056545 () Bool)

(assert (=> start!98636 m!1056545))

(declare-fun m!1056547 () Bool)

(assert (=> start!98636 m!1056547))

(declare-fun m!1056549 () Bool)

(assert (=> b!1146270 m!1056549))

(declare-fun m!1056551 () Bool)

(assert (=> b!1146270 m!1056551))

(declare-fun m!1056553 () Bool)

(assert (=> b!1146270 m!1056553))

(assert (=> b!1146270 m!1056539))

(declare-fun m!1056555 () Bool)

(assert (=> b!1146270 m!1056555))

(assert (=> b!1146270 m!1056553))

(assert (=> b!1146270 m!1056551))

(declare-fun m!1056557 () Bool)

(assert (=> b!1146270 m!1056557))

(assert (=> b!1146270 m!1056539))

(assert (=> b!1146270 m!1056539))

(declare-fun m!1056559 () Bool)

(assert (=> b!1146270 m!1056559))

(declare-fun m!1056561 () Bool)

(assert (=> b!1146270 m!1056561))

(declare-fun m!1056563 () Bool)

(assert (=> b!1146268 m!1056563))

(declare-fun m!1056565 () Bool)

(assert (=> bm!52481 m!1056565))

(declare-fun m!1056567 () Bool)

(assert (=> b!1146262 m!1056567))

(declare-fun m!1056569 () Bool)

(assert (=> b!1146264 m!1056569))

(declare-fun m!1056571 () Bool)

(assert (=> b!1146265 m!1056571))

(declare-fun m!1056573 () Bool)

(assert (=> b!1146265 m!1056573))

(declare-fun m!1056575 () Bool)

(assert (=> b!1146265 m!1056575))

(assert (=> bm!52480 m!1056549))

(declare-fun m!1056577 () Bool)

(assert (=> b!1146260 m!1056577))

(declare-fun m!1056579 () Bool)

(assert (=> b!1146271 m!1056579))

(declare-fun m!1056581 () Bool)

(assert (=> b!1146271 m!1056581))

(declare-fun m!1056583 () Bool)

(assert (=> b!1146271 m!1056583))

(declare-fun m!1056585 () Bool)

(assert (=> b!1146271 m!1056585))

(declare-fun m!1056587 () Bool)

(assert (=> b!1146274 m!1056587))

(declare-fun m!1056589 () Bool)

(assert (=> bm!52485 m!1056589))

(declare-fun m!1056591 () Bool)

(assert (=> b!1146259 m!1056591))

(declare-fun m!1056593 () Bool)

(assert (=> b!1146266 m!1056593))

(declare-fun m!1056595 () Bool)

(assert (=> b!1146263 m!1056595))

(declare-fun m!1056597 () Bool)

(assert (=> b!1146263 m!1056597))

(declare-fun m!1056599 () Bool)

(assert (=> b!1146251 m!1056599))

(declare-fun m!1056601 () Bool)

(assert (=> b!1146251 m!1056601))

(declare-fun m!1056603 () Bool)

(assert (=> b!1146254 m!1056603))

(declare-fun m!1056605 () Bool)

(assert (=> b!1146254 m!1056605))

(declare-fun m!1056607 () Bool)

(assert (=> b!1146254 m!1056607))

(declare-fun m!1056609 () Bool)

(assert (=> b!1146254 m!1056609))

(declare-fun m!1056611 () Bool)

(assert (=> bm!52486 m!1056611))

(declare-fun m!1056613 () Bool)

(assert (=> b!1146278 m!1056613))

(assert (=> b!1146250 m!1056591))

(declare-fun m!1056615 () Bool)

(assert (=> mapNonEmpty!44990 m!1056615))

(declare-fun m!1056617 () Bool)

(assert (=> b!1146267 m!1056617))

(check-sat (not b!1146266) (not b!1146270) (not b!1146259) (not b!1146268) tp_is_empty!28777 (not start!98636) (not b!1146278) (not bm!52485) (not bm!52481) (not b!1146274) (not b!1146260) (not b!1146264) (not b!1146251) (not bm!52486) (not b!1146271) (not bm!52480) (not b!1146265) b_and!39323 (not bm!52483) (not b!1146263) (not b_next!24247) (not b!1146262) (not b!1146254) (not b_lambda!19335) (not b!1146250) (not mapNonEmpty!44990) (not b!1146273))
(check-sat b_and!39323 (not b_next!24247))
