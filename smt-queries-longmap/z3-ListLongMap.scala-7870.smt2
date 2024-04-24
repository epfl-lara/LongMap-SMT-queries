; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98200 () Bool)

(assert start!98200)

(declare-fun b_free!23665 () Bool)

(declare-fun b_next!23665 () Bool)

(assert (=> start!98200 (= b_free!23665 (not b_next!23665))))

(declare-fun tp!83698 () Bool)

(declare-fun b_and!38123 () Bool)

(assert (=> start!98200 (= tp!83698 b_and!38123)))

(declare-fun mapIsEmpty!44110 () Bool)

(declare-fun mapRes!44110 () Bool)

(assert (=> mapIsEmpty!44110 mapRes!44110))

(declare-fun b!1124349 () Bool)

(declare-fun res!750812 () Bool)

(declare-fun e!640211 () Bool)

(assert (=> b!1124349 (=> (not res!750812) (not e!640211))))

(declare-datatypes ((array!73307 0))(
  ( (array!73308 (arr!35300 (Array (_ BitVec 32) (_ BitVec 64))) (size!35837 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73307)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1124349 (= res!750812 (= (select (arr!35300 _keys!1208) i!673) k0!934))))

(declare-fun b!1124350 () Bool)

(declare-fun e!640208 () Bool)

(assert (=> b!1124350 (= e!640211 e!640208)))

(declare-fun res!750803 () Bool)

(assert (=> b!1124350 (=> (not res!750803) (not e!640208))))

(declare-fun lt!499451 () array!73307)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73307 (_ BitVec 32)) Bool)

(assert (=> b!1124350 (= res!750803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499451 mask!1564))))

(assert (=> b!1124350 (= lt!499451 (array!73308 (store (arr!35300 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35837 _keys!1208)))))

(declare-fun b!1124351 () Bool)

(declare-fun res!750811 () Bool)

(assert (=> b!1124351 (=> (not res!750811) (not e!640211))))

(assert (=> b!1124351 (= res!750811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124352 () Bool)

(declare-fun e!640207 () Bool)

(assert (=> b!1124352 (= e!640208 (not e!640207))))

(declare-fun res!750805 () Bool)

(assert (=> b!1124352 (=> res!750805 e!640207)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1124352 (= res!750805 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124352 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36821 0))(
  ( (Unit!36822) )
))
(declare-fun lt!499450 () Unit!36821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73307 (_ BitVec 64) (_ BitVec 32)) Unit!36821)

(assert (=> b!1124352 (= lt!499450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!42721 0))(
  ( (V!42722 (val!14154 Int)) )
))
(declare-fun zeroValue!944 () V!42721)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17784 0))(
  ( (tuple2!17785 (_1!8903 (_ BitVec 64)) (_2!8903 V!42721)) )
))
(declare-datatypes ((List!24577 0))(
  ( (Nil!24574) (Cons!24573 (h!25791 tuple2!17784) (t!35226 List!24577)) )
))
(declare-datatypes ((ListLongMap!15761 0))(
  ( (ListLongMap!15762 (toList!7896 List!24577)) )
))
(declare-fun call!47344 () ListLongMap!15761)

(declare-fun minValue!944 () V!42721)

