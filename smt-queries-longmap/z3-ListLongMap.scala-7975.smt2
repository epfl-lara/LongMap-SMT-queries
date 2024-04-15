; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98684 () Bool)

(assert start!98684)

(declare-fun b_free!24295 () Bool)

(declare-fun b_next!24295 () Bool)

(assert (=> start!98684 (= b_free!24295 (not b_next!24295))))

(declare-fun tp!85595 () Bool)

(declare-fun b_and!39417 () Bool)

(assert (=> start!98684 (= tp!85595 b_and!39417)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1148458 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!513310 () Bool)

(declare-fun e!653240 () Bool)

(assert (=> b!1148458 (= e!653240 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513310) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148459 () Bool)

(declare-fun e!653231 () Bool)

(declare-fun tp_is_empty!28825 () Bool)

(assert (=> b!1148459 (= e!653231 tp_is_empty!28825)))

(declare-fun b!1148460 () Bool)

(declare-datatypes ((V!43561 0))(
  ( (V!43562 (val!14469 Int)) )
))
(declare-datatypes ((tuple2!18430 0))(
  ( (tuple2!18431 (_1!9226 (_ BitVec 64)) (_2!9226 V!43561)) )
))
(declare-datatypes ((List!25167 0))(
  ( (Nil!25164) (Cons!25163 (h!26372 tuple2!18430) (t!36445 List!25167)) )
))
(declare-datatypes ((ListLongMap!16399 0))(
  ( (ListLongMap!16400 (toList!8215 List!25167)) )
))
(declare-fun call!53062 () ListLongMap!16399)

(declare-fun contains!6676 (ListLongMap!16399 (_ BitVec 64)) Bool)

(assert (=> b!1148460 (contains!6676 call!53062 k0!934)))

(declare-datatypes ((Unit!37590 0))(
  ( (Unit!37591) )
))
(declare-fun lt!513293 () Unit!37590)

(declare-fun call!53063 () Unit!37590)

(assert (=> b!1148460 (= lt!513293 call!53063)))

(declare-fun call!53065 () Bool)

(assert (=> b!1148460 call!53065))

(declare-fun lt!513292 () ListLongMap!16399)

(declare-fun lt!513309 () ListLongMap!16399)

(declare-fun zeroValue!944 () V!43561)

(declare-fun +!3633 (ListLongMap!16399 tuple2!18430) ListLongMap!16399)

(assert (=> b!1148460 (= lt!513292 (+!3633 lt!513309 (tuple2!18431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513312 () Unit!37590)

(declare-fun addStillContains!845 (ListLongMap!16399 (_ BitVec 64) V!43561 (_ BitVec 64)) Unit!37590)

(assert (=> b!1148460 (= lt!513312 (addStillContains!845 lt!513309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!653234 () Unit!37590)

(assert (=> b!1148460 (= e!653234 lt!513293)))

(declare-fun b!1148461 () Bool)

(declare-fun res!764242 () Bool)

(declare-fun e!653229 () Bool)

(assert (=> b!1148461 (=> (not res!764242) (not e!653229))))

(declare-datatypes ((array!74420 0))(
  ( (array!74421 (arr!35861 (Array (_ BitVec 32) (_ BitVec 64))) (size!36399 (_ BitVec 32))) )
))
(declare-fun lt!513294 () array!74420)

(declare-datatypes ((List!25168 0))(
  ( (Nil!25165) (Cons!25164 (h!26373 (_ BitVec 64)) (t!36446 List!25168)) )
))
(declare-fun arrayNoDuplicates!0 (array!74420 (_ BitVec 32) List!25168) Bool)

(assert (=> b!1148461 (= res!764242 (arrayNoDuplicates!0 lt!513294 #b00000000000000000000000000000000 Nil!25165))))

(declare-fun b!1148462 () Bool)

(declare-fun e!653243 () Bool)

(declare-fun e!653239 () Bool)

(assert (=> b!1148462 (= e!653243 e!653239)))

(declare-fun res!764252 () Bool)

(assert (=> b!1148462 (=> res!764252 e!653239)))

(declare-fun _keys!1208 () array!74420)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1148462 (= res!764252 (not (= (select (arr!35861 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653230 () Bool)

(assert (=> b!1148462 e!653230))

(declare-fun c!113490 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148462 (= c!113490 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!513299 () Unit!37590)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13703 0))(
  ( (ValueCellFull!13703 (v!17105 V!43561)) (EmptyCell!13703) )
))
(declare-datatypes ((array!74422 0))(
  ( (array!74423 (arr!35862 (Array (_ BitVec 32) ValueCell!13703)) (size!36400 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74422)

(declare-fun minValue!944 () V!43561)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 (array!74420 array!74422 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37590)

(assert (=> b!1148462 (= lt!513299 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113491 () Bool)

(declare-fun call!53059 () ListLongMap!16399)

(declare-fun bm!53057 () Bool)

(assert (=> bm!53057 (= call!53065 (contains!6676 (ite c!113491 lt!513292 call!53059) k0!934))))

(declare-fun b!1148463 () Bool)

(declare-fun res!764247 () Bool)

(declare-fun e!653242 () Bool)

(assert (=> b!1148463 (=> (not res!764247) (not e!653242))))

(assert (=> b!1148463 (= res!764247 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36399 _keys!1208))))))

(declare-fun b!1148464 () Bool)

(declare-fun call!53060 () ListLongMap!16399)

(declare-fun call!53061 () ListLongMap!16399)

(declare-fun -!1286 (ListLongMap!16399 (_ BitVec 64)) ListLongMap!16399)

(assert (=> b!1148464 (= e!653230 (= call!53061 (-!1286 call!53060 k0!934)))))

(declare-fun b!1148465 () Bool)

(declare-fun e!653235 () Unit!37590)

(declare-fun Unit!37592 () Unit!37590)

(assert (=> b!1148465 (= e!653235 Unit!37592)))

(declare-fun e!653233 () Bool)

(declare-fun lt!513301 () ListLongMap!16399)

(declare-fun b!1148466 () Bool)

(assert (=> b!1148466 (= e!653233 (= (-!1286 lt!513301 k0!934) lt!513309))))

(declare-fun b!1148467 () Bool)

(declare-fun arrayContainsKey!0 (array!74420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148467 (= e!653240 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148468 () Bool)

(declare-fun res!764240 () Bool)

(assert (=> b!1148468 (=> (not res!764240) (not e!653242))))

(assert (=> b!1148468 (= res!764240 (and (= (size!36400 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36399 _keys!1208) (size!36400 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!653236 () Bool)

(declare-fun b!1148469 () Bool)

(assert (=> b!1148469 (= e!653236 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45062 () Bool)

(declare-fun mapRes!45062 () Bool)

(declare-fun tp!85596 () Bool)

(assert (=> mapNonEmpty!45062 (= mapRes!45062 (and tp!85596 e!653231))))

(declare-fun mapValue!45062 () ValueCell!13703)

(declare-fun mapKey!45062 () (_ BitVec 32))

(declare-fun mapRest!45062 () (Array (_ BitVec 32) ValueCell!13703))

(assert (=> mapNonEmpty!45062 (= (arr!35862 _values!996) (store mapRest!45062 mapKey!45062 mapValue!45062))))

(declare-fun b!1148470 () Bool)

(declare-fun res!764244 () Bool)

(assert (=> b!1148470 (=> (not res!764244) (not e!653242))))

(assert (=> b!1148470 (= res!764244 (= (select (arr!35861 _keys!1208) i!673) k0!934))))

(declare-fun b!1148471 () Bool)

(declare-fun c!113492 () Bool)

(assert (=> b!1148471 (= c!113492 (and (not lt!513310) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653228 () Unit!37590)

(assert (=> b!1148471 (= e!653234 e!653228)))

(declare-fun b!1148472 () Bool)

(declare-fun res!764245 () Bool)

(assert (=> b!1148472 (=> (not res!764245) (not e!653242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148472 (= res!764245 (validMask!0 mask!1564))))

(declare-fun b!1148473 () Bool)

(declare-fun e!653237 () Unit!37590)

(declare-fun Unit!37593 () Unit!37590)

(assert (=> b!1148473 (= e!653237 Unit!37593)))

(assert (=> b!1148473 (= lt!513310 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148473 (= c!113491 (and (not lt!513310) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513297 () Unit!37590)

(assert (=> b!1148473 (= lt!513297 e!653234)))

(declare-fun lt!513296 () Unit!37590)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!438 (array!74420 array!74422 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 64) (_ BitVec 32) Int) Unit!37590)

(assert (=> b!1148473 (= lt!513296 (lemmaListMapContainsThenArrayContainsFrom!438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113487 () Bool)

(assert (=> b!1148473 (= c!113487 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764243 () Bool)

(assert (=> b!1148473 (= res!764243 e!653240)))

(assert (=> b!1148473 (=> (not res!764243) (not e!653236))))

(assert (=> b!1148473 e!653236))

(declare-fun lt!513308 () Unit!37590)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74420 (_ BitVec 32) (_ BitVec 32)) Unit!37590)

(assert (=> b!1148473 (= lt!513308 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148473 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25165)))

(declare-fun lt!513304 () Unit!37590)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74420 (_ BitVec 64) (_ BitVec 32) List!25168) Unit!37590)

(assert (=> b!1148473 (= lt!513304 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25165))))

(assert (=> b!1148473 false))

(declare-fun b!1148474 () Bool)

(declare-fun res!764238 () Bool)

(assert (=> b!1148474 (=> (not res!764238) (not e!653242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74420 (_ BitVec 32)) Bool)

(assert (=> b!1148474 (= res!764238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!764250 () Bool)

(assert (=> start!98684 (=> (not res!764250) (not e!653242))))

(assert (=> start!98684 (= res!764250 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36399 _keys!1208))))))

(assert (=> start!98684 e!653242))

(assert (=> start!98684 tp_is_empty!28825))

(declare-fun array_inv!27558 (array!74420) Bool)

(assert (=> start!98684 (array_inv!27558 _keys!1208)))

(assert (=> start!98684 true))

(assert (=> start!98684 tp!85595))

(declare-fun e!653232 () Bool)

(declare-fun array_inv!27559 (array!74422) Bool)

(assert (=> start!98684 (and (array_inv!27559 _values!996) e!653232)))

(declare-fun bm!53056 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4700 (array!74420 array!74422 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) Int) ListLongMap!16399)

(assert (=> bm!53056 (= call!53060 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53058 () Bool)

(declare-fun call!53066 () Unit!37590)

(assert (=> bm!53058 (= call!53066 call!53063)))

(declare-fun b!1148475 () Bool)

(declare-fun e!653238 () Bool)

(assert (=> b!1148475 (= e!653229 (not e!653238))))

(declare-fun res!764248 () Bool)

(assert (=> b!1148475 (=> res!764248 e!653238)))

(assert (=> b!1148475 (= res!764248 (bvsgt from!1455 i!673))))

(assert (=> b!1148475 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513298 () Unit!37590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74420 (_ BitVec 64) (_ BitVec 32)) Unit!37590)

(assert (=> b!1148475 (= lt!513298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53059 () Bool)

(declare-fun lt!513305 () array!74422)

(assert (=> bm!53059 (= call!53061 (getCurrentListMapNoExtraKeys!4700 lt!513294 lt!513305 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148476 () Bool)

(assert (=> b!1148476 (= e!653228 e!653235)))

(declare-fun c!113489 () Bool)

(assert (=> b!1148476 (= c!113489 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513310))))

(declare-fun bm!53060 () Bool)

(assert (=> bm!53060 (= call!53062 (+!3633 (ite c!113491 lt!513292 lt!513309) (ite c!113491 (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113492 (tuple2!18431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!53061 () Bool)

(assert (=> bm!53061 (= call!53059 call!53062)))

(declare-fun b!1148477 () Bool)

(declare-fun e!653241 () Bool)

(assert (=> b!1148477 (= e!653241 tp_is_empty!28825)))

(declare-fun b!1148478 () Bool)

(assert (=> b!1148478 (= e!653232 (and e!653241 mapRes!45062))))

(declare-fun condMapEmpty!45062 () Bool)

(declare-fun mapDefault!45062 () ValueCell!13703)

(assert (=> b!1148478 (= condMapEmpty!45062 (= (arr!35862 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13703)) mapDefault!45062)))))

(declare-fun b!1148479 () Bool)

(declare-fun call!53064 () Bool)

(assert (=> b!1148479 call!53064))

(declare-fun lt!513302 () Unit!37590)

(assert (=> b!1148479 (= lt!513302 call!53066)))

(assert (=> b!1148479 (= e!653235 lt!513302)))

(declare-fun b!1148480 () Bool)

(assert (=> b!1148480 (= e!653238 e!653243)))

(declare-fun res!764251 () Bool)

(assert (=> b!1148480 (=> res!764251 e!653243)))

(assert (=> b!1148480 (= res!764251 (not (= from!1455 i!673)))))

(declare-fun lt!513295 () ListLongMap!16399)

(assert (=> b!1148480 (= lt!513295 (getCurrentListMapNoExtraKeys!4700 lt!513294 lt!513305 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513311 () V!43561)

(assert (=> b!1148480 (= lt!513305 (array!74423 (store (arr!35862 _values!996) i!673 (ValueCellFull!13703 lt!513311)) (size!36400 _values!996)))))

(declare-fun dynLambda!2668 (Int (_ BitVec 64)) V!43561)

(assert (=> b!1148480 (= lt!513311 (dynLambda!2668 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148480 (= lt!513301 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148481 () Bool)

(declare-fun Unit!37594 () Unit!37590)

(assert (=> b!1148481 (= e!653237 Unit!37594)))

(declare-fun b!1148482 () Bool)

(assert (=> b!1148482 (= e!653230 (= call!53061 call!53060))))

(declare-fun b!1148483 () Bool)

(declare-fun res!764241 () Bool)

(assert (=> b!1148483 (=> (not res!764241) (not e!653242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148483 (= res!764241 (validKeyInArray!0 k0!934))))

(declare-fun b!1148484 () Bool)

(assert (=> b!1148484 (= e!653242 e!653229)))

(declare-fun res!764249 () Bool)

(assert (=> b!1148484 (=> (not res!764249) (not e!653229))))

(assert (=> b!1148484 (= res!764249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513294 mask!1564))))

(assert (=> b!1148484 (= lt!513294 (array!74421 (store (arr!35861 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36399 _keys!1208)))))

(declare-fun b!1148485 () Bool)

(declare-fun lt!513306 () Unit!37590)

(assert (=> b!1148485 (= e!653228 lt!513306)))

(assert (=> b!1148485 (= lt!513306 call!53066)))

(assert (=> b!1148485 call!53064))

(declare-fun bm!53062 () Bool)

(assert (=> bm!53062 (= call!53063 (addStillContains!845 (ite c!113491 lt!513292 lt!513309) (ite c!113491 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113492 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113491 minValue!944 (ite c!113492 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!45062 () Bool)

(assert (=> mapIsEmpty!45062 mapRes!45062))

(declare-fun b!1148486 () Bool)

(declare-fun res!764246 () Bool)

(assert (=> b!1148486 (=> (not res!764246) (not e!653242))))

(assert (=> b!1148486 (= res!764246 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25165))))

(declare-fun b!1148487 () Bool)

(assert (=> b!1148487 (= e!653239 true)))

(assert (=> b!1148487 e!653233))

(declare-fun res!764239 () Bool)

(assert (=> b!1148487 (=> (not res!764239) (not e!653233))))

(declare-fun lt!513303 () V!43561)

(assert (=> b!1148487 (= res!764239 (= (-!1286 (+!3633 lt!513309 (tuple2!18431 (select (arr!35861 _keys!1208) from!1455) lt!513303)) (select (arr!35861 _keys!1208) from!1455)) lt!513309))))

(declare-fun lt!513307 () Unit!37590)

(declare-fun addThenRemoveForNewKeyIsSame!147 (ListLongMap!16399 (_ BitVec 64) V!43561) Unit!37590)

(assert (=> b!1148487 (= lt!513307 (addThenRemoveForNewKeyIsSame!147 lt!513309 (select (arr!35861 _keys!1208) from!1455) lt!513303))))

(declare-fun get!18259 (ValueCell!13703 V!43561) V!43561)

(assert (=> b!1148487 (= lt!513303 (get!18259 (select (arr!35862 _values!996) from!1455) lt!513311))))

(declare-fun lt!513300 () Unit!37590)

(assert (=> b!1148487 (= lt!513300 e!653237)))

(declare-fun c!113488 () Bool)

(assert (=> b!1148487 (= c!113488 (contains!6676 lt!513309 k0!934))))

(assert (=> b!1148487 (= lt!513309 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53063 () Bool)

(assert (=> bm!53063 (= call!53064 call!53065)))

(assert (= (and start!98684 res!764250) b!1148472))

(assert (= (and b!1148472 res!764245) b!1148468))

(assert (= (and b!1148468 res!764240) b!1148474))

(assert (= (and b!1148474 res!764238) b!1148486))

(assert (= (and b!1148486 res!764246) b!1148463))

(assert (= (and b!1148463 res!764247) b!1148483))

(assert (= (and b!1148483 res!764241) b!1148470))

(assert (= (and b!1148470 res!764244) b!1148484))

(assert (= (and b!1148484 res!764249) b!1148461))

(assert (= (and b!1148461 res!764242) b!1148475))

(assert (= (and b!1148475 (not res!764248)) b!1148480))

(assert (= (and b!1148480 (not res!764251)) b!1148462))

(assert (= (and b!1148462 c!113490) b!1148464))

(assert (= (and b!1148462 (not c!113490)) b!1148482))

(assert (= (or b!1148464 b!1148482) bm!53059))

(assert (= (or b!1148464 b!1148482) bm!53056))

(assert (= (and b!1148462 (not res!764252)) b!1148487))

(assert (= (and b!1148487 c!113488) b!1148473))

(assert (= (and b!1148487 (not c!113488)) b!1148481))

(assert (= (and b!1148473 c!113491) b!1148460))

(assert (= (and b!1148473 (not c!113491)) b!1148471))

(assert (= (and b!1148471 c!113492) b!1148485))

(assert (= (and b!1148471 (not c!113492)) b!1148476))

(assert (= (and b!1148476 c!113489) b!1148479))

(assert (= (and b!1148476 (not c!113489)) b!1148465))

(assert (= (or b!1148485 b!1148479) bm!53058))

(assert (= (or b!1148485 b!1148479) bm!53061))

(assert (= (or b!1148485 b!1148479) bm!53063))

(assert (= (or b!1148460 bm!53063) bm!53057))

(assert (= (or b!1148460 bm!53058) bm!53062))

(assert (= (or b!1148460 bm!53061) bm!53060))

(assert (= (and b!1148473 c!113487) b!1148467))

(assert (= (and b!1148473 (not c!113487)) b!1148458))

(assert (= (and b!1148473 res!764243) b!1148469))

(assert (= (and b!1148487 res!764239) b!1148466))

(assert (= (and b!1148478 condMapEmpty!45062) mapIsEmpty!45062))

(assert (= (and b!1148478 (not condMapEmpty!45062)) mapNonEmpty!45062))

(get-info :version)

(assert (= (and mapNonEmpty!45062 ((_ is ValueCellFull!13703) mapValue!45062)) b!1148459))

(assert (= (and b!1148478 ((_ is ValueCellFull!13703) mapDefault!45062)) b!1148477))

(assert (= start!98684 b!1148478))

(declare-fun b_lambda!19383 () Bool)

(assert (=> (not b_lambda!19383) (not b!1148480)))

(declare-fun t!36444 () Bool)

(declare-fun tb!9099 () Bool)

(assert (=> (and start!98684 (= defaultEntry!1004 defaultEntry!1004) t!36444) tb!9099))

(declare-fun result!18771 () Bool)

(assert (=> tb!9099 (= result!18771 tp_is_empty!28825)))

(assert (=> b!1148480 t!36444))

(declare-fun b_and!39419 () Bool)

(assert (= b_and!39417 (and (=> t!36444 result!18771) b_and!39419)))

(declare-fun m!1058463 () Bool)

(assert (=> b!1148475 m!1058463))

(declare-fun m!1058465 () Bool)

(assert (=> b!1148475 m!1058465))

(declare-fun m!1058467 () Bool)

(assert (=> b!1148480 m!1058467))

(declare-fun m!1058469 () Bool)

(assert (=> b!1148480 m!1058469))

(declare-fun m!1058471 () Bool)

(assert (=> b!1148480 m!1058471))

(declare-fun m!1058473 () Bool)

(assert (=> b!1148480 m!1058473))

(declare-fun m!1058475 () Bool)

(assert (=> bm!53060 m!1058475))

(declare-fun m!1058477 () Bool)

(assert (=> b!1148474 m!1058477))

(declare-fun m!1058479 () Bool)

(assert (=> bm!53056 m!1058479))

(declare-fun m!1058481 () Bool)

(assert (=> b!1148461 m!1058481))

(declare-fun m!1058483 () Bool)

(assert (=> b!1148466 m!1058483))

(declare-fun m!1058485 () Bool)

(assert (=> mapNonEmpty!45062 m!1058485))

(declare-fun m!1058487 () Bool)

(assert (=> b!1148470 m!1058487))

(declare-fun m!1058489 () Bool)

(assert (=> b!1148462 m!1058489))

(declare-fun m!1058491 () Bool)

(assert (=> b!1148462 m!1058491))

(declare-fun m!1058493 () Bool)

(assert (=> b!1148483 m!1058493))

(declare-fun m!1058495 () Bool)

(assert (=> b!1148486 m!1058495))

(declare-fun m!1058497 () Bool)

(assert (=> b!1148472 m!1058497))

(declare-fun m!1058499 () Bool)

(assert (=> bm!53062 m!1058499))

(declare-fun m!1058501 () Bool)

(assert (=> b!1148460 m!1058501))

(declare-fun m!1058503 () Bool)

(assert (=> b!1148460 m!1058503))

(declare-fun m!1058505 () Bool)

(assert (=> b!1148460 m!1058505))

(declare-fun m!1058507 () Bool)

(assert (=> b!1148469 m!1058507))

(declare-fun m!1058509 () Bool)

(assert (=> start!98684 m!1058509))

(declare-fun m!1058511 () Bool)

(assert (=> start!98684 m!1058511))

(assert (=> b!1148467 m!1058507))

(declare-fun m!1058513 () Bool)

(assert (=> bm!53059 m!1058513))

(declare-fun m!1058515 () Bool)

(assert (=> b!1148464 m!1058515))

(declare-fun m!1058517 () Bool)

(assert (=> b!1148484 m!1058517))

(declare-fun m!1058519 () Bool)

(assert (=> b!1148484 m!1058519))

(assert (=> b!1148487 m!1058479))

(declare-fun m!1058521 () Bool)

(assert (=> b!1148487 m!1058521))

(declare-fun m!1058523 () Bool)

(assert (=> b!1148487 m!1058523))

(assert (=> b!1148487 m!1058521))

(declare-fun m!1058525 () Bool)

(assert (=> b!1148487 m!1058525))

(assert (=> b!1148487 m!1058489))

(declare-fun m!1058527 () Bool)

(assert (=> b!1148487 m!1058527))

(declare-fun m!1058529 () Bool)

(assert (=> b!1148487 m!1058529))

(assert (=> b!1148487 m!1058525))

(assert (=> b!1148487 m!1058489))

(declare-fun m!1058531 () Bool)

(assert (=> b!1148487 m!1058531))

(assert (=> b!1148487 m!1058489))

(declare-fun m!1058533 () Bool)

(assert (=> b!1148473 m!1058533))

(declare-fun m!1058535 () Bool)

(assert (=> b!1148473 m!1058535))

(declare-fun m!1058537 () Bool)

(assert (=> b!1148473 m!1058537))

(declare-fun m!1058539 () Bool)

(assert (=> b!1148473 m!1058539))

(declare-fun m!1058541 () Bool)

(assert (=> bm!53057 m!1058541))

(check-sat (not start!98684) (not bm!53056) (not bm!53060) (not b!1148469) (not bm!53059) (not b!1148483) (not b!1148464) tp_is_empty!28825 (not bm!53057) (not b!1148466) (not b!1148473) (not b!1148467) b_and!39419 (not b_lambda!19383) (not b!1148487) (not b!1148472) (not bm!53062) (not b!1148460) (not b!1148462) (not b!1148486) (not mapNonEmpty!45062) (not b!1148484) (not b!1148480) (not b!1148475) (not b_next!24295) (not b!1148474) (not b!1148461))
(check-sat b_and!39419 (not b_next!24295))
