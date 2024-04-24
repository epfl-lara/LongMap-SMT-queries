; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99840 () Bool)

(assert start!99840)

(declare-fun b_free!25183 () Bool)

(declare-fun b_next!25183 () Bool)

(assert (=> start!99840 (= b_free!25183 (not b_next!25183))))

(declare-fun tp!88262 () Bool)

(declare-fun b_and!41235 () Bool)

(assert (=> start!99840 (= tp!88262 b_and!41235)))

(declare-fun b!1181090 () Bool)

(declare-fun res!784380 () Bool)

(declare-fun e!671588 () Bool)

(assert (=> b!1181090 (=> (not res!784380) (not e!671588))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181090 (= res!784380 (validKeyInArray!0 k0!934))))

(declare-fun b!1181091 () Bool)

(declare-fun e!671578 () Bool)

(assert (=> b!1181091 (= e!671588 e!671578)))

(declare-fun res!784372 () Bool)

(assert (=> b!1181091 (=> (not res!784372) (not e!671578))))

(declare-datatypes ((array!76279 0))(
  ( (array!76280 (arr!36783 (Array (_ BitVec 32) (_ BitVec 64))) (size!37320 (_ BitVec 32))) )
))
(declare-fun lt!533782 () array!76279)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76279 (_ BitVec 32)) Bool)

(assert (=> b!1181091 (= res!784372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533782 mask!1564))))

(declare-fun _keys!1208 () array!76279)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181091 (= lt!533782 (array!76280 (store (arr!36783 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37320 _keys!1208)))))

(declare-fun b!1181092 () Bool)

(declare-fun e!671577 () Bool)

