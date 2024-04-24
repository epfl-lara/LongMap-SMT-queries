; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100266 () Bool)

(assert start!100266)

(declare-fun b_free!25609 () Bool)

(declare-fun b_next!25609 () Bool)

(assert (=> start!100266 (= b_free!25609 (not b_next!25609))))

(declare-fun tp!89540 () Bool)

(declare-fun b_and!42087 () Bool)

(assert (=> start!100266 (= tp!89540 b_and!42087)))

(declare-fun res!793411 () Bool)

(declare-fun e!678384 () Bool)

(assert (=> start!100266 (=> (not res!793411) (not e!678384))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77109 0))(
  ( (array!77110 (arr!37198 (Array (_ BitVec 32) (_ BitVec 64))) (size!37735 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77109)

(assert (=> start!100266 (= res!793411 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37735 _keys!1208))))))

(assert (=> start!100266 e!678384))

(declare-fun tp_is_empty!30139 () Bool)

(assert (=> start!100266 tp_is_empty!30139))

(declare-fun array_inv!28426 (array!77109) Bool)

(assert (=> start!100266 (array_inv!28426 _keys!1208)))

(assert (=> start!100266 true))

(assert (=> start!100266 tp!89540))

(declare-datatypes ((V!45313 0))(
  ( (V!45314 (val!15126 Int)) )
))
(declare-datatypes ((ValueCell!14360 0))(
  ( (ValueCellFull!14360 (v!17760 V!45313)) (EmptyCell!14360) )
))
(declare-datatypes ((array!77111 0))(
  ( (array!77112 (arr!37199 (Array (_ BitVec 32) ValueCell!14360)) (size!37736 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77111)

(declare-fun e!678381 () Bool)

(declare-fun array_inv!28427 (array!77111) Bool)

(assert (=> start!100266 (and (array_inv!28427 _values!996) e!678381)))

(declare-fun b!1193274 () Bool)

(declare-fun e!678383 () Bool)

(assert (=> b!1193274 (= e!678383 tp_is_empty!30139)))

(declare-fun mapIsEmpty!47036 () Bool)

(declare-fun mapRes!47036 () Bool)

(assert (=> mapIsEmpty!47036 mapRes!47036))

(declare-fun b!1193275 () Bool)

(declare-fun res!793412 () Bool)

(assert (=> b!1193275 (=> (not res!793412) (not e!678384))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193275 (= res!793412 (validKeyInArray!0 k0!934))))

(declare-fun b!1193276 () Bool)

(declare-fun res!793409 () Bool)

(assert (=> b!1193276 (=> (not res!793409) (not e!678384))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193276 (= res!793409 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37735 _keys!1208))))))

(declare-fun b!1193277 () Bool)

(declare-fun e!678380 () Bool)

(declare-fun e!678385 () Bool)

(assert (=> b!1193277 (= e!678380 (not e!678385))))

(declare-fun res!793413 () Bool)

(assert (=> b!1193277 (=> res!793413 e!678385)))

(assert (=> b!1193277 (= res!793413 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193277 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39525 0))(
  ( (Unit!39526) )
))
(declare-fun lt!542528 () Unit!39525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77109 (_ BitVec 64) (_ BitVec 32)) Unit!39525)

(assert (=> b!1193277 (= lt!542528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193278 () Bool)

(assert (=> b!1193278 (= e!678381 (and e!678383 mapRes!47036))))

(declare-fun condMapEmpty!47036 () Bool)

(declare-fun mapDefault!47036 () ValueCell!14360)

(assert (=> b!1193278 (= condMapEmpty!47036 (= (arr!37199 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14360)) mapDefault!47036)))))

(declare-fun b!1193279 () Bool)

(declare-fun res!793414 () Bool)

(assert (=> b!1193279 (=> (not res!793414) (not e!678384))))

(declare-datatypes ((List!26218 0))(
  ( (Nil!26215) (Cons!26214 (h!27432 (_ BitVec 64)) (t!38811 List!26218)) )
))
(declare-fun arrayNoDuplicates!0 (array!77109 (_ BitVec 32) List!26218) Bool)

(assert (=> b!1193279 (= res!793414 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26215))))

(declare-fun b!1193280 () Bool)

(declare-fun res!793415 () Bool)

(assert (=> b!1193280 (=> (not res!793415) (not e!678380))))

(declare-fun lt!542529 () array!77109)

