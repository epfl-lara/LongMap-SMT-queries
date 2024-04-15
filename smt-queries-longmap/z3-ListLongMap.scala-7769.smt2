; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97352 () Bool)

(assert start!97352)

(declare-fun b_free!23329 () Bool)

(declare-fun b_next!23329 () Bool)

(assert (=> start!97352 (= b_free!23329 (not b_next!23329))))

(declare-fun tp!82285 () Bool)

(declare-fun b_and!37469 () Bool)

(assert (=> start!97352 (= tp!82285 b_and!37469)))

(declare-fun b!1109479 () Bool)

(declare-fun e!632813 () Bool)

(declare-fun e!632811 () Bool)

(assert (=> b!1109479 (= e!632813 e!632811)))

(declare-fun res!740434 () Bool)

(assert (=> b!1109479 (=> (not res!740434) (not e!632811))))

(declare-datatypes ((array!71990 0))(
  ( (array!71991 (arr!34648 (Array (_ BitVec 32) (_ BitVec 64))) (size!35186 (_ BitVec 32))) )
))
(declare-fun lt!495819 () array!71990)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71990 (_ BitVec 32)) Bool)

(assert (=> b!1109479 (= res!740434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495819 mask!1564))))

(declare-fun _keys!1208 () array!71990)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109479 (= lt!495819 (array!71991 (store (arr!34648 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35186 _keys!1208)))))

(declare-fun b!1109480 () Bool)

(declare-fun e!632810 () Bool)

(assert (=> b!1109480 (= e!632811 (not e!632810))))

(declare-fun res!740426 () Bool)

(assert (=> b!1109480 (=> res!740426 e!632810)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109480 (= res!740426 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35186 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109480 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36225 0))(
  ( (Unit!36226) )
))
(declare-fun lt!495818 () Unit!36225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71990 (_ BitVec 64) (_ BitVec 32)) Unit!36225)

