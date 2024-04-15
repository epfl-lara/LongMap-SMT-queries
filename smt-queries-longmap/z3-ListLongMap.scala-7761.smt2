; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97304 () Bool)

(assert start!97304)

(declare-fun b_free!23281 () Bool)

(declare-fun b_next!23281 () Bool)

(assert (=> start!97304 (= b_free!23281 (not b_next!23281))))

(declare-fun tp!82142 () Bool)

(declare-fun b_and!37373 () Bool)

(assert (=> start!97304 (= tp!82142 b_and!37373)))

(declare-fun b!1108278 () Bool)

(declare-fun e!632237 () Bool)

(declare-fun e!632238 () Bool)

(assert (=> b!1108278 (= e!632237 e!632238)))

(declare-fun res!739639 () Bool)

(assert (=> b!1108278 (=> (not res!739639) (not e!632238))))

(declare-datatypes ((array!71898 0))(
  ( (array!71899 (arr!34602 (Array (_ BitVec 32) (_ BitVec 64))) (size!35140 (_ BitVec 32))) )
))
(declare-fun lt!495601 () array!71898)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71898 (_ BitVec 32)) Bool)

(assert (=> b!1108278 (= res!739639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495601 mask!1564))))

(declare-fun _keys!1208 () array!71898)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108278 (= lt!495601 (array!71899 (store (arr!34602 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35140 _keys!1208)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46513 () Bool)

(declare-datatypes ((V!41849 0))(
  ( (V!41850 (val!13827 Int)) )
))
(declare-datatypes ((ValueCell!13061 0))(
  ( (ValueCellFull!13061 (v!16459 V!41849)) (EmptyCell!13061) )
))
(declare-datatypes ((array!71900 0))(
  ( (array!71901 (arr!34603 (Array (_ BitVec 32) ValueCell!13061)) (size!35141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71900)

(declare-fun minValue!944 () V!41849)

(declare-datatypes ((tuple2!17526 0))(
  ( (tuple2!17527 (_1!8774 (_ BitVec 64)) (_2!8774 V!41849)) )
))
(declare-datatypes ((List!24183 0))(
  ( (Nil!24180) (Cons!24179 (h!25388 tuple2!17526) (t!34501 List!24183)) )
))
(declare-datatypes ((ListLongMap!15495 0))(
  ( (ListLongMap!15496 (toList!7763 List!24183)) )
))
(declare-fun call!46516 () ListLongMap!15495)

(declare-fun zeroValue!944 () V!41849)

(declare-fun getCurrentListMapNoExtraKeys!4279 (array!71898 array!71900 (_ BitVec 32) (_ BitVec 32) V!41849 V!41849 (_ BitVec 32) Int) ListLongMap!15495)

(declare-fun dynLambda!2346 (Int (_ BitVec 64)) V!41849)

(assert (=> bm!46513 (= call!46516 (getCurrentListMapNoExtraKeys!4279 lt!495601 (array!71901 (store (arr!34603 _values!996) i!673 (ValueCellFull!13061 (dynLambda!2346 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35141 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46514 () Bool)

(declare-fun call!46517 () ListLongMap!15495)

(assert (=> bm!46514 (= call!46517 (getCurrentListMapNoExtraKeys!4279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108279 () Bool)

(declare-fun e!632231 () Bool)

(declare-fun tp_is_empty!27541 () Bool)

(assert (=> b!1108279 (= e!632231 tp_is_empty!27541)))

(declare-fun res!739637 () Bool)

(assert (=> start!97304 (=> (not res!739637) (not e!632237))))

(assert (=> start!97304 (= res!739637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35140 _keys!1208))))))

(assert (=> start!97304 e!632237))

(assert (=> start!97304 tp_is_empty!27541))

(declare-fun array_inv!26682 (array!71898) Bool)

(assert (=> start!97304 (array_inv!26682 _keys!1208)))

(assert (=> start!97304 true))

(assert (=> start!97304 tp!82142))

(declare-fun e!632236 () Bool)

(declare-fun array_inv!26683 (array!71900) Bool)

(assert (=> start!97304 (and (array_inv!26683 _values!996) e!632236)))

(declare-fun b!1108280 () Bool)

(declare-fun e!632232 () Bool)

(assert (=> b!1108280 (= e!632232 tp_is_empty!27541)))

(declare-fun b!1108281 () Bool)

(declare-fun mapRes!43129 () Bool)

(assert (=> b!1108281 (= e!632236 (and e!632232 mapRes!43129))))

(declare-fun condMapEmpty!43129 () Bool)

(declare-fun mapDefault!43129 () ValueCell!13061)

(assert (=> b!1108281 (= condMapEmpty!43129 (= (arr!34603 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13061)) mapDefault!43129)))))

(declare-fun b!1108282 () Bool)

(declare-fun res!739642 () Bool)

(assert (=> b!1108282 (=> (not res!739642) (not e!632237))))

(assert (=> b!1108282 (= res!739642 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35140 _keys!1208))))))

(declare-fun b!1108283 () Bool)

(declare-fun res!739641 () Bool)

(assert (=> b!1108283 (=> (not res!739641) (not e!632237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108283 (= res!739641 (validMask!0 mask!1564))))

(declare-fun b!1108284 () Bool)

(declare-fun res!739636 () Bool)

(assert (=> b!1108284 (=> (not res!739636) (not e!632238))))

(declare-datatypes ((List!24184 0))(
  ( (Nil!24181) (Cons!24180 (h!25389 (_ BitVec 64)) (t!34502 List!24184)) )
))
(declare-fun arrayNoDuplicates!0 (array!71898 (_ BitVec 32) List!24184) Bool)

(assert (=> b!1108284 (= res!739636 (arrayNoDuplicates!0 lt!495601 #b00000000000000000000000000000000 Nil!24181))))

(declare-fun b!1108285 () Bool)

(declare-fun res!739633 () Bool)

(assert (=> b!1108285 (=> (not res!739633) (not e!632237))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1108285 (= res!739633 (= (select (arr!34602 _keys!1208) i!673) k0!934))))

(declare-fun b!1108286 () Bool)

(declare-fun res!739635 () Bool)

(assert (=> b!1108286 (=> (not res!739635) (not e!632237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108286 (= res!739635 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43129 () Bool)

(declare-fun tp!82141 () Bool)

(assert (=> mapNonEmpty!43129 (= mapRes!43129 (and tp!82141 e!632231))))

(declare-fun mapValue!43129 () ValueCell!13061)

(declare-fun mapRest!43129 () (Array (_ BitVec 32) ValueCell!13061))

(declare-fun mapKey!43129 () (_ BitVec 32))

(assert (=> mapNonEmpty!43129 (= (arr!34603 _values!996) (store mapRest!43129 mapKey!43129 mapValue!43129))))

(declare-fun b!1108287 () Bool)

(declare-fun res!739632 () Bool)

(assert (=> b!1108287 (=> (not res!739632) (not e!632237))))

(assert (=> b!1108287 (= res!739632 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24181))))

(declare-fun b!1108288 () Bool)

(declare-fun res!739634 () Bool)

(assert (=> b!1108288 (=> (not res!739634) (not e!632237))))

(assert (=> b!1108288 (= res!739634 (and (= (size!35141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35140 _keys!1208) (size!35141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108289 () Bool)

(declare-fun res!739638 () Bool)

(assert (=> b!1108289 (=> (not res!739638) (not e!632237))))

(assert (=> b!1108289 (= res!739638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43129 () Bool)

(assert (=> mapIsEmpty!43129 mapRes!43129))

(declare-fun e!632233 () Bool)

(declare-fun b!1108290 () Bool)

(declare-fun -!985 (ListLongMap!15495 (_ BitVec 64)) ListLongMap!15495)

(assert (=> b!1108290 (= e!632233 (= call!46516 (-!985 call!46517 k0!934)))))

(declare-fun b!1108291 () Bool)

(declare-fun e!632234 () Bool)

(assert (=> b!1108291 (= e!632234 true)))

(assert (=> b!1108291 e!632233))

(declare-fun c!109080 () Bool)

(assert (=> b!1108291 (= c!109080 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36187 0))(
  ( (Unit!36188) )
))
(declare-fun lt!495602 () Unit!36187)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 (array!71898 array!71900 (_ BitVec 32) (_ BitVec 32) V!41849 V!41849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36187)

(assert (=> b!1108291 (= lt!495602 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108292 () Bool)

(assert (=> b!1108292 (= e!632238 (not e!632234))))

(declare-fun res!739640 () Bool)

(assert (=> b!1108292 (=> res!739640 e!632234)))

(assert (=> b!1108292 (= res!739640 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35140 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108292 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495603 () Unit!36187)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71898 (_ BitVec 64) (_ BitVec 32)) Unit!36187)

(assert (=> b!1108292 (= lt!495603 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108293 () Bool)

(assert (=> b!1108293 (= e!632233 (= call!46516 call!46517))))

(assert (= (and start!97304 res!739637) b!1108283))

(assert (= (and b!1108283 res!739641) b!1108288))

(assert (= (and b!1108288 res!739634) b!1108289))

(assert (= (and b!1108289 res!739638) b!1108287))

(assert (= (and b!1108287 res!739632) b!1108282))

(assert (= (and b!1108282 res!739642) b!1108286))

(assert (= (and b!1108286 res!739635) b!1108285))

(assert (= (and b!1108285 res!739633) b!1108278))

(assert (= (and b!1108278 res!739639) b!1108284))

(assert (= (and b!1108284 res!739636) b!1108292))

(assert (= (and b!1108292 (not res!739640)) b!1108291))

(assert (= (and b!1108291 c!109080) b!1108290))

(assert (= (and b!1108291 (not c!109080)) b!1108293))

(assert (= (or b!1108290 b!1108293) bm!46513))

(assert (= (or b!1108290 b!1108293) bm!46514))

(assert (= (and b!1108281 condMapEmpty!43129) mapIsEmpty!43129))

(assert (= (and b!1108281 (not condMapEmpty!43129)) mapNonEmpty!43129))

(get-info :version)

(assert (= (and mapNonEmpty!43129 ((_ is ValueCellFull!13061) mapValue!43129)) b!1108279))

(assert (= (and b!1108281 ((_ is ValueCellFull!13061) mapDefault!43129)) b!1108280))

(assert (= start!97304 b!1108281))

(declare-fun b_lambda!18283 () Bool)

(assert (=> (not b_lambda!18283) (not bm!46513)))

(declare-fun t!34500 () Bool)

(declare-fun tb!8139 () Bool)

(assert (=> (and start!97304 (= defaultEntry!1004 defaultEntry!1004) t!34500) tb!8139))

(declare-fun result!16847 () Bool)

(assert (=> tb!8139 (= result!16847 tp_is_empty!27541)))

(assert (=> bm!46513 t!34500))

(declare-fun b_and!37375 () Bool)

(assert (= b_and!37373 (and (=> t!34500 result!16847) b_and!37375)))

(declare-fun m!1026315 () Bool)

(assert (=> b!1108284 m!1026315))

(declare-fun m!1026317 () Bool)

(assert (=> bm!46513 m!1026317))

(declare-fun m!1026319 () Bool)

(assert (=> bm!46513 m!1026319))

(declare-fun m!1026321 () Bool)

(assert (=> bm!46513 m!1026321))

(declare-fun m!1026323 () Bool)

(assert (=> start!97304 m!1026323))

(declare-fun m!1026325 () Bool)

(assert (=> start!97304 m!1026325))

(declare-fun m!1026327 () Bool)

(assert (=> b!1108292 m!1026327))

(declare-fun m!1026329 () Bool)

(assert (=> b!1108292 m!1026329))

(declare-fun m!1026331 () Bool)

(assert (=> b!1108290 m!1026331))

(declare-fun m!1026333 () Bool)

(assert (=> b!1108285 m!1026333))

(declare-fun m!1026335 () Bool)

(assert (=> mapNonEmpty!43129 m!1026335))

(declare-fun m!1026337 () Bool)

(assert (=> b!1108291 m!1026337))

(declare-fun m!1026339 () Bool)

(assert (=> b!1108286 m!1026339))

(declare-fun m!1026341 () Bool)

(assert (=> b!1108283 m!1026341))

(declare-fun m!1026343 () Bool)

(assert (=> b!1108287 m!1026343))

(declare-fun m!1026345 () Bool)

(assert (=> b!1108289 m!1026345))

(declare-fun m!1026347 () Bool)

(assert (=> bm!46514 m!1026347))

(declare-fun m!1026349 () Bool)

(assert (=> b!1108278 m!1026349))

(declare-fun m!1026351 () Bool)

(assert (=> b!1108278 m!1026351))

(check-sat (not b!1108291) (not b!1108287) (not b_next!23281) (not mapNonEmpty!43129) (not b!1108286) (not b_lambda!18283) (not b!1108284) (not b!1108292) (not b!1108283) (not b!1108289) (not start!97304) tp_is_empty!27541 (not bm!46514) b_and!37375 (not b!1108278) (not bm!46513) (not b!1108290))
(check-sat b_and!37375 (not b_next!23281))
