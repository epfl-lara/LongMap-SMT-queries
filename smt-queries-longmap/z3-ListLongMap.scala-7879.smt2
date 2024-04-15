; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98012 () Bool)

(assert start!98012)

(declare-fun b_free!23719 () Bool)

(declare-fun b_next!23719 () Bool)

(assert (=> start!98012 (= b_free!23719 (not b_next!23719))))

(declare-fun tp!83861 () Bool)

(declare-fun b_and!38199 () Bool)

(assert (=> start!98012 (= tp!83861 b_and!38199)))

(declare-fun b!1124507 () Bool)

(declare-fun e!640129 () Bool)

(declare-fun e!640125 () Bool)

(assert (=> b!1124507 (= e!640129 e!640125)))

(declare-fun res!751378 () Bool)

(assert (=> b!1124507 (=> res!751378 e!640125)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124507 (= res!751378 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42793 0))(
  ( (V!42794 (val!14181 Int)) )
))
(declare-fun zeroValue!944 () V!42793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17902 0))(
  ( (tuple2!17903 (_1!8962 (_ BitVec 64)) (_2!8962 V!42793)) )
))
(declare-datatypes ((List!24664 0))(
  ( (Nil!24661) (Cons!24660 (h!25869 tuple2!17902) (t!35366 List!24664)) )
))
(declare-datatypes ((ListLongMap!15871 0))(
  ( (ListLongMap!15872 (toList!7951 List!24664)) )
))
(declare-fun lt!499344 () ListLongMap!15871)

(declare-datatypes ((array!73288 0))(
  ( (array!73289 (arr!35297 (Array (_ BitVec 32) (_ BitVec 64))) (size!35835 (_ BitVec 32))) )
))
(declare-fun lt!499341 () array!73288)

(declare-datatypes ((ValueCell!13415 0))(
  ( (ValueCellFull!13415 (v!16813 V!42793)) (EmptyCell!13415) )
))
(declare-datatypes ((array!73290 0))(
  ( (array!73291 (arr!35298 (Array (_ BitVec 32) ValueCell!13415)) (size!35836 (_ BitVec 32))) )
))
(declare-fun lt!499342 () array!73290)

(declare-fun minValue!944 () V!42793)

(declare-fun getCurrentListMapNoExtraKeys!4456 (array!73288 array!73290 (_ BitVec 32) (_ BitVec 32) V!42793 V!42793 (_ BitVec 32) Int) ListLongMap!15871)