(assert (=> b!1109480 (= lt!495818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109481 () Bool)

(declare-fun e!632807 () Bool)

(declare-datatypes ((V!41913 0))(
  ( (V!41914 (val!13851 Int)) )
))
(declare-datatypes ((tuple2!17568 0))(
  ( (tuple2!17569 (_1!8795 (_ BitVec 64)) (_2!8795 V!41913)) )
))
(declare-datatypes ((List!24224 0))(
  ( (Nil!24221) (Cons!24220 (h!25429 tuple2!17568) (t!34590 List!24224)) )
))
(declare-datatypes ((ListLongMap!15537 0))(
  ( (ListLongMap!15538 (toList!7784 List!24224)) )
))
(declare-fun call!46661 () ListLongMap!15537)

(declare-fun call!46660 () ListLongMap!15537)

(assert (=> b!1109481 (= e!632807 (= call!46661 call!46660))))

(declare-fun b!1109482 () Bool)

(declare-fun res!740425 () Bool)

(assert (=> b!1109482 (=> (not res!740425) (not e!632813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109482 (= res!740425 (validKeyInArray!0 k0!934))))

(declare-fun b!1109483 () Bool)

(declare-fun res!740433 () Bool)

(assert (=> b!1109483 (=> (not res!740433) (not e!632813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109483 (= res!740433 (validMask!0 mask!1564))))

(declare-fun b!1109484 () Bool)

(declare-fun res!740428 () Bool)

(assert (=> b!1109484 (=> (not res!740428) (not e!632813))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13085 0))(
  ( (ValueCellFull!13085 (v!16483 V!41913)) (EmptyCell!13085) )
))
(declare-datatypes ((array!71992 0))(
  ( (array!71993 (arr!34649 (Array (_ BitVec 32) ValueCell!13085)) (size!35187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71992)

(assert (=> b!1109484 (= res!740428 (and (= (size!35187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35186 _keys!1208) (size!35187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109485 () Bool)

(declare-fun e!632814 () Bool)

(declare-fun tp_is_empty!27589 () Bool)

(assert (=> b!1109485 (= e!632814 tp_is_empty!27589)))

(declare-fun b!1109486 () Bool)

(declare-fun res!740432 () Bool)

(assert (=> b!1109486 (=> (not res!740432) (not e!632813))))

(assert (=> b!1109486 (= res!740432 (= (select (arr!34648 _keys!1208) i!673) k0!934))))

(declare-fun res!740431 () Bool)

(assert (=> start!97352 (=> (not res!740431) (not e!632813))))

(assert (=> start!97352 (= res!740431 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35186 _keys!1208))))))

(assert (=> start!97352 e!632813))

(assert (=> start!97352 tp_is_empty!27589))

(declare-fun array_inv!26710 (array!71990) Bool)

(assert (=> start!97352 (array_inv!26710 _keys!1208)))

(assert (=> start!97352 true))

(assert (=> start!97352 tp!82285))

(declare-fun e!632808 () Bool)

(declare-fun array_inv!26711 (array!71992) Bool)

(assert (=> start!97352 (and (array_inv!26711 _values!996) e!632808)))

(declare-fun b!1109478 () Bool)

(declare-fun res!740427 () Bool)

(assert (=> b!1109478 (=> (not res!740427) (not e!632813))))

(declare-datatypes ((List!24225 0))(
  ( (Nil!24222) (Cons!24221 (h!25430 (_ BitVec 64)) (t!34591 List!24225)) )
))
(declare-fun arrayNoDuplicates!0 (array!71990 (_ BitVec 32) List!24225) Bool)

(assert (=> b!1109478 (= res!740427 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24222))))

(declare-fun b!1109487 () Bool)

(declare-fun e!632812 () Bool)

(declare-fun mapRes!43201 () Bool)

(assert (=> b!1109487 (= e!632808 (and e!632812 mapRes!43201))))

(declare-fun condMapEmpty!43201 () Bool)

(declare-fun mapDefault!43201 () ValueCell!13085)

(assert (=> b!1109487 (= condMapEmpty!43201 (= (arr!34649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13085)) mapDefault!43201)))))

(declare-fun mapNonEmpty!43201 () Bool)

(declare-fun tp!82286 () Bool)

(assert (=> mapNonEmpty!43201 (= mapRes!43201 (and tp!82286 e!632814))))

(declare-fun mapKey!43201 () (_ BitVec 32))

(declare-fun mapValue!43201 () ValueCell!13085)

(declare-fun mapRest!43201 () (Array (_ BitVec 32) ValueCell!13085))

(assert (=> mapNonEmpty!43201 (= (arr!34649 _values!996) (store mapRest!43201 mapKey!43201 mapValue!43201))))

(declare-fun b!1109488 () Bool)

(declare-fun -!1001 (ListLongMap!15537 (_ BitVec 64)) ListLongMap!15537)

(assert (=> b!1109488 (= e!632807 (= call!46661 (-!1001 call!46660 k0!934)))))

(declare-fun b!1109489 () Bool)

(assert (=> b!1109489 (= e!632812 tp_is_empty!27589)))

(declare-fun zeroValue!944 () V!41913)

(declare-fun bm!46657 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41913)

(declare-fun getCurrentListMapNoExtraKeys!4299 (array!71990 array!71992 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) Int) ListLongMap!15537)

(assert (=> bm!46657 (= call!46660 (getCurrentListMapNoExtraKeys!4299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46658 () Bool)

(declare-fun dynLambda!2365 (Int (_ BitVec 64)) V!41913)

(assert (=> bm!46658 (= call!46661 (getCurrentListMapNoExtraKeys!4299 lt!495819 (array!71993 (store (arr!34649 _values!996) i!673 (ValueCellFull!13085 (dynLambda!2365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35187 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109490 () Bool)

(declare-fun res!740429 () Bool)

(assert (=> b!1109490 (=> (not res!740429) (not e!632813))))

(assert (=> b!1109490 (= res!740429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43201 () Bool)

(assert (=> mapIsEmpty!43201 mapRes!43201))

(declare-fun b!1109491 () Bool)

(assert (=> b!1109491 (= e!632810 true)))

(assert (=> b!1109491 e!632807))

(declare-fun c!109152 () Bool)

(assert (=> b!1109491 (= c!109152 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495817 () Unit!36225)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 (array!71990 array!71992 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36225)

(assert (=> b!1109491 (= lt!495817 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109492 () Bool)

(declare-fun res!740424 () Bool)

(assert (=> b!1109492 (=> (not res!740424) (not e!632811))))

(assert (=> b!1109492 (= res!740424 (arrayNoDuplicates!0 lt!495819 #b00000000000000000000000000000000 Nil!24222))))

(declare-fun b!1109493 () Bool)

(declare-fun res!740430 () Bool)

(assert (=> b!1109493 (=> (not res!740430) (not e!632813))))

(assert (=> b!1109493 (= res!740430 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35186 _keys!1208))))))

(assert (= (and start!97352 res!740431) b!1109483))

(assert (= (and b!1109483 res!740433) b!1109484))

(assert (= (and b!1109484 res!740428) b!1109490))

(assert (= (and b!1109490 res!740429) b!1109478))

(assert (= (and b!1109478 res!740427) b!1109493))

(assert (= (and b!1109493 res!740430) b!1109482))

(assert (= (and b!1109482 res!740425) b!1109486))

(assert (= (and b!1109486 res!740432) b!1109479))

(assert (= (and b!1109479 res!740434) b!1109492))

(assert (= (and b!1109492 res!740424) b!1109480))

(assert (= (and b!1109480 (not res!740426)) b!1109491))

(assert (= (and b!1109491 c!109152) b!1109488))

(assert (= (and b!1109491 (not c!109152)) b!1109481))

(assert (= (or b!1109488 b!1109481) bm!46658))

(assert (= (or b!1109488 b!1109481) bm!46657))

(assert (= (and b!1109487 condMapEmpty!43201) mapIsEmpty!43201))

(assert (= (and b!1109487 (not condMapEmpty!43201)) mapNonEmpty!43201))

(get-info :version)

(assert (= (and mapNonEmpty!43201 ((_ is ValueCellFull!13085) mapValue!43201)) b!1109485))

(assert (= (and b!1109487 ((_ is ValueCellFull!13085) mapDefault!43201)) b!1109489))

(assert (= start!97352 b!1109487))

(declare-fun b_lambda!18331 () Bool)

(assert (=> (not b_lambda!18331) (not bm!46658)))

(declare-fun t!34589 () Bool)

(declare-fun tb!8187 () Bool)

(assert (=> (and start!97352 (= defaultEntry!1004 defaultEntry!1004) t!34589) tb!8187))

(declare-fun result!16943 () Bool)

(assert (=> tb!8187 (= result!16943 tp_is_empty!27589)))

(assert (=> bm!46658 t!34589))

(declare-fun b_and!37471 () Bool)

(assert (= b_and!37469 (and (=> t!34589 result!16943) b_and!37471)))

(declare-fun m!1027227 () Bool)

(assert (=> start!97352 m!1027227))

(declare-fun m!1027229 () Bool)

(assert (=> start!97352 m!1027229))

(declare-fun m!1027231 () Bool)

(assert (=> b!1109478 m!1027231))

(declare-fun m!1027233 () Bool)

(assert (=> b!1109490 m!1027233))

(declare-fun m!1027235 () Bool)

(assert (=> b!1109483 m!1027235))

(declare-fun m!1027237 () Bool)

(assert (=> b!1109479 m!1027237))

(declare-fun m!1027239 () Bool)

(assert (=> b!1109479 m!1027239))

(declare-fun m!1027241 () Bool)

(assert (=> b!1109488 m!1027241))

(declare-fun m!1027243 () Bool)

(assert (=> b!1109480 m!1027243))

(declare-fun m!1027245 () Bool)

(assert (=> b!1109480 m!1027245))

(declare-fun m!1027247 () Bool)

(assert (=> b!1109492 m!1027247))

(declare-fun m!1027249 () Bool)

(assert (=> bm!46658 m!1027249))

(declare-fun m!1027251 () Bool)

(assert (=> bm!46658 m!1027251))

(declare-fun m!1027253 () Bool)

(assert (=> bm!46658 m!1027253))

(declare-fun m!1027255 () Bool)

(assert (=> b!1109491 m!1027255))

(declare-fun m!1027257 () Bool)

(assert (=> b!1109482 m!1027257))

(declare-fun m!1027259 () Bool)

(assert (=> mapNonEmpty!43201 m!1027259))

(declare-fun m!1027261 () Bool)

(assert (=> b!1109486 m!1027261))

(declare-fun m!1027263 () Bool)

(assert (=> bm!46657 m!1027263))

(check-sat (not b!1109483) (not mapNonEmpty!43201) tp_is_empty!27589 (not b_lambda!18331) (not b!1109482) (not b_next!23329) (not b!1109492) (not b!1109490) (not bm!46657) b_and!37471 (not b!1109480) (not b!1109479) (not b!1109478) (not start!97352) (not bm!46658) (not b!1109488) (not b!1109491))
(check-sat b_and!37471 (not b_next!23329))
