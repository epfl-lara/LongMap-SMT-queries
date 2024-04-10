; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98596 () Bool)

(assert start!98596)

(declare-fun b_free!24201 () Bool)

(declare-fun b_next!24201 () Bool)

(assert (=> start!98596 (= b_free!24201 (not b_next!24201))))

(declare-fun tp!85313 () Bool)

(declare-fun b_and!39251 () Bool)

(assert (=> start!98596 (= tp!85313 b_and!39251)))

(declare-datatypes ((V!43435 0))(
  ( (V!43436 (val!14422 Int)) )
))
(declare-fun zeroValue!944 () V!43435)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74315 0))(
  ( (array!74316 (arr!35808 (Array (_ BitVec 32) (_ BitVec 64))) (size!36344 (_ BitVec 32))) )
))
(declare-fun lt!510533 () array!74315)

(declare-fun bm!51951 () Bool)

(declare-datatypes ((ValueCell!13656 0))(
  ( (ValueCellFull!13656 (v!17059 V!43435)) (EmptyCell!13656) )
))
(declare-datatypes ((array!74317 0))(
  ( (array!74318 (arr!35809 (Array (_ BitVec 32) ValueCell!13656)) (size!36345 (_ BitVec 32))) )
))
(declare-fun lt!510526 () array!74317)

(declare-datatypes ((tuple2!18264 0))(
  ( (tuple2!18265 (_1!9143 (_ BitVec 64)) (_2!9143 V!43435)) )
))
(declare-datatypes ((List!25016 0))(
  ( (Nil!25013) (Cons!25012 (h!26221 tuple2!18264) (t!36209 List!25016)) )
))
(declare-datatypes ((ListLongMap!16233 0))(
  ( (ListLongMap!16234 (toList!8132 List!25016)) )
))
(declare-fun call!51961 () ListLongMap!16233)

(declare-fun minValue!944 () V!43435)

(declare-fun getCurrentListMapNoExtraKeys!4610 (array!74315 array!74317 (_ BitVec 32) (_ BitVec 32) V!43435 V!43435 (_ BitVec 32) Int) ListLongMap!16233)

