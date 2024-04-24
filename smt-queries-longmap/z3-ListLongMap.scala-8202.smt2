; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100314 () Bool)

(assert start!100314)

(declare-fun b_free!25657 () Bool)

(declare-fun b_next!25657 () Bool)

(assert (=> start!100314 (= b_free!25657 (not b_next!25657))))

(declare-fun tp!89684 () Bool)

(declare-fun b_and!42183 () Bool)

(assert (=> start!100314 (= tp!89684 b_and!42183)))

(declare-fun b!1194402 () Bool)

(declare-fun res!794271 () Bool)

(declare-fun e!678960 () Bool)

(assert (=> b!1194402 (=> (not res!794271) (not e!678960))))

(declare-datatypes ((array!77197 0))(
  ( (array!77198 (arr!37242 (Array (_ BitVec 32) (_ BitVec 64))) (size!37779 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77197)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194402 (= res!794271 (= (select (arr!37242 _keys!1208) i!673) k0!934))))

(declare-fun b!1194403 () Bool)

(declare-fun e!678958 () Bool)

(declare-fun e!678957 () Bool)

(declare-fun mapRes!47108 () Bool)

(assert (=> b!1194403 (= e!678958 (and e!678957 mapRes!47108))))

(declare-fun condMapEmpty!47108 () Bool)

(declare-datatypes ((V!45377 0))(
  ( (V!45378 (val!15150 Int)) )
))
(declare-datatypes ((ValueCell!14384 0))(
  ( (ValueCellFull!14384 (v!17784 V!45377)) (EmptyCell!14384) )
))
(declare-datatypes ((array!77199 0))(
  ( (array!77200 (arr!37243 (Array (_ BitVec 32) ValueCell!14384)) (size!37780 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77199)

(declare-fun mapDefault!47108 () ValueCell!14384)

(assert (=> b!1194403 (= condMapEmpty!47108 (= (arr!37243 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14384)) mapDefault!47108)))))

(declare-fun b!1194404 () Bool)

(declare-fun res!794276 () Bool)

(assert (=> b!1194404 (=> (not res!794276) (not e!678960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194404 (= res!794276 (validKeyInArray!0 k0!934))))

(declare-fun b!1194405 () Bool)

(declare-fun e!678962 () Bool)

(declare-fun tp_is_empty!30187 () Bool)

(assert (=> b!1194405 (= e!678962 tp_is_empty!30187)))

(declare-fun b!1194406 () Bool)

(declare-fun res!794274 () Bool)

(assert (=> b!1194406 (=> (not res!794274) (not e!678960))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194406 (= res!794274 (and (= (size!37780 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37779 _keys!1208) (size!37780 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194407 () Bool)

(declare-fun e!678956 () Bool)

(declare-fun e!678961 () Bool)

(assert (=> b!1194407 (= e!678956 (not e!678961))))

(declare-fun res!794273 () Bool)

(assert (=> b!1194407 (=> res!794273 e!678961)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1194407 (= res!794273 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194407 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39559 0))(
  ( (Unit!39560) )
))
(declare-fun lt!542959 () Unit!39559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77197 (_ BitVec 64) (_ BitVec 32)) Unit!39559)

(assert (=> b!1194407 (= lt!542959 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47108 () Bool)

(declare-fun tp!89685 () Bool)

(assert (=> mapNonEmpty!47108 (= mapRes!47108 (and tp!89685 e!678962))))

(declare-fun mapRest!47108 () (Array (_ BitVec 32) ValueCell!14384))

(declare-fun mapKey!47108 () (_ BitVec 32))

(declare-fun mapValue!47108 () ValueCell!14384)

(assert (=> mapNonEmpty!47108 (= (arr!37243 _values!996) (store mapRest!47108 mapKey!47108 mapValue!47108))))

(declare-fun b!1194409 () Bool)

(declare-fun res!794268 () Bool)

(assert (=> b!1194409 (=> (not res!794268) (not e!678960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194409 (= res!794268 (validMask!0 mask!1564))))

(declare-fun b!1194410 () Bool)

(declare-fun res!794279 () Bool)

(assert (=> b!1194410 (=> (not res!794279) (not e!678960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77197 (_ BitVec 32)) Bool)

(assert (=> b!1194410 (= res!794279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194411 () Bool)

(declare-fun res!794278 () Bool)

(assert (=> b!1194411 (=> (not res!794278) (not e!678956))))

(declare-fun lt!542957 () array!77197)

(declare-datatypes ((List!26253 0))(
  ( (Nil!26250) (Cons!26249 (h!27467 (_ BitVec 64)) (t!38894 List!26253)) )
))
(declare-fun arrayNoDuplicates!0 (array!77197 (_ BitVec 32) List!26253) Bool)

(assert (=> b!1194411 (= res!794278 (arrayNoDuplicates!0 lt!542957 #b00000000000000000000000000000000 Nil!26250))))

(declare-fun b!1194412 () Bool)

(assert (=> b!1194412 (= e!678957 tp_is_empty!30187)))

(declare-fun mapIsEmpty!47108 () Bool)

(assert (=> mapIsEmpty!47108 mapRes!47108))

(declare-fun b!1194408 () Bool)

(declare-fun res!794269 () Bool)

(assert (=> b!1194408 (=> (not res!794269) (not e!678960))))

(assert (=> b!1194408 (= res!794269 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37779 _keys!1208))))))

(declare-fun res!794277 () Bool)

(assert (=> start!100314 (=> (not res!794277) (not e!678960))))

(assert (=> start!100314 (= res!794277 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37779 _keys!1208))))))

(assert (=> start!100314 e!678960))

(assert (=> start!100314 tp_is_empty!30187))

(declare-fun array_inv!28460 (array!77197) Bool)

(assert (=> start!100314 (array_inv!28460 _keys!1208)))

(assert (=> start!100314 true))

(assert (=> start!100314 tp!89684))

(declare-fun array_inv!28461 (array!77199) Bool)

(assert (=> start!100314 (and (array_inv!28461 _values!996) e!678958)))

(declare-fun b!1194413 () Bool)

(assert (=> b!1194413 (= e!678960 e!678956)))

(declare-fun res!794270 () Bool)

(assert (=> b!1194413 (=> (not res!794270) (not e!678956))))

(assert (=> b!1194413 (= res!794270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542957 mask!1564))))

(assert (=> b!1194413 (= lt!542957 (array!77198 (store (arr!37242 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37779 _keys!1208)))))

(declare-fun b!1194414 () Bool)

(declare-fun e!678955 () Bool)

(assert (=> b!1194414 (= e!678961 e!678955)))

(declare-fun res!794275 () Bool)

(assert (=> b!1194414 (=> res!794275 e!678955)))

(assert (=> b!1194414 (= res!794275 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45377)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19512 0))(
  ( (tuple2!19513 (_1!9767 (_ BitVec 64)) (_2!9767 V!45377)) )
))
(declare-datatypes ((List!26254 0))(
  ( (Nil!26251) (Cons!26250 (h!27468 tuple2!19512) (t!38895 List!26254)) )
))
(declare-datatypes ((ListLongMap!17489 0))(
  ( (ListLongMap!17490 (toList!8760 List!26254)) )
))
(declare-fun lt!542962 () ListLongMap!17489)

(declare-fun lt!542960 () array!77199)

(declare-fun minValue!944 () V!45377)

(declare-fun getCurrentListMapNoExtraKeys!5228 (array!77197 array!77199 (_ BitVec 32) (_ BitVec 32) V!45377 V!45377 (_ BitVec 32) Int) ListLongMap!17489)

(assert (=> b!1194414 (= lt!542962 (getCurrentListMapNoExtraKeys!5228 lt!542957 lt!542960 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3177 (Int (_ BitVec 64)) V!45377)

(assert (=> b!1194414 (= lt!542960 (array!77200 (store (arr!37243 _values!996) i!673 (ValueCellFull!14384 (dynLambda!3177 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37780 _values!996)))))

(declare-fun lt!542961 () ListLongMap!17489)

(assert (=> b!1194414 (= lt!542961 (getCurrentListMapNoExtraKeys!5228 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194415 () Bool)

(declare-fun res!794272 () Bool)

(assert (=> b!1194415 (=> (not res!794272) (not e!678960))))

(assert (=> b!1194415 (= res!794272 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26250))))

(declare-fun b!1194416 () Bool)

(assert (=> b!1194416 (= e!678955 true)))

(declare-fun -!1763 (ListLongMap!17489 (_ BitVec 64)) ListLongMap!17489)

(assert (=> b!1194416 (= (getCurrentListMapNoExtraKeys!5228 lt!542957 lt!542960 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1763 (getCurrentListMapNoExtraKeys!5228 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542958 () Unit!39559)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!978 (array!77197 array!77199 (_ BitVec 32) (_ BitVec 32) V!45377 V!45377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39559)

(assert (=> b!1194416 (= lt!542958 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100314 res!794277) b!1194409))

(assert (= (and b!1194409 res!794268) b!1194406))

(assert (= (and b!1194406 res!794274) b!1194410))

(assert (= (and b!1194410 res!794279) b!1194415))

(assert (= (and b!1194415 res!794272) b!1194408))

(assert (= (and b!1194408 res!794269) b!1194404))

(assert (= (and b!1194404 res!794276) b!1194402))

(assert (= (and b!1194402 res!794271) b!1194413))

(assert (= (and b!1194413 res!794270) b!1194411))

(assert (= (and b!1194411 res!794278) b!1194407))

(assert (= (and b!1194407 (not res!794273)) b!1194414))

(assert (= (and b!1194414 (not res!794275)) b!1194416))

(assert (= (and b!1194403 condMapEmpty!47108) mapIsEmpty!47108))

(assert (= (and b!1194403 (not condMapEmpty!47108)) mapNonEmpty!47108))

(get-info :version)

(assert (= (and mapNonEmpty!47108 ((_ is ValueCellFull!14384) mapValue!47108)) b!1194405))

(assert (= (and b!1194403 ((_ is ValueCellFull!14384) mapDefault!47108)) b!1194412))

(assert (= start!100314 b!1194403))

(declare-fun b_lambda!20795 () Bool)

(assert (=> (not b_lambda!20795) (not b!1194414)))

(declare-fun t!38893 () Bool)

(declare-fun tb!10461 () Bool)

(assert (=> (and start!100314 (= defaultEntry!1004 defaultEntry!1004) t!38893) tb!10461))

(declare-fun result!21497 () Bool)

(assert (=> tb!10461 (= result!21497 tp_is_empty!30187)))

(assert (=> b!1194414 t!38893))

(declare-fun b_and!42185 () Bool)

(assert (= b_and!42183 (and (=> t!38893 result!21497) b_and!42185)))

(declare-fun m!1102971 () Bool)

(assert (=> b!1194402 m!1102971))

(declare-fun m!1102973 () Bool)

(assert (=> mapNonEmpty!47108 m!1102973))

(declare-fun m!1102975 () Bool)

(assert (=> start!100314 m!1102975))

(declare-fun m!1102977 () Bool)

(assert (=> start!100314 m!1102977))

(declare-fun m!1102979 () Bool)

(assert (=> b!1194415 m!1102979))

(declare-fun m!1102981 () Bool)

(assert (=> b!1194407 m!1102981))

(declare-fun m!1102983 () Bool)

(assert (=> b!1194407 m!1102983))

(declare-fun m!1102985 () Bool)

(assert (=> b!1194404 m!1102985))

(declare-fun m!1102987 () Bool)

(assert (=> b!1194411 m!1102987))

(declare-fun m!1102989 () Bool)

(assert (=> b!1194416 m!1102989))

(declare-fun m!1102991 () Bool)

(assert (=> b!1194416 m!1102991))

(assert (=> b!1194416 m!1102991))

(declare-fun m!1102993 () Bool)

(assert (=> b!1194416 m!1102993))

(declare-fun m!1102995 () Bool)

(assert (=> b!1194416 m!1102995))

(declare-fun m!1102997 () Bool)

(assert (=> b!1194414 m!1102997))

(declare-fun m!1102999 () Bool)

(assert (=> b!1194414 m!1102999))

(declare-fun m!1103001 () Bool)

(assert (=> b!1194414 m!1103001))

(declare-fun m!1103003 () Bool)

(assert (=> b!1194414 m!1103003))

(declare-fun m!1103005 () Bool)

(assert (=> b!1194409 m!1103005))

(declare-fun m!1103007 () Bool)

(assert (=> b!1194410 m!1103007))

(declare-fun m!1103009 () Bool)

(assert (=> b!1194413 m!1103009))

(declare-fun m!1103011 () Bool)

(assert (=> b!1194413 m!1103011))

(check-sat (not b!1194416) (not b!1194407) (not b!1194409) (not b!1194404) (not b!1194414) tp_is_empty!30187 (not b!1194413) (not b_next!25657) b_and!42185 (not b_lambda!20795) (not b!1194415) (not mapNonEmpty!47108) (not b!1194410) (not start!100314) (not b!1194411))
(check-sat b_and!42185 (not b_next!25657))
