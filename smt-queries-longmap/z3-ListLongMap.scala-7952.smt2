; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98554 () Bool)

(assert start!98554)

(declare-fun b_free!24159 () Bool)

(declare-fun b_next!24159 () Bool)

(assert (=> start!98554 (= b_free!24159 (not b_next!24159))))

(declare-fun tp!85188 () Bool)

(declare-fun b_and!39167 () Bool)

(assert (=> start!98554 (= tp!85188 b_and!39167)))

(declare-fun bm!51447 () Bool)

(declare-datatypes ((Unit!37472 0))(
  ( (Unit!37473) )
))
(declare-fun call!51455 () Unit!37472)

(declare-fun call!51451 () Unit!37472)

(assert (=> bm!51447 (= call!51455 call!51451)))

(declare-fun b!1142384 () Bool)

(declare-fun e!649897 () Bool)

(assert (=> b!1142384 (= e!649897 true)))

(declare-datatypes ((array!74231 0))(
  ( (array!74232 (arr!35766 (Array (_ BitVec 32) (_ BitVec 64))) (size!36302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74231)

(declare-datatypes ((V!43379 0))(
  ( (V!43380 (val!14401 Int)) )
))
(declare-datatypes ((tuple2!18222 0))(
  ( (tuple2!18223 (_1!9122 (_ BitVec 64)) (_2!9122 V!43379)) )
))
(declare-datatypes ((List!24976 0))(
  ( (Nil!24973) (Cons!24972 (h!26181 tuple2!18222) (t!36127 List!24976)) )
))
(declare-datatypes ((ListLongMap!16191 0))(
  ( (ListLongMap!16192 (toList!8111 List!24976)) )
))
(declare-fun lt!509210 () ListLongMap!16191)

(declare-fun lt!509213 () V!43379)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun -!1259 (ListLongMap!16191 (_ BitVec 64)) ListLongMap!16191)

(declare-fun +!3541 (ListLongMap!16191 tuple2!18222) ListLongMap!16191)

(assert (=> b!1142384 (= (-!1259 (+!3541 lt!509210 (tuple2!18223 (select (arr!35766 _keys!1208) from!1455) lt!509213)) (select (arr!35766 _keys!1208) from!1455)) lt!509210)))

(declare-fun lt!509202 () Unit!37472)

(declare-fun addThenRemoveForNewKeyIsSame!112 (ListLongMap!16191 (_ BitVec 64) V!43379) Unit!37472)

(assert (=> b!1142384 (= lt!509202 (addThenRemoveForNewKeyIsSame!112 lt!509210 (select (arr!35766 _keys!1208) from!1455) lt!509213))))

(declare-fun lt!509207 () V!43379)

(declare-datatypes ((ValueCell!13635 0))(
  ( (ValueCellFull!13635 (v!17038 V!43379)) (EmptyCell!13635) )
))
(declare-datatypes ((array!74233 0))(
  ( (array!74234 (arr!35767 (Array (_ BitVec 32) ValueCell!13635)) (size!36303 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74233)

(declare-fun get!18178 (ValueCell!13635 V!43379) V!43379)

(assert (=> b!1142384 (= lt!509213 (get!18178 (select (arr!35767 _values!996) from!1455) lt!509207))))

(declare-fun lt!509201 () Unit!37472)

(declare-fun e!649911 () Unit!37472)

(assert (=> b!1142384 (= lt!509201 e!649911)))

(declare-fun c!112292 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6644 (ListLongMap!16191 (_ BitVec 64)) Bool)

(assert (=> b!1142384 (= c!112292 (contains!6644 lt!509210 k0!934))))

(declare-fun zeroValue!944 () V!43379)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43379)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4591 (array!74231 array!74233 (_ BitVec 32) (_ BitVec 32) V!43379 V!43379 (_ BitVec 32) Int) ListLongMap!16191)

(assert (=> b!1142384 (= lt!509210 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142385 () Bool)

(declare-fun c!112290 () Bool)

(declare-fun lt!509208 () Bool)

(assert (=> b!1142385 (= c!112290 (and (not lt!509208) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649903 () Unit!37472)

(declare-fun e!649896 () Unit!37472)

(assert (=> b!1142385 (= e!649903 e!649896)))

(declare-fun lt!509200 () ListLongMap!16191)

(declare-fun c!112291 () Bool)

(declare-fun call!51452 () ListLongMap!16191)

(declare-fun bm!51448 () Bool)

(assert (=> bm!51448 (= call!51452 (+!3541 (ite c!112291 lt!509200 lt!509210) (ite c!112291 (tuple2!18223 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112290 (tuple2!18223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18223 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1142386 () Bool)

(declare-fun res!761304 () Bool)

(declare-fun e!649898 () Bool)

(assert (=> b!1142386 (=> (not res!761304) (not e!649898))))

(assert (=> b!1142386 (= res!761304 (and (= (size!36303 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36302 _keys!1208) (size!36303 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142387 () Bool)

(declare-fun e!649904 () Bool)

(declare-fun e!649907 () Bool)

(assert (=> b!1142387 (= e!649904 (not e!649907))))

(declare-fun res!761302 () Bool)

(assert (=> b!1142387 (=> res!761302 e!649907)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142387 (= res!761302 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509203 () Unit!37472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74231 (_ BitVec 64) (_ BitVec 32)) Unit!37472)

(assert (=> b!1142387 (= lt!509203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142388 () Bool)

(declare-fun e!649899 () Bool)

(declare-fun tp_is_empty!28689 () Bool)

(assert (=> b!1142388 (= e!649899 tp_is_empty!28689)))

(declare-fun e!649902 () Bool)

(declare-fun b!1142389 () Bool)

(assert (=> b!1142389 (= e!649902 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509208) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142390 () Bool)

(declare-fun Unit!37474 () Unit!37472)

(assert (=> b!1142390 (= e!649911 Unit!37474)))

(declare-fun b!1142391 () Bool)

(declare-fun res!761310 () Bool)

(assert (=> b!1142391 (=> (not res!761310) (not e!649898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142391 (= res!761310 (validMask!0 mask!1564))))

(declare-fun b!1142392 () Bool)

(declare-fun e!649908 () Bool)

(assert (=> b!1142392 (= e!649907 e!649908)))

(declare-fun res!761308 () Bool)

(assert (=> b!1142392 (=> res!761308 e!649908)))

(assert (=> b!1142392 (= res!761308 (not (= from!1455 i!673)))))

(declare-fun lt!509211 () array!74231)

(declare-fun lt!509219 () ListLongMap!16191)

(declare-fun lt!509220 () array!74233)

(assert (=> b!1142392 (= lt!509219 (getCurrentListMapNoExtraKeys!4591 lt!509211 lt!509220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142392 (= lt!509220 (array!74234 (store (arr!35767 _values!996) i!673 (ValueCellFull!13635 lt!509207)) (size!36303 _values!996)))))

(declare-fun dynLambda!2633 (Int (_ BitVec 64)) V!43379)

(assert (=> b!1142392 (= lt!509207 (dynLambda!2633 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509215 () ListLongMap!16191)

(assert (=> b!1142392 (= lt!509215 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142393 () Bool)

(declare-fun call!51457 () Bool)

(assert (=> b!1142393 call!51457))

(declare-fun lt!509204 () Unit!37472)

(assert (=> b!1142393 (= lt!509204 call!51455)))

(declare-fun e!649900 () Unit!37472)

(assert (=> b!1142393 (= e!649900 lt!509204)))

(declare-fun bm!51449 () Bool)

(declare-fun call!51454 () Bool)

(assert (=> bm!51449 (= call!51457 call!51454)))

(declare-fun b!1142394 () Bool)

(declare-fun e!649901 () Bool)

(assert (=> b!1142394 (= e!649901 tp_is_empty!28689)))

(declare-fun call!51456 () ListLongMap!16191)

(declare-fun bm!51450 () Bool)

(assert (=> bm!51450 (= call!51456 (getCurrentListMapNoExtraKeys!4591 lt!509211 lt!509220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142395 () Bool)

(declare-fun res!761307 () Bool)

(assert (=> b!1142395 (=> (not res!761307) (not e!649898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74231 (_ BitVec 32)) Bool)

(assert (=> b!1142395 (= res!761307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142396 () Bool)

(declare-fun res!761314 () Bool)

(assert (=> b!1142396 (=> (not res!761314) (not e!649898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142396 (= res!761314 (validKeyInArray!0 k0!934))))

(declare-fun b!1142397 () Bool)

(declare-fun e!649906 () Bool)

(assert (=> b!1142397 (= e!649906 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142398 () Bool)

(declare-fun e!649905 () Bool)

(declare-fun mapRes!44858 () Bool)

(assert (=> b!1142398 (= e!649905 (and e!649901 mapRes!44858))))

(declare-fun condMapEmpty!44858 () Bool)

(declare-fun mapDefault!44858 () ValueCell!13635)

(assert (=> b!1142398 (= condMapEmpty!44858 (= (arr!35767 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13635)) mapDefault!44858)))))

(declare-fun call!51450 () ListLongMap!16191)

(declare-fun bm!51451 () Bool)

(assert (=> bm!51451 (= call!51454 (contains!6644 (ite c!112291 lt!509200 call!51450) k0!934))))

(declare-fun b!1142399 () Bool)

(declare-fun e!649910 () Bool)

(declare-fun call!51453 () ListLongMap!16191)

(assert (=> b!1142399 (= e!649910 (= call!51456 call!51453))))

(declare-fun b!1142400 () Bool)

(assert (=> b!1142400 (= e!649908 e!649897)))

(declare-fun res!761303 () Bool)

(assert (=> b!1142400 (=> res!761303 e!649897)))

(assert (=> b!1142400 (= res!761303 (not (= (select (arr!35766 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142400 e!649910))

(declare-fun c!112289 () Bool)

(assert (=> b!1142400 (= c!112289 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509218 () Unit!37472)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 (array!74231 array!74233 (_ BitVec 32) (_ BitVec 32) V!43379 V!43379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37472)

(assert (=> b!1142400 (= lt!509218 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142401 () Bool)

(assert (=> b!1142401 (contains!6644 call!51452 k0!934)))

(declare-fun lt!509206 () Unit!37472)

(assert (=> b!1142401 (= lt!509206 call!51451)))

(assert (=> b!1142401 call!51454))

(assert (=> b!1142401 (= lt!509200 (+!3541 lt!509210 (tuple2!18223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509209 () Unit!37472)

(declare-fun addStillContains!797 (ListLongMap!16191 (_ BitVec 64) V!43379 (_ BitVec 64)) Unit!37472)

(assert (=> b!1142401 (= lt!509209 (addStillContains!797 lt!509210 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1142401 (= e!649903 lt!509206)))

(declare-fun res!761315 () Bool)

(assert (=> start!98554 (=> (not res!761315) (not e!649898))))

(assert (=> start!98554 (= res!761315 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36302 _keys!1208))))))

(assert (=> start!98554 e!649898))

(assert (=> start!98554 tp_is_empty!28689))

(declare-fun array_inv!27410 (array!74231) Bool)

(assert (=> start!98554 (array_inv!27410 _keys!1208)))

(assert (=> start!98554 true))

(assert (=> start!98554 tp!85188))

(declare-fun array_inv!27411 (array!74233) Bool)

(assert (=> start!98554 (and (array_inv!27411 _values!996) e!649905)))

(declare-fun b!1142402 () Bool)

(declare-fun res!761311 () Bool)

(assert (=> b!1142402 (=> (not res!761311) (not e!649898))))

(declare-datatypes ((List!24977 0))(
  ( (Nil!24974) (Cons!24973 (h!26182 (_ BitVec 64)) (t!36128 List!24977)) )
))
(declare-fun arrayNoDuplicates!0 (array!74231 (_ BitVec 32) List!24977) Bool)

(assert (=> b!1142402 (= res!761311 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24974))))

(declare-fun mapIsEmpty!44858 () Bool)

(assert (=> mapIsEmpty!44858 mapRes!44858))

(declare-fun b!1142403 () Bool)

(assert (=> b!1142403 (= e!649910 (= call!51456 (-!1259 call!51453 k0!934)))))

(declare-fun bm!51452 () Bool)

(assert (=> bm!51452 (= call!51453 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142404 () Bool)

(assert (=> b!1142404 (= e!649896 e!649900)))

(declare-fun c!112293 () Bool)

(assert (=> b!1142404 (= c!112293 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509208))))

(declare-fun bm!51453 () Bool)

(assert (=> bm!51453 (= call!51451 (addStillContains!797 (ite c!112291 lt!509200 lt!509210) (ite c!112291 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112290 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112291 minValue!944 (ite c!112290 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1142405 () Bool)

(assert (=> b!1142405 (= e!649898 e!649904)))

(declare-fun res!761312 () Bool)

(assert (=> b!1142405 (=> (not res!761312) (not e!649904))))

(assert (=> b!1142405 (= res!761312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509211 mask!1564))))

(assert (=> b!1142405 (= lt!509211 (array!74232 (store (arr!35766 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36302 _keys!1208)))))

(declare-fun b!1142406 () Bool)

(assert (=> b!1142406 (= e!649902 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51454 () Bool)

(assert (=> bm!51454 (= call!51450 call!51452)))

(declare-fun b!1142407 () Bool)

(declare-fun Unit!37475 () Unit!37472)

(assert (=> b!1142407 (= e!649900 Unit!37475)))

(declare-fun b!1142408 () Bool)

(declare-fun res!761309 () Bool)

(assert (=> b!1142408 (=> (not res!761309) (not e!649898))))

(assert (=> b!1142408 (= res!761309 (= (select (arr!35766 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44858 () Bool)

(declare-fun tp!85187 () Bool)

(assert (=> mapNonEmpty!44858 (= mapRes!44858 (and tp!85187 e!649899))))

(declare-fun mapKey!44858 () (_ BitVec 32))

(declare-fun mapValue!44858 () ValueCell!13635)

(declare-fun mapRest!44858 () (Array (_ BitVec 32) ValueCell!13635))

(assert (=> mapNonEmpty!44858 (= (arr!35767 _values!996) (store mapRest!44858 mapKey!44858 mapValue!44858))))

(declare-fun b!1142409 () Bool)

(declare-fun lt!509216 () Unit!37472)

(assert (=> b!1142409 (= e!649896 lt!509216)))

(assert (=> b!1142409 (= lt!509216 call!51455)))

(assert (=> b!1142409 call!51457))

(declare-fun b!1142410 () Bool)

(declare-fun Unit!37476 () Unit!37472)

(assert (=> b!1142410 (= e!649911 Unit!37476)))

(assert (=> b!1142410 (= lt!509208 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142410 (= c!112291 (and (not lt!509208) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509214 () Unit!37472)

(assert (=> b!1142410 (= lt!509214 e!649903)))

(declare-fun lt!509205 () Unit!37472)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!393 (array!74231 array!74233 (_ BitVec 32) (_ BitVec 32) V!43379 V!43379 (_ BitVec 64) (_ BitVec 32) Int) Unit!37472)

(assert (=> b!1142410 (= lt!509205 (lemmaListMapContainsThenArrayContainsFrom!393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112294 () Bool)

(assert (=> b!1142410 (= c!112294 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761306 () Bool)

(assert (=> b!1142410 (= res!761306 e!649902)))

(assert (=> b!1142410 (=> (not res!761306) (not e!649906))))

(assert (=> b!1142410 e!649906))

(declare-fun lt!509217 () Unit!37472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74231 (_ BitVec 32) (_ BitVec 32)) Unit!37472)

(assert (=> b!1142410 (= lt!509217 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142410 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24974)))

(declare-fun lt!509212 () Unit!37472)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74231 (_ BitVec 64) (_ BitVec 32) List!24977) Unit!37472)

(assert (=> b!1142410 (= lt!509212 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24974))))

(assert (=> b!1142410 false))

(declare-fun b!1142411 () Bool)

(declare-fun res!761305 () Bool)

(assert (=> b!1142411 (=> (not res!761305) (not e!649904))))

(assert (=> b!1142411 (= res!761305 (arrayNoDuplicates!0 lt!509211 #b00000000000000000000000000000000 Nil!24974))))

(declare-fun b!1142412 () Bool)

(declare-fun res!761313 () Bool)

(assert (=> b!1142412 (=> (not res!761313) (not e!649898))))

(assert (=> b!1142412 (= res!761313 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36302 _keys!1208))))))

(assert (= (and start!98554 res!761315) b!1142391))

(assert (= (and b!1142391 res!761310) b!1142386))

(assert (= (and b!1142386 res!761304) b!1142395))

(assert (= (and b!1142395 res!761307) b!1142402))

(assert (= (and b!1142402 res!761311) b!1142412))

(assert (= (and b!1142412 res!761313) b!1142396))

(assert (= (and b!1142396 res!761314) b!1142408))

(assert (= (and b!1142408 res!761309) b!1142405))

(assert (= (and b!1142405 res!761312) b!1142411))

(assert (= (and b!1142411 res!761305) b!1142387))

(assert (= (and b!1142387 (not res!761302)) b!1142392))

(assert (= (and b!1142392 (not res!761308)) b!1142400))

(assert (= (and b!1142400 c!112289) b!1142403))

(assert (= (and b!1142400 (not c!112289)) b!1142399))

(assert (= (or b!1142403 b!1142399) bm!51452))

(assert (= (or b!1142403 b!1142399) bm!51450))

(assert (= (and b!1142400 (not res!761303)) b!1142384))

(assert (= (and b!1142384 c!112292) b!1142410))

(assert (= (and b!1142384 (not c!112292)) b!1142390))

(assert (= (and b!1142410 c!112291) b!1142401))

(assert (= (and b!1142410 (not c!112291)) b!1142385))

(assert (= (and b!1142385 c!112290) b!1142409))

(assert (= (and b!1142385 (not c!112290)) b!1142404))

(assert (= (and b!1142404 c!112293) b!1142393))

(assert (= (and b!1142404 (not c!112293)) b!1142407))

(assert (= (or b!1142409 b!1142393) bm!51447))

(assert (= (or b!1142409 b!1142393) bm!51454))

(assert (= (or b!1142409 b!1142393) bm!51449))

(assert (= (or b!1142401 bm!51449) bm!51451))

(assert (= (or b!1142401 bm!51447) bm!51453))

(assert (= (or b!1142401 bm!51454) bm!51448))

(assert (= (and b!1142410 c!112294) b!1142406))

(assert (= (and b!1142410 (not c!112294)) b!1142389))

(assert (= (and b!1142410 res!761306) b!1142397))

(assert (= (and b!1142398 condMapEmpty!44858) mapIsEmpty!44858))

(assert (= (and b!1142398 (not condMapEmpty!44858)) mapNonEmpty!44858))

(get-info :version)

(assert (= (and mapNonEmpty!44858 ((_ is ValueCellFull!13635) mapValue!44858)) b!1142388))

(assert (= (and b!1142398 ((_ is ValueCellFull!13635) mapDefault!44858)) b!1142394))

(assert (= start!98554 b!1142398))

(declare-fun b_lambda!19265 () Bool)

(assert (=> (not b_lambda!19265) (not b!1142392)))

(declare-fun t!36126 () Bool)

(declare-fun tb!8971 () Bool)

(assert (=> (and start!98554 (= defaultEntry!1004 defaultEntry!1004) t!36126) tb!8971))

(declare-fun result!18507 () Bool)

(assert (=> tb!8971 (= result!18507 tp_is_empty!28689)))

(assert (=> b!1142392 t!36126))

(declare-fun b_and!39169 () Bool)

(assert (= b_and!39167 (and (=> t!36126 result!18507) b_and!39169)))

(declare-fun m!1053657 () Bool)

(assert (=> b!1142400 m!1053657))

(declare-fun m!1053659 () Bool)

(assert (=> b!1142400 m!1053659))

(declare-fun m!1053661 () Bool)

(assert (=> b!1142384 m!1053661))

(assert (=> b!1142384 m!1053657))

(declare-fun m!1053663 () Bool)

(assert (=> b!1142384 m!1053663))

(declare-fun m!1053665 () Bool)

(assert (=> b!1142384 m!1053665))

(declare-fun m!1053667 () Bool)

(assert (=> b!1142384 m!1053667))

(assert (=> b!1142384 m!1053657))

(declare-fun m!1053669 () Bool)

(assert (=> b!1142384 m!1053669))

(assert (=> b!1142384 m!1053667))

(declare-fun m!1053671 () Bool)

(assert (=> b!1142384 m!1053671))

(declare-fun m!1053673 () Bool)

(assert (=> b!1142384 m!1053673))

(assert (=> b!1142384 m!1053661))

(assert (=> b!1142384 m!1053657))

(declare-fun m!1053675 () Bool)

(assert (=> bm!51451 m!1053675))

(declare-fun m!1053677 () Bool)

(assert (=> bm!51448 m!1053677))

(declare-fun m!1053679 () Bool)

(assert (=> b!1142410 m!1053679))

(declare-fun m!1053681 () Bool)

(assert (=> b!1142410 m!1053681))

(declare-fun m!1053683 () Bool)

(assert (=> b!1142410 m!1053683))

(declare-fun m!1053685 () Bool)

(assert (=> b!1142410 m!1053685))

(declare-fun m!1053687 () Bool)

(assert (=> b!1142402 m!1053687))

(declare-fun m!1053689 () Bool)

(assert (=> b!1142403 m!1053689))

(declare-fun m!1053691 () Bool)

(assert (=> b!1142396 m!1053691))

(declare-fun m!1053693 () Bool)

(assert (=> mapNonEmpty!44858 m!1053693))

(declare-fun m!1053695 () Bool)

(assert (=> b!1142395 m!1053695))

(declare-fun m!1053697 () Bool)

(assert (=> b!1142392 m!1053697))

(declare-fun m!1053699 () Bool)

(assert (=> b!1142392 m!1053699))

(declare-fun m!1053701 () Bool)

(assert (=> b!1142392 m!1053701))

(declare-fun m!1053703 () Bool)

(assert (=> b!1142392 m!1053703))

(declare-fun m!1053705 () Bool)

(assert (=> b!1142391 m!1053705))

(declare-fun m!1053707 () Bool)

(assert (=> b!1142397 m!1053707))

(declare-fun m!1053709 () Bool)

(assert (=> b!1142387 m!1053709))

(declare-fun m!1053711 () Bool)

(assert (=> b!1142387 m!1053711))

(declare-fun m!1053713 () Bool)

(assert (=> b!1142405 m!1053713))

(declare-fun m!1053715 () Bool)

(assert (=> b!1142405 m!1053715))

(assert (=> b!1142406 m!1053707))

(assert (=> bm!51452 m!1053665))

(declare-fun m!1053717 () Bool)

(assert (=> b!1142411 m!1053717))

(declare-fun m!1053719 () Bool)

(assert (=> bm!51450 m!1053719))

(declare-fun m!1053721 () Bool)

(assert (=> bm!51453 m!1053721))

(declare-fun m!1053723 () Bool)

(assert (=> b!1142408 m!1053723))

(declare-fun m!1053725 () Bool)

(assert (=> b!1142401 m!1053725))

(declare-fun m!1053727 () Bool)

(assert (=> b!1142401 m!1053727))

(declare-fun m!1053729 () Bool)

(assert (=> b!1142401 m!1053729))

(declare-fun m!1053731 () Bool)

(assert (=> start!98554 m!1053731))

(declare-fun m!1053733 () Bool)

(assert (=> start!98554 m!1053733))

(check-sat (not b!1142411) (not b!1142405) (not start!98554) (not b!1142400) (not b!1142396) (not b!1142397) (not b!1142384) (not b!1142391) (not b!1142392) (not b!1142402) (not b!1142410) (not bm!51451) (not bm!51448) (not b_next!24159) tp_is_empty!28689 (not mapNonEmpty!44858) (not bm!51452) (not bm!51450) b_and!39169 (not b_lambda!19265) (not b!1142395) (not b!1142406) (not b!1142401) (not b!1142403) (not b!1142387) (not bm!51453))
(check-sat b_and!39169 (not b_next!24159))
