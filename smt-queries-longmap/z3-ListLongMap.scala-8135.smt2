; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99678 () Bool)

(assert start!99678)

(declare-fun b_free!25257 () Bool)

(declare-fun b_next!25257 () Bool)

(assert (=> start!99678 (= b_free!25257 (not b_next!25257))))

(declare-fun tp!88485 () Bool)

(declare-fun b_and!41381 () Bool)

(assert (=> start!99678 (= tp!88485 b_and!41381)))

(declare-fun b!1182253 () Bool)

(declare-fun e!672161 () Bool)

(declare-fun e!672164 () Bool)

(assert (=> b!1182253 (= e!672161 e!672164)))

(declare-fun res!785697 () Bool)

(assert (=> b!1182253 (=> res!785697 e!672164)))

(declare-datatypes ((array!76377 0))(
  ( (array!76378 (arr!36838 (Array (_ BitVec 32) (_ BitVec 64))) (size!37374 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76377)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182253 (= res!785697 (not (validKeyInArray!0 (select (arr!36838 _keys!1208) from!1455))))))

(declare-datatypes ((V!44843 0))(
  ( (V!44844 (val!14950 Int)) )
))
(declare-datatypes ((tuple2!19158 0))(
  ( (tuple2!19159 (_1!9590 (_ BitVec 64)) (_2!9590 V!44843)) )
))
(declare-datatypes ((List!25899 0))(
  ( (Nil!25896) (Cons!25895 (h!27104 tuple2!19158) (t!38148 List!25899)) )
))
(declare-datatypes ((ListLongMap!17127 0))(
  ( (ListLongMap!17128 (toList!8579 List!25899)) )
))
(declare-fun lt!535085 () ListLongMap!17127)

(declare-fun lt!535089 () ListLongMap!17127)

(assert (=> b!1182253 (= lt!535085 lt!535089)))

(declare-fun lt!535093 () ListLongMap!17127)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1617 (ListLongMap!17127 (_ BitVec 64)) ListLongMap!17127)

(assert (=> b!1182253 (= lt!535089 (-!1617 lt!535093 k0!934))))

(declare-fun zeroValue!944 () V!44843)

(declare-fun lt!535077 () array!76377)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14184 0))(
  ( (ValueCellFull!14184 (v!17588 V!44843)) (EmptyCell!14184) )
))
(declare-datatypes ((array!76379 0))(
  ( (array!76380 (arr!36839 (Array (_ BitVec 32) ValueCell!14184)) (size!37375 (_ BitVec 32))) )
))
(declare-fun lt!535088 () array!76379)

(declare-fun minValue!944 () V!44843)

(declare-fun getCurrentListMapNoExtraKeys!5032 (array!76377 array!76379 (_ BitVec 32) (_ BitVec 32) V!44843 V!44843 (_ BitVec 32) Int) ListLongMap!17127)

