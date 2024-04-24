; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100008 () Bool)

(assert start!100008)

(declare-fun b_free!25351 () Bool)

(declare-fun b_next!25351 () Bool)

(assert (=> start!100008 (= b_free!25351 (not b_next!25351))))

(declare-fun tp!88766 () Bool)

(declare-fun b_and!41571 () Bool)

(assert (=> start!100008 (= tp!88766 b_and!41571)))

(declare-fun b!1186456 () Bool)

(declare-fun e!674681 () Bool)

(assert (=> b!1186456 (= e!674681 true)))

(declare-datatypes ((V!44969 0))(
  ( (V!44970 (val!14997 Int)) )
))
(declare-datatypes ((tuple2!19278 0))(
  ( (tuple2!19279 (_1!9650 (_ BitVec 64)) (_2!9650 V!44969)) )
))
(declare-datatypes ((List!26012 0))(
  ( (Nil!26009) (Cons!26008 (h!27226 tuple2!19278) (t!38347 List!26012)) )
))
(declare-datatypes ((ListLongMap!17255 0))(
  ( (ListLongMap!17256 (toList!8643 List!26012)) )
))
(declare-fun lt!538253 () ListLongMap!17255)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!538244 () ListLongMap!17255)

(declare-fun -!1664 (ListLongMap!17255 (_ BitVec 64)) ListLongMap!17255)

(assert (=> b!1186456 (= (-!1664 lt!538253 k0!934) lt!538244)))

