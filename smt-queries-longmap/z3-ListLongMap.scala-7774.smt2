; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97390 () Bool)

(assert start!97390)

(declare-fun b_free!23361 () Bool)

(declare-fun b_next!23361 () Bool)

(assert (=> start!97390 (= b_free!23361 (not b_next!23361))))

(declare-fun tp!82381 () Bool)

(declare-fun b_and!37557 () Bool)

(assert (=> start!97390 (= tp!82381 b_and!37557)))

(declare-fun mapNonEmpty!43249 () Bool)

(declare-fun mapRes!43249 () Bool)

(declare-fun tp!82382 () Bool)

(declare-fun e!633285 () Bool)

(assert (=> mapNonEmpty!43249 (= mapRes!43249 (and tp!82382 e!633285))))

(declare-datatypes ((V!41955 0))(
  ( (V!41956 (val!13867 Int)) )
))
(declare-datatypes ((ValueCell!13101 0))(
  ( (ValueCellFull!13101 (v!16500 V!41955)) (EmptyCell!13101) )
))
(declare-fun mapValue!43249 () ValueCell!13101)

(declare-fun mapRest!43249 () (Array (_ BitVec 32) ValueCell!13101))

(declare-datatypes ((array!72159 0))(
  ( (array!72160 (arr!34732 (Array (_ BitVec 32) ValueCell!13101)) (size!35268 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72159)

(declare-fun mapKey!43249 () (_ BitVec 32))

(assert (=> mapNonEmpty!43249 (= (arr!34732 _values!996) (store mapRest!43249 mapKey!43249 mapValue!43249))))

(declare-datatypes ((tuple2!17536 0))(
  ( (tuple2!17537 (_1!8779 (_ BitVec 64)) (_2!8779 V!41955)) )
))
(declare-datatypes ((List!24221 0))(
  ( (Nil!24218) (Cons!24217 (h!25426 tuple2!17536) (t!34628 List!24221)) )
))
(declare-datatypes ((ListLongMap!15505 0))(
  ( (ListLongMap!15506 (toList!7768 List!24221)) )
))
(declare-fun call!46779 () ListLongMap!15505)

(declare-fun e!633283 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1110419 () Bool)

(declare-fun call!46780 () ListLongMap!15505)

(declare-fun -!1040 (ListLongMap!15505 (_ BitVec 64)) ListLongMap!15505)

(assert (=> b!1110419 (= e!633283 (= call!46779 (-!1040 call!46780 k0!934)))))

(declare-fun b!1110420 () Bool)

(declare-fun e!633281 () Bool)

(assert (=> b!1110420 (= e!633281 true)))

(assert (=> b!1110420 e!633283))

(declare-fun c!109233 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110420 (= c!109233 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41955)

(declare-datatypes ((array!72161 0))(
  ( (array!72162 (arr!34733 (Array (_ BitVec 32) (_ BitVec 64))) (size!35269 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36442 0))(
  ( (Unit!36443) )
))
(declare-fun lt!496162 () Unit!36442)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41955)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!290 (array!72161 array!72159 (_ BitVec 32) (_ BitVec 32) V!41955 V!41955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36442)

(assert (=> b!1110420 (= lt!496162 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110421 () Bool)

(declare-fun res!741031 () Bool)

(declare-fun e!633282 () Bool)

(assert (=> b!1110421 (=> (not res!741031) (not e!633282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110421 (= res!741031 (validKeyInArray!0 k0!934))))

(declare-fun b!1110422 () Bool)

(declare-fun res!741028 () Bool)

(declare-fun e!633279 () Bool)

(assert (=> b!1110422 (=> (not res!741028) (not e!633279))))

(declare-fun lt!496163 () array!72161)

(declare-datatypes ((List!24222 0))(
  ( (Nil!24219) (Cons!24218 (h!25427 (_ BitVec 64)) (t!34629 List!24222)) )
))
(declare-fun arrayNoDuplicates!0 (array!72161 (_ BitVec 32) List!24222) Bool)

(assert (=> b!1110422 (= res!741028 (arrayNoDuplicates!0 lt!496163 #b00000000000000000000000000000000 Nil!24219))))

(declare-fun b!1110423 () Bool)

(assert (=> b!1110423 (= e!633279 (not e!633281))))

(declare-fun res!741021 () Bool)

(assert (=> b!1110423 (=> res!741021 e!633281)))

(assert (=> b!1110423 (= res!741021 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35269 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110423 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496161 () Unit!36442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72161 (_ BitVec 64) (_ BitVec 32)) Unit!36442)

(assert (=> b!1110423 (= lt!496161 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110424 () Bool)

(declare-fun res!741026 () Bool)

(assert (=> b!1110424 (=> (not res!741026) (not e!633282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110424 (= res!741026 (validMask!0 mask!1564))))

(declare-fun bm!46776 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4262 (array!72161 array!72159 (_ BitVec 32) (_ BitVec 32) V!41955 V!41955 (_ BitVec 32) Int) ListLongMap!15505)

(declare-fun dynLambda!2390 (Int (_ BitVec 64)) V!41955)

(assert (=> bm!46776 (= call!46779 (getCurrentListMapNoExtraKeys!4262 lt!496163 (array!72160 (store (arr!34732 _values!996) i!673 (ValueCellFull!13101 (dynLambda!2390 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35268 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!741022 () Bool)

(assert (=> start!97390 (=> (not res!741022) (not e!633282))))

(assert (=> start!97390 (= res!741022 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35269 _keys!1208))))))

(assert (=> start!97390 e!633282))

(declare-fun tp_is_empty!27621 () Bool)

(assert (=> start!97390 tp_is_empty!27621))

(declare-fun array_inv!26724 (array!72161) Bool)

(assert (=> start!97390 (array_inv!26724 _keys!1208)))

(assert (=> start!97390 true))

(assert (=> start!97390 tp!82381))

(declare-fun e!633280 () Bool)

(declare-fun array_inv!26725 (array!72159) Bool)

(assert (=> start!97390 (and (array_inv!26725 _values!996) e!633280)))

(declare-fun b!1110425 () Bool)

(declare-fun e!633284 () Bool)

(assert (=> b!1110425 (= e!633284 tp_is_empty!27621)))

(declare-fun b!1110426 () Bool)

(assert (=> b!1110426 (= e!633285 tp_is_empty!27621)))

(declare-fun b!1110427 () Bool)

(declare-fun res!741030 () Bool)

(assert (=> b!1110427 (=> (not res!741030) (not e!633282))))

(assert (=> b!1110427 (= res!741030 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35269 _keys!1208))))))

(declare-fun b!1110428 () Bool)

(declare-fun res!741027 () Bool)

(assert (=> b!1110428 (=> (not res!741027) (not e!633282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72161 (_ BitVec 32)) Bool)

(assert (=> b!1110428 (= res!741027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46777 () Bool)

(assert (=> bm!46777 (= call!46780 (getCurrentListMapNoExtraKeys!4262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110429 () Bool)

(declare-fun res!741023 () Bool)

(assert (=> b!1110429 (=> (not res!741023) (not e!633282))))

(assert (=> b!1110429 (= res!741023 (= (select (arr!34733 _keys!1208) i!673) k0!934))))

(declare-fun b!1110430 () Bool)

(assert (=> b!1110430 (= e!633282 e!633279)))

(declare-fun res!741025 () Bool)

(assert (=> b!1110430 (=> (not res!741025) (not e!633279))))

(assert (=> b!1110430 (= res!741025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496163 mask!1564))))

(assert (=> b!1110430 (= lt!496163 (array!72162 (store (arr!34733 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35269 _keys!1208)))))

(declare-fun mapIsEmpty!43249 () Bool)

(assert (=> mapIsEmpty!43249 mapRes!43249))

(declare-fun b!1110431 () Bool)

(assert (=> b!1110431 (= e!633283 (= call!46779 call!46780))))

(declare-fun b!1110432 () Bool)

(assert (=> b!1110432 (= e!633280 (and e!633284 mapRes!43249))))

(declare-fun condMapEmpty!43249 () Bool)

(declare-fun mapDefault!43249 () ValueCell!13101)

(assert (=> b!1110432 (= condMapEmpty!43249 (= (arr!34732 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13101)) mapDefault!43249)))))

(declare-fun b!1110433 () Bool)

(declare-fun res!741024 () Bool)

(assert (=> b!1110433 (=> (not res!741024) (not e!633282))))

(assert (=> b!1110433 (= res!741024 (and (= (size!35268 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35269 _keys!1208) (size!35268 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110434 () Bool)

(declare-fun res!741029 () Bool)

(assert (=> b!1110434 (=> (not res!741029) (not e!633282))))

(assert (=> b!1110434 (= res!741029 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24219))))

(assert (= (and start!97390 res!741022) b!1110424))

(assert (= (and b!1110424 res!741026) b!1110433))

(assert (= (and b!1110433 res!741024) b!1110428))

(assert (= (and b!1110428 res!741027) b!1110434))

(assert (= (and b!1110434 res!741029) b!1110427))

(assert (= (and b!1110427 res!741030) b!1110421))

(assert (= (and b!1110421 res!741031) b!1110429))

(assert (= (and b!1110429 res!741023) b!1110430))

(assert (= (and b!1110430 res!741025) b!1110422))

(assert (= (and b!1110422 res!741028) b!1110423))

(assert (= (and b!1110423 (not res!741021)) b!1110420))

(assert (= (and b!1110420 c!109233) b!1110419))

(assert (= (and b!1110420 (not c!109233)) b!1110431))

(assert (= (or b!1110419 b!1110431) bm!46777))

(assert (= (or b!1110419 b!1110431) bm!46776))

(assert (= (and b!1110432 condMapEmpty!43249) mapIsEmpty!43249))

(assert (= (and b!1110432 (not condMapEmpty!43249)) mapNonEmpty!43249))

(get-info :version)

(assert (= (and mapNonEmpty!43249 ((_ is ValueCellFull!13101) mapValue!43249)) b!1110426))

(assert (= (and b!1110432 ((_ is ValueCellFull!13101) mapDefault!43249)) b!1110425))

(assert (= start!97390 b!1110432))

(declare-fun b_lambda!18383 () Bool)

(assert (=> (not b_lambda!18383) (not bm!46776)))

(declare-fun t!34627 () Bool)

(declare-fun tb!8227 () Bool)

(assert (=> (and start!97390 (= defaultEntry!1004 defaultEntry!1004) t!34627) tb!8227))

(declare-fun result!17015 () Bool)

(assert (=> tb!8227 (= result!17015 tp_is_empty!27621)))

(assert (=> bm!46776 t!34627))

(declare-fun b_and!37559 () Bool)

(assert (= b_and!37557 (and (=> t!34627 result!17015) b_and!37559)))

(declare-fun m!1028461 () Bool)

(assert (=> bm!46776 m!1028461))

(declare-fun m!1028463 () Bool)

(assert (=> bm!46776 m!1028463))

(declare-fun m!1028465 () Bool)

(assert (=> bm!46776 m!1028465))

(declare-fun m!1028467 () Bool)

(assert (=> start!97390 m!1028467))

(declare-fun m!1028469 () Bool)

(assert (=> start!97390 m!1028469))

(declare-fun m!1028471 () Bool)

(assert (=> b!1110429 m!1028471))

(declare-fun m!1028473 () Bool)

(assert (=> b!1110428 m!1028473))

(declare-fun m!1028475 () Bool)

(assert (=> b!1110430 m!1028475))

(declare-fun m!1028477 () Bool)

(assert (=> b!1110430 m!1028477))

(declare-fun m!1028479 () Bool)

(assert (=> bm!46777 m!1028479))

(declare-fun m!1028481 () Bool)

(assert (=> b!1110419 m!1028481))

(declare-fun m!1028483 () Bool)

(assert (=> b!1110422 m!1028483))

(declare-fun m!1028485 () Bool)

(assert (=> b!1110420 m!1028485))

(declare-fun m!1028487 () Bool)

(assert (=> mapNonEmpty!43249 m!1028487))

(declare-fun m!1028489 () Bool)

(assert (=> b!1110421 m!1028489))

(declare-fun m!1028491 () Bool)

(assert (=> b!1110423 m!1028491))

(declare-fun m!1028493 () Bool)

(assert (=> b!1110423 m!1028493))

(declare-fun m!1028495 () Bool)

(assert (=> b!1110434 m!1028495))

(declare-fun m!1028497 () Bool)

(assert (=> b!1110424 m!1028497))

(check-sat (not start!97390) (not b_next!23361) tp_is_empty!27621 (not b!1110422) (not b!1110424) (not b_lambda!18383) (not b!1110434) (not mapNonEmpty!43249) (not bm!46776) (not bm!46777) (not b!1110420) (not b!1110421) (not b!1110419) (not b!1110423) (not b!1110428) b_and!37559 (not b!1110430))
(check-sat b_and!37559 (not b_next!23361))