(assert (=> b!1182253 (= lt!535085 (getCurrentListMapNoExtraKeys!5032 lt!535077 lt!535088 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76379)

(assert (=> b!1182253 (= lt!535093 (getCurrentListMapNoExtraKeys!5032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39111 0))(
  ( (Unit!39112) )
))
(declare-fun lt!535095 () Unit!39111)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 (array!76377 array!76379 (_ BitVec 32) (_ BitVec 32) V!44843 V!44843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39111)

(assert (=> b!1182253 (= lt!535095 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182254 () Bool)

(declare-fun e!672156 () Bool)

(declare-fun e!672166 () Bool)

(assert (=> b!1182254 (= e!672156 e!672166)))

(declare-fun res!785693 () Bool)

(assert (=> b!1182254 (=> (not res!785693) (not e!672166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76377 (_ BitVec 32)) Bool)

(assert (=> b!1182254 (= res!785693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535077 mask!1564))))

(assert (=> b!1182254 (= lt!535077 (array!76378 (store (arr!36838 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37374 _keys!1208)))))

(declare-fun b!1182255 () Bool)

(declare-fun e!672159 () Bool)

(declare-fun e!672157 () Bool)

(assert (=> b!1182255 (= e!672159 e!672157)))

(declare-fun res!785696 () Bool)

(assert (=> b!1182255 (=> res!785696 e!672157)))

(assert (=> b!1182255 (= res!785696 (not (= (select (arr!36838 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182256 () Bool)

(declare-fun e!672158 () Bool)

(assert (=> b!1182256 (= e!672166 (not e!672158))))

(declare-fun res!785688 () Bool)

(assert (=> b!1182256 (=> res!785688 e!672158)))

(assert (=> b!1182256 (= res!785688 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182256 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535092 () Unit!39111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76377 (_ BitVec 64) (_ BitVec 32)) Unit!39111)

(assert (=> b!1182256 (= lt!535092 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182257 () Bool)

(declare-fun res!785689 () Bool)

(assert (=> b!1182257 (=> (not res!785689) (not e!672156))))

(assert (=> b!1182257 (= res!785689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182258 () Bool)

(declare-fun res!785698 () Bool)

(assert (=> b!1182258 (=> (not res!785698) (not e!672156))))

(declare-datatypes ((List!25900 0))(
  ( (Nil!25897) (Cons!25896 (h!27105 (_ BitVec 64)) (t!38149 List!25900)) )
))
(declare-fun arrayNoDuplicates!0 (array!76377 (_ BitVec 32) List!25900) Bool)

(assert (=> b!1182258 (= res!785698 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25897))))

(declare-fun b!1182259 () Bool)

(declare-fun e!672160 () Unit!39111)

(declare-fun Unit!39113 () Unit!39111)

(assert (=> b!1182259 (= e!672160 Unit!39113)))

(declare-fun b!1182260 () Bool)

(assert (=> b!1182260 (= e!672157 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182261 () Bool)

(declare-fun e!672162 () Bool)

(declare-fun e!672155 () Bool)

(declare-fun mapRes!46508 () Bool)

(assert (=> b!1182261 (= e!672162 (and e!672155 mapRes!46508))))

(declare-fun condMapEmpty!46508 () Bool)

(declare-fun mapDefault!46508 () ValueCell!14184)

(assert (=> b!1182261 (= condMapEmpty!46508 (= (arr!36839 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14184)) mapDefault!46508)))))

(declare-fun b!1182262 () Bool)

(declare-fun res!785691 () Bool)

(assert (=> b!1182262 (=> (not res!785691) (not e!672156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182262 (= res!785691 (validMask!0 mask!1564))))

(declare-fun b!1182263 () Bool)

(declare-fun res!785695 () Bool)

(assert (=> b!1182263 (=> (not res!785695) (not e!672166))))

(assert (=> b!1182263 (= res!785695 (arrayNoDuplicates!0 lt!535077 #b00000000000000000000000000000000 Nil!25897))))

(declare-fun b!1182264 () Bool)

(declare-fun e!672165 () Bool)

(declare-fun tp_is_empty!29787 () Bool)

(assert (=> b!1182264 (= e!672165 tp_is_empty!29787)))

(declare-fun res!785692 () Bool)

(assert (=> start!99678 (=> (not res!785692) (not e!672156))))

(assert (=> start!99678 (= res!785692 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37374 _keys!1208))))))

(assert (=> start!99678 e!672156))

(assert (=> start!99678 tp_is_empty!29787))

(declare-fun array_inv!28126 (array!76377) Bool)

(assert (=> start!99678 (array_inv!28126 _keys!1208)))

(assert (=> start!99678 true))

(assert (=> start!99678 tp!88485))

(declare-fun array_inv!28127 (array!76379) Bool)

(assert (=> start!99678 (and (array_inv!28127 _values!996) e!672162)))

(declare-fun b!1182265 () Bool)

(assert (=> b!1182265 (= e!672158 e!672161)))

(declare-fun res!785687 () Bool)

(assert (=> b!1182265 (=> res!785687 e!672161)))

(assert (=> b!1182265 (= res!785687 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!535086 () ListLongMap!17127)

(assert (=> b!1182265 (= lt!535086 (getCurrentListMapNoExtraKeys!5032 lt!535077 lt!535088 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535081 () V!44843)

(assert (=> b!1182265 (= lt!535088 (array!76380 (store (arr!36839 _values!996) i!673 (ValueCellFull!14184 lt!535081)) (size!37375 _values!996)))))

(declare-fun dynLambda!2987 (Int (_ BitVec 64)) V!44843)

(assert (=> b!1182265 (= lt!535081 (dynLambda!2987 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535080 () ListLongMap!17127)

(assert (=> b!1182265 (= lt!535080 (getCurrentListMapNoExtraKeys!5032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182266 () Bool)

(declare-fun res!785686 () Bool)

(assert (=> b!1182266 (=> (not res!785686) (not e!672156))))

(assert (=> b!1182266 (= res!785686 (and (= (size!37375 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37374 _keys!1208) (size!37375 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46508 () Bool)

(assert (=> mapIsEmpty!46508 mapRes!46508))

(declare-fun b!1182267 () Bool)

(declare-fun res!785684 () Bool)

(assert (=> b!1182267 (=> (not res!785684) (not e!672156))))

(assert (=> b!1182267 (= res!785684 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37374 _keys!1208))))))

(declare-fun b!1182268 () Bool)

(assert (=> b!1182268 (= e!672155 tp_is_empty!29787)))

(declare-fun b!1182269 () Bool)

(assert (=> b!1182269 (= e!672164 true)))

(declare-fun lt!535094 () ListLongMap!17127)

(declare-fun lt!535087 () ListLongMap!17127)

(assert (=> b!1182269 (= (-!1617 lt!535094 k0!934) lt!535087)))

(declare-fun lt!535082 () V!44843)

(declare-fun lt!535079 () Unit!39111)

(declare-fun addRemoveCommutativeForDiffKeys!146 (ListLongMap!17127 (_ BitVec 64) V!44843 (_ BitVec 64)) Unit!39111)

(assert (=> b!1182269 (= lt!535079 (addRemoveCommutativeForDiffKeys!146 lt!535093 (select (arr!36838 _keys!1208) from!1455) lt!535082 k0!934))))

(assert (=> b!1182269 (and (= lt!535080 lt!535094) (= lt!535089 lt!535085))))

(declare-fun lt!535083 () tuple2!19158)

(declare-fun +!3883 (ListLongMap!17127 tuple2!19158) ListLongMap!17127)

(assert (=> b!1182269 (= lt!535094 (+!3883 lt!535093 lt!535083))))

(assert (=> b!1182269 (not (= (select (arr!36838 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535090 () Unit!39111)

(assert (=> b!1182269 (= lt!535090 e!672160)))

(declare-fun c!117009 () Bool)

(assert (=> b!1182269 (= c!117009 (= (select (arr!36838 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182269 e!672159))

(declare-fun res!785694 () Bool)

(assert (=> b!1182269 (=> (not res!785694) (not e!672159))))

(assert (=> b!1182269 (= res!785694 (= lt!535086 lt!535087))))

(assert (=> b!1182269 (= lt!535087 (+!3883 lt!535089 lt!535083))))

(assert (=> b!1182269 (= lt!535083 (tuple2!19159 (select (arr!36838 _keys!1208) from!1455) lt!535082))))

(declare-fun get!18842 (ValueCell!14184 V!44843) V!44843)

(assert (=> b!1182269 (= lt!535082 (get!18842 (select (arr!36839 _values!996) from!1455) lt!535081))))

(declare-fun b!1182270 () Bool)

(declare-fun res!785685 () Bool)

(assert (=> b!1182270 (=> (not res!785685) (not e!672156))))

(assert (=> b!1182270 (= res!785685 (validKeyInArray!0 k0!934))))

(declare-fun b!1182271 () Bool)

(declare-fun res!785690 () Bool)

(assert (=> b!1182271 (=> (not res!785690) (not e!672156))))

(assert (=> b!1182271 (= res!785690 (= (select (arr!36838 _keys!1208) i!673) k0!934))))

(declare-fun b!1182272 () Bool)

(declare-fun Unit!39114 () Unit!39111)

(assert (=> b!1182272 (= e!672160 Unit!39114)))

(declare-fun lt!535078 () Unit!39111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39111)

(assert (=> b!1182272 (= lt!535078 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182272 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535091 () Unit!39111)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76377 (_ BitVec 32) (_ BitVec 32)) Unit!39111)

(assert (=> b!1182272 (= lt!535091 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182272 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25897)))

(declare-fun lt!535084 () Unit!39111)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76377 (_ BitVec 64) (_ BitVec 32) List!25900) Unit!39111)

(assert (=> b!1182272 (= lt!535084 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25897))))

(assert (=> b!1182272 false))

(declare-fun mapNonEmpty!46508 () Bool)

(declare-fun tp!88484 () Bool)

(assert (=> mapNonEmpty!46508 (= mapRes!46508 (and tp!88484 e!672165))))

(declare-fun mapValue!46508 () ValueCell!14184)

(declare-fun mapKey!46508 () (_ BitVec 32))

(declare-fun mapRest!46508 () (Array (_ BitVec 32) ValueCell!14184))

(assert (=> mapNonEmpty!46508 (= (arr!36839 _values!996) (store mapRest!46508 mapKey!46508 mapValue!46508))))

(assert (= (and start!99678 res!785692) b!1182262))

(assert (= (and b!1182262 res!785691) b!1182266))

(assert (= (and b!1182266 res!785686) b!1182257))

(assert (= (and b!1182257 res!785689) b!1182258))

(assert (= (and b!1182258 res!785698) b!1182267))

(assert (= (and b!1182267 res!785684) b!1182270))

(assert (= (and b!1182270 res!785685) b!1182271))

(assert (= (and b!1182271 res!785690) b!1182254))

(assert (= (and b!1182254 res!785693) b!1182263))

(assert (= (and b!1182263 res!785695) b!1182256))

(assert (= (and b!1182256 (not res!785688)) b!1182265))

(assert (= (and b!1182265 (not res!785687)) b!1182253))

(assert (= (and b!1182253 (not res!785697)) b!1182269))

(assert (= (and b!1182269 res!785694) b!1182255))

(assert (= (and b!1182255 (not res!785696)) b!1182260))

(assert (= (and b!1182269 c!117009) b!1182272))

(assert (= (and b!1182269 (not c!117009)) b!1182259))

(assert (= (and b!1182261 condMapEmpty!46508) mapIsEmpty!46508))

(assert (= (and b!1182261 (not condMapEmpty!46508)) mapNonEmpty!46508))

(get-info :version)

(assert (= (and mapNonEmpty!46508 ((_ is ValueCellFull!14184) mapValue!46508)) b!1182264))

(assert (= (and b!1182261 ((_ is ValueCellFull!14184) mapDefault!46508)) b!1182268))

(assert (= start!99678 b!1182261))

(declare-fun b_lambda!20401 () Bool)

(assert (=> (not b_lambda!20401) (not b!1182265)))

(declare-fun t!38147 () Bool)

(declare-fun tb!10069 () Bool)

(assert (=> (and start!99678 (= defaultEntry!1004 defaultEntry!1004) t!38147) tb!10069))

(declare-fun result!20705 () Bool)

(assert (=> tb!10069 (= result!20705 tp_is_empty!29787)))

(assert (=> b!1182265 t!38147))

(declare-fun b_and!41383 () Bool)

(assert (= b_and!41381 (and (=> t!38147 result!20705) b_and!41383)))

(declare-fun m!1090255 () Bool)

(assert (=> b!1182269 m!1090255))

(assert (=> b!1182269 m!1090255))

(declare-fun m!1090257 () Bool)

(assert (=> b!1182269 m!1090257))

(declare-fun m!1090259 () Bool)

(assert (=> b!1182269 m!1090259))

(declare-fun m!1090261 () Bool)

(assert (=> b!1182269 m!1090261))

(declare-fun m!1090263 () Bool)

(assert (=> b!1182269 m!1090263))

(declare-fun m!1090265 () Bool)

(assert (=> b!1182269 m!1090265))

(declare-fun m!1090267 () Bool)

(assert (=> b!1182269 m!1090267))

(assert (=> b!1182269 m!1090259))

(declare-fun m!1090269 () Bool)

(assert (=> b!1182254 m!1090269))

(declare-fun m!1090271 () Bool)

(assert (=> b!1182254 m!1090271))

(declare-fun m!1090273 () Bool)

(assert (=> b!1182265 m!1090273))

(declare-fun m!1090275 () Bool)

(assert (=> b!1182265 m!1090275))

(declare-fun m!1090277 () Bool)

(assert (=> b!1182265 m!1090277))

(declare-fun m!1090279 () Bool)

(assert (=> b!1182265 m!1090279))

(declare-fun m!1090281 () Bool)

(assert (=> b!1182258 m!1090281))

(assert (=> b!1182255 m!1090259))

(declare-fun m!1090283 () Bool)

(assert (=> b!1182253 m!1090283))

(declare-fun m!1090285 () Bool)

(assert (=> b!1182253 m!1090285))

(declare-fun m!1090287 () Bool)

(assert (=> b!1182253 m!1090287))

(declare-fun m!1090289 () Bool)

(assert (=> b!1182253 m!1090289))

(assert (=> b!1182253 m!1090259))

(declare-fun m!1090291 () Bool)

(assert (=> b!1182253 m!1090291))

(assert (=> b!1182253 m!1090259))

(declare-fun m!1090293 () Bool)

(assert (=> b!1182257 m!1090293))

(declare-fun m!1090295 () Bool)

(assert (=> b!1182262 m!1090295))

(declare-fun m!1090297 () Bool)

(assert (=> b!1182256 m!1090297))

(declare-fun m!1090299 () Bool)

(assert (=> b!1182256 m!1090299))

(declare-fun m!1090301 () Bool)

(assert (=> b!1182272 m!1090301))

(declare-fun m!1090303 () Bool)

(assert (=> b!1182272 m!1090303))

(declare-fun m!1090305 () Bool)

(assert (=> b!1182272 m!1090305))

(declare-fun m!1090307 () Bool)

(assert (=> b!1182272 m!1090307))

(declare-fun m!1090309 () Bool)

(assert (=> b!1182272 m!1090309))

(declare-fun m!1090311 () Bool)

(assert (=> b!1182271 m!1090311))

(declare-fun m!1090313 () Bool)

(assert (=> mapNonEmpty!46508 m!1090313))

(declare-fun m!1090315 () Bool)

(assert (=> start!99678 m!1090315))

(declare-fun m!1090317 () Bool)

(assert (=> start!99678 m!1090317))

(declare-fun m!1090319 () Bool)

(assert (=> b!1182270 m!1090319))

(declare-fun m!1090321 () Bool)

(assert (=> b!1182260 m!1090321))

(declare-fun m!1090323 () Bool)

(assert (=> b!1182263 m!1090323))

(check-sat (not b_lambda!20401) (not b!1182262) (not b!1182270) (not b_next!25257) (not b!1182253) (not b!1182260) (not b!1182258) (not b!1182257) (not mapNonEmpty!46508) b_and!41383 (not b!1182256) (not start!99678) tp_is_empty!29787 (not b!1182272) (not b!1182265) (not b!1182269) (not b!1182254) (not b!1182263))
(check-sat b_and!41383 (not b_next!25257))
