; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99870 () Bool)

(assert start!99870)

(declare-fun b_free!25213 () Bool)

(declare-fun b_next!25213 () Bool)

(assert (=> start!99870 (= b_free!25213 (not b_next!25213))))

(declare-fun tp!88352 () Bool)

(declare-fun b_and!41295 () Bool)

(assert (=> start!99870 (= tp!88352 b_and!41295)))

(declare-fun res!785136 () Bool)

(declare-fun e!672170 () Bool)

(assert (=> start!99870 (=> (not res!785136) (not e!672170))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76339 0))(
  ( (array!76340 (arr!36813 (Array (_ BitVec 32) (_ BitVec 64))) (size!37350 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76339)

(assert (=> start!99870 (= res!785136 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37350 _keys!1208))))))

(assert (=> start!99870 e!672170))

(declare-fun tp_is_empty!29743 () Bool)

(assert (=> start!99870 tp_is_empty!29743))

(declare-fun array_inv!28186 (array!76339) Bool)

(assert (=> start!99870 (array_inv!28186 _keys!1208)))

(assert (=> start!99870 true))

(assert (=> start!99870 tp!88352))

(declare-datatypes ((V!44785 0))(
  ( (V!44786 (val!14928 Int)) )
))
(declare-datatypes ((ValueCell!14162 0))(
  ( (ValueCellFull!14162 (v!17562 V!44785)) (EmptyCell!14162) )
))
(declare-datatypes ((array!76341 0))(
  ( (array!76342 (arr!36814 (Array (_ BitVec 32) ValueCell!14162)) (size!37351 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76341)

(declare-fun e!672172 () Bool)

(declare-fun array_inv!28187 (array!76341) Bool)

(assert (=> start!99870 (and (array_inv!28187 _values!996) e!672172)))

(declare-fun b!1182110 () Bool)

(declare-fun res!785138 () Bool)

(assert (=> b!1182110 (=> (not res!785138) (not e!672170))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182110 (= res!785138 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37350 _keys!1208))))))

(declare-fun b!1182111 () Bool)

(declare-fun res!785140 () Bool)

(assert (=> b!1182111 (=> (not res!785140) (not e!672170))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76339 (_ BitVec 32)) Bool)

(assert (=> b!1182111 (= res!785140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182112 () Bool)

(declare-fun e!672168 () Bool)

(assert (=> b!1182112 (= e!672168 tp_is_empty!29743)))

(declare-fun b!1182113 () Bool)

(declare-fun res!785142 () Bool)

(assert (=> b!1182113 (=> (not res!785142) (not e!672170))))

(declare-datatypes ((List!25898 0))(
  ( (Nil!25895) (Cons!25894 (h!27112 (_ BitVec 64)) (t!38095 List!25898)) )
))
(declare-fun arrayNoDuplicates!0 (array!76339 (_ BitVec 32) List!25898) Bool)

(assert (=> b!1182113 (= res!785142 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25895))))

(declare-fun mapIsEmpty!46442 () Bool)

(declare-fun mapRes!46442 () Bool)

(assert (=> mapIsEmpty!46442 mapRes!46442))

(declare-fun b!1182114 () Bool)

(declare-fun res!785150 () Bool)

(declare-fun e!672169 () Bool)

(assert (=> b!1182114 (=> (not res!785150) (not e!672169))))

(declare-datatypes ((tuple2!19168 0))(
  ( (tuple2!19169 (_1!9595 (_ BitVec 64)) (_2!9595 V!44785)) )
))
(declare-fun lt!534445 () tuple2!19168)

(declare-datatypes ((List!25899 0))(
  ( (Nil!25896) (Cons!25895 (h!27113 tuple2!19168) (t!38096 List!25899)) )
))
(declare-datatypes ((ListLongMap!17145 0))(
  ( (ListLongMap!17146 (toList!8588 List!25899)) )
))
(declare-fun lt!534444 () ListLongMap!17145)

(declare-fun lt!534453 () ListLongMap!17145)

(declare-fun +!3911 (ListLongMap!17145 tuple2!19168) ListLongMap!17145)

(assert (=> b!1182114 (= res!785150 (= lt!534444 (+!3911 lt!534453 lt!534445)))))

(declare-fun b!1182115 () Bool)

(declare-fun lt!534451 () ListLongMap!17145)

(declare-fun lt!534450 () ListLongMap!17145)

(assert (=> b!1182115 (= e!672169 (= lt!534451 lt!534450))))

(declare-fun b!1182116 () Bool)

(declare-datatypes ((Unit!39041 0))(
  ( (Unit!39042) )
))
(declare-fun e!672171 () Unit!39041)

(declare-fun Unit!39043 () Unit!39041)

(assert (=> b!1182116 (= e!672171 Unit!39043)))

(declare-fun b!1182117 () Bool)

(declare-fun res!785146 () Bool)

(assert (=> b!1182117 (=> (not res!785146) (not e!672170))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182117 (= res!785146 (validKeyInArray!0 k0!934))))

(declare-fun b!1182118 () Bool)

(declare-fun e!672163 () Bool)

(declare-fun e!672173 () Bool)

(assert (=> b!1182118 (= e!672163 e!672173)))

(declare-fun res!785137 () Bool)

(assert (=> b!1182118 (=> res!785137 e!672173)))

(assert (=> b!1182118 (= res!785137 (not (validKeyInArray!0 (select (arr!36813 _keys!1208) from!1455))))))

(assert (=> b!1182118 (= lt!534450 lt!534451)))

(declare-fun -!1615 (ListLongMap!17145 (_ BitVec 64)) ListLongMap!17145)

(assert (=> b!1182118 (= lt!534451 (-!1615 lt!534453 k0!934))))

(declare-fun zeroValue!944 () V!44785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534449 () array!76339)

(declare-fun lt!534457 () array!76341)

(declare-fun minValue!944 () V!44785)

(declare-fun getCurrentListMapNoExtraKeys!5064 (array!76339 array!76341 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) Int) ListLongMap!17145)

(assert (=> b!1182118 (= lt!534450 (getCurrentListMapNoExtraKeys!5064 lt!534449 lt!534457 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182118 (= lt!534453 (getCurrentListMapNoExtraKeys!5064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534443 () Unit!39041)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 (array!76339 array!76341 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39041)

(assert (=> b!1182118 (= lt!534443 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182119 () Bool)

(declare-fun e!672165 () Bool)

(declare-fun e!672164 () Bool)

(assert (=> b!1182119 (= e!672165 e!672164)))

(declare-fun res!785149 () Bool)

(assert (=> b!1182119 (=> res!785149 e!672164)))

(assert (=> b!1182119 (= res!785149 (not (= (select (arr!36813 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182120 () Bool)

(declare-fun res!785135 () Bool)

(declare-fun e!672161 () Bool)

(assert (=> b!1182120 (=> (not res!785135) (not e!672161))))

(assert (=> b!1182120 (= res!785135 (arrayNoDuplicates!0 lt!534449 #b00000000000000000000000000000000 Nil!25895))))

(declare-fun b!1182121 () Bool)

(declare-fun e!672166 () Bool)

(assert (=> b!1182121 (= e!672166 tp_is_empty!29743)))

(declare-fun b!1182122 () Bool)

(declare-fun e!672162 () Bool)

(assert (=> b!1182122 (= e!672161 (not e!672162))))

(declare-fun res!785145 () Bool)

(assert (=> b!1182122 (=> res!785145 e!672162)))

(assert (=> b!1182122 (= res!785145 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182122 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534456 () Unit!39041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76339 (_ BitVec 64) (_ BitVec 32)) Unit!39041)

(assert (=> b!1182122 (= lt!534456 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182123 () Bool)

(declare-fun res!785147 () Bool)

(assert (=> b!1182123 (=> (not res!785147) (not e!672170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182123 (= res!785147 (validMask!0 mask!1564))))

(declare-fun b!1182124 () Bool)

(assert (=> b!1182124 (= e!672162 e!672163)))

(declare-fun res!785148 () Bool)

(assert (=> b!1182124 (=> res!785148 e!672163)))

(assert (=> b!1182124 (= res!785148 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!534455 () ListLongMap!17145)

(assert (=> b!1182124 (= lt!534455 (getCurrentListMapNoExtraKeys!5064 lt!534449 lt!534457 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534448 () V!44785)

(assert (=> b!1182124 (= lt!534457 (array!76342 (store (arr!36814 _values!996) i!673 (ValueCellFull!14162 lt!534448)) (size!37351 _values!996)))))

(declare-fun dynLambda!3030 (Int (_ BitVec 64)) V!44785)

(assert (=> b!1182124 (= lt!534448 (dynLambda!3030 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182124 (= lt!534444 (getCurrentListMapNoExtraKeys!5064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182125 () Bool)

(declare-fun res!785143 () Bool)

(assert (=> b!1182125 (=> (not res!785143) (not e!672170))))

(assert (=> b!1182125 (= res!785143 (and (= (size!37351 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37350 _keys!1208) (size!37351 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182126 () Bool)

(assert (=> b!1182126 (= e!672172 (and e!672166 mapRes!46442))))

(declare-fun condMapEmpty!46442 () Bool)

(declare-fun mapDefault!46442 () ValueCell!14162)

(assert (=> b!1182126 (= condMapEmpty!46442 (= (arr!36814 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14162)) mapDefault!46442)))))

(declare-fun b!1182127 () Bool)

(assert (=> b!1182127 (= e!672173 true)))

(assert (=> b!1182127 e!672169))

(declare-fun res!785144 () Bool)

(assert (=> b!1182127 (=> (not res!785144) (not e!672169))))

(assert (=> b!1182127 (= res!785144 (not (= (select (arr!36813 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534447 () Unit!39041)

(assert (=> b!1182127 (= lt!534447 e!672171)))

(declare-fun c!117341 () Bool)

(assert (=> b!1182127 (= c!117341 (= (select (arr!36813 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182127 e!672165))

(declare-fun res!785134 () Bool)

(assert (=> b!1182127 (=> (not res!785134) (not e!672165))))

(assert (=> b!1182127 (= res!785134 (= lt!534455 (+!3911 lt!534451 lt!534445)))))

(declare-fun get!18861 (ValueCell!14162 V!44785) V!44785)

(assert (=> b!1182127 (= lt!534445 (tuple2!19169 (select (arr!36813 _keys!1208) from!1455) (get!18861 (select (arr!36814 _values!996) from!1455) lt!534448)))))

(declare-fun b!1182128 () Bool)

(assert (=> b!1182128 (= e!672170 e!672161)))

(declare-fun res!785139 () Bool)

(assert (=> b!1182128 (=> (not res!785139) (not e!672161))))

(assert (=> b!1182128 (= res!785139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534449 mask!1564))))

(assert (=> b!1182128 (= lt!534449 (array!76340 (store (arr!36813 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37350 _keys!1208)))))

(declare-fun b!1182129 () Bool)

(declare-fun res!785141 () Bool)

(assert (=> b!1182129 (=> (not res!785141) (not e!672170))))

(assert (=> b!1182129 (= res!785141 (= (select (arr!36813 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46442 () Bool)

(declare-fun tp!88353 () Bool)

(assert (=> mapNonEmpty!46442 (= mapRes!46442 (and tp!88353 e!672168))))

(declare-fun mapRest!46442 () (Array (_ BitVec 32) ValueCell!14162))

(declare-fun mapValue!46442 () ValueCell!14162)

(declare-fun mapKey!46442 () (_ BitVec 32))

(assert (=> mapNonEmpty!46442 (= (arr!36814 _values!996) (store mapRest!46442 mapKey!46442 mapValue!46442))))

(declare-fun b!1182130 () Bool)

(declare-fun Unit!39044 () Unit!39041)

(assert (=> b!1182130 (= e!672171 Unit!39044)))

(declare-fun lt!534446 () Unit!39041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39041)

(assert (=> b!1182130 (= lt!534446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182130 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534452 () Unit!39041)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76339 (_ BitVec 32) (_ BitVec 32)) Unit!39041)

(assert (=> b!1182130 (= lt!534452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182130 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25895)))

(declare-fun lt!534454 () Unit!39041)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76339 (_ BitVec 64) (_ BitVec 32) List!25898) Unit!39041)

(assert (=> b!1182130 (= lt!534454 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25895))))

(assert (=> b!1182130 false))

(declare-fun b!1182131 () Bool)

(assert (=> b!1182131 (= e!672164 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99870 res!785136) b!1182123))

(assert (= (and b!1182123 res!785147) b!1182125))

(assert (= (and b!1182125 res!785143) b!1182111))

(assert (= (and b!1182111 res!785140) b!1182113))

(assert (= (and b!1182113 res!785142) b!1182110))

(assert (= (and b!1182110 res!785138) b!1182117))

(assert (= (and b!1182117 res!785146) b!1182129))

(assert (= (and b!1182129 res!785141) b!1182128))

(assert (= (and b!1182128 res!785139) b!1182120))

(assert (= (and b!1182120 res!785135) b!1182122))

(assert (= (and b!1182122 (not res!785145)) b!1182124))

(assert (= (and b!1182124 (not res!785148)) b!1182118))

(assert (= (and b!1182118 (not res!785137)) b!1182127))

(assert (= (and b!1182127 res!785134) b!1182119))

(assert (= (and b!1182119 (not res!785149)) b!1182131))

(assert (= (and b!1182127 c!117341) b!1182130))

(assert (= (and b!1182127 (not c!117341)) b!1182116))

(assert (= (and b!1182127 res!785144) b!1182114))

(assert (= (and b!1182114 res!785150) b!1182115))

(assert (= (and b!1182126 condMapEmpty!46442) mapIsEmpty!46442))

(assert (= (and b!1182126 (not condMapEmpty!46442)) mapNonEmpty!46442))

(get-info :version)

(assert (= (and mapNonEmpty!46442 ((_ is ValueCellFull!14162) mapValue!46442)) b!1182112))

(assert (= (and b!1182126 ((_ is ValueCellFull!14162) mapDefault!46442)) b!1182121))

(assert (= start!99870 b!1182126))

(declare-fun b_lambda!20351 () Bool)

(assert (=> (not b_lambda!20351) (not b!1182124)))

(declare-fun t!38094 () Bool)

(declare-fun tb!10017 () Bool)

(assert (=> (and start!99870 (= defaultEntry!1004 defaultEntry!1004) t!38094) tb!10017))

(declare-fun result!20609 () Bool)

(assert (=> tb!10017 (= result!20609 tp_is_empty!29743)))

(assert (=> b!1182124 t!38094))

(declare-fun b_and!41297 () Bool)

(assert (= b_and!41295 (and (=> t!38094 result!20609) b_and!41297)))

(declare-fun m!1090335 () Bool)

(assert (=> b!1182120 m!1090335))

(declare-fun m!1090337 () Bool)

(assert (=> b!1182128 m!1090337))

(declare-fun m!1090339 () Bool)

(assert (=> b!1182128 m!1090339))

(declare-fun m!1090341 () Bool)

(assert (=> b!1182111 m!1090341))

(declare-fun m!1090343 () Bool)

(assert (=> b!1182130 m!1090343))

(declare-fun m!1090345 () Bool)

(assert (=> b!1182130 m!1090345))

(declare-fun m!1090347 () Bool)

(assert (=> b!1182130 m!1090347))

(declare-fun m!1090349 () Bool)

(assert (=> b!1182130 m!1090349))

(declare-fun m!1090351 () Bool)

(assert (=> b!1182130 m!1090351))

(declare-fun m!1090353 () Bool)

(assert (=> b!1182114 m!1090353))

(declare-fun m!1090355 () Bool)

(assert (=> mapNonEmpty!46442 m!1090355))

(declare-fun m!1090357 () Bool)

(assert (=> b!1182127 m!1090357))

(declare-fun m!1090359 () Bool)

(assert (=> b!1182127 m!1090359))

(declare-fun m!1090361 () Bool)

(assert (=> b!1182127 m!1090361))

(assert (=> b!1182127 m!1090361))

(declare-fun m!1090363 () Bool)

(assert (=> b!1182127 m!1090363))

(declare-fun m!1090365 () Bool)

(assert (=> b!1182129 m!1090365))

(declare-fun m!1090367 () Bool)

(assert (=> b!1182123 m!1090367))

(declare-fun m!1090369 () Bool)

(assert (=> b!1182131 m!1090369))

(declare-fun m!1090371 () Bool)

(assert (=> start!99870 m!1090371))

(declare-fun m!1090373 () Bool)

(assert (=> start!99870 m!1090373))

(assert (=> b!1182119 m!1090357))

(declare-fun m!1090375 () Bool)

(assert (=> b!1182117 m!1090375))

(declare-fun m!1090377 () Bool)

(assert (=> b!1182113 m!1090377))

(declare-fun m!1090379 () Bool)

(assert (=> b!1182122 m!1090379))

(declare-fun m!1090381 () Bool)

(assert (=> b!1182122 m!1090381))

(declare-fun m!1090383 () Bool)

(assert (=> b!1182118 m!1090383))

(declare-fun m!1090385 () Bool)

(assert (=> b!1182118 m!1090385))

(declare-fun m!1090387 () Bool)

(assert (=> b!1182118 m!1090387))

(declare-fun m!1090389 () Bool)

(assert (=> b!1182118 m!1090389))

(assert (=> b!1182118 m!1090357))

(declare-fun m!1090391 () Bool)

(assert (=> b!1182118 m!1090391))

(assert (=> b!1182118 m!1090357))

(declare-fun m!1090393 () Bool)

(assert (=> b!1182124 m!1090393))

(declare-fun m!1090395 () Bool)

(assert (=> b!1182124 m!1090395))

(declare-fun m!1090397 () Bool)

(assert (=> b!1182124 m!1090397))

(declare-fun m!1090399 () Bool)

(assert (=> b!1182124 m!1090399))

(check-sat (not b_lambda!20351) (not b!1182128) (not b!1182118) (not b!1182114) (not b_next!25213) (not start!99870) (not b!1182120) (not b!1182124) b_and!41297 (not b!1182113) (not mapNonEmpty!46442) (not b!1182131) (not b!1182123) (not b!1182122) tp_is_empty!29743 (not b!1182130) (not b!1182127) (not b!1182117) (not b!1182111))
(check-sat b_and!41297 (not b_next!25213))
