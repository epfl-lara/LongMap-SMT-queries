; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98368 () Bool)

(assert start!98368)

(declare-fun b_free!23833 () Bool)

(declare-fun b_next!23833 () Bool)

(assert (=> start!98368 (= b_free!23833 (not b_next!23833))))

(declare-fun tp!84202 () Bool)

(declare-fun b_and!38459 () Bool)

(assert (=> start!98368 (= tp!84202 b_and!38459)))

(declare-datatypes ((V!42945 0))(
  ( (V!42946 (val!14238 Int)) )
))
(declare-fun zeroValue!944 () V!42945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47845 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73631 0))(
  ( (array!73632 (arr!35462 (Array (_ BitVec 32) (_ BitVec 64))) (size!35999 (_ BitVec 32))) )
))
(declare-fun lt!501283 () array!73631)

(declare-datatypes ((tuple2!17932 0))(
  ( (tuple2!17933 (_1!8977 (_ BitVec 64)) (_2!8977 V!42945)) )
))
(declare-datatypes ((List!24712 0))(
  ( (Nil!24709) (Cons!24708 (h!25926 tuple2!17932) (t!35529 List!24712)) )
))
(declare-datatypes ((ListLongMap!15909 0))(
  ( (ListLongMap!15910 (toList!7970 List!24712)) )
))
(declare-fun call!47848 () ListLongMap!15909)

(declare-fun minValue!944 () V!42945)

(declare-datatypes ((ValueCell!13472 0))(
  ( (ValueCellFull!13472 (v!16867 V!42945)) (EmptyCell!13472) )
))
(declare-datatypes ((array!73633 0))(
  ( (array!73634 (arr!35463 (Array (_ BitVec 32) ValueCell!13472)) (size!36000 (_ BitVec 32))) )
))
(declare-fun lt!501286 () array!73633)

(declare-fun getCurrentListMapNoExtraKeys!4490 (array!73631 array!73633 (_ BitVec 32) (_ BitVec 32) V!42945 V!42945 (_ BitVec 32) Int) ListLongMap!15909)