(declare-fun arrayContainsKey!0 (array!76279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181092 (= e!671577 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181093 () Bool)

(declare-fun e!671585 () Bool)

(declare-fun e!671587 () Bool)

(assert (=> b!1181093 (= e!671585 e!671587)))

(declare-fun res!784376 () Bool)

(assert (=> b!1181093 (=> res!784376 e!671587)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181093 (= res!784376 (not (validKeyInArray!0 (select (arr!36783 _keys!1208) from!1455))))))

(declare-datatypes ((V!44745 0))(
  ( (V!44746 (val!14913 Int)) )
))
(declare-datatypes ((tuple2!19140 0))(
  ( (tuple2!19141 (_1!9581 (_ BitVec 64)) (_2!9581 V!44745)) )
))
(declare-datatypes ((List!25870 0))(
  ( (Nil!25867) (Cons!25866 (h!27084 tuple2!19140) (t!38037 List!25870)) )
))
(declare-datatypes ((ListLongMap!17117 0))(
  ( (ListLongMap!17118 (toList!8574 List!25870)) )
))
(declare-fun lt!533781 () ListLongMap!17117)

(declare-fun lt!533775 () ListLongMap!17117)

(assert (=> b!1181093 (= lt!533781 lt!533775)))

(declare-fun lt!533771 () ListLongMap!17117)

(declare-fun -!1603 (ListLongMap!17117 (_ BitVec 64)) ListLongMap!17117)

(assert (=> b!1181093 (= lt!533775 (-!1603 lt!533771 k0!934))))

(declare-fun zeroValue!944 () V!44745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44745)

(declare-datatypes ((ValueCell!14147 0))(
  ( (ValueCellFull!14147 (v!17547 V!44745)) (EmptyCell!14147) )
))
(declare-datatypes ((array!76281 0))(
  ( (array!76282 (arr!36784 (Array (_ BitVec 32) ValueCell!14147)) (size!37321 (_ BitVec 32))) )
))
(declare-fun lt!533780 () array!76281)

(declare-fun getCurrentListMapNoExtraKeys!5052 (array!76279 array!76281 (_ BitVec 32) (_ BitVec 32) V!44745 V!44745 (_ BitVec 32) Int) ListLongMap!17117)

(assert (=> b!1181093 (= lt!533781 (getCurrentListMapNoExtraKeys!5052 lt!533782 lt!533780 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76281)

(assert (=> b!1181093 (= lt!533771 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38994 0))(
  ( (Unit!38995) )
))
(declare-fun lt!533768 () Unit!38994)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 (array!76279 array!76281 (_ BitVec 32) (_ BitVec 32) V!44745 V!44745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38994)

(assert (=> b!1181093 (= lt!533768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46397 () Bool)

(declare-fun mapRes!46397 () Bool)

(declare-fun tp!88263 () Bool)

(declare-fun e!671579 () Bool)

(assert (=> mapNonEmpty!46397 (= mapRes!46397 (and tp!88263 e!671579))))

(declare-fun mapRest!46397 () (Array (_ BitVec 32) ValueCell!14147))

(declare-fun mapValue!46397 () ValueCell!14147)

(declare-fun mapKey!46397 () (_ BitVec 32))

(assert (=> mapNonEmpty!46397 (= (arr!36784 _values!996) (store mapRest!46397 mapKey!46397 mapValue!46397))))

(declare-fun b!1181094 () Bool)

(declare-fun e!671586 () Bool)

(assert (=> b!1181094 (= e!671578 (not e!671586))))

(declare-fun res!784371 () Bool)

(assert (=> b!1181094 (=> res!784371 e!671586)))

(assert (=> b!1181094 (= res!784371 (bvsgt from!1455 i!673))))

(assert (=> b!1181094 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533774 () Unit!38994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76279 (_ BitVec 64) (_ BitVec 32)) Unit!38994)

(assert (=> b!1181094 (= lt!533774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!784375 () Bool)

(assert (=> start!99840 (=> (not res!784375) (not e!671588))))

(assert (=> start!99840 (= res!784375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37320 _keys!1208))))))

(assert (=> start!99840 e!671588))

(declare-fun tp_is_empty!29713 () Bool)

(assert (=> start!99840 tp_is_empty!29713))

(declare-fun array_inv!28166 (array!76279) Bool)

(assert (=> start!99840 (array_inv!28166 _keys!1208)))

(assert (=> start!99840 true))

(assert (=> start!99840 tp!88262))

(declare-fun e!671582 () Bool)

(declare-fun array_inv!28167 (array!76281) Bool)

(assert (=> start!99840 (and (array_inv!28167 _values!996) e!671582)))

(declare-fun b!1181095 () Bool)

(declare-fun res!784374 () Bool)

(declare-fun e!671581 () Bool)

(assert (=> b!1181095 (=> (not res!784374) (not e!671581))))

(declare-fun lt!533776 () ListLongMap!17117)

(declare-fun lt!533778 () tuple2!19140)

(declare-fun +!3899 (ListLongMap!17117 tuple2!19140) ListLongMap!17117)

(assert (=> b!1181095 (= res!784374 (= lt!533776 (+!3899 lt!533771 lt!533778)))))

(declare-fun b!1181096 () Bool)

(declare-fun e!671583 () Bool)

(assert (=> b!1181096 (= e!671583 e!671577)))

(declare-fun res!784382 () Bool)

(assert (=> b!1181096 (=> res!784382 e!671577)))

(assert (=> b!1181096 (= res!784382 (not (= (select (arr!36783 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181097 () Bool)

(declare-fun res!784378 () Bool)

(assert (=> b!1181097 (=> (not res!784378) (not e!671588))))

(assert (=> b!1181097 (= res!784378 (= (select (arr!36783 _keys!1208) i!673) k0!934))))

(declare-fun b!1181098 () Bool)

(declare-fun res!784377 () Bool)

(assert (=> b!1181098 (=> (not res!784377) (not e!671588))))

(declare-datatypes ((List!25871 0))(
  ( (Nil!25868) (Cons!25867 (h!27085 (_ BitVec 64)) (t!38038 List!25871)) )
))
(declare-fun arrayNoDuplicates!0 (array!76279 (_ BitVec 32) List!25871) Bool)

(assert (=> b!1181098 (= res!784377 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25868))))

(declare-fun mapIsEmpty!46397 () Bool)

(assert (=> mapIsEmpty!46397 mapRes!46397))

(declare-fun b!1181099 () Bool)

(declare-fun res!784381 () Bool)

(assert (=> b!1181099 (=> (not res!784381) (not e!671588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181099 (= res!784381 (validMask!0 mask!1564))))

(declare-fun b!1181100 () Bool)

(declare-fun res!784373 () Bool)

(assert (=> b!1181100 (=> (not res!784373) (not e!671588))))

(assert (=> b!1181100 (= res!784373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181101 () Bool)

(declare-fun res!784379 () Bool)

(assert (=> b!1181101 (=> (not res!784379) (not e!671588))))

(assert (=> b!1181101 (= res!784379 (and (= (size!37321 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37320 _keys!1208) (size!37321 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181102 () Bool)

(declare-fun res!784383 () Bool)

(assert (=> b!1181102 (=> (not res!784383) (not e!671578))))

(assert (=> b!1181102 (= res!784383 (arrayNoDuplicates!0 lt!533782 #b00000000000000000000000000000000 Nil!25868))))

(declare-fun b!1181103 () Bool)

(assert (=> b!1181103 (= e!671587 true)))

(assert (=> b!1181103 e!671581))

(declare-fun res!784384 () Bool)

(assert (=> b!1181103 (=> (not res!784384) (not e!671581))))

(assert (=> b!1181103 (= res!784384 (not (= (select (arr!36783 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533769 () Unit!38994)

(declare-fun e!671580 () Unit!38994)

(assert (=> b!1181103 (= lt!533769 e!671580)))

(declare-fun c!117296 () Bool)

(assert (=> b!1181103 (= c!117296 (= (select (arr!36783 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181103 e!671583))

(declare-fun res!784385 () Bool)

(assert (=> b!1181103 (=> (not res!784385) (not e!671583))))

(declare-fun lt!533777 () ListLongMap!17117)

(assert (=> b!1181103 (= res!784385 (= lt!533777 (+!3899 lt!533775 lt!533778)))))

(declare-fun lt!533773 () V!44745)

(declare-fun get!18839 (ValueCell!14147 V!44745) V!44745)

(assert (=> b!1181103 (= lt!533778 (tuple2!19141 (select (arr!36783 _keys!1208) from!1455) (get!18839 (select (arr!36784 _values!996) from!1455) lt!533773)))))

(declare-fun b!1181104 () Bool)

(declare-fun Unit!38996 () Unit!38994)

(assert (=> b!1181104 (= e!671580 Unit!38996)))

(declare-fun lt!533772 () Unit!38994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38994)

(assert (=> b!1181104 (= lt!533772 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181104 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533770 () Unit!38994)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76279 (_ BitVec 32) (_ BitVec 32)) Unit!38994)

(assert (=> b!1181104 (= lt!533770 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181104 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25868)))

(declare-fun lt!533779 () Unit!38994)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76279 (_ BitVec 64) (_ BitVec 32) List!25871) Unit!38994)

(assert (=> b!1181104 (= lt!533779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25868))))

(assert (=> b!1181104 false))

(declare-fun b!1181105 () Bool)

(assert (=> b!1181105 (= e!671579 tp_is_empty!29713)))

(declare-fun b!1181106 () Bool)

(declare-fun Unit!38997 () Unit!38994)

(assert (=> b!1181106 (= e!671580 Unit!38997)))

(declare-fun b!1181107 () Bool)

(declare-fun e!671576 () Bool)

(assert (=> b!1181107 (= e!671582 (and e!671576 mapRes!46397))))

(declare-fun condMapEmpty!46397 () Bool)

(declare-fun mapDefault!46397 () ValueCell!14147)

(assert (=> b!1181107 (= condMapEmpty!46397 (= (arr!36784 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14147)) mapDefault!46397)))))

(declare-fun b!1181108 () Bool)

(assert (=> b!1181108 (= e!671576 tp_is_empty!29713)))

(declare-fun b!1181109 () Bool)

(assert (=> b!1181109 (= e!671581 (= lt!533775 lt!533781))))

(declare-fun b!1181110 () Bool)

(declare-fun res!784369 () Bool)

(assert (=> b!1181110 (=> (not res!784369) (not e!671588))))

(assert (=> b!1181110 (= res!784369 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37320 _keys!1208))))))

(declare-fun b!1181111 () Bool)

(assert (=> b!1181111 (= e!671586 e!671585)))

(declare-fun res!784370 () Bool)

(assert (=> b!1181111 (=> res!784370 e!671585)))

(assert (=> b!1181111 (= res!784370 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181111 (= lt!533777 (getCurrentListMapNoExtraKeys!5052 lt!533782 lt!533780 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181111 (= lt!533780 (array!76282 (store (arr!36784 _values!996) i!673 (ValueCellFull!14147 lt!533773)) (size!37321 _values!996)))))

(declare-fun dynLambda!3020 (Int (_ BitVec 64)) V!44745)

(assert (=> b!1181111 (= lt!533773 (dynLambda!3020 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181111 (= lt!533776 (getCurrentListMapNoExtraKeys!5052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99840 res!784375) b!1181099))

(assert (= (and b!1181099 res!784381) b!1181101))

(assert (= (and b!1181101 res!784379) b!1181100))

(assert (= (and b!1181100 res!784373) b!1181098))

(assert (= (and b!1181098 res!784377) b!1181110))

(assert (= (and b!1181110 res!784369) b!1181090))

(assert (= (and b!1181090 res!784380) b!1181097))

(assert (= (and b!1181097 res!784378) b!1181091))

(assert (= (and b!1181091 res!784372) b!1181102))

(assert (= (and b!1181102 res!784383) b!1181094))

(assert (= (and b!1181094 (not res!784371)) b!1181111))

(assert (= (and b!1181111 (not res!784370)) b!1181093))

(assert (= (and b!1181093 (not res!784376)) b!1181103))

(assert (= (and b!1181103 res!784385) b!1181096))

(assert (= (and b!1181096 (not res!784382)) b!1181092))

(assert (= (and b!1181103 c!117296) b!1181104))

(assert (= (and b!1181103 (not c!117296)) b!1181106))

(assert (= (and b!1181103 res!784384) b!1181095))

(assert (= (and b!1181095 res!784374) b!1181109))

(assert (= (and b!1181107 condMapEmpty!46397) mapIsEmpty!46397))

(assert (= (and b!1181107 (not condMapEmpty!46397)) mapNonEmpty!46397))

(get-info :version)

(assert (= (and mapNonEmpty!46397 ((_ is ValueCellFull!14147) mapValue!46397)) b!1181105))

(assert (= (and b!1181107 ((_ is ValueCellFull!14147) mapDefault!46397)) b!1181108))

(assert (= start!99840 b!1181107))

(declare-fun b_lambda!20321 () Bool)

(assert (=> (not b_lambda!20321) (not b!1181111)))

(declare-fun t!38036 () Bool)

(declare-fun tb!9987 () Bool)

(assert (=> (and start!99840 (= defaultEntry!1004 defaultEntry!1004) t!38036) tb!9987))

(declare-fun result!20549 () Bool)

(assert (=> tb!9987 (= result!20549 tp_is_empty!29713)))

(assert (=> b!1181111 t!38036))

(declare-fun b_and!41237 () Bool)

(assert (= b_and!41235 (and (=> t!38036 result!20549) b_and!41237)))

(declare-fun m!1089345 () Bool)

(assert (=> b!1181097 m!1089345))

(declare-fun m!1089347 () Bool)

(assert (=> start!99840 m!1089347))

(declare-fun m!1089349 () Bool)

(assert (=> start!99840 m!1089349))

(declare-fun m!1089351 () Bool)

(assert (=> b!1181104 m!1089351))

(declare-fun m!1089353 () Bool)

(assert (=> b!1181104 m!1089353))

(declare-fun m!1089355 () Bool)

(assert (=> b!1181104 m!1089355))

(declare-fun m!1089357 () Bool)

(assert (=> b!1181104 m!1089357))

(declare-fun m!1089359 () Bool)

(assert (=> b!1181104 m!1089359))

(declare-fun m!1089361 () Bool)

(assert (=> b!1181102 m!1089361))

(declare-fun m!1089363 () Bool)

(assert (=> b!1181093 m!1089363))

(declare-fun m!1089365 () Bool)

(assert (=> b!1181093 m!1089365))

(declare-fun m!1089367 () Bool)

(assert (=> b!1181093 m!1089367))

(declare-fun m!1089369 () Bool)

(assert (=> b!1181093 m!1089369))

(declare-fun m!1089371 () Bool)

(assert (=> b!1181093 m!1089371))

(declare-fun m!1089373 () Bool)

(assert (=> b!1181093 m!1089373))

(assert (=> b!1181093 m!1089371))

(declare-fun m!1089375 () Bool)

(assert (=> b!1181100 m!1089375))

(declare-fun m!1089377 () Bool)

(assert (=> b!1181099 m!1089377))

(declare-fun m!1089379 () Bool)

(assert (=> b!1181092 m!1089379))

(declare-fun m!1089381 () Bool)

(assert (=> mapNonEmpty!46397 m!1089381))

(assert (=> b!1181103 m!1089371))

(declare-fun m!1089383 () Bool)

(assert (=> b!1181103 m!1089383))

(declare-fun m!1089385 () Bool)

(assert (=> b!1181103 m!1089385))

(assert (=> b!1181103 m!1089385))

(declare-fun m!1089387 () Bool)

(assert (=> b!1181103 m!1089387))

(declare-fun m!1089389 () Bool)

(assert (=> b!1181111 m!1089389))

(declare-fun m!1089391 () Bool)

(assert (=> b!1181111 m!1089391))

(declare-fun m!1089393 () Bool)

(assert (=> b!1181111 m!1089393))

(declare-fun m!1089395 () Bool)

(assert (=> b!1181111 m!1089395))

(declare-fun m!1089397 () Bool)

(assert (=> b!1181091 m!1089397))

(declare-fun m!1089399 () Bool)

(assert (=> b!1181091 m!1089399))

(assert (=> b!1181096 m!1089371))

(declare-fun m!1089401 () Bool)

(assert (=> b!1181095 m!1089401))

(declare-fun m!1089403 () Bool)

(assert (=> b!1181098 m!1089403))

(declare-fun m!1089405 () Bool)

(assert (=> b!1181094 m!1089405))

(declare-fun m!1089407 () Bool)

(assert (=> b!1181094 m!1089407))

(declare-fun m!1089409 () Bool)

(assert (=> b!1181090 m!1089409))

(check-sat b_and!41237 tp_is_empty!29713 (not b!1181090) (not b!1181093) (not start!99840) (not b!1181100) (not b_next!25183) (not b!1181099) (not b!1181111) (not b!1181104) (not mapNonEmpty!46397) (not b!1181091) (not b_lambda!20321) (not b!1181103) (not b!1181095) (not b!1181092) (not b!1181098) (not b!1181102) (not b!1181094))
(check-sat b_and!41237 (not b_next!25183))