(assert (=> b!1124507 (= lt!499344 (getCurrentListMapNoExtraKeys!4456 lt!499341 lt!499342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73290)

(declare-fun dynLambda!2479 (Int (_ BitVec 64)) V!42793)

(assert (=> b!1124507 (= lt!499342 (array!73291 (store (arr!35298 _values!996) i!673 (ValueCellFull!13415 (dynLambda!2479 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35836 _values!996)))))

(declare-fun _keys!1208 () array!73288)

(declare-fun lt!499338 () ListLongMap!15871)

(assert (=> b!1124507 (= lt!499338 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124508 () Bool)

(declare-fun res!751369 () Bool)

(declare-fun e!640124 () Bool)

(assert (=> b!1124508 (=> (not res!751369) (not e!640124))))

(assert (=> b!1124508 (= res!751369 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35835 _keys!1208))))))

(declare-fun b!1124509 () Bool)

(declare-fun e!640131 () Bool)

(declare-fun e!640133 () Bool)

(declare-fun mapRes!44191 () Bool)

(assert (=> b!1124509 (= e!640131 (and e!640133 mapRes!44191))))

(declare-fun condMapEmpty!44191 () Bool)

(declare-fun mapDefault!44191 () ValueCell!13415)

(assert (=> b!1124509 (= condMapEmpty!44191 (= (arr!35298 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13415)) mapDefault!44191)))))

(declare-fun b!1124510 () Bool)

(declare-fun e!640126 () Bool)

(assert (=> b!1124510 (= e!640126 (not e!640129))))

(declare-fun res!751377 () Bool)

(assert (=> b!1124510 (=> res!751377 e!640129)))

(assert (=> b!1124510 (= res!751377 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124510 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36713 0))(
  ( (Unit!36714) )
))
(declare-fun lt!499340 () Unit!36713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73288 (_ BitVec 64) (_ BitVec 32)) Unit!36713)

(assert (=> b!1124510 (= lt!499340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124511 () Bool)

(declare-fun e!640127 () Bool)

(assert (=> b!1124511 (= e!640125 e!640127)))

(declare-fun res!751379 () Bool)

(assert (=> b!1124511 (=> res!751379 e!640127)))

(assert (=> b!1124511 (= res!751379 (not (= (select (arr!35297 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640132 () Bool)

(assert (=> b!1124511 e!640132))

(declare-fun c!109542 () Bool)

(assert (=> b!1124511 (= c!109542 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499339 () Unit!36713)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 (array!73288 array!73290 (_ BitVec 32) (_ BitVec 32) V!42793 V!42793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36713)

(assert (=> b!1124511 (= lt!499339 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124512 () Bool)

(declare-fun res!751371 () Bool)

(assert (=> b!1124512 (=> (not res!751371) (not e!640124))))

(assert (=> b!1124512 (= res!751371 (= (select (arr!35297 _keys!1208) i!673) k0!934))))

(declare-fun b!1124513 () Bool)

(declare-fun res!751374 () Bool)

(assert (=> b!1124513 (=> (not res!751374) (not e!640124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73288 (_ BitVec 32)) Bool)

(assert (=> b!1124513 (= res!751374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124514 () Bool)

(declare-fun res!751367 () Bool)

(declare-fun e!640134 () Bool)

(assert (=> b!1124514 (=> res!751367 e!640134)))

(assert (=> b!1124514 (= res!751367 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124515 () Bool)

(declare-fun call!47416 () ListLongMap!15871)

(declare-fun call!47417 () ListLongMap!15871)

(assert (=> b!1124515 (= e!640132 (= call!47416 call!47417))))

(declare-fun res!751372 () Bool)

(assert (=> start!98012 (=> (not res!751372) (not e!640124))))

(assert (=> start!98012 (= res!751372 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35835 _keys!1208))))))

(assert (=> start!98012 e!640124))

(declare-fun tp_is_empty!28249 () Bool)

(assert (=> start!98012 tp_is_empty!28249))

(declare-fun array_inv!27168 (array!73288) Bool)

(assert (=> start!98012 (array_inv!27168 _keys!1208)))

(assert (=> start!98012 true))

(assert (=> start!98012 tp!83861))

(declare-fun array_inv!27169 (array!73290) Bool)

(assert (=> start!98012 (and (array_inv!27169 _values!996) e!640131)))

(declare-fun bm!47413 () Bool)

(assert (=> bm!47413 (= call!47417 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124516 () Bool)

(declare-fun res!751381 () Bool)

(assert (=> b!1124516 (=> (not res!751381) (not e!640126))))

(declare-datatypes ((List!24665 0))(
  ( (Nil!24662) (Cons!24661 (h!25870 (_ BitVec 64)) (t!35367 List!24665)) )
))
(declare-fun arrayNoDuplicates!0 (array!73288 (_ BitVec 32) List!24665) Bool)

(assert (=> b!1124516 (= res!751381 (arrayNoDuplicates!0 lt!499341 #b00000000000000000000000000000000 Nil!24662))))

(declare-fun bm!47414 () Bool)

(assert (=> bm!47414 (= call!47416 (getCurrentListMapNoExtraKeys!4456 lt!499341 lt!499342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124517 () Bool)

(assert (=> b!1124517 (= e!640124 e!640126)))

(declare-fun res!751376 () Bool)

(assert (=> b!1124517 (=> (not res!751376) (not e!640126))))

(assert (=> b!1124517 (= res!751376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499341 mask!1564))))

(assert (=> b!1124517 (= lt!499341 (array!73289 (store (arr!35297 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35835 _keys!1208)))))

(declare-fun b!1124518 () Bool)

(declare-fun res!751370 () Bool)

(assert (=> b!1124518 (=> (not res!751370) (not e!640124))))

(assert (=> b!1124518 (= res!751370 (and (= (size!35836 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35835 _keys!1208) (size!35836 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124519 () Bool)

(assert (=> b!1124519 (= e!640127 e!640134)))

(declare-fun res!751375 () Bool)

(assert (=> b!1124519 (=> res!751375 e!640134)))

(declare-fun lt!499337 () ListLongMap!15871)

(declare-fun contains!6422 (ListLongMap!15871 (_ BitVec 64)) Bool)

(assert (=> b!1124519 (= res!751375 (not (contains!6422 lt!499337 k0!934)))))

(assert (=> b!1124519 (= lt!499337 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124520 () Bool)

(assert (=> b!1124520 (= e!640133 tp_is_empty!28249)))

(declare-fun b!1124521 () Bool)

(declare-fun res!751373 () Bool)

(assert (=> b!1124521 (=> (not res!751373) (not e!640124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124521 (= res!751373 (validKeyInArray!0 k0!934))))

(declare-fun b!1124522 () Bool)

(assert (=> b!1124522 (= e!640134 true)))

(declare-fun +!3453 (ListLongMap!15871 tuple2!17902) ListLongMap!15871)

(assert (=> b!1124522 (contains!6422 (+!3453 lt!499337 (tuple2!17903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499343 () Unit!36713)

(declare-fun addStillContains!671 (ListLongMap!15871 (_ BitVec 64) V!42793 (_ BitVec 64)) Unit!36713)

(assert (=> b!1124522 (= lt!499343 (addStillContains!671 lt!499337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124523 () Bool)

(declare-fun res!751380 () Bool)

(assert (=> b!1124523 (=> (not res!751380) (not e!640124))))

(assert (=> b!1124523 (= res!751380 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24662))))

(declare-fun b!1124524 () Bool)

(declare-fun -!1088 (ListLongMap!15871 (_ BitVec 64)) ListLongMap!15871)

(assert (=> b!1124524 (= e!640132 (= call!47416 (-!1088 call!47417 k0!934)))))

(declare-fun b!1124525 () Bool)

(declare-fun e!640128 () Bool)

(assert (=> b!1124525 (= e!640128 tp_is_empty!28249)))

(declare-fun mapNonEmpty!44191 () Bool)

(declare-fun tp!83860 () Bool)

(assert (=> mapNonEmpty!44191 (= mapRes!44191 (and tp!83860 e!640128))))

(declare-fun mapRest!44191 () (Array (_ BitVec 32) ValueCell!13415))

(declare-fun mapKey!44191 () (_ BitVec 32))

(declare-fun mapValue!44191 () ValueCell!13415)

(assert (=> mapNonEmpty!44191 (= (arr!35298 _values!996) (store mapRest!44191 mapKey!44191 mapValue!44191))))

(declare-fun b!1124526 () Bool)

(declare-fun res!751368 () Bool)

(assert (=> b!1124526 (=> (not res!751368) (not e!640124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124526 (= res!751368 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44191 () Bool)

(assert (=> mapIsEmpty!44191 mapRes!44191))

(assert (= (and start!98012 res!751372) b!1124526))

(assert (= (and b!1124526 res!751368) b!1124518))

(assert (= (and b!1124518 res!751370) b!1124513))

(assert (= (and b!1124513 res!751374) b!1124523))

(assert (= (and b!1124523 res!751380) b!1124508))

(assert (= (and b!1124508 res!751369) b!1124521))

(assert (= (and b!1124521 res!751373) b!1124512))

(assert (= (and b!1124512 res!751371) b!1124517))

(assert (= (and b!1124517 res!751376) b!1124516))

(assert (= (and b!1124516 res!751381) b!1124510))

(assert (= (and b!1124510 (not res!751377)) b!1124507))

(assert (= (and b!1124507 (not res!751378)) b!1124511))

(assert (= (and b!1124511 c!109542) b!1124524))

(assert (= (and b!1124511 (not c!109542)) b!1124515))

(assert (= (or b!1124524 b!1124515) bm!47414))

(assert (= (or b!1124524 b!1124515) bm!47413))

(assert (= (and b!1124511 (not res!751379)) b!1124519))

(assert (= (and b!1124519 (not res!751375)) b!1124514))

(assert (= (and b!1124514 (not res!751367)) b!1124522))

(assert (= (and b!1124509 condMapEmpty!44191) mapIsEmpty!44191))

(assert (= (and b!1124509 (not condMapEmpty!44191)) mapNonEmpty!44191))

(get-info :version)

(assert (= (and mapNonEmpty!44191 ((_ is ValueCellFull!13415) mapValue!44191)) b!1124525))

(assert (= (and b!1124509 ((_ is ValueCellFull!13415) mapDefault!44191)) b!1124520))

(assert (= start!98012 b!1124509))

(declare-fun b_lambda!18671 () Bool)

(assert (=> (not b_lambda!18671) (not b!1124507)))

(declare-fun t!35365 () Bool)

(declare-fun tb!8523 () Bool)

(assert (=> (and start!98012 (= defaultEntry!1004 defaultEntry!1004) t!35365) tb!8523))

(declare-fun result!17615 () Bool)

(assert (=> tb!8523 (= result!17615 tp_is_empty!28249)))

(assert (=> b!1124507 t!35365))

(declare-fun b_and!38201 () Bool)

(assert (= b_and!38199 (and (=> t!35365 result!17615) b_and!38201)))

(declare-fun m!1038273 () Bool)

(assert (=> b!1124524 m!1038273))

(declare-fun m!1038275 () Bool)

(assert (=> b!1124512 m!1038275))

(declare-fun m!1038277 () Bool)

(assert (=> b!1124517 m!1038277))

(declare-fun m!1038279 () Bool)

(assert (=> b!1124517 m!1038279))

(declare-fun m!1038281 () Bool)

(assert (=> mapNonEmpty!44191 m!1038281))

(declare-fun m!1038283 () Bool)

(assert (=> b!1124526 m!1038283))

(declare-fun m!1038285 () Bool)

(assert (=> b!1124522 m!1038285))

(assert (=> b!1124522 m!1038285))

(declare-fun m!1038287 () Bool)

(assert (=> b!1124522 m!1038287))

(declare-fun m!1038289 () Bool)

(assert (=> b!1124522 m!1038289))

(declare-fun m!1038291 () Bool)

(assert (=> b!1124507 m!1038291))

(declare-fun m!1038293 () Bool)

(assert (=> b!1124507 m!1038293))

(declare-fun m!1038295 () Bool)

(assert (=> b!1124507 m!1038295))

(declare-fun m!1038297 () Bool)

(assert (=> b!1124507 m!1038297))

(declare-fun m!1038299 () Bool)

(assert (=> b!1124516 m!1038299))

(declare-fun m!1038301 () Bool)

(assert (=> b!1124521 m!1038301))

(declare-fun m!1038303 () Bool)

(assert (=> b!1124511 m!1038303))

(declare-fun m!1038305 () Bool)

(assert (=> b!1124511 m!1038305))

(declare-fun m!1038307 () Bool)

(assert (=> b!1124513 m!1038307))

(declare-fun m!1038309 () Bool)

(assert (=> bm!47413 m!1038309))

(declare-fun m!1038311 () Bool)

(assert (=> b!1124510 m!1038311))

(declare-fun m!1038313 () Bool)

(assert (=> b!1124510 m!1038313))

(declare-fun m!1038315 () Bool)

(assert (=> b!1124519 m!1038315))

(assert (=> b!1124519 m!1038309))

(declare-fun m!1038317 () Bool)

(assert (=> bm!47414 m!1038317))

(declare-fun m!1038319 () Bool)

(assert (=> start!98012 m!1038319))

(declare-fun m!1038321 () Bool)

(assert (=> start!98012 m!1038321))

(declare-fun m!1038323 () Bool)

(assert (=> b!1124523 m!1038323))

(check-sat (not b_next!23719) (not bm!47414) (not b!1124510) (not b!1124523) (not b!1124519) (not b!1124507) (not b!1124513) (not mapNonEmpty!44191) (not b!1124517) (not b!1124522) (not b!1124516) (not b!1124526) (not b!1124521) (not b!1124524) (not bm!47413) tp_is_empty!28249 (not b!1124511) b_and!38201 (not b_lambda!18671) (not start!98012))
(check-sat b_and!38201 (not b_next!23719))
