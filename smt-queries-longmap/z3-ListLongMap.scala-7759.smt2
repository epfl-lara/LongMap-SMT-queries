; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97534 () Bool)

(assert start!97534)

(declare-fun b_free!23269 () Bool)

(declare-fun b_next!23269 () Bool)

(assert (=> start!97534 (= b_free!23269 (not b_next!23269))))

(declare-fun tp!82106 () Bool)

(declare-fun b_and!37381 () Bool)

(assert (=> start!97534 (= tp!82106 b_and!37381)))

(declare-fun b!1109434 () Bool)

(declare-fun res!740026 () Bool)

(declare-fun e!633026 () Bool)

(assert (=> b!1109434 (=> (not res!740026) (not e!633026))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109434 (= res!740026 (validKeyInArray!0 k0!934))))

(declare-fun b!1109435 () Bool)

(declare-fun e!633024 () Bool)

(declare-fun e!633029 () Bool)

(assert (=> b!1109435 (= e!633024 (not e!633029))))

(declare-fun res!740025 () Bool)

(assert (=> b!1109435 (=> res!740025 e!633029)))

(declare-datatypes ((array!72009 0))(
  ( (array!72010 (arr!34651 (Array (_ BitVec 32) (_ BitVec 64))) (size!35188 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72009)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109435 (= res!740025 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35188 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109435 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36345 0))(
  ( (Unit!36346) )
))
(declare-fun lt!496264 () Unit!36345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72009 (_ BitVec 64) (_ BitVec 32)) Unit!36345)

(assert (=> b!1109435 (= lt!496264 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109436 () Bool)

(declare-fun res!740033 () Bool)

(assert (=> b!1109436 (=> (not res!740033) (not e!633026))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72009 (_ BitVec 32)) Bool)

(assert (=> b!1109436 (= res!740033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109437 () Bool)

(declare-fun res!740030 () Bool)

(assert (=> b!1109437 (=> (not res!740030) (not e!633024))))

(declare-fun lt!496263 () array!72009)

(declare-datatypes ((List!24160 0))(
  ( (Nil!24157) (Cons!24156 (h!25374 (_ BitVec 64)) (t!34467 List!24160)) )
))
(declare-fun arrayNoDuplicates!0 (array!72009 (_ BitVec 32) List!24160) Bool)

(assert (=> b!1109437 (= res!740030 (arrayNoDuplicates!0 lt!496263 #b00000000000000000000000000000000 Nil!24157))))

(declare-fun b!1109439 () Bool)

(declare-fun res!740028 () Bool)

(assert (=> b!1109439 (=> (not res!740028) (not e!633026))))

(assert (=> b!1109439 (= res!740028 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24157))))

(declare-fun mapNonEmpty!43111 () Bool)

(declare-fun mapRes!43111 () Bool)

(declare-fun tp!82105 () Bool)

(declare-fun e!633027 () Bool)

(assert (=> mapNonEmpty!43111 (= mapRes!43111 (and tp!82105 e!633027))))

(declare-datatypes ((V!41833 0))(
  ( (V!41834 (val!13821 Int)) )
))
(declare-datatypes ((ValueCell!13055 0))(
  ( (ValueCellFull!13055 (v!16450 V!41833)) (EmptyCell!13055) )
))
(declare-fun mapRest!43111 () (Array (_ BitVec 32) ValueCell!13055))

(declare-datatypes ((array!72011 0))(
  ( (array!72012 (arr!34652 (Array (_ BitVec 32) ValueCell!13055)) (size!35189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72011)

(declare-fun mapKey!43111 () (_ BitVec 32))

(declare-fun mapValue!43111 () ValueCell!13055)

(assert (=> mapNonEmpty!43111 (= (arr!34652 _values!996) (store mapRest!43111 mapKey!43111 mapValue!43111))))

(declare-fun b!1109440 () Bool)

(declare-fun res!740031 () Bool)

(assert (=> b!1109440 (=> (not res!740031) (not e!633026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109440 (= res!740031 (validMask!0 mask!1564))))

(declare-fun b!1109441 () Bool)

(assert (=> b!1109441 (= e!633029 true)))

(declare-fun e!633030 () Bool)

(assert (=> b!1109441 e!633030))

(declare-fun c!109499 () Bool)

(assert (=> b!1109441 (= c!109499 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41833)

(declare-fun lt!496262 () Unit!36345)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!269 (array!72009 array!72011 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36345)

(assert (=> b!1109441 (= lt!496262 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109442 () Bool)

(declare-fun res!740035 () Bool)

(assert (=> b!1109442 (=> (not res!740035) (not e!633026))))

(assert (=> b!1109442 (= res!740035 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35188 _keys!1208))))))

(declare-fun b!1109443 () Bool)

(declare-fun res!740029 () Bool)

(assert (=> b!1109443 (=> (not res!740029) (not e!633026))))

(assert (=> b!1109443 (= res!740029 (and (= (size!35189 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35188 _keys!1208) (size!35189 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17474 0))(
  ( (tuple2!17475 (_1!8748 (_ BitVec 64)) (_2!8748 V!41833)) )
))
(declare-datatypes ((List!24161 0))(
  ( (Nil!24158) (Cons!24157 (h!25375 tuple2!17474) (t!34468 List!24161)) )
))
(declare-datatypes ((ListLongMap!15451 0))(
  ( (ListLongMap!15452 (toList!7741 List!24161)) )
))
(declare-fun call!46570 () ListLongMap!15451)

(declare-fun call!46571 () ListLongMap!15451)

(declare-fun b!1109444 () Bool)

(declare-fun -!999 (ListLongMap!15451 (_ BitVec 64)) ListLongMap!15451)

(assert (=> b!1109444 (= e!633030 (= call!46571 (-!999 call!46570 k0!934)))))

(declare-fun bm!46567 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4276 (array!72009 array!72011 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) Int) ListLongMap!15451)

(declare-fun dynLambda!2392 (Int (_ BitVec 64)) V!41833)

(assert (=> bm!46567 (= call!46571 (getCurrentListMapNoExtraKeys!4276 lt!496263 (array!72012 (store (arr!34652 _values!996) i!673 (ValueCellFull!13055 (dynLambda!2392 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35189 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109445 () Bool)

(declare-fun tp_is_empty!27529 () Bool)

(assert (=> b!1109445 (= e!633027 tp_is_empty!27529)))

(declare-fun bm!46568 () Bool)

(assert (=> bm!46568 (= call!46570 (getCurrentListMapNoExtraKeys!4276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43111 () Bool)

(assert (=> mapIsEmpty!43111 mapRes!43111))

(declare-fun b!1109446 () Bool)

(declare-fun e!633028 () Bool)

(declare-fun e!633025 () Bool)

(assert (=> b!1109446 (= e!633028 (and e!633025 mapRes!43111))))

(declare-fun condMapEmpty!43111 () Bool)

(declare-fun mapDefault!43111 () ValueCell!13055)

(assert (=> b!1109446 (= condMapEmpty!43111 (= (arr!34652 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13055)) mapDefault!43111)))))

(declare-fun b!1109447 () Bool)

(assert (=> b!1109447 (= e!633026 e!633024)))

(declare-fun res!740034 () Bool)

(assert (=> b!1109447 (=> (not res!740034) (not e!633024))))

(assert (=> b!1109447 (= res!740034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496263 mask!1564))))

(assert (=> b!1109447 (= lt!496263 (array!72010 (store (arr!34651 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35188 _keys!1208)))))

(declare-fun res!740027 () Bool)

(assert (=> start!97534 (=> (not res!740027) (not e!633026))))

(assert (=> start!97534 (= res!740027 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35188 _keys!1208))))))

(assert (=> start!97534 e!633026))

(assert (=> start!97534 tp_is_empty!27529))

(declare-fun array_inv!26696 (array!72009) Bool)

(assert (=> start!97534 (array_inv!26696 _keys!1208)))

(assert (=> start!97534 true))

(assert (=> start!97534 tp!82106))

(declare-fun array_inv!26697 (array!72011) Bool)

(assert (=> start!97534 (and (array_inv!26697 _values!996) e!633028)))

(declare-fun b!1109438 () Bool)

(assert (=> b!1109438 (= e!633025 tp_is_empty!27529)))

(declare-fun b!1109448 () Bool)

(declare-fun res!740032 () Bool)

(assert (=> b!1109448 (=> (not res!740032) (not e!633026))))

(assert (=> b!1109448 (= res!740032 (= (select (arr!34651 _keys!1208) i!673) k0!934))))

(declare-fun b!1109449 () Bool)

(assert (=> b!1109449 (= e!633030 (= call!46571 call!46570))))

(assert (= (and start!97534 res!740027) b!1109440))

(assert (= (and b!1109440 res!740031) b!1109443))

(assert (= (and b!1109443 res!740029) b!1109436))

(assert (= (and b!1109436 res!740033) b!1109439))

(assert (= (and b!1109439 res!740028) b!1109442))

(assert (= (and b!1109442 res!740035) b!1109434))

(assert (= (and b!1109434 res!740026) b!1109448))

(assert (= (and b!1109448 res!740032) b!1109447))

(assert (= (and b!1109447 res!740034) b!1109437))

(assert (= (and b!1109437 res!740030) b!1109435))

(assert (= (and b!1109435 (not res!740025)) b!1109441))

(assert (= (and b!1109441 c!109499) b!1109444))

(assert (= (and b!1109441 (not c!109499)) b!1109449))

(assert (= (or b!1109444 b!1109449) bm!46567))

(assert (= (or b!1109444 b!1109449) bm!46568))

(assert (= (and b!1109446 condMapEmpty!43111) mapIsEmpty!43111))

(assert (= (and b!1109446 (not condMapEmpty!43111)) mapNonEmpty!43111))

(get-info :version)

(assert (= (and mapNonEmpty!43111 ((_ is ValueCellFull!13055) mapValue!43111)) b!1109445))

(assert (= (and b!1109446 ((_ is ValueCellFull!13055) mapDefault!43111)) b!1109438))

(assert (= start!97534 b!1109446))

(declare-fun b_lambda!18299 () Bool)

(assert (=> (not b_lambda!18299) (not bm!46567)))

(declare-fun t!34466 () Bool)

(declare-fun tb!8127 () Bool)

(assert (=> (and start!97534 (= defaultEntry!1004 defaultEntry!1004) t!34466) tb!8127))

(declare-fun result!16823 () Bool)

(assert (=> tb!8127 (= result!16823 tp_is_empty!27529)))

(assert (=> bm!46567 t!34466))

(declare-fun b_and!37383 () Bool)

(assert (= b_and!37381 (and (=> t!34466 result!16823) b_and!37383)))

(declare-fun m!1028385 () Bool)

(assert (=> b!1109439 m!1028385))

(declare-fun m!1028387 () Bool)

(assert (=> b!1109434 m!1028387))

(declare-fun m!1028389 () Bool)

(assert (=> b!1109447 m!1028389))

(declare-fun m!1028391 () Bool)

(assert (=> b!1109447 m!1028391))

(declare-fun m!1028393 () Bool)

(assert (=> bm!46568 m!1028393))

(declare-fun m!1028395 () Bool)

(assert (=> b!1109441 m!1028395))

(declare-fun m!1028397 () Bool)

(assert (=> b!1109435 m!1028397))

(declare-fun m!1028399 () Bool)

(assert (=> b!1109435 m!1028399))

(declare-fun m!1028401 () Bool)

(assert (=> b!1109440 m!1028401))

(declare-fun m!1028403 () Bool)

(assert (=> b!1109437 m!1028403))

(declare-fun m!1028405 () Bool)

(assert (=> b!1109444 m!1028405))

(declare-fun m!1028407 () Bool)

(assert (=> mapNonEmpty!43111 m!1028407))

(declare-fun m!1028409 () Bool)

(assert (=> b!1109436 m!1028409))

(declare-fun m!1028411 () Bool)

(assert (=> bm!46567 m!1028411))

(declare-fun m!1028413 () Bool)

(assert (=> bm!46567 m!1028413))

(declare-fun m!1028415 () Bool)

(assert (=> bm!46567 m!1028415))

(declare-fun m!1028417 () Bool)

(assert (=> b!1109448 m!1028417))

(declare-fun m!1028419 () Bool)

(assert (=> start!97534 m!1028419))

(declare-fun m!1028421 () Bool)

(assert (=> start!97534 m!1028421))

(check-sat (not b!1109437) (not b!1109447) (not b!1109439) (not b!1109435) (not b!1109440) b_and!37383 (not mapNonEmpty!43111) (not b_lambda!18299) (not b!1109444) (not start!97534) (not b_next!23269) (not bm!46567) (not bm!46568) tp_is_empty!27529 (not b!1109436) (not b!1109434) (not b!1109441))
(check-sat b_and!37383 (not b_next!23269))
