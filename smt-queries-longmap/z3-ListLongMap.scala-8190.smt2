; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100000 () Bool)

(assert start!100000)

(declare-fun b_free!25585 () Bool)

(declare-fun b_next!25585 () Bool)

(assert (=> start!100000 (= b_free!25585 (not b_next!25585))))

(declare-fun tp!89469 () Bool)

(declare-fun b_and!42015 () Bool)

(assert (=> start!100000 (= tp!89469 b_and!42015)))

(declare-fun b!1191297 () Bool)

(declare-fun res!792406 () Bool)

(declare-fun e!677182 () Bool)

(assert (=> b!1191297 (=> (not res!792406) (not e!677182))))

(declare-datatypes ((array!76950 0))(
  ( (array!76951 (arr!37125 (Array (_ BitVec 32) (_ BitVec 64))) (size!37663 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76950)

(declare-datatypes ((List!26247 0))(
  ( (Nil!26244) (Cons!26243 (h!27452 (_ BitVec 64)) (t!38815 List!26247)) )
))
(declare-fun arrayNoDuplicates!0 (array!76950 (_ BitVec 32) List!26247) Bool)

(assert (=> b!1191297 (= res!792406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26244))))

(declare-fun b!1191298 () Bool)

(declare-fun e!677188 () Bool)

(declare-fun e!677187 () Bool)

(declare-fun mapRes!47000 () Bool)

(assert (=> b!1191298 (= e!677188 (and e!677187 mapRes!47000))))

(declare-fun condMapEmpty!47000 () Bool)

(declare-datatypes ((V!45281 0))(
  ( (V!45282 (val!15114 Int)) )
))
(declare-datatypes ((ValueCell!14348 0))(
  ( (ValueCellFull!14348 (v!17751 V!45281)) (EmptyCell!14348) )
))
(declare-datatypes ((array!76952 0))(
  ( (array!76953 (arr!37126 (Array (_ BitVec 32) ValueCell!14348)) (size!37664 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76952)

(declare-fun mapDefault!47000 () ValueCell!14348)

(assert (=> b!1191298 (= condMapEmpty!47000 (= (arr!37126 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14348)) mapDefault!47000)))))

(declare-fun b!1191299 () Bool)

(declare-fun e!677183 () Bool)

(declare-fun e!677186 () Bool)

(assert (=> b!1191299 (= e!677183 (not e!677186))))

(declare-fun res!792401 () Bool)

(assert (=> b!1191299 (=> res!792401 e!677186)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191299 (= res!792401 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191299 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39399 0))(
  ( (Unit!39400) )
))
(declare-fun lt!541637 () Unit!39399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76950 (_ BitVec 64) (_ BitVec 32)) Unit!39399)

(assert (=> b!1191299 (= lt!541637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47000 () Bool)

(declare-fun tp!89468 () Bool)

(declare-fun e!677184 () Bool)

(assert (=> mapNonEmpty!47000 (= mapRes!47000 (and tp!89468 e!677184))))

(declare-fun mapValue!47000 () ValueCell!14348)

(declare-fun mapKey!47000 () (_ BitVec 32))

(declare-fun mapRest!47000 () (Array (_ BitVec 32) ValueCell!14348))

(assert (=> mapNonEmpty!47000 (= (arr!37126 _values!996) (store mapRest!47000 mapKey!47000 mapValue!47000))))

(declare-fun b!1191300 () Bool)

(declare-fun res!792399 () Bool)

(assert (=> b!1191300 (=> (not res!792399) (not e!677182))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1191300 (= res!792399 (and (= (size!37664 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37663 _keys!1208) (size!37664 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191301 () Bool)

(declare-fun res!792398 () Bool)

(assert (=> b!1191301 (=> (not res!792398) (not e!677183))))

(declare-fun lt!541633 () array!76950)

(assert (=> b!1191301 (= res!792398 (arrayNoDuplicates!0 lt!541633 #b00000000000000000000000000000000 Nil!26244))))

(declare-fun b!1191302 () Bool)

(declare-fun res!792407 () Bool)

(assert (=> b!1191302 (=> (not res!792407) (not e!677182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76950 (_ BitVec 32)) Bool)

(assert (=> b!1191302 (= res!792407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191303 () Bool)

(declare-fun e!677185 () Bool)

(assert (=> b!1191303 (= e!677185 true)))

(declare-fun zeroValue!944 () V!45281)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541635 () array!76952)

(declare-fun minValue!944 () V!45281)

(declare-datatypes ((tuple2!19534 0))(
  ( (tuple2!19535 (_1!9778 (_ BitVec 64)) (_2!9778 V!45281)) )
))
(declare-datatypes ((List!26248 0))(
  ( (Nil!26245) (Cons!26244 (h!27453 tuple2!19534) (t!38816 List!26248)) )
))
(declare-datatypes ((ListLongMap!17503 0))(
  ( (ListLongMap!17504 (toList!8767 List!26248)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5217 (array!76950 array!76952 (_ BitVec 32) (_ BitVec 32) V!45281 V!45281 (_ BitVec 32) Int) ListLongMap!17503)

(declare-fun -!1710 (ListLongMap!17503 (_ BitVec 64)) ListLongMap!17503)

(assert (=> b!1191303 (= (getCurrentListMapNoExtraKeys!5217 lt!541633 lt!541635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1710 (getCurrentListMapNoExtraKeys!5217 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541638 () Unit!39399)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!960 (array!76950 array!76952 (_ BitVec 32) (_ BitVec 32) V!45281 V!45281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39399)

(assert (=> b!1191303 (= lt!541638 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191304 () Bool)

(declare-fun res!792403 () Bool)

(assert (=> b!1191304 (=> (not res!792403) (not e!677182))))

(assert (=> b!1191304 (= res!792403 (= (select (arr!37125 _keys!1208) i!673) k0!934))))

(declare-fun b!1191305 () Bool)

(declare-fun res!792400 () Bool)

(assert (=> b!1191305 (=> (not res!792400) (not e!677182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191305 (= res!792400 (validMask!0 mask!1564))))

(declare-fun b!1191306 () Bool)

(assert (=> b!1191306 (= e!677186 e!677185)))

(declare-fun res!792404 () Bool)

(assert (=> b!1191306 (=> res!792404 e!677185)))

(assert (=> b!1191306 (= res!792404 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541636 () ListLongMap!17503)

(assert (=> b!1191306 (= lt!541636 (getCurrentListMapNoExtraKeys!5217 lt!541633 lt!541635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3106 (Int (_ BitVec 64)) V!45281)

(assert (=> b!1191306 (= lt!541635 (array!76953 (store (arr!37126 _values!996) i!673 (ValueCellFull!14348 (dynLambda!3106 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37664 _values!996)))))

(declare-fun lt!541634 () ListLongMap!17503)

(assert (=> b!1191306 (= lt!541634 (getCurrentListMapNoExtraKeys!5217 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!792409 () Bool)

(assert (=> start!100000 (=> (not res!792409) (not e!677182))))

(assert (=> start!100000 (= res!792409 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37663 _keys!1208))))))

(assert (=> start!100000 e!677182))

(declare-fun tp_is_empty!30115 () Bool)

(assert (=> start!100000 tp_is_empty!30115))

(declare-fun array_inv!28434 (array!76950) Bool)

(assert (=> start!100000 (array_inv!28434 _keys!1208)))

(assert (=> start!100000 true))

(assert (=> start!100000 tp!89469))

(declare-fun array_inv!28435 (array!76952) Bool)

(assert (=> start!100000 (and (array_inv!28435 _values!996) e!677188)))

(declare-fun b!1191307 () Bool)

(assert (=> b!1191307 (= e!677182 e!677183)))

(declare-fun res!792402 () Bool)

(assert (=> b!1191307 (=> (not res!792402) (not e!677183))))

(assert (=> b!1191307 (= res!792402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541633 mask!1564))))

(assert (=> b!1191307 (= lt!541633 (array!76951 (store (arr!37125 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37663 _keys!1208)))))

(declare-fun b!1191308 () Bool)

(assert (=> b!1191308 (= e!677184 tp_is_empty!30115)))

(declare-fun b!1191309 () Bool)

(assert (=> b!1191309 (= e!677187 tp_is_empty!30115)))

(declare-fun b!1191310 () Bool)

(declare-fun res!792405 () Bool)

(assert (=> b!1191310 (=> (not res!792405) (not e!677182))))

(assert (=> b!1191310 (= res!792405 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37663 _keys!1208))))))

(declare-fun b!1191311 () Bool)

(declare-fun res!792408 () Bool)

(assert (=> b!1191311 (=> (not res!792408) (not e!677182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191311 (= res!792408 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47000 () Bool)

(assert (=> mapIsEmpty!47000 mapRes!47000))

(assert (= (and start!100000 res!792409) b!1191305))

(assert (= (and b!1191305 res!792400) b!1191300))

(assert (= (and b!1191300 res!792399) b!1191302))

(assert (= (and b!1191302 res!792407) b!1191297))

(assert (= (and b!1191297 res!792406) b!1191310))

(assert (= (and b!1191310 res!792405) b!1191311))

(assert (= (and b!1191311 res!792408) b!1191304))

(assert (= (and b!1191304 res!792403) b!1191307))

(assert (= (and b!1191307 res!792402) b!1191301))

(assert (= (and b!1191301 res!792398) b!1191299))

(assert (= (and b!1191299 (not res!792401)) b!1191306))

(assert (= (and b!1191306 (not res!792404)) b!1191303))

(assert (= (and b!1191298 condMapEmpty!47000) mapIsEmpty!47000))

(assert (= (and b!1191298 (not condMapEmpty!47000)) mapNonEmpty!47000))

(get-info :version)

(assert (= (and mapNonEmpty!47000 ((_ is ValueCellFull!14348) mapValue!47000)) b!1191308))

(assert (= (and b!1191298 ((_ is ValueCellFull!14348) mapDefault!47000)) b!1191309))

(assert (= start!100000 b!1191298))

(declare-fun b_lambda!20711 () Bool)

(assert (=> (not b_lambda!20711) (not b!1191306)))

(declare-fun t!38814 () Bool)

(declare-fun tb!10389 () Bool)

(assert (=> (and start!100000 (= defaultEntry!1004 defaultEntry!1004) t!38814) tb!10389))

(declare-fun result!21353 () Bool)

(assert (=> tb!10389 (= result!21353 tp_is_empty!30115)))

(assert (=> b!1191306 t!38814))

(declare-fun b_and!42017 () Bool)

(assert (= b_and!42015 (and (=> t!38814 result!21353) b_and!42017)))

(declare-fun m!1099277 () Bool)

(assert (=> mapNonEmpty!47000 m!1099277))

(declare-fun m!1099279 () Bool)

(assert (=> start!100000 m!1099279))

(declare-fun m!1099281 () Bool)

(assert (=> start!100000 m!1099281))

(declare-fun m!1099283 () Bool)

(assert (=> b!1191297 m!1099283))

(declare-fun m!1099285 () Bool)

(assert (=> b!1191304 m!1099285))

(declare-fun m!1099287 () Bool)

(assert (=> b!1191301 m!1099287))

(declare-fun m!1099289 () Bool)

(assert (=> b!1191299 m!1099289))

(declare-fun m!1099291 () Bool)

(assert (=> b!1191299 m!1099291))

(declare-fun m!1099293 () Bool)

(assert (=> b!1191305 m!1099293))

(declare-fun m!1099295 () Bool)

(assert (=> b!1191311 m!1099295))

(declare-fun m!1099297 () Bool)

(assert (=> b!1191306 m!1099297))

(declare-fun m!1099299 () Bool)

(assert (=> b!1191306 m!1099299))

(declare-fun m!1099301 () Bool)

(assert (=> b!1191306 m!1099301))

(declare-fun m!1099303 () Bool)

(assert (=> b!1191306 m!1099303))

(declare-fun m!1099305 () Bool)

(assert (=> b!1191302 m!1099305))

(declare-fun m!1099307 () Bool)

(assert (=> b!1191307 m!1099307))

(declare-fun m!1099309 () Bool)

(assert (=> b!1191307 m!1099309))

(declare-fun m!1099311 () Bool)

(assert (=> b!1191303 m!1099311))

(declare-fun m!1099313 () Bool)

(assert (=> b!1191303 m!1099313))

(assert (=> b!1191303 m!1099313))

(declare-fun m!1099315 () Bool)

(assert (=> b!1191303 m!1099315))

(declare-fun m!1099317 () Bool)

(assert (=> b!1191303 m!1099317))

(check-sat (not start!100000) (not b!1191301) (not b!1191306) b_and!42017 (not b!1191307) (not b!1191303) (not b!1191299) (not b!1191311) (not b_lambda!20711) (not b!1191305) tp_is_empty!30115 (not mapNonEmpty!47000) (not b!1191297) (not b!1191302) (not b_next!25585))
(check-sat b_and!42017 (not b_next!25585))