(declare-datatypes ((array!76607 0))(
  ( (array!76608 (arr!36947 (Array (_ BitVec 32) (_ BitVec 64))) (size!37484 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76607)

(declare-fun lt!538258 () V!44969)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538248 () ListLongMap!17255)

(declare-datatypes ((Unit!39257 0))(
  ( (Unit!39258) )
))
(declare-fun lt!538249 () Unit!39257)

(declare-fun addRemoveCommutativeForDiffKeys!177 (ListLongMap!17255 (_ BitVec 64) V!44969 (_ BitVec 64)) Unit!39257)

(assert (=> b!1186456 (= lt!538249 (addRemoveCommutativeForDiffKeys!177 lt!538248 (select (arr!36947 _keys!1208) from!1455) lt!538258 k0!934))))

(declare-fun lt!538254 () ListLongMap!17255)

(declare-fun lt!538250 () ListLongMap!17255)

(declare-fun lt!538240 () ListLongMap!17255)

(assert (=> b!1186456 (and (= lt!538240 lt!538253) (= lt!538250 lt!538254))))

(declare-fun lt!538242 () tuple2!19278)

(declare-fun +!3961 (ListLongMap!17255 tuple2!19278) ListLongMap!17255)

(assert (=> b!1186456 (= lt!538253 (+!3961 lt!538248 lt!538242))))

(assert (=> b!1186456 (not (= (select (arr!36947 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538245 () Unit!39257)

(declare-fun e!674680 () Unit!39257)

(assert (=> b!1186456 (= lt!538245 e!674680)))

(declare-fun c!117548 () Bool)

(assert (=> b!1186456 (= c!117548 (= (select (arr!36947 _keys!1208) from!1455) k0!934))))

(declare-fun e!674690 () Bool)

(assert (=> b!1186456 e!674690))

(declare-fun res!788319 () Bool)

(assert (=> b!1186456 (=> (not res!788319) (not e!674690))))

(declare-fun lt!538243 () ListLongMap!17255)

(assert (=> b!1186456 (= res!788319 (= lt!538243 lt!538244))))

(assert (=> b!1186456 (= lt!538244 (+!3961 lt!538250 lt!538242))))

(assert (=> b!1186456 (= lt!538242 (tuple2!19279 (select (arr!36947 _keys!1208) from!1455) lt!538258))))

(declare-fun lt!538247 () V!44969)

(declare-datatypes ((ValueCell!14231 0))(
  ( (ValueCellFull!14231 (v!17631 V!44969)) (EmptyCell!14231) )
))
(declare-datatypes ((array!76609 0))(
  ( (array!76610 (arr!36948 (Array (_ BitVec 32) ValueCell!14231)) (size!37485 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76609)

(declare-fun get!18956 (ValueCell!14231 V!44969) V!44969)

(assert (=> b!1186456 (= lt!538258 (get!18956 (select (arr!36948 _values!996) from!1455) lt!538247))))

(declare-fun b!1186457 () Bool)

(declare-fun res!788314 () Bool)

(declare-fun e!674688 () Bool)

(assert (=> b!1186457 (=> (not res!788314) (not e!674688))))

(declare-fun lt!538241 () array!76607)

(declare-datatypes ((List!26013 0))(
  ( (Nil!26010) (Cons!26009 (h!27227 (_ BitVec 64)) (t!38348 List!26013)) )
))
(declare-fun arrayNoDuplicates!0 (array!76607 (_ BitVec 32) List!26013) Bool)

(assert (=> b!1186457 (= res!788314 (arrayNoDuplicates!0 lt!538241 #b00000000000000000000000000000000 Nil!26010))))

(declare-fun b!1186458 () Bool)

(declare-fun Unit!39259 () Unit!39257)

(assert (=> b!1186458 (= e!674680 Unit!39259)))

(declare-fun b!1186459 () Bool)

(declare-fun e!674683 () Bool)

(declare-fun e!674685 () Bool)

(assert (=> b!1186459 (= e!674683 e!674685)))

(declare-fun res!788308 () Bool)

(assert (=> b!1186459 (=> res!788308 e!674685)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186459 (= res!788308 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538256 () array!76609)

(declare-fun minValue!944 () V!44969)

(declare-fun getCurrentListMapNoExtraKeys!5114 (array!76607 array!76609 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) Int) ListLongMap!17255)

(assert (=> b!1186459 (= lt!538243 (getCurrentListMapNoExtraKeys!5114 lt!538241 lt!538256 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186459 (= lt!538256 (array!76610 (store (arr!36948 _values!996) i!673 (ValueCellFull!14231 lt!538247)) (size!37485 _values!996)))))

(declare-fun dynLambda!3075 (Int (_ BitVec 64)) V!44969)

(assert (=> b!1186459 (= lt!538247 (dynLambda!3075 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186459 (= lt!538240 (getCurrentListMapNoExtraKeys!5114 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186460 () Bool)

(declare-fun res!788307 () Bool)

(declare-fun e!674684 () Bool)

(assert (=> b!1186460 (=> (not res!788307) (not e!674684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186460 (= res!788307 (validKeyInArray!0 k0!934))))

(declare-fun b!1186462 () Bool)

(declare-fun res!788320 () Bool)

(assert (=> b!1186462 (=> (not res!788320) (not e!674684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186462 (= res!788320 (validMask!0 mask!1564))))

(declare-fun b!1186463 () Bool)

(declare-fun e!674679 () Bool)

(declare-fun e!674682 () Bool)

(declare-fun mapRes!46649 () Bool)

(assert (=> b!1186463 (= e!674679 (and e!674682 mapRes!46649))))

(declare-fun condMapEmpty!46649 () Bool)

(declare-fun mapDefault!46649 () ValueCell!14231)

(assert (=> b!1186463 (= condMapEmpty!46649 (= (arr!36948 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14231)) mapDefault!46649)))))

(declare-fun b!1186464 () Bool)

(declare-fun res!788317 () Bool)

(assert (=> b!1186464 (=> (not res!788317) (not e!674684))))

(assert (=> b!1186464 (= res!788317 (= (select (arr!36947 _keys!1208) i!673) k0!934))))

(declare-fun b!1186465 () Bool)

(declare-fun res!788316 () Bool)

(assert (=> b!1186465 (=> (not res!788316) (not e!674684))))

(assert (=> b!1186465 (= res!788316 (and (= (size!37485 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37484 _keys!1208) (size!37485 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186466 () Bool)

(declare-fun e!674689 () Bool)

(declare-fun tp_is_empty!29881 () Bool)

(assert (=> b!1186466 (= e!674689 tp_is_empty!29881)))

(declare-fun e!674686 () Bool)

(declare-fun b!1186467 () Bool)

(declare-fun arrayContainsKey!0 (array!76607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186467 (= e!674686 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186468 () Bool)

(assert (=> b!1186468 (= e!674684 e!674688)))

(declare-fun res!788311 () Bool)

(assert (=> b!1186468 (=> (not res!788311) (not e!674688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76607 (_ BitVec 32)) Bool)

(assert (=> b!1186468 (= res!788311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538241 mask!1564))))

(assert (=> b!1186468 (= lt!538241 (array!76608 (store (arr!36947 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37484 _keys!1208)))))

(declare-fun mapNonEmpty!46649 () Bool)

(declare-fun tp!88767 () Bool)

(assert (=> mapNonEmpty!46649 (= mapRes!46649 (and tp!88767 e!674689))))

(declare-fun mapRest!46649 () (Array (_ BitVec 32) ValueCell!14231))

(declare-fun mapKey!46649 () (_ BitVec 32))

(declare-fun mapValue!46649 () ValueCell!14231)

(assert (=> mapNonEmpty!46649 (= (arr!36948 _values!996) (store mapRest!46649 mapKey!46649 mapValue!46649))))

(declare-fun b!1186469 () Bool)

(declare-fun res!788321 () Bool)

(assert (=> b!1186469 (=> (not res!788321) (not e!674684))))

(assert (=> b!1186469 (= res!788321 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26010))))

(declare-fun b!1186470 () Bool)

(declare-fun Unit!39260 () Unit!39257)

(assert (=> b!1186470 (= e!674680 Unit!39260)))

(declare-fun lt!538255 () Unit!39257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39257)

(assert (=> b!1186470 (= lt!538255 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186470 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538246 () Unit!39257)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76607 (_ BitVec 32) (_ BitVec 32)) Unit!39257)

(assert (=> b!1186470 (= lt!538246 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186470 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26010)))

(declare-fun lt!538251 () Unit!39257)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76607 (_ BitVec 64) (_ BitVec 32) List!26013) Unit!39257)

(assert (=> b!1186470 (= lt!538251 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26010))))

(assert (=> b!1186470 false))

(declare-fun res!788312 () Bool)

(assert (=> start!100008 (=> (not res!788312) (not e!674684))))

(assert (=> start!100008 (= res!788312 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37484 _keys!1208))))))

(assert (=> start!100008 e!674684))

(assert (=> start!100008 tp_is_empty!29881))

(declare-fun array_inv!28272 (array!76607) Bool)

(assert (=> start!100008 (array_inv!28272 _keys!1208)))

(assert (=> start!100008 true))

(assert (=> start!100008 tp!88766))

(declare-fun array_inv!28273 (array!76609) Bool)

(assert (=> start!100008 (and (array_inv!28273 _values!996) e!674679)))

(declare-fun b!1186461 () Bool)

(assert (=> b!1186461 (= e!674690 e!674686)))

(declare-fun res!788318 () Bool)

(assert (=> b!1186461 (=> res!788318 e!674686)))

(assert (=> b!1186461 (= res!788318 (not (= (select (arr!36947 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186471 () Bool)

(assert (=> b!1186471 (= e!674682 tp_is_empty!29881)))

(declare-fun b!1186472 () Bool)

(assert (=> b!1186472 (= e!674685 e!674681)))

(declare-fun res!788313 () Bool)

(assert (=> b!1186472 (=> res!788313 e!674681)))

(assert (=> b!1186472 (= res!788313 (not (validKeyInArray!0 (select (arr!36947 _keys!1208) from!1455))))))

(assert (=> b!1186472 (= lt!538254 lt!538250)))

(assert (=> b!1186472 (= lt!538250 (-!1664 lt!538248 k0!934))))

(assert (=> b!1186472 (= lt!538254 (getCurrentListMapNoExtraKeys!5114 lt!538241 lt!538256 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186472 (= lt!538248 (getCurrentListMapNoExtraKeys!5114 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538257 () Unit!39257)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!884 (array!76607 array!76609 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39257)

(assert (=> b!1186472 (= lt!538257 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!884 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186473 () Bool)

(assert (=> b!1186473 (= e!674688 (not e!674683))))

(declare-fun res!788315 () Bool)

(assert (=> b!1186473 (=> res!788315 e!674683)))

(assert (=> b!1186473 (= res!788315 (bvsgt from!1455 i!673))))

(assert (=> b!1186473 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538252 () Unit!39257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76607 (_ BitVec 64) (_ BitVec 32)) Unit!39257)

(assert (=> b!1186473 (= lt!538252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186474 () Bool)

(declare-fun res!788309 () Bool)

(assert (=> b!1186474 (=> (not res!788309) (not e!674684))))

(assert (=> b!1186474 (= res!788309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46649 () Bool)

(assert (=> mapIsEmpty!46649 mapRes!46649))

(declare-fun b!1186475 () Bool)

(declare-fun res!788310 () Bool)

(assert (=> b!1186475 (=> (not res!788310) (not e!674684))))

(assert (=> b!1186475 (= res!788310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37484 _keys!1208))))))

(assert (= (and start!100008 res!788312) b!1186462))

(assert (= (and b!1186462 res!788320) b!1186465))

(assert (= (and b!1186465 res!788316) b!1186474))

(assert (= (and b!1186474 res!788309) b!1186469))

(assert (= (and b!1186469 res!788321) b!1186475))

(assert (= (and b!1186475 res!788310) b!1186460))

(assert (= (and b!1186460 res!788307) b!1186464))

(assert (= (and b!1186464 res!788317) b!1186468))

(assert (= (and b!1186468 res!788311) b!1186457))

(assert (= (and b!1186457 res!788314) b!1186473))

(assert (= (and b!1186473 (not res!788315)) b!1186459))

(assert (= (and b!1186459 (not res!788308)) b!1186472))

(assert (= (and b!1186472 (not res!788313)) b!1186456))

(assert (= (and b!1186456 res!788319) b!1186461))

(assert (= (and b!1186461 (not res!788318)) b!1186467))

(assert (= (and b!1186456 c!117548) b!1186470))

(assert (= (and b!1186456 (not c!117548)) b!1186458))

(assert (= (and b!1186463 condMapEmpty!46649) mapIsEmpty!46649))

(assert (= (and b!1186463 (not condMapEmpty!46649)) mapNonEmpty!46649))

(get-info :version)

(assert (= (and mapNonEmpty!46649 ((_ is ValueCellFull!14231) mapValue!46649)) b!1186466))

(assert (= (and b!1186463 ((_ is ValueCellFull!14231) mapDefault!46649)) b!1186471))

(assert (= start!100008 b!1186463))

(declare-fun b_lambda!20489 () Bool)

(assert (=> (not b_lambda!20489) (not b!1186459)))

(declare-fun t!38346 () Bool)

(declare-fun tb!10155 () Bool)

(assert (=> (and start!100008 (= defaultEntry!1004 defaultEntry!1004) t!38346) tb!10155))

(declare-fun result!20885 () Bool)

(assert (=> tb!10155 (= result!20885 tp_is_empty!29881)))

(assert (=> b!1186459 t!38346))

(declare-fun b_and!41573 () Bool)

(assert (= b_and!41571 (and (=> t!38346 result!20885) b_and!41573)))

(declare-fun m!1095117 () Bool)

(assert (=> b!1186469 m!1095117))

(declare-fun m!1095119 () Bool)

(assert (=> b!1186459 m!1095119))

(declare-fun m!1095121 () Bool)

(assert (=> b!1186459 m!1095121))

(declare-fun m!1095123 () Bool)

(assert (=> b!1186459 m!1095123))

(declare-fun m!1095125 () Bool)

(assert (=> b!1186459 m!1095125))

(declare-fun m!1095127 () Bool)

(assert (=> start!100008 m!1095127))

(declare-fun m!1095129 () Bool)

(assert (=> start!100008 m!1095129))

(declare-fun m!1095131 () Bool)

(assert (=> b!1186474 m!1095131))

(declare-fun m!1095133 () Bool)

(assert (=> b!1186461 m!1095133))

(declare-fun m!1095135 () Bool)

(assert (=> b!1186467 m!1095135))

(declare-fun m!1095137 () Bool)

(assert (=> mapNonEmpty!46649 m!1095137))

(declare-fun m!1095139 () Bool)

(assert (=> b!1186470 m!1095139))

(declare-fun m!1095141 () Bool)

(assert (=> b!1186470 m!1095141))

(declare-fun m!1095143 () Bool)

(assert (=> b!1186470 m!1095143))

(declare-fun m!1095145 () Bool)

(assert (=> b!1186470 m!1095145))

(declare-fun m!1095147 () Bool)

(assert (=> b!1186470 m!1095147))

(declare-fun m!1095149 () Bool)

(assert (=> b!1186464 m!1095149))

(declare-fun m!1095151 () Bool)

(assert (=> b!1186456 m!1095151))

(assert (=> b!1186456 m!1095133))

(declare-fun m!1095153 () Bool)

(assert (=> b!1186456 m!1095153))

(declare-fun m!1095155 () Bool)

(assert (=> b!1186456 m!1095155))

(declare-fun m!1095157 () Bool)

(assert (=> b!1186456 m!1095157))

(declare-fun m!1095159 () Bool)

(assert (=> b!1186456 m!1095159))

(assert (=> b!1186456 m!1095133))

(assert (=> b!1186456 m!1095151))

(declare-fun m!1095161 () Bool)

(assert (=> b!1186456 m!1095161))

(declare-fun m!1095163 () Bool)

(assert (=> b!1186457 m!1095163))

(declare-fun m!1095165 () Bool)

(assert (=> b!1186472 m!1095165))

(declare-fun m!1095167 () Bool)

(assert (=> b!1186472 m!1095167))

(assert (=> b!1186472 m!1095133))

(declare-fun m!1095169 () Bool)

(assert (=> b!1186472 m!1095169))

(assert (=> b!1186472 m!1095133))

(declare-fun m!1095171 () Bool)

(assert (=> b!1186472 m!1095171))

(declare-fun m!1095173 () Bool)

(assert (=> b!1186472 m!1095173))

(declare-fun m!1095175 () Bool)

(assert (=> b!1186460 m!1095175))

(declare-fun m!1095177 () Bool)

(assert (=> b!1186473 m!1095177))

(declare-fun m!1095179 () Bool)

(assert (=> b!1186473 m!1095179))

(declare-fun m!1095181 () Bool)

(assert (=> b!1186462 m!1095181))

(declare-fun m!1095183 () Bool)

(assert (=> b!1186468 m!1095183))

(declare-fun m!1095185 () Bool)

(assert (=> b!1186468 m!1095185))

(check-sat (not mapNonEmpty!46649) tp_is_empty!29881 (not start!100008) (not b!1186457) (not b!1186467) (not b!1186456) (not b_lambda!20489) (not b_next!25351) (not b!1186468) (not b!1186459) (not b!1186462) (not b!1186472) b_and!41573 (not b!1186470) (not b!1186469) (not b!1186473) (not b!1186474) (not b!1186460))
(check-sat b_and!41573 (not b_next!25351))