(assert (=> b!1193280 (= res!793415 (arrayNoDuplicates!0 lt!542529 #b00000000000000000000000000000000 Nil!26215))))

(declare-fun b!1193281 () Bool)

(declare-fun res!793407 () Bool)

(assert (=> b!1193281 (=> (not res!793407) (not e!678384))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1193281 (= res!793407 (and (= (size!37736 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37735 _keys!1208) (size!37736 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193282 () Bool)

(declare-fun res!793405 () Bool)

(assert (=> b!1193282 (=> (not res!793405) (not e!678384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77109 (_ BitVec 32)) Bool)

(assert (=> b!1193282 (= res!793405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193283 () Bool)

(declare-fun res!793408 () Bool)

(assert (=> b!1193283 (=> (not res!793408) (not e!678384))))

(assert (=> b!1193283 (= res!793408 (= (select (arr!37198 _keys!1208) i!673) k0!934))))

(declare-fun b!1193284 () Bool)

(declare-fun e!678386 () Bool)

(assert (=> b!1193284 (= e!678385 e!678386)))

(declare-fun res!793406 () Bool)

(assert (=> b!1193284 (=> res!793406 e!678386)))

(assert (=> b!1193284 (= res!793406 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45313)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542527 () array!77111)

(declare-datatypes ((tuple2!19476 0))(
  ( (tuple2!19477 (_1!9749 (_ BitVec 64)) (_2!9749 V!45313)) )
))
(declare-datatypes ((List!26219 0))(
  ( (Nil!26216) (Cons!26215 (h!27433 tuple2!19476) (t!38812 List!26219)) )
))
(declare-datatypes ((ListLongMap!17453 0))(
  ( (ListLongMap!17454 (toList!8742 List!26219)) )
))
(declare-fun lt!542526 () ListLongMap!17453)

(declare-fun minValue!944 () V!45313)

(declare-fun getCurrentListMapNoExtraKeys!5210 (array!77109 array!77111 (_ BitVec 32) (_ BitVec 32) V!45313 V!45313 (_ BitVec 32) Int) ListLongMap!17453)

(assert (=> b!1193284 (= lt!542526 (getCurrentListMapNoExtraKeys!5210 lt!542529 lt!542527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3161 (Int (_ BitVec 64)) V!45313)

(assert (=> b!1193284 (= lt!542527 (array!77112 (store (arr!37199 _values!996) i!673 (ValueCellFull!14360 (dynLambda!3161 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37736 _values!996)))))

(declare-fun lt!542525 () ListLongMap!17453)

(assert (=> b!1193284 (= lt!542525 (getCurrentListMapNoExtraKeys!5210 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47036 () Bool)

(declare-fun tp!89541 () Bool)

(declare-fun e!678379 () Bool)

(assert (=> mapNonEmpty!47036 (= mapRes!47036 (and tp!89541 e!678379))))

(declare-fun mapRest!47036 () (Array (_ BitVec 32) ValueCell!14360))

(declare-fun mapKey!47036 () (_ BitVec 32))

(declare-fun mapValue!47036 () ValueCell!14360)

(assert (=> mapNonEmpty!47036 (= (arr!37199 _values!996) (store mapRest!47036 mapKey!47036 mapValue!47036))))

(declare-fun b!1193285 () Bool)

(assert (=> b!1193285 (= e!678384 e!678380)))

(declare-fun res!793404 () Bool)

(assert (=> b!1193285 (=> (not res!793404) (not e!678380))))

(assert (=> b!1193285 (= res!793404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542529 mask!1564))))

(assert (=> b!1193285 (= lt!542529 (array!77110 (store (arr!37198 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37735 _keys!1208)))))

(declare-fun b!1193286 () Bool)

(assert (=> b!1193286 (= e!678386 true)))

(declare-fun -!1749 (ListLongMap!17453 (_ BitVec 64)) ListLongMap!17453)

(assert (=> b!1193286 (= (getCurrentListMapNoExtraKeys!5210 lt!542529 lt!542527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1749 (getCurrentListMapNoExtraKeys!5210 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542530 () Unit!39525)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!964 (array!77109 array!77111 (_ BitVec 32) (_ BitVec 32) V!45313 V!45313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39525)

(assert (=> b!1193286 (= lt!542530 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193287 () Bool)

(declare-fun res!793410 () Bool)

(assert (=> b!1193287 (=> (not res!793410) (not e!678384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193287 (= res!793410 (validMask!0 mask!1564))))

(declare-fun b!1193288 () Bool)

(assert (=> b!1193288 (= e!678379 tp_is_empty!30139)))

(assert (= (and start!100266 res!793411) b!1193287))

(assert (= (and b!1193287 res!793410) b!1193281))

(assert (= (and b!1193281 res!793407) b!1193282))

(assert (= (and b!1193282 res!793405) b!1193279))

(assert (= (and b!1193279 res!793414) b!1193276))

(assert (= (and b!1193276 res!793409) b!1193275))

(assert (= (and b!1193275 res!793412) b!1193283))

(assert (= (and b!1193283 res!793408) b!1193285))

(assert (= (and b!1193285 res!793404) b!1193280))

(assert (= (and b!1193280 res!793415) b!1193277))

(assert (= (and b!1193277 (not res!793413)) b!1193284))

(assert (= (and b!1193284 (not res!793406)) b!1193286))

(assert (= (and b!1193278 condMapEmpty!47036) mapIsEmpty!47036))

(assert (= (and b!1193278 (not condMapEmpty!47036)) mapNonEmpty!47036))

(get-info :version)

(assert (= (and mapNonEmpty!47036 ((_ is ValueCellFull!14360) mapValue!47036)) b!1193288))

(assert (= (and b!1193278 ((_ is ValueCellFull!14360) mapDefault!47036)) b!1193274))

(assert (= start!100266 b!1193278))

(declare-fun b_lambda!20747 () Bool)

(assert (=> (not b_lambda!20747) (not b!1193284)))

(declare-fun t!38810 () Bool)

(declare-fun tb!10413 () Bool)

(assert (=> (and start!100266 (= defaultEntry!1004 defaultEntry!1004) t!38810) tb!10413))

(declare-fun result!21401 () Bool)

(assert (=> tb!10413 (= result!21401 tp_is_empty!30139)))

(assert (=> b!1193284 t!38810))

(declare-fun b_and!42089 () Bool)

(assert (= b_and!42087 (and (=> t!38810 result!21401) b_and!42089)))

(declare-fun m!1101963 () Bool)

(assert (=> b!1193286 m!1101963))

(declare-fun m!1101965 () Bool)

(assert (=> b!1193286 m!1101965))

(assert (=> b!1193286 m!1101965))

(declare-fun m!1101967 () Bool)

(assert (=> b!1193286 m!1101967))

(declare-fun m!1101969 () Bool)

(assert (=> b!1193286 m!1101969))

(declare-fun m!1101971 () Bool)

(assert (=> b!1193282 m!1101971))

(declare-fun m!1101973 () Bool)

(assert (=> b!1193285 m!1101973))

(declare-fun m!1101975 () Bool)

(assert (=> b!1193285 m!1101975))

(declare-fun m!1101977 () Bool)

(assert (=> b!1193283 m!1101977))

(declare-fun m!1101979 () Bool)

(assert (=> b!1193277 m!1101979))

(declare-fun m!1101981 () Bool)

(assert (=> b!1193277 m!1101981))

(declare-fun m!1101983 () Bool)

(assert (=> b!1193284 m!1101983))

(declare-fun m!1101985 () Bool)

(assert (=> b!1193284 m!1101985))

(declare-fun m!1101987 () Bool)

(assert (=> b!1193284 m!1101987))

(declare-fun m!1101989 () Bool)

(assert (=> b!1193284 m!1101989))

(declare-fun m!1101991 () Bool)

(assert (=> mapNonEmpty!47036 m!1101991))

(declare-fun m!1101993 () Bool)

(assert (=> b!1193275 m!1101993))

(declare-fun m!1101995 () Bool)

(assert (=> start!100266 m!1101995))

(declare-fun m!1101997 () Bool)

(assert (=> start!100266 m!1101997))

(declare-fun m!1101999 () Bool)

(assert (=> b!1193287 m!1101999))

(declare-fun m!1102001 () Bool)

(assert (=> b!1193279 m!1102001))

(declare-fun m!1102003 () Bool)

(assert (=> b!1193280 m!1102003))

(check-sat b_and!42089 (not b!1193280) (not b!1193287) (not mapNonEmpty!47036) (not b_next!25609) tp_is_empty!30139 (not b!1193285) (not b!1193286) (not b!1193282) (not b!1193277) (not b!1193279) (not b_lambda!20747) (not b!1193275) (not b!1193284) (not start!100266))
(check-sat b_and!42089 (not b_next!25609))