(assert (=> bm!51951 (= call!51961 (getCurrentListMapNoExtraKeys!4610 lt!510533 lt!510526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144258 () Bool)

(declare-datatypes ((Unit!37554 0))(
  ( (Unit!37555) )
))
(declare-fun e!650913 () Unit!37554)

(declare-fun Unit!37556 () Unit!37554)

(assert (=> b!1144258 (= e!650913 Unit!37556)))

(declare-fun b!1144259 () Bool)

(declare-fun e!650922 () Bool)

(declare-fun e!650925 () Bool)

(assert (=> b!1144259 (= e!650922 e!650925)))

(declare-fun res!762203 () Bool)

(assert (=> b!1144259 (=> (not res!762203) (not e!650925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74315 (_ BitVec 32)) Bool)

(assert (=> b!1144259 (= res!762203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510533 mask!1564))))

(declare-fun _keys!1208 () array!74315)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144259 (= lt!510533 (array!74316 (store (arr!35808 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36344 _keys!1208)))))

(declare-fun b!1144260 () Bool)

(declare-fun res!762191 () Bool)

(assert (=> b!1144260 (=> (not res!762191) (not e!650922))))

(assert (=> b!1144260 (= res!762191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144261 () Bool)

(declare-fun c!112667 () Bool)

(declare-fun lt!510536 () Bool)

(assert (=> b!1144261 (= c!112667 (and (not lt!510536) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650909 () Unit!37554)

(declare-fun e!650916 () Unit!37554)

(assert (=> b!1144261 (= e!650909 e!650916)))

(declare-fun b!1144262 () Bool)

(declare-fun e!650918 () Bool)

(declare-fun e!650917 () Bool)

(declare-fun mapRes!44921 () Bool)

(assert (=> b!1144262 (= e!650918 (and e!650917 mapRes!44921))))

(declare-fun condMapEmpty!44921 () Bool)

(declare-fun _values!996 () array!74317)

(declare-fun mapDefault!44921 () ValueCell!13656)

(assert (=> b!1144262 (= condMapEmpty!44921 (= (arr!35809 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13656)) mapDefault!44921)))))

(declare-fun b!1144263 () Bool)

(declare-fun lt!510527 () Unit!37554)

(assert (=> b!1144263 (= e!650916 lt!510527)))

(declare-fun call!51960 () Unit!37554)

(assert (=> b!1144263 (= lt!510527 call!51960)))

(declare-fun call!51958 () Bool)

(assert (=> b!1144263 call!51958))

(declare-fun b!1144264 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!650923 () Bool)

(declare-fun arrayContainsKey!0 (array!74315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144264 (= e!650923 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144265 () Bool)

(declare-fun res!762189 () Bool)

(assert (=> b!1144265 (=> (not res!762189) (not e!650922))))

(assert (=> b!1144265 (= res!762189 (= (select (arr!35808 _keys!1208) i!673) k0!934))))

(declare-fun call!51959 () ListLongMap!16233)

(declare-fun bm!51952 () Bool)

(assert (=> bm!51952 (= call!51959 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144266 () Bool)

(declare-fun e!650915 () Bool)

(assert (=> b!1144266 (= e!650915 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510536) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44921 () Bool)

(assert (=> mapIsEmpty!44921 mapRes!44921))

(declare-fun lt!510531 () ListLongMap!16233)

(declare-fun call!51957 () ListLongMap!16233)

(declare-fun lt!510540 () ListLongMap!16233)

(declare-fun bm!51953 () Bool)

(declare-fun c!112668 () Bool)

(declare-fun +!3559 (ListLongMap!16233 tuple2!18264) ListLongMap!16233)

(assert (=> bm!51953 (= call!51957 (+!3559 (ite c!112668 lt!510531 lt!510540) (ite c!112668 (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112667 (tuple2!18265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1144267 () Bool)

(assert (=> b!1144267 call!51958))

(declare-fun lt!510530 () Unit!37554)

(assert (=> b!1144267 (= lt!510530 call!51960)))

(declare-fun e!650920 () Unit!37554)

(assert (=> b!1144267 (= e!650920 lt!510530)))

(declare-fun b!1144268 () Bool)

(declare-fun Unit!37557 () Unit!37554)

(assert (=> b!1144268 (= e!650913 Unit!37557)))

(assert (=> b!1144268 (= lt!510536 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144268 (= c!112668 (and (not lt!510536) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510538 () Unit!37554)

(assert (=> b!1144268 (= lt!510538 e!650909)))

(declare-fun lt!510524 () Unit!37554)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!406 (array!74315 array!74317 (_ BitVec 32) (_ BitVec 32) V!43435 V!43435 (_ BitVec 64) (_ BitVec 32) Int) Unit!37554)

(assert (=> b!1144268 (= lt!510524 (lemmaListMapContainsThenArrayContainsFrom!406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112670 () Bool)

(assert (=> b!1144268 (= c!112670 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762202 () Bool)

(assert (=> b!1144268 (= res!762202 e!650915)))

(assert (=> b!1144268 (=> (not res!762202) (not e!650923))))

(assert (=> b!1144268 e!650923))

(declare-fun lt!510523 () Unit!37554)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74315 (_ BitVec 32) (_ BitVec 32)) Unit!37554)

(assert (=> b!1144268 (= lt!510523 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25017 0))(
  ( (Nil!25014) (Cons!25013 (h!26222 (_ BitVec 64)) (t!36210 List!25017)) )
))
(declare-fun arrayNoDuplicates!0 (array!74315 (_ BitVec 32) List!25017) Bool)

(assert (=> b!1144268 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25014)))

(declare-fun lt!510528 () Unit!37554)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74315 (_ BitVec 64) (_ BitVec 32) List!25017) Unit!37554)

(assert (=> b!1144268 (= lt!510528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25014))))

(assert (=> b!1144268 false))

(declare-fun bm!51954 () Bool)

(declare-fun call!51956 () Bool)

(assert (=> bm!51954 (= call!51958 call!51956)))

(declare-fun b!1144269 () Bool)

(declare-fun res!762190 () Bool)

(assert (=> b!1144269 (=> (not res!762190) (not e!650922))))

(assert (=> b!1144269 (= res!762190 (and (= (size!36345 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36344 _keys!1208) (size!36345 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!762194 () Bool)

(assert (=> start!98596 (=> (not res!762194) (not e!650922))))

(assert (=> start!98596 (= res!762194 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36344 _keys!1208))))))

(assert (=> start!98596 e!650922))

(declare-fun tp_is_empty!28731 () Bool)

(assert (=> start!98596 tp_is_empty!28731))

(declare-fun array_inv!27436 (array!74315) Bool)

(assert (=> start!98596 (array_inv!27436 _keys!1208)))

(assert (=> start!98596 true))

(assert (=> start!98596 tp!85313))

(declare-fun array_inv!27437 (array!74317) Bool)

(assert (=> start!98596 (and (array_inv!27437 _values!996) e!650918)))

(declare-fun call!51954 () Unit!37554)

(declare-fun bm!51955 () Bool)

(declare-fun addStillContains!814 (ListLongMap!16233 (_ BitVec 64) V!43435 (_ BitVec 64)) Unit!37554)

(assert (=> bm!51955 (= call!51954 (addStillContains!814 (ite c!112668 lt!510531 lt!510540) (ite c!112668 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112667 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112668 minValue!944 (ite c!112667 zeroValue!944 minValue!944)) k0!934))))

(declare-fun e!650914 () Bool)

(declare-fun lt!510537 () ListLongMap!16233)

(declare-fun b!1144270 () Bool)

(declare-fun -!1275 (ListLongMap!16233 (_ BitVec 64)) ListLongMap!16233)

(assert (=> b!1144270 (= e!650914 (= (-!1275 lt!510537 k0!934) lt!510540))))

(declare-fun b!1144271 () Bool)

(declare-fun res!762201 () Bool)

(assert (=> b!1144271 (=> (not res!762201) (not e!650922))))

(assert (=> b!1144271 (= res!762201 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25014))))

(declare-fun b!1144272 () Bool)

(declare-fun e!650912 () Bool)

(assert (=> b!1144272 (= e!650912 tp_is_empty!28731)))

(declare-fun b!1144273 () Bool)

(assert (=> b!1144273 (= e!650915 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44921 () Bool)

(declare-fun tp!85314 () Bool)

(assert (=> mapNonEmpty!44921 (= mapRes!44921 (and tp!85314 e!650912))))

(declare-fun mapKey!44921 () (_ BitVec 32))

(declare-fun mapValue!44921 () ValueCell!13656)

(declare-fun mapRest!44921 () (Array (_ BitVec 32) ValueCell!13656))

(assert (=> mapNonEmpty!44921 (= (arr!35809 _values!996) (store mapRest!44921 mapKey!44921 mapValue!44921))))

(declare-fun b!1144274 () Bool)

(declare-fun e!650910 () Bool)

(assert (=> b!1144274 (= e!650910 true)))

(assert (=> b!1144274 e!650914))

(declare-fun res!762197 () Bool)

(assert (=> b!1144274 (=> (not res!762197) (not e!650914))))

(declare-fun lt!510535 () V!43435)

(assert (=> b!1144274 (= res!762197 (= (-!1275 (+!3559 lt!510540 (tuple2!18265 (select (arr!35808 _keys!1208) from!1455) lt!510535)) (select (arr!35808 _keys!1208) from!1455)) lt!510540))))

(declare-fun lt!510529 () Unit!37554)

(declare-fun addThenRemoveForNewKeyIsSame!126 (ListLongMap!16233 (_ BitVec 64) V!43435) Unit!37554)

(assert (=> b!1144274 (= lt!510529 (addThenRemoveForNewKeyIsSame!126 lt!510540 (select (arr!35808 _keys!1208) from!1455) lt!510535))))

(declare-fun lt!510534 () V!43435)

(declare-fun get!18206 (ValueCell!13656 V!43435) V!43435)

(assert (=> b!1144274 (= lt!510535 (get!18206 (select (arr!35809 _values!996) from!1455) lt!510534))))

(declare-fun lt!510532 () Unit!37554)

(assert (=> b!1144274 (= lt!510532 e!650913)))

(declare-fun c!112672 () Bool)

(declare-fun contains!6661 (ListLongMap!16233 (_ BitVec 64)) Bool)

(assert (=> b!1144274 (= c!112672 (contains!6661 lt!510540 k0!934))))

(assert (=> b!1144274 (= lt!510540 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144275 () Bool)

(declare-fun e!650919 () Bool)

(declare-fun e!650924 () Bool)

(assert (=> b!1144275 (= e!650919 e!650924)))

(declare-fun res!762199 () Bool)

(assert (=> b!1144275 (=> res!762199 e!650924)))

(assert (=> b!1144275 (= res!762199 (not (= from!1455 i!673)))))

(declare-fun lt!510542 () ListLongMap!16233)

(assert (=> b!1144275 (= lt!510542 (getCurrentListMapNoExtraKeys!4610 lt!510533 lt!510526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144275 (= lt!510526 (array!74318 (store (arr!35809 _values!996) i!673 (ValueCellFull!13656 lt!510534)) (size!36345 _values!996)))))

(declare-fun dynLambda!2647 (Int (_ BitVec 64)) V!43435)

(assert (=> b!1144275 (= lt!510534 (dynLambda!2647 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1144275 (= lt!510537 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144276 () Bool)

(declare-fun res!762198 () Bool)

(assert (=> b!1144276 (=> (not res!762198) (not e!650922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144276 (= res!762198 (validMask!0 mask!1564))))

(declare-fun bm!51956 () Bool)

(assert (=> bm!51956 (= call!51960 call!51954)))

(declare-fun b!1144277 () Bool)

(declare-fun Unit!37558 () Unit!37554)

(assert (=> b!1144277 (= e!650920 Unit!37558)))

(declare-fun b!1144278 () Bool)

(assert (=> b!1144278 (= e!650924 e!650910)))

(declare-fun res!762200 () Bool)

(assert (=> b!1144278 (=> res!762200 e!650910)))

(assert (=> b!1144278 (= res!762200 (not (= (select (arr!35808 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650911 () Bool)

(assert (=> b!1144278 e!650911))

(declare-fun c!112671 () Bool)

(assert (=> b!1144278 (= c!112671 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510525 () Unit!37554)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!516 (array!74315 array!74317 (_ BitVec 32) (_ BitVec 32) V!43435 V!43435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37554)

(assert (=> b!1144278 (= lt!510525 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144279 () Bool)

(assert (=> b!1144279 (= e!650917 tp_is_empty!28731)))

(declare-fun b!1144280 () Bool)

(declare-fun res!762196 () Bool)

(assert (=> b!1144280 (=> (not res!762196) (not e!650925))))

(assert (=> b!1144280 (= res!762196 (arrayNoDuplicates!0 lt!510533 #b00000000000000000000000000000000 Nil!25014))))

(declare-fun bm!51957 () Bool)

(declare-fun call!51955 () ListLongMap!16233)

(assert (=> bm!51957 (= call!51956 (contains!6661 (ite c!112668 lt!510531 call!51955) k0!934))))

(declare-fun b!1144281 () Bool)

(assert (=> b!1144281 (contains!6661 call!51957 k0!934)))

(declare-fun lt!510539 () Unit!37554)

(assert (=> b!1144281 (= lt!510539 call!51954)))

(assert (=> b!1144281 call!51956))

(assert (=> b!1144281 (= lt!510531 (+!3559 lt!510540 (tuple2!18265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510543 () Unit!37554)

(assert (=> b!1144281 (= lt!510543 (addStillContains!814 lt!510540 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1144281 (= e!650909 lt!510539)))

(declare-fun b!1144282 () Bool)

(declare-fun res!762193 () Bool)

(assert (=> b!1144282 (=> (not res!762193) (not e!650922))))

(assert (=> b!1144282 (= res!762193 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36344 _keys!1208))))))

(declare-fun b!1144283 () Bool)

(assert (=> b!1144283 (= e!650911 (= call!51961 call!51959))))

(declare-fun b!1144284 () Bool)

(assert (=> b!1144284 (= e!650925 (not e!650919))))

(declare-fun res!762192 () Bool)

(assert (=> b!1144284 (=> res!762192 e!650919)))

(assert (=> b!1144284 (= res!762192 (bvsgt from!1455 i!673))))

(assert (=> b!1144284 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510541 () Unit!37554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74315 (_ BitVec 64) (_ BitVec 32)) Unit!37554)

(assert (=> b!1144284 (= lt!510541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144285 () Bool)

(assert (=> b!1144285 (= e!650911 (= call!51961 (-!1275 call!51959 k0!934)))))

(declare-fun b!1144286 () Bool)

(assert (=> b!1144286 (= e!650916 e!650920)))

(declare-fun c!112669 () Bool)

(assert (=> b!1144286 (= c!112669 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510536))))

(declare-fun bm!51958 () Bool)

(assert (=> bm!51958 (= call!51955 call!51957)))

(declare-fun b!1144287 () Bool)

(declare-fun res!762195 () Bool)

(assert (=> b!1144287 (=> (not res!762195) (not e!650922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144287 (= res!762195 (validKeyInArray!0 k0!934))))

(assert (= (and start!98596 res!762194) b!1144276))

(assert (= (and b!1144276 res!762198) b!1144269))

(assert (= (and b!1144269 res!762190) b!1144260))

(assert (= (and b!1144260 res!762191) b!1144271))

(assert (= (and b!1144271 res!762201) b!1144282))

(assert (= (and b!1144282 res!762193) b!1144287))

(assert (= (and b!1144287 res!762195) b!1144265))

(assert (= (and b!1144265 res!762189) b!1144259))

(assert (= (and b!1144259 res!762203) b!1144280))

(assert (= (and b!1144280 res!762196) b!1144284))

(assert (= (and b!1144284 (not res!762192)) b!1144275))

(assert (= (and b!1144275 (not res!762199)) b!1144278))

(assert (= (and b!1144278 c!112671) b!1144285))

(assert (= (and b!1144278 (not c!112671)) b!1144283))

(assert (= (or b!1144285 b!1144283) bm!51951))

(assert (= (or b!1144285 b!1144283) bm!51952))

(assert (= (and b!1144278 (not res!762200)) b!1144274))

(assert (= (and b!1144274 c!112672) b!1144268))

(assert (= (and b!1144274 (not c!112672)) b!1144258))

(assert (= (and b!1144268 c!112668) b!1144281))

(assert (= (and b!1144268 (not c!112668)) b!1144261))

(assert (= (and b!1144261 c!112667) b!1144263))

(assert (= (and b!1144261 (not c!112667)) b!1144286))

(assert (= (and b!1144286 c!112669) b!1144267))

(assert (= (and b!1144286 (not c!112669)) b!1144277))

(assert (= (or b!1144263 b!1144267) bm!51956))

(assert (= (or b!1144263 b!1144267) bm!51958))

(assert (= (or b!1144263 b!1144267) bm!51954))

(assert (= (or b!1144281 bm!51954) bm!51957))

(assert (= (or b!1144281 bm!51956) bm!51955))

(assert (= (or b!1144281 bm!51958) bm!51953))

(assert (= (and b!1144268 c!112670) b!1144273))

(assert (= (and b!1144268 (not c!112670)) b!1144266))

(assert (= (and b!1144268 res!762202) b!1144264))

(assert (= (and b!1144274 res!762197) b!1144270))

(assert (= (and b!1144262 condMapEmpty!44921) mapIsEmpty!44921))

(assert (= (and b!1144262 (not condMapEmpty!44921)) mapNonEmpty!44921))

(get-info :version)

(assert (= (and mapNonEmpty!44921 ((_ is ValueCellFull!13656) mapValue!44921)) b!1144272))

(assert (= (and b!1144262 ((_ is ValueCellFull!13656) mapDefault!44921)) b!1144279))

(assert (= start!98596 b!1144262))

(declare-fun b_lambda!19307 () Bool)

(assert (=> (not b_lambda!19307) (not b!1144275)))

(declare-fun t!36208 () Bool)

(declare-fun tb!9013 () Bool)

(assert (=> (and start!98596 (= defaultEntry!1004 defaultEntry!1004) t!36208) tb!9013))

(declare-fun result!18591 () Bool)

(assert (=> tb!9013 (= result!18591 tp_is_empty!28731)))

(assert (=> b!1144275 t!36208))

(declare-fun b_and!39253 () Bool)

(assert (= b_and!39251 (and (=> t!36208 result!18591) b_and!39253)))

(declare-fun m!1055299 () Bool)

(assert (=> b!1144259 m!1055299))

(declare-fun m!1055301 () Bool)

(assert (=> b!1144259 m!1055301))

(declare-fun m!1055303 () Bool)

(assert (=> b!1144280 m!1055303))

(declare-fun m!1055305 () Bool)

(assert (=> b!1144287 m!1055305))

(declare-fun m!1055307 () Bool)

(assert (=> bm!51955 m!1055307))

(declare-fun m!1055309 () Bool)

(assert (=> b!1144270 m!1055309))

(declare-fun m!1055311 () Bool)

(assert (=> b!1144275 m!1055311))

(declare-fun m!1055313 () Bool)

(assert (=> b!1144275 m!1055313))

(declare-fun m!1055315 () Bool)

(assert (=> b!1144275 m!1055315))

(declare-fun m!1055317 () Bool)

(assert (=> b!1144275 m!1055317))

(declare-fun m!1055319 () Bool)

(assert (=> bm!51952 m!1055319))

(declare-fun m!1055321 () Bool)

(assert (=> bm!51957 m!1055321))

(declare-fun m!1055323 () Bool)

(assert (=> b!1144273 m!1055323))

(declare-fun m!1055325 () Bool)

(assert (=> b!1144284 m!1055325))

(declare-fun m!1055327 () Bool)

(assert (=> b!1144284 m!1055327))

(declare-fun m!1055329 () Bool)

(assert (=> b!1144268 m!1055329))

(declare-fun m!1055331 () Bool)

(assert (=> b!1144268 m!1055331))

(declare-fun m!1055333 () Bool)

(assert (=> b!1144268 m!1055333))

(declare-fun m!1055335 () Bool)

(assert (=> b!1144268 m!1055335))

(declare-fun m!1055337 () Bool)

(assert (=> start!98596 m!1055337))

(declare-fun m!1055339 () Bool)

(assert (=> start!98596 m!1055339))

(declare-fun m!1055341 () Bool)

(assert (=> b!1144271 m!1055341))

(declare-fun m!1055343 () Bool)

(assert (=> mapNonEmpty!44921 m!1055343))

(assert (=> b!1144274 m!1055319))

(declare-fun m!1055345 () Bool)

(assert (=> b!1144274 m!1055345))

(declare-fun m!1055347 () Bool)

(assert (=> b!1144274 m!1055347))

(declare-fun m!1055349 () Bool)

(assert (=> b!1144274 m!1055349))

(declare-fun m!1055351 () Bool)

(assert (=> b!1144274 m!1055351))

(declare-fun m!1055353 () Bool)

(assert (=> b!1144274 m!1055353))

(assert (=> b!1144274 m!1055345))

(declare-fun m!1055355 () Bool)

(assert (=> b!1144274 m!1055355))

(assert (=> b!1144274 m!1055351))

(assert (=> b!1144274 m!1055347))

(declare-fun m!1055357 () Bool)

(assert (=> b!1144274 m!1055357))

(assert (=> b!1144274 m!1055347))

(declare-fun m!1055359 () Bool)

(assert (=> b!1144260 m!1055359))

(assert (=> b!1144278 m!1055347))

(declare-fun m!1055361 () Bool)

(assert (=> b!1144278 m!1055361))

(declare-fun m!1055363 () Bool)

(assert (=> b!1144276 m!1055363))

(declare-fun m!1055365 () Bool)

(assert (=> b!1144281 m!1055365))

(declare-fun m!1055367 () Bool)

(assert (=> b!1144281 m!1055367))

(declare-fun m!1055369 () Bool)

(assert (=> b!1144281 m!1055369))

(declare-fun m!1055371 () Bool)

(assert (=> b!1144265 m!1055371))

(declare-fun m!1055373 () Bool)

(assert (=> bm!51953 m!1055373))

(assert (=> b!1144264 m!1055323))

(declare-fun m!1055375 () Bool)

(assert (=> b!1144285 m!1055375))

(declare-fun m!1055377 () Bool)

(assert (=> bm!51951 m!1055377))

(check-sat (not b!1144275) (not b!1144259) (not b!1144280) (not b!1144284) (not b_next!24201) (not bm!51953) (not b!1144273) (not start!98596) (not b!1144271) (not b!1144274) (not b!1144276) (not b!1144281) (not bm!51955) (not bm!51951) (not b!1144264) (not bm!51957) b_and!39253 (not b!1144285) (not b!1144270) (not mapNonEmpty!44921) (not b!1144268) tp_is_empty!28731 (not bm!51952) (not b!1144278) (not b_lambda!19307) (not b!1144287) (not b!1144260))
(check-sat b_and!39253 (not b_next!24201))
