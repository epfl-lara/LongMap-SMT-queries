; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99744 () Bool)

(assert start!99744)

(declare-fun b_free!25323 () Bool)

(declare-fun b_next!25323 () Bool)

(assert (=> start!99744 (= b_free!25323 (not b_next!25323))))

(declare-fun tp!88682 () Bool)

(declare-fun b_and!41513 () Bool)

(assert (=> start!99744 (= tp!88682 b_and!41513)))

(declare-fun b!1184299 () Bool)

(declare-fun e!673345 () Bool)

(declare-fun e!673353 () Bool)

(assert (=> b!1184299 (= e!673345 e!673353)))

(declare-fun res!787180 () Bool)

(assert (=> b!1184299 (=> res!787180 e!673353)))

(declare-datatypes ((array!76505 0))(
  ( (array!76506 (arr!36902 (Array (_ BitVec 32) (_ BitVec 64))) (size!37438 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76505)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184299 (= res!787180 (not (= (select (arr!36902 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184300 () Bool)

(declare-fun e!673348 () Bool)

(declare-fun e!673349 () Bool)

(assert (=> b!1184300 (= e!673348 e!673349)))

(declare-fun res!787174 () Bool)

(assert (=> b!1184300 (=> res!787174 e!673349)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184300 (= res!787174 (not (validKeyInArray!0 (select (arr!36902 _keys!1208) from!1455))))))

(declare-datatypes ((V!44931 0))(
  ( (V!44932 (val!14983 Int)) )
))
(declare-datatypes ((tuple2!19210 0))(
  ( (tuple2!19211 (_1!9616 (_ BitVec 64)) (_2!9616 V!44931)) )
))
(declare-datatypes ((List!25950 0))(
  ( (Nil!25947) (Cons!25946 (h!27155 tuple2!19210) (t!38265 List!25950)) )
))
(declare-datatypes ((ListLongMap!17179 0))(
  ( (ListLongMap!17180 (toList!8605 List!25950)) )
))
(declare-fun lt!536976 () ListLongMap!17179)

(declare-fun lt!536959 () ListLongMap!17179)

(assert (=> b!1184300 (= lt!536976 lt!536959)))

(declare-fun lt!536961 () ListLongMap!17179)

(declare-fun -!1640 (ListLongMap!17179 (_ BitVec 64)) ListLongMap!17179)

(assert (=> b!1184300 (= lt!536959 (-!1640 lt!536961 k0!934))))

(declare-fun zeroValue!944 () V!44931)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!536958 () array!76505)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44931)

(declare-datatypes ((ValueCell!14217 0))(
  ( (ValueCellFull!14217 (v!17621 V!44931)) (EmptyCell!14217) )
))
(declare-datatypes ((array!76507 0))(
  ( (array!76508 (arr!36903 (Array (_ BitVec 32) ValueCell!14217)) (size!37439 (_ BitVec 32))) )
))
(declare-fun lt!536970 () array!76507)

(declare-fun getCurrentListMapNoExtraKeys!5055 (array!76505 array!76507 (_ BitVec 32) (_ BitVec 32) V!44931 V!44931 (_ BitVec 32) Int) ListLongMap!17179)

(assert (=> b!1184300 (= lt!536976 (getCurrentListMapNoExtraKeys!5055 lt!536958 lt!536970 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76507)

(assert (=> b!1184300 (= lt!536961 (getCurrentListMapNoExtraKeys!5055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39207 0))(
  ( (Unit!39208) )
))
(declare-fun lt!536962 () Unit!39207)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 (array!76505 array!76507 (_ BitVec 32) (_ BitVec 32) V!44931 V!44931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39207)

(assert (=> b!1184300 (= lt!536962 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184301 () Bool)

(declare-fun e!673343 () Unit!39207)

(declare-fun Unit!39209 () Unit!39207)

(assert (=> b!1184301 (= e!673343 Unit!39209)))

(declare-fun b!1184302 () Bool)

(declare-fun e!673352 () Bool)

(assert (=> b!1184302 (= e!673352 e!673348)))

(declare-fun res!787170 () Bool)

(assert (=> b!1184302 (=> res!787170 e!673348)))

(assert (=> b!1184302 (= res!787170 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!536963 () ListLongMap!17179)

(assert (=> b!1184302 (= lt!536963 (getCurrentListMapNoExtraKeys!5055 lt!536958 lt!536970 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536975 () V!44931)

(assert (=> b!1184302 (= lt!536970 (array!76508 (store (arr!36903 _values!996) i!673 (ValueCellFull!14217 lt!536975)) (size!37439 _values!996)))))

(declare-fun dynLambda!3006 (Int (_ BitVec 64)) V!44931)

(assert (=> b!1184302 (= lt!536975 (dynLambda!3006 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536973 () ListLongMap!17179)

(assert (=> b!1184302 (= lt!536973 (getCurrentListMapNoExtraKeys!5055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46607 () Bool)

(declare-fun mapRes!46607 () Bool)

(declare-fun tp!88683 () Bool)

(declare-fun e!673351 () Bool)

(assert (=> mapNonEmpty!46607 (= mapRes!46607 (and tp!88683 e!673351))))

(declare-fun mapValue!46607 () ValueCell!14217)

(declare-fun mapRest!46607 () (Array (_ BitVec 32) ValueCell!14217))

(declare-fun mapKey!46607 () (_ BitVec 32))

(assert (=> mapNonEmpty!46607 (= (arr!36903 _values!996) (store mapRest!46607 mapKey!46607 mapValue!46607))))

(declare-fun b!1184303 () Bool)

(declare-fun res!787173 () Bool)

(declare-fun e!673347 () Bool)

(assert (=> b!1184303 (=> (not res!787173) (not e!673347))))

(assert (=> b!1184303 (= res!787173 (and (= (size!37439 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37438 _keys!1208) (size!37439 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184304 () Bool)

(declare-fun res!787176 () Bool)

(assert (=> b!1184304 (=> (not res!787176) (not e!673347))))

(assert (=> b!1184304 (= res!787176 (= (select (arr!36902 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46607 () Bool)

(assert (=> mapIsEmpty!46607 mapRes!46607))

(declare-fun b!1184305 () Bool)

(declare-fun tp_is_empty!29853 () Bool)

(assert (=> b!1184305 (= e!673351 tp_is_empty!29853)))

(declare-fun b!1184307 () Bool)

(declare-fun res!787181 () Bool)

(assert (=> b!1184307 (=> (not res!787181) (not e!673347))))

(assert (=> b!1184307 (= res!787181 (validKeyInArray!0 k0!934))))

(declare-fun b!1184308 () Bool)

(declare-fun e!673350 () Bool)

(assert (=> b!1184308 (= e!673347 e!673350)))

(declare-fun res!787182 () Bool)

(assert (=> b!1184308 (=> (not res!787182) (not e!673350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76505 (_ BitVec 32)) Bool)

(assert (=> b!1184308 (= res!787182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536958 mask!1564))))

(assert (=> b!1184308 (= lt!536958 (array!76506 (store (arr!36902 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37438 _keys!1208)))))

(declare-fun b!1184309 () Bool)

(declare-fun res!787177 () Bool)

(assert (=> b!1184309 (=> (not res!787177) (not e!673347))))

(declare-datatypes ((List!25951 0))(
  ( (Nil!25948) (Cons!25947 (h!27156 (_ BitVec 64)) (t!38266 List!25951)) )
))
(declare-fun arrayNoDuplicates!0 (array!76505 (_ BitVec 32) List!25951) Bool)

(assert (=> b!1184309 (= res!787177 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1184310 () Bool)

(declare-fun Unit!39210 () Unit!39207)

(assert (=> b!1184310 (= e!673343 Unit!39210)))

(declare-fun lt!536960 () Unit!39207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39207)

(assert (=> b!1184310 (= lt!536960 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184310 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536965 () Unit!39207)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76505 (_ BitVec 32) (_ BitVec 32)) Unit!39207)

(assert (=> b!1184310 (= lt!536965 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184310 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25948)))

(declare-fun lt!536967 () Unit!39207)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76505 (_ BitVec 64) (_ BitVec 32) List!25951) Unit!39207)

(assert (=> b!1184310 (= lt!536967 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25948))))

(assert (=> b!1184310 false))

(declare-fun b!1184311 () Bool)

(declare-fun res!787175 () Bool)

(assert (=> b!1184311 (=> (not res!787175) (not e!673347))))

(assert (=> b!1184311 (= res!787175 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37438 _keys!1208))))))

(declare-fun b!1184312 () Bool)

(declare-fun res!787169 () Bool)

(assert (=> b!1184312 (=> (not res!787169) (not e!673347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184312 (= res!787169 (validMask!0 mask!1564))))

(declare-fun b!1184313 () Bool)

(assert (=> b!1184313 (= e!673349 true)))

(declare-fun lt!536966 () ListLongMap!17179)

(declare-fun lt!536972 () ListLongMap!17179)

(assert (=> b!1184313 (= (-!1640 lt!536966 k0!934) lt!536972)))

(declare-fun lt!536964 () V!44931)

(declare-fun lt!536969 () Unit!39207)

(declare-fun addRemoveCommutativeForDiffKeys!165 (ListLongMap!17179 (_ BitVec 64) V!44931 (_ BitVec 64)) Unit!39207)

(assert (=> b!1184313 (= lt!536969 (addRemoveCommutativeForDiffKeys!165 lt!536961 (select (arr!36902 _keys!1208) from!1455) lt!536964 k0!934))))

(assert (=> b!1184313 (and (= lt!536973 lt!536966) (= lt!536959 lt!536976))))

(declare-fun lt!536971 () tuple2!19210)

(declare-fun +!3902 (ListLongMap!17179 tuple2!19210) ListLongMap!17179)

(assert (=> b!1184313 (= lt!536966 (+!3902 lt!536961 lt!536971))))

(assert (=> b!1184313 (not (= (select (arr!36902 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536974 () Unit!39207)

(assert (=> b!1184313 (= lt!536974 e!673343)))

(declare-fun c!117108 () Bool)

(assert (=> b!1184313 (= c!117108 (= (select (arr!36902 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184313 e!673345))

(declare-fun res!787183 () Bool)

(assert (=> b!1184313 (=> (not res!787183) (not e!673345))))

(assert (=> b!1184313 (= res!787183 (= lt!536963 lt!536972))))

(assert (=> b!1184313 (= lt!536972 (+!3902 lt!536959 lt!536971))))

(assert (=> b!1184313 (= lt!536971 (tuple2!19211 (select (arr!36902 _keys!1208) from!1455) lt!536964))))

(declare-fun get!18883 (ValueCell!14217 V!44931) V!44931)

(assert (=> b!1184313 (= lt!536964 (get!18883 (select (arr!36903 _values!996) from!1455) lt!536975))))

(declare-fun b!1184314 () Bool)

(declare-fun res!787172 () Bool)

(assert (=> b!1184314 (=> (not res!787172) (not e!673347))))

(assert (=> b!1184314 (= res!787172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184315 () Bool)

(assert (=> b!1184315 (= e!673350 (not e!673352))))

(declare-fun res!787179 () Bool)

(assert (=> b!1184315 (=> res!787179 e!673352)))

(assert (=> b!1184315 (= res!787179 (bvsgt from!1455 i!673))))

(assert (=> b!1184315 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536968 () Unit!39207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76505 (_ BitVec 64) (_ BitVec 32)) Unit!39207)

(assert (=> b!1184315 (= lt!536968 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184316 () Bool)

(assert (=> b!1184316 (= e!673353 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184317 () Bool)

(declare-fun res!787171 () Bool)

(assert (=> b!1184317 (=> (not res!787171) (not e!673350))))

(assert (=> b!1184317 (= res!787171 (arrayNoDuplicates!0 lt!536958 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1184318 () Bool)

(declare-fun e!673344 () Bool)

(declare-fun e!673354 () Bool)

(assert (=> b!1184318 (= e!673344 (and e!673354 mapRes!46607))))

(declare-fun condMapEmpty!46607 () Bool)

(declare-fun mapDefault!46607 () ValueCell!14217)

(assert (=> b!1184318 (= condMapEmpty!46607 (= (arr!36903 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14217)) mapDefault!46607)))))

(declare-fun res!787178 () Bool)

(assert (=> start!99744 (=> (not res!787178) (not e!673347))))

(assert (=> start!99744 (= res!787178 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37438 _keys!1208))))))

(assert (=> start!99744 e!673347))

(assert (=> start!99744 tp_is_empty!29853))

(declare-fun array_inv!28164 (array!76505) Bool)

(assert (=> start!99744 (array_inv!28164 _keys!1208)))

(assert (=> start!99744 true))

(assert (=> start!99744 tp!88682))

(declare-fun array_inv!28165 (array!76507) Bool)

(assert (=> start!99744 (and (array_inv!28165 _values!996) e!673344)))

(declare-fun b!1184306 () Bool)

(assert (=> b!1184306 (= e!673354 tp_is_empty!29853)))

(assert (= (and start!99744 res!787178) b!1184312))

(assert (= (and b!1184312 res!787169) b!1184303))

(assert (= (and b!1184303 res!787173) b!1184314))

(assert (= (and b!1184314 res!787172) b!1184309))

(assert (= (and b!1184309 res!787177) b!1184311))

(assert (= (and b!1184311 res!787175) b!1184307))

(assert (= (and b!1184307 res!787181) b!1184304))

(assert (= (and b!1184304 res!787176) b!1184308))

(assert (= (and b!1184308 res!787182) b!1184317))

(assert (= (and b!1184317 res!787171) b!1184315))

(assert (= (and b!1184315 (not res!787179)) b!1184302))

(assert (= (and b!1184302 (not res!787170)) b!1184300))

(assert (= (and b!1184300 (not res!787174)) b!1184313))

(assert (= (and b!1184313 res!787183) b!1184299))

(assert (= (and b!1184299 (not res!787180)) b!1184316))

(assert (= (and b!1184313 c!117108) b!1184310))

(assert (= (and b!1184313 (not c!117108)) b!1184301))

(assert (= (and b!1184318 condMapEmpty!46607) mapIsEmpty!46607))

(assert (= (and b!1184318 (not condMapEmpty!46607)) mapNonEmpty!46607))

(get-info :version)

(assert (= (and mapNonEmpty!46607 ((_ is ValueCellFull!14217) mapValue!46607)) b!1184305))

(assert (= (and b!1184318 ((_ is ValueCellFull!14217) mapDefault!46607)) b!1184306))

(assert (= start!99744 b!1184318))

(declare-fun b_lambda!20467 () Bool)

(assert (=> (not b_lambda!20467) (not b!1184302)))

(declare-fun t!38264 () Bool)

(declare-fun tb!10135 () Bool)

(assert (=> (and start!99744 (= defaultEntry!1004 defaultEntry!1004) t!38264) tb!10135))

(declare-fun result!20837 () Bool)

(assert (=> tb!10135 (= result!20837 tp_is_empty!29853)))

(assert (=> b!1184302 t!38264))

(declare-fun b_and!41515 () Bool)

(assert (= b_and!41513 (and (=> t!38264 result!20837) b_and!41515)))

(declare-fun m!1092565 () Bool)

(assert (=> b!1184312 m!1092565))

(declare-fun m!1092567 () Bool)

(assert (=> start!99744 m!1092567))

(declare-fun m!1092569 () Bool)

(assert (=> start!99744 m!1092569))

(declare-fun m!1092571 () Bool)

(assert (=> b!1184317 m!1092571))

(declare-fun m!1092573 () Bool)

(assert (=> b!1184315 m!1092573))

(declare-fun m!1092575 () Bool)

(assert (=> b!1184315 m!1092575))

(declare-fun m!1092577 () Bool)

(assert (=> b!1184309 m!1092577))

(declare-fun m!1092579 () Bool)

(assert (=> b!1184299 m!1092579))

(declare-fun m!1092581 () Bool)

(assert (=> b!1184313 m!1092581))

(declare-fun m!1092583 () Bool)

(assert (=> b!1184313 m!1092583))

(assert (=> b!1184313 m!1092579))

(declare-fun m!1092585 () Bool)

(assert (=> b!1184313 m!1092585))

(declare-fun m!1092587 () Bool)

(assert (=> b!1184313 m!1092587))

(assert (=> b!1184313 m!1092581))

(declare-fun m!1092589 () Bool)

(assert (=> b!1184313 m!1092589))

(assert (=> b!1184313 m!1092579))

(declare-fun m!1092591 () Bool)

(assert (=> b!1184313 m!1092591))

(declare-fun m!1092593 () Bool)

(assert (=> b!1184310 m!1092593))

(declare-fun m!1092595 () Bool)

(assert (=> b!1184310 m!1092595))

(declare-fun m!1092597 () Bool)

(assert (=> b!1184310 m!1092597))

(declare-fun m!1092599 () Bool)

(assert (=> b!1184310 m!1092599))

(declare-fun m!1092601 () Bool)

(assert (=> b!1184310 m!1092601))

(declare-fun m!1092603 () Bool)

(assert (=> b!1184307 m!1092603))

(declare-fun m!1092605 () Bool)

(assert (=> mapNonEmpty!46607 m!1092605))

(declare-fun m!1092607 () Bool)

(assert (=> b!1184300 m!1092607))

(declare-fun m!1092609 () Bool)

(assert (=> b!1184300 m!1092609))

(declare-fun m!1092611 () Bool)

(assert (=> b!1184300 m!1092611))

(assert (=> b!1184300 m!1092579))

(declare-fun m!1092613 () Bool)

(assert (=> b!1184300 m!1092613))

(declare-fun m!1092615 () Bool)

(assert (=> b!1184300 m!1092615))

(assert (=> b!1184300 m!1092579))

(declare-fun m!1092617 () Bool)

(assert (=> b!1184302 m!1092617))

(declare-fun m!1092619 () Bool)

(assert (=> b!1184302 m!1092619))

(declare-fun m!1092621 () Bool)

(assert (=> b!1184302 m!1092621))

(declare-fun m!1092623 () Bool)

(assert (=> b!1184302 m!1092623))

(declare-fun m!1092625 () Bool)

(assert (=> b!1184316 m!1092625))

(declare-fun m!1092627 () Bool)

(assert (=> b!1184308 m!1092627))

(declare-fun m!1092629 () Bool)

(assert (=> b!1184308 m!1092629))

(declare-fun m!1092631 () Bool)

(assert (=> b!1184314 m!1092631))

(declare-fun m!1092633 () Bool)

(assert (=> b!1184304 m!1092633))

(check-sat (not b!1184312) (not start!99744) (not b!1184300) (not b!1184315) (not b!1184310) (not b!1184309) (not b!1184313) (not mapNonEmpty!46607) b_and!41515 (not b!1184302) (not b!1184307) (not b!1184308) (not b_next!25323) (not b!1184317) tp_is_empty!29853 (not b!1184314) (not b!1184316) (not b_lambda!20467))
(check-sat b_and!41515 (not b_next!25323))