(declare-datatypes ((ValueCell!13388 0))(
  ( (ValueCellFull!13388 (v!16783 V!42721)) (EmptyCell!13388) )
))
(declare-datatypes ((array!73309 0))(
  ( (array!73310 (arr!35301 (Array (_ BitVec 32) ValueCell!13388)) (size!35838 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73309)

(declare-fun bm!47341 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4423 (array!73307 array!73309 (_ BitVec 32) (_ BitVec 32) V!42721 V!42721 (_ BitVec 32) Int) ListLongMap!15761)

(assert (=> bm!47341 (= call!47344 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124353 () Bool)

(declare-fun res!750807 () Bool)

(assert (=> b!1124353 (=> (not res!750807) (not e!640211))))

(assert (=> b!1124353 (= res!750807 (and (= (size!35838 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35837 _keys!1208) (size!35838 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124354 () Bool)

(declare-fun res!750813 () Bool)

(assert (=> b!1124354 (=> (not res!750813) (not e!640208))))

(declare-datatypes ((List!24578 0))(
  ( (Nil!24575) (Cons!24574 (h!25792 (_ BitVec 64)) (t!35227 List!24578)) )
))
(declare-fun arrayNoDuplicates!0 (array!73307 (_ BitVec 32) List!24578) Bool)

(assert (=> b!1124354 (= res!750813 (arrayNoDuplicates!0 lt!499451 #b00000000000000000000000000000000 Nil!24575))))

(declare-fun b!1124355 () Bool)

(declare-fun e!640203 () Bool)

(assert (=> b!1124355 (= e!640207 e!640203)))

(declare-fun res!750814 () Bool)

(assert (=> b!1124355 (=> res!750814 e!640203)))

(assert (=> b!1124355 (= res!750814 (not (= from!1455 i!673)))))

(declare-fun lt!499448 () array!73309)

(declare-fun lt!499452 () ListLongMap!15761)

(assert (=> b!1124355 (= lt!499452 (getCurrentListMapNoExtraKeys!4423 lt!499451 lt!499448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2506 (Int (_ BitVec 64)) V!42721)

(assert (=> b!1124355 (= lt!499448 (array!73310 (store (arr!35301 _values!996) i!673 (ValueCellFull!13388 (dynLambda!2506 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35838 _values!996)))))

(declare-fun lt!499447 () ListLongMap!15761)

(assert (=> b!1124355 (= lt!499447 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47345 () ListLongMap!15761)

(declare-fun bm!47342 () Bool)

(assert (=> bm!47342 (= call!47345 (getCurrentListMapNoExtraKeys!4423 lt!499451 lt!499448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124356 () Bool)

(declare-fun e!640212 () Bool)

(declare-fun e!640204 () Bool)

(assert (=> b!1124356 (= e!640212 (and e!640204 mapRes!44110))))

(declare-fun condMapEmpty!44110 () Bool)

(declare-fun mapDefault!44110 () ValueCell!13388)

(assert (=> b!1124356 (= condMapEmpty!44110 (= (arr!35301 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13388)) mapDefault!44110)))))

(declare-fun b!1124357 () Bool)

(declare-fun e!640206 () Bool)

(assert (=> b!1124357 (= e!640203 e!640206)))

(declare-fun res!750802 () Bool)

(assert (=> b!1124357 (=> res!750802 e!640206)))

(assert (=> b!1124357 (= res!750802 (not (= (select (arr!35300 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640205 () Bool)

(assert (=> b!1124357 e!640205))

(declare-fun c!109898 () Bool)

(assert (=> b!1124357 (= c!109898 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499449 () Unit!36821)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 (array!73307 array!73309 (_ BitVec 32) (_ BitVec 32) V!42721 V!42721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36821)

(assert (=> b!1124357 (= lt!499449 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124358 () Bool)

(declare-fun tp_is_empty!28195 () Bool)

(assert (=> b!1124358 (= e!640204 tp_is_empty!28195)))

(declare-fun res!750808 () Bool)

(assert (=> start!98200 (=> (not res!750808) (not e!640211))))

(assert (=> start!98200 (= res!750808 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35837 _keys!1208))))))

(assert (=> start!98200 e!640211))

(assert (=> start!98200 tp_is_empty!28195))

(declare-fun array_inv!27168 (array!73307) Bool)

(assert (=> start!98200 (array_inv!27168 _keys!1208)))

(assert (=> start!98200 true))

(assert (=> start!98200 tp!83698))

(declare-fun array_inv!27169 (array!73309) Bool)

(assert (=> start!98200 (and (array_inv!27169 _values!996) e!640212)))

(declare-fun b!1124348 () Bool)

(assert (=> b!1124348 (= e!640206 true)))

(declare-fun lt!499453 () Bool)

(declare-fun contains!6455 (ListLongMap!15761 (_ BitVec 64)) Bool)

(assert (=> b!1124348 (= lt!499453 (contains!6455 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1124359 () Bool)

(declare-fun res!750809 () Bool)

(assert (=> b!1124359 (=> (not res!750809) (not e!640211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124359 (= res!750809 (validMask!0 mask!1564))))

(declare-fun b!1124360 () Bool)

(declare-fun e!640210 () Bool)

(assert (=> b!1124360 (= e!640210 tp_is_empty!28195)))

(declare-fun b!1124361 () Bool)

(declare-fun res!750806 () Bool)

(assert (=> b!1124361 (=> (not res!750806) (not e!640211))))

(assert (=> b!1124361 (= res!750806 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24575))))

(declare-fun b!1124362 () Bool)

(declare-fun res!750810 () Bool)

(assert (=> b!1124362 (=> (not res!750810) (not e!640211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124362 (= res!750810 (validKeyInArray!0 k0!934))))

(declare-fun b!1124363 () Bool)

(assert (=> b!1124363 (= e!640205 (= call!47345 call!47344))))

(declare-fun mapNonEmpty!44110 () Bool)

(declare-fun tp!83699 () Bool)

(assert (=> mapNonEmpty!44110 (= mapRes!44110 (and tp!83699 e!640210))))

(declare-fun mapKey!44110 () (_ BitVec 32))

(declare-fun mapRest!44110 () (Array (_ BitVec 32) ValueCell!13388))

(declare-fun mapValue!44110 () ValueCell!13388)

(assert (=> mapNonEmpty!44110 (= (arr!35301 _values!996) (store mapRest!44110 mapKey!44110 mapValue!44110))))

(declare-fun b!1124364 () Bool)

(declare-fun -!1090 (ListLongMap!15761 (_ BitVec 64)) ListLongMap!15761)

(assert (=> b!1124364 (= e!640205 (= call!47345 (-!1090 call!47344 k0!934)))))

(declare-fun b!1124365 () Bool)

(declare-fun res!750804 () Bool)

(assert (=> b!1124365 (=> (not res!750804) (not e!640211))))

(assert (=> b!1124365 (= res!750804 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35837 _keys!1208))))))

(assert (= (and start!98200 res!750808) b!1124359))

(assert (= (and b!1124359 res!750809) b!1124353))

(assert (= (and b!1124353 res!750807) b!1124351))

(assert (= (and b!1124351 res!750811) b!1124361))

(assert (= (and b!1124361 res!750806) b!1124365))

(assert (= (and b!1124365 res!750804) b!1124362))

(assert (= (and b!1124362 res!750810) b!1124349))

(assert (= (and b!1124349 res!750812) b!1124350))

(assert (= (and b!1124350 res!750803) b!1124354))

(assert (= (and b!1124354 res!750813) b!1124352))

(assert (= (and b!1124352 (not res!750805)) b!1124355))

(assert (= (and b!1124355 (not res!750814)) b!1124357))

(assert (= (and b!1124357 c!109898) b!1124364))

(assert (= (and b!1124357 (not c!109898)) b!1124363))

(assert (= (or b!1124364 b!1124363) bm!47342))

(assert (= (or b!1124364 b!1124363) bm!47341))

(assert (= (and b!1124357 (not res!750802)) b!1124348))

(assert (= (and b!1124356 condMapEmpty!44110) mapIsEmpty!44110))

(assert (= (and b!1124356 (not condMapEmpty!44110)) mapNonEmpty!44110))

(get-info :version)

(assert (= (and mapNonEmpty!44110 ((_ is ValueCellFull!13388) mapValue!44110)) b!1124360))

(assert (= (and b!1124356 ((_ is ValueCellFull!13388) mapDefault!44110)) b!1124358))

(assert (= start!98200 b!1124356))

(declare-fun b_lambda!18645 () Bool)

(assert (=> (not b_lambda!18645) (not b!1124355)))

(declare-fun t!35225 () Bool)

(declare-fun tb!8469 () Bool)

(assert (=> (and start!98200 (= defaultEntry!1004 defaultEntry!1004) t!35225) tb!8469))

(declare-fun result!17507 () Bool)

(assert (=> tb!8469 (= result!17507 tp_is_empty!28195)))

(assert (=> b!1124355 t!35225))

(declare-fun b_and!38125 () Bool)

(assert (= b_and!38123 (and (=> t!35225 result!17507) b_and!38125)))

(declare-fun m!1039241 () Bool)

(assert (=> b!1124350 m!1039241))

(declare-fun m!1039243 () Bool)

(assert (=> b!1124350 m!1039243))

(declare-fun m!1039245 () Bool)

(assert (=> b!1124359 m!1039245))

(declare-fun m!1039247 () Bool)

(assert (=> b!1124361 m!1039247))

(declare-fun m!1039249 () Bool)

(assert (=> mapNonEmpty!44110 m!1039249))

(declare-fun m!1039251 () Bool)

(assert (=> b!1124357 m!1039251))

(declare-fun m!1039253 () Bool)

(assert (=> b!1124357 m!1039253))

(declare-fun m!1039255 () Bool)

(assert (=> b!1124364 m!1039255))

(declare-fun m!1039257 () Bool)

(assert (=> b!1124362 m!1039257))

(declare-fun m!1039259 () Bool)

(assert (=> b!1124348 m!1039259))

(assert (=> b!1124348 m!1039259))

(declare-fun m!1039261 () Bool)

(assert (=> b!1124348 m!1039261))

(declare-fun m!1039263 () Bool)

(assert (=> b!1124352 m!1039263))

(declare-fun m!1039265 () Bool)

(assert (=> b!1124352 m!1039265))

(declare-fun m!1039267 () Bool)

(assert (=> start!98200 m!1039267))

(declare-fun m!1039269 () Bool)

(assert (=> start!98200 m!1039269))

(declare-fun m!1039271 () Bool)

(assert (=> b!1124354 m!1039271))

(assert (=> bm!47341 m!1039259))

(declare-fun m!1039273 () Bool)

(assert (=> b!1124355 m!1039273))

(declare-fun m!1039275 () Bool)

(assert (=> b!1124355 m!1039275))

(declare-fun m!1039277 () Bool)

(assert (=> b!1124355 m!1039277))

(declare-fun m!1039279 () Bool)

(assert (=> b!1124355 m!1039279))

(declare-fun m!1039281 () Bool)

(assert (=> b!1124349 m!1039281))

(declare-fun m!1039283 () Bool)

(assert (=> b!1124351 m!1039283))

(declare-fun m!1039285 () Bool)

(assert (=> bm!47342 m!1039285))

(check-sat (not b!1124352) (not b!1124348) (not b_next!23665) (not b!1124361) (not b!1124350) (not b!1124364) (not b!1124355) (not b!1124354) (not start!98200) (not b_lambda!18645) (not b!1124351) (not b!1124359) (not bm!47342) b_and!38125 (not b!1124357) (not mapNonEmpty!44110) (not b!1124362) (not bm!47341) tp_is_empty!28195)
(check-sat b_and!38125 (not b_next!23665))