(assert (=> bm!47845 (= call!47848 (getCurrentListMapNoExtraKeys!4490 lt!501283 lt!501286 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129250 () Bool)

(declare-fun res!754283 () Bool)

(declare-fun e!642822 () Bool)

(assert (=> b!1129250 (=> (not res!754283) (not e!642822))))

(declare-datatypes ((List!24713 0))(
  ( (Nil!24710) (Cons!24709 (h!25927 (_ BitVec 64)) (t!35530 List!24713)) )
))
(declare-fun arrayNoDuplicates!0 (array!73631 (_ BitVec 32) List!24713) Bool)

(assert (=> b!1129250 (= res!754283 (arrayNoDuplicates!0 lt!501283 #b00000000000000000000000000000000 Nil!24710))))

(declare-fun b!1129251 () Bool)

(declare-fun e!642814 () Bool)

(declare-fun e!642817 () Bool)

(assert (=> b!1129251 (= e!642814 e!642817)))

(declare-fun res!754286 () Bool)

(assert (=> b!1129251 (=> res!754286 e!642817)))

(declare-fun _keys!1208 () array!73631)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1129251 (= res!754286 (not (= (select (arr!35462 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642819 () Bool)

(assert (=> b!1129251 e!642819))

(declare-fun c!110150 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129251 (= c!110150 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!73633)

(declare-datatypes ((Unit!36941 0))(
  ( (Unit!36942) )
))
(declare-fun lt!501288 () Unit!36941)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!401 (array!73631 array!73633 (_ BitVec 32) (_ BitVec 32) V!42945 V!42945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36941)

(assert (=> b!1129251 (= lt!501288 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129252 () Bool)

(declare-fun e!642816 () Bool)

(assert (=> b!1129252 (= e!642822 (not e!642816))))

(declare-fun res!754278 () Bool)

(assert (=> b!1129252 (=> res!754278 e!642816)))

(assert (=> b!1129252 (= res!754278 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129252 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501287 () Unit!36941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73631 (_ BitVec 64) (_ BitVec 32)) Unit!36941)

(assert (=> b!1129252 (= lt!501287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!47849 () ListLongMap!15909)

(declare-fun bm!47846 () Bool)

(assert (=> bm!47846 (= call!47849 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129253 () Bool)

(declare-fun res!754279 () Bool)

(declare-fun e!642820 () Bool)

(assert (=> b!1129253 (=> (not res!754279) (not e!642820))))

(assert (=> b!1129253 (= res!754279 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35999 _keys!1208))))))

(declare-fun b!1129254 () Bool)

(declare-fun res!754276 () Bool)

(assert (=> b!1129254 (=> (not res!754276) (not e!642820))))

(assert (=> b!1129254 (= res!754276 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24710))))

(declare-fun b!1129255 () Bool)

(assert (=> b!1129255 (= e!642816 e!642814)))

(declare-fun res!754282 () Bool)

(assert (=> b!1129255 (=> res!754282 e!642814)))

(assert (=> b!1129255 (= res!754282 (not (= from!1455 i!673)))))

(declare-fun lt!501289 () ListLongMap!15909)

(assert (=> b!1129255 (= lt!501289 (getCurrentListMapNoExtraKeys!4490 lt!501283 lt!501286 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2557 (Int (_ BitVec 64)) V!42945)

(assert (=> b!1129255 (= lt!501286 (array!73634 (store (arr!35463 _values!996) i!673 (ValueCellFull!13472 (dynLambda!2557 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36000 _values!996)))))

(declare-fun lt!501284 () ListLongMap!15909)

(assert (=> b!1129255 (= lt!501284 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129256 () Bool)

(declare-fun res!754281 () Bool)

(assert (=> b!1129256 (=> (not res!754281) (not e!642820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129256 (= res!754281 (validMask!0 mask!1564))))

(declare-fun b!1129257 () Bool)

(declare-fun res!754284 () Bool)

(assert (=> b!1129257 (=> (not res!754284) (not e!642820))))

(assert (=> b!1129257 (= res!754284 (= (select (arr!35462 _keys!1208) i!673) k0!934))))

(declare-fun b!1129258 () Bool)

(assert (=> b!1129258 (= e!642820 e!642822)))

(declare-fun res!754285 () Bool)

(assert (=> b!1129258 (=> (not res!754285) (not e!642822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73631 (_ BitVec 32)) Bool)

(assert (=> b!1129258 (= res!754285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501283 mask!1564))))

(assert (=> b!1129258 (= lt!501283 (array!73632 (store (arr!35462 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35999 _keys!1208)))))

(declare-fun b!1129259 () Bool)

(declare-fun res!754288 () Bool)

(assert (=> b!1129259 (=> (not res!754288) (not e!642820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129259 (= res!754288 (validKeyInArray!0 k0!934))))

(declare-fun b!1129260 () Bool)

(declare-fun e!642813 () Bool)

(declare-fun e!642821 () Bool)

(declare-fun mapRes!44362 () Bool)

(assert (=> b!1129260 (= e!642813 (and e!642821 mapRes!44362))))

(declare-fun condMapEmpty!44362 () Bool)

(declare-fun mapDefault!44362 () ValueCell!13472)

(assert (=> b!1129260 (= condMapEmpty!44362 (= (arr!35463 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13472)) mapDefault!44362)))))

(declare-fun b!1129261 () Bool)

(declare-fun res!754277 () Bool)

(assert (=> b!1129261 (=> (not res!754277) (not e!642820))))

(assert (=> b!1129261 (= res!754277 (and (= (size!36000 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35999 _keys!1208) (size!36000 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!754280 () Bool)

(assert (=> start!98368 (=> (not res!754280) (not e!642820))))

(assert (=> start!98368 (= res!754280 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35999 _keys!1208))))))

(assert (=> start!98368 e!642820))

(declare-fun tp_is_empty!28363 () Bool)

(assert (=> start!98368 tp_is_empty!28363))

(declare-fun array_inv!27266 (array!73631) Bool)

(assert (=> start!98368 (array_inv!27266 _keys!1208)))

(assert (=> start!98368 true))

(assert (=> start!98368 tp!84202))

(declare-fun array_inv!27267 (array!73633) Bool)

(assert (=> start!98368 (and (array_inv!27267 _values!996) e!642813)))

(declare-fun b!1129262 () Bool)

(declare-fun e!642818 () Bool)

(assert (=> b!1129262 (= e!642818 tp_is_empty!28363)))

(declare-fun b!1129263 () Bool)

(assert (=> b!1129263 (= e!642819 (= call!47848 call!47849))))

(declare-fun mapNonEmpty!44362 () Bool)

(declare-fun tp!84203 () Bool)

(assert (=> mapNonEmpty!44362 (= mapRes!44362 (and tp!84203 e!642818))))

(declare-fun mapKey!44362 () (_ BitVec 32))

(declare-fun mapValue!44362 () ValueCell!13472)

(declare-fun mapRest!44362 () (Array (_ BitVec 32) ValueCell!13472))

(assert (=> mapNonEmpty!44362 (= (arr!35463 _values!996) (store mapRest!44362 mapKey!44362 mapValue!44362))))

(declare-fun b!1129264 () Bool)

(declare-fun -!1140 (ListLongMap!15909 (_ BitVec 64)) ListLongMap!15909)

(assert (=> b!1129264 (= e!642819 (= call!47848 (-!1140 call!47849 k0!934)))))

(declare-fun b!1129265 () Bool)

(assert (=> b!1129265 (= e!642821 tp_is_empty!28363)))

(declare-fun mapIsEmpty!44362 () Bool)

(assert (=> mapIsEmpty!44362 mapRes!44362))

(declare-fun b!1129266 () Bool)

(assert (=> b!1129266 (= e!642817 true)))

(declare-fun lt!501285 () Bool)

(declare-fun contains!6510 (ListLongMap!15909 (_ BitVec 64)) Bool)

(assert (=> b!1129266 (= lt!501285 (contains!6510 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129267 () Bool)

(declare-fun res!754287 () Bool)

(assert (=> b!1129267 (=> (not res!754287) (not e!642820))))

(assert (=> b!1129267 (= res!754287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98368 res!754280) b!1129256))

(assert (= (and b!1129256 res!754281) b!1129261))

(assert (= (and b!1129261 res!754277) b!1129267))

(assert (= (and b!1129267 res!754287) b!1129254))

(assert (= (and b!1129254 res!754276) b!1129253))

(assert (= (and b!1129253 res!754279) b!1129259))

(assert (= (and b!1129259 res!754288) b!1129257))

(assert (= (and b!1129257 res!754284) b!1129258))

(assert (= (and b!1129258 res!754285) b!1129250))

(assert (= (and b!1129250 res!754283) b!1129252))

(assert (= (and b!1129252 (not res!754278)) b!1129255))

(assert (= (and b!1129255 (not res!754282)) b!1129251))

(assert (= (and b!1129251 c!110150) b!1129264))

(assert (= (and b!1129251 (not c!110150)) b!1129263))

(assert (= (or b!1129264 b!1129263) bm!47845))

(assert (= (or b!1129264 b!1129263) bm!47846))

(assert (= (and b!1129251 (not res!754286)) b!1129266))

(assert (= (and b!1129260 condMapEmpty!44362) mapIsEmpty!44362))

(assert (= (and b!1129260 (not condMapEmpty!44362)) mapNonEmpty!44362))

(get-info :version)

(assert (= (and mapNonEmpty!44362 ((_ is ValueCellFull!13472) mapValue!44362)) b!1129262))

(assert (= (and b!1129260 ((_ is ValueCellFull!13472) mapDefault!44362)) b!1129265))

(assert (= start!98368 b!1129260))

(declare-fun b_lambda!18813 () Bool)

(assert (=> (not b_lambda!18813) (not b!1129255)))

(declare-fun t!35528 () Bool)

(declare-fun tb!8637 () Bool)

(assert (=> (and start!98368 (= defaultEntry!1004 defaultEntry!1004) t!35528) tb!8637))

(declare-fun result!17843 () Bool)

(assert (=> tb!8637 (= result!17843 tp_is_empty!28363)))

(assert (=> b!1129255 t!35528))

(declare-fun b_and!38461 () Bool)

(assert (= b_and!38459 (and (=> t!35528 result!17843) b_and!38461)))

(declare-fun m!1043291 () Bool)

(assert (=> mapNonEmpty!44362 m!1043291))

(declare-fun m!1043293 () Bool)

(assert (=> b!1129266 m!1043293))

(assert (=> b!1129266 m!1043293))

(declare-fun m!1043295 () Bool)

(assert (=> b!1129266 m!1043295))

(declare-fun m!1043297 () Bool)

(assert (=> b!1129258 m!1043297))

(declare-fun m!1043299 () Bool)

(assert (=> b!1129258 m!1043299))

(assert (=> bm!47846 m!1043293))

(declare-fun m!1043301 () Bool)

(assert (=> start!98368 m!1043301))

(declare-fun m!1043303 () Bool)

(assert (=> start!98368 m!1043303))

(declare-fun m!1043305 () Bool)

(assert (=> b!1129255 m!1043305))

(declare-fun m!1043307 () Bool)

(assert (=> b!1129255 m!1043307))

(declare-fun m!1043309 () Bool)

(assert (=> b!1129255 m!1043309))

(declare-fun m!1043311 () Bool)

(assert (=> b!1129255 m!1043311))

(declare-fun m!1043313 () Bool)

(assert (=> b!1129254 m!1043313))

(declare-fun m!1043315 () Bool)

(assert (=> b!1129257 m!1043315))

(declare-fun m!1043317 () Bool)

(assert (=> b!1129259 m!1043317))

(declare-fun m!1043319 () Bool)

(assert (=> b!1129264 m!1043319))

(declare-fun m!1043321 () Bool)

(assert (=> b!1129267 m!1043321))

(declare-fun m!1043323 () Bool)

(assert (=> b!1129251 m!1043323))

(declare-fun m!1043325 () Bool)

(assert (=> b!1129251 m!1043325))

(declare-fun m!1043327 () Bool)

(assert (=> b!1129252 m!1043327))

(declare-fun m!1043329 () Bool)

(assert (=> b!1129252 m!1043329))

(declare-fun m!1043331 () Bool)

(assert (=> b!1129256 m!1043331))

(declare-fun m!1043333 () Bool)

(assert (=> bm!47845 m!1043333))

(declare-fun m!1043335 () Bool)

(assert (=> b!1129250 m!1043335))

(check-sat (not b!1129267) (not b!1129254) (not b!1129252) (not bm!47846) (not b!1129250) tp_is_empty!28363 (not b!1129256) (not b!1129264) (not b_next!23833) b_and!38461 (not mapNonEmpty!44362) (not b!1129258) (not start!98368) (not b_lambda!18813) (not b!1129255) (not bm!47845) (not b!1129266) (not b!1129259) (not b!1129251))
(check-sat b_and!38461 (not b_next!23833))
