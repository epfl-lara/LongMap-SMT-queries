; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97412 () Bool)

(assert start!97412)

(declare-fun b_free!23389 () Bool)

(declare-fun b_next!23389 () Bool)

(assert (=> start!97412 (= b_free!23389 (not b_next!23389))))

(declare-fun tp!82465 () Bool)

(declare-fun b_and!37593 () Bool)

(assert (=> start!97412 (= tp!82465 b_and!37593)))

(declare-fun b!1111002 () Bool)

(declare-fun e!633544 () Bool)

(declare-datatypes ((V!41993 0))(
  ( (V!41994 (val!13881 Int)) )
))
(declare-datatypes ((tuple2!17624 0))(
  ( (tuple2!17625 (_1!8823 (_ BitVec 64)) (_2!8823 V!41993)) )
))
(declare-datatypes ((List!24277 0))(
  ( (Nil!24274) (Cons!24273 (h!25482 tuple2!17624) (t!34703 List!24277)) )
))
(declare-datatypes ((ListLongMap!15593 0))(
  ( (ListLongMap!15594 (toList!7812 List!24277)) )
))
(declare-fun call!46840 () ListLongMap!15593)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!46841 () ListLongMap!15593)

(declare-fun -!1025 (ListLongMap!15593 (_ BitVec 64)) ListLongMap!15593)

(assert (=> b!1111002 (= e!633544 (= call!46841 (-!1025 call!46840 k0!934)))))

(declare-fun b!1111003 () Bool)

(declare-fun e!633543 () Bool)

(assert (=> b!1111003 (= e!633543 true)))

(assert (=> b!1111003 e!633544))

(declare-fun c!109254 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111003 (= c!109254 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41993)

(declare-datatypes ((array!72108 0))(
  ( (array!72109 (arr!34707 (Array (_ BitVec 32) (_ BitVec 64))) (size!35245 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72108)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36273 0))(
  ( (Unit!36274) )
))
(declare-fun lt!496089 () Unit!36273)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13115 0))(
  ( (ValueCellFull!13115 (v!16513 V!41993)) (EmptyCell!13115) )
))
(declare-datatypes ((array!72110 0))(
  ( (array!72111 (arr!34708 (Array (_ BitVec 32) ValueCell!13115)) (size!35246 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72110)

(declare-fun minValue!944 () V!41993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!298 (array!72108 array!72110 (_ BitVec 32) (_ BitVec 32) V!41993 V!41993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36273)

(assert (=> b!1111003 (= lt!496089 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111004 () Bool)

(declare-fun res!741422 () Bool)

(declare-fun e!633545 () Bool)

(assert (=> b!1111004 (=> (not res!741422) (not e!633545))))

(assert (=> b!1111004 (= res!741422 (and (= (size!35246 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35245 _keys!1208) (size!35246 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43291 () Bool)

(declare-fun mapRes!43291 () Bool)

(declare-fun tp!82466 () Bool)

(declare-fun e!633541 () Bool)

(assert (=> mapNonEmpty!43291 (= mapRes!43291 (and tp!82466 e!633541))))

(declare-fun mapKey!43291 () (_ BitVec 32))

(declare-fun mapValue!43291 () ValueCell!13115)

(declare-fun mapRest!43291 () (Array (_ BitVec 32) ValueCell!13115))

(assert (=> mapNonEmpty!43291 (= (arr!34708 _values!996) (store mapRest!43291 mapKey!43291 mapValue!43291))))

(declare-fun b!1111006 () Bool)

(declare-fun res!741423 () Bool)

(assert (=> b!1111006 (=> (not res!741423) (not e!633545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111006 (= res!741423 (validKeyInArray!0 k0!934))))

(declare-fun b!1111007 () Bool)

(assert (=> b!1111007 (= e!633544 (= call!46841 call!46840))))

(declare-fun b!1111008 () Bool)

(declare-fun res!741420 () Bool)

(assert (=> b!1111008 (=> (not res!741420) (not e!633545))))

(assert (=> b!1111008 (= res!741420 (= (select (arr!34707 _keys!1208) i!673) k0!934))))

(declare-fun b!1111009 () Bool)

(declare-fun res!741418 () Bool)

(assert (=> b!1111009 (=> (not res!741418) (not e!633545))))

(assert (=> b!1111009 (= res!741418 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35245 _keys!1208))))))

(declare-fun b!1111010 () Bool)

(declare-fun res!741415 () Bool)

(assert (=> b!1111010 (=> (not res!741415) (not e!633545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111010 (= res!741415 (validMask!0 mask!1564))))

(declare-fun b!1111011 () Bool)

(declare-fun res!741414 () Bool)

(declare-fun e!633546 () Bool)

(assert (=> b!1111011 (=> (not res!741414) (not e!633546))))

(declare-fun lt!496088 () array!72108)

(declare-datatypes ((List!24278 0))(
  ( (Nil!24275) (Cons!24274 (h!25483 (_ BitVec 64)) (t!34704 List!24278)) )
))
(declare-fun arrayNoDuplicates!0 (array!72108 (_ BitVec 32) List!24278) Bool)

(assert (=> b!1111011 (= res!741414 (arrayNoDuplicates!0 lt!496088 #b00000000000000000000000000000000 Nil!24275))))

(declare-fun b!1111012 () Bool)

(declare-fun res!741421 () Bool)

(assert (=> b!1111012 (=> (not res!741421) (not e!633545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72108 (_ BitVec 32)) Bool)

(assert (=> b!1111012 (= res!741421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111013 () Bool)

(declare-fun e!633540 () Bool)

(declare-fun tp_is_empty!27649 () Bool)

(assert (=> b!1111013 (= e!633540 tp_is_empty!27649)))

(declare-fun b!1111014 () Bool)

(declare-fun e!633542 () Bool)

(assert (=> b!1111014 (= e!633542 (and e!633540 mapRes!43291))))

(declare-fun condMapEmpty!43291 () Bool)

(declare-fun mapDefault!43291 () ValueCell!13115)

(assert (=> b!1111014 (= condMapEmpty!43291 (= (arr!34708 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13115)) mapDefault!43291)))))

(declare-fun res!741416 () Bool)

(assert (=> start!97412 (=> (not res!741416) (not e!633545))))

(assert (=> start!97412 (= res!741416 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35245 _keys!1208))))))

(assert (=> start!97412 e!633545))

(assert (=> start!97412 tp_is_empty!27649))

(declare-fun array_inv!26754 (array!72108) Bool)

(assert (=> start!97412 (array_inv!26754 _keys!1208)))

(assert (=> start!97412 true))

(assert (=> start!97412 tp!82465))

(declare-fun array_inv!26755 (array!72110) Bool)

(assert (=> start!97412 (and (array_inv!26755 _values!996) e!633542)))

(declare-fun b!1111005 () Bool)

(assert (=> b!1111005 (= e!633545 e!633546)))

(declare-fun res!741424 () Bool)

(assert (=> b!1111005 (=> (not res!741424) (not e!633546))))

(assert (=> b!1111005 (= res!741424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496088 mask!1564))))

(assert (=> b!1111005 (= lt!496088 (array!72109 (store (arr!34707 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35245 _keys!1208)))))

(declare-fun bm!46837 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4325 (array!72108 array!72110 (_ BitVec 32) (_ BitVec 32) V!41993 V!41993 (_ BitVec 32) Int) ListLongMap!15593)

(assert (=> bm!46837 (= call!46840 (getCurrentListMapNoExtraKeys!4325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111015 () Bool)

(assert (=> b!1111015 (= e!633546 (not e!633543))))

(declare-fun res!741419 () Bool)

(assert (=> b!1111015 (=> res!741419 e!633543)))

(assert (=> b!1111015 (= res!741419 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35245 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496087 () Unit!36273)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72108 (_ BitVec 64) (_ BitVec 32)) Unit!36273)

(assert (=> b!1111015 (= lt!496087 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46838 () Bool)

(declare-fun dynLambda!2388 (Int (_ BitVec 64)) V!41993)

(assert (=> bm!46838 (= call!46841 (getCurrentListMapNoExtraKeys!4325 lt!496088 (array!72111 (store (arr!34708 _values!996) i!673 (ValueCellFull!13115 (dynLambda!2388 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111016 () Bool)

(assert (=> b!1111016 (= e!633541 tp_is_empty!27649)))

(declare-fun mapIsEmpty!43291 () Bool)

(assert (=> mapIsEmpty!43291 mapRes!43291))

(declare-fun b!1111017 () Bool)

(declare-fun res!741417 () Bool)

(assert (=> b!1111017 (=> (not res!741417) (not e!633545))))

(assert (=> b!1111017 (= res!741417 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24275))))

(assert (= (and start!97412 res!741416) b!1111010))

(assert (= (and b!1111010 res!741415) b!1111004))

(assert (= (and b!1111004 res!741422) b!1111012))

(assert (= (and b!1111012 res!741421) b!1111017))

(assert (= (and b!1111017 res!741417) b!1111009))

(assert (= (and b!1111009 res!741418) b!1111006))

(assert (= (and b!1111006 res!741423) b!1111008))

(assert (= (and b!1111008 res!741420) b!1111005))

(assert (= (and b!1111005 res!741424) b!1111011))

(assert (= (and b!1111011 res!741414) b!1111015))

(assert (= (and b!1111015 (not res!741419)) b!1111003))

(assert (= (and b!1111003 c!109254) b!1111002))

(assert (= (and b!1111003 (not c!109254)) b!1111007))

(assert (= (or b!1111002 b!1111007) bm!46838))

(assert (= (or b!1111002 b!1111007) bm!46837))

(assert (= (and b!1111014 condMapEmpty!43291) mapIsEmpty!43291))

(assert (= (and b!1111014 (not condMapEmpty!43291)) mapNonEmpty!43291))

(get-info :version)

(assert (= (and mapNonEmpty!43291 ((_ is ValueCellFull!13115) mapValue!43291)) b!1111016))

(assert (= (and b!1111014 ((_ is ValueCellFull!13115) mapDefault!43291)) b!1111013))

(assert (= start!97412 b!1111014))

(declare-fun b_lambda!18395 () Bool)

(assert (=> (not b_lambda!18395) (not bm!46838)))

(declare-fun t!34702 () Bool)

(declare-fun tb!8247 () Bool)

(assert (=> (and start!97412 (= defaultEntry!1004 defaultEntry!1004) t!34702) tb!8247))

(declare-fun result!17063 () Bool)

(assert (=> tb!8247 (= result!17063 tp_is_empty!27649)))

(assert (=> bm!46838 t!34702))

(declare-fun b_and!37595 () Bool)

(assert (= b_and!37593 (and (=> t!34702 result!17063) b_and!37595)))

(declare-fun m!1028367 () Bool)

(assert (=> start!97412 m!1028367))

(declare-fun m!1028369 () Bool)

(assert (=> start!97412 m!1028369))

(declare-fun m!1028371 () Bool)

(assert (=> b!1111005 m!1028371))

(declare-fun m!1028373 () Bool)

(assert (=> b!1111005 m!1028373))

(declare-fun m!1028375 () Bool)

(assert (=> bm!46837 m!1028375))

(declare-fun m!1028377 () Bool)

(assert (=> b!1111015 m!1028377))

(declare-fun m!1028379 () Bool)

(assert (=> b!1111015 m!1028379))

(declare-fun m!1028381 () Bool)

(assert (=> b!1111002 m!1028381))

(declare-fun m!1028383 () Bool)

(assert (=> bm!46838 m!1028383))

(declare-fun m!1028385 () Bool)

(assert (=> bm!46838 m!1028385))

(declare-fun m!1028387 () Bool)

(assert (=> bm!46838 m!1028387))

(declare-fun m!1028389 () Bool)

(assert (=> b!1111010 m!1028389))

(declare-fun m!1028391 () Bool)

(assert (=> b!1111006 m!1028391))

(declare-fun m!1028393 () Bool)

(assert (=> b!1111017 m!1028393))

(declare-fun m!1028395 () Bool)

(assert (=> b!1111011 m!1028395))

(declare-fun m!1028397 () Bool)

(assert (=> b!1111003 m!1028397))

(declare-fun m!1028399 () Bool)

(assert (=> b!1111012 m!1028399))

(declare-fun m!1028401 () Bool)

(assert (=> mapNonEmpty!43291 m!1028401))

(declare-fun m!1028403 () Bool)

(assert (=> b!1111008 m!1028403))

(check-sat (not b!1111005) (not b!1111006) (not b!1111015) (not b_lambda!18395) (not b!1111003) b_and!37595 (not mapNonEmpty!43291) (not b!1111012) (not b!1111010) tp_is_empty!27649 (not b!1111002) (not b_next!23389) (not bm!46838) (not b!1111017) (not bm!46837) (not b!1111011) (not start!97412))
(check-sat b_and!37595 (not b_next!23389))
