; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100068 () Bool)

(assert start!100068)

(declare-fun b_free!25411 () Bool)

(declare-fun b_next!25411 () Bool)

(assert (=> start!100068 (= b_free!25411 (not b_next!25411))))

(declare-fun tp!88946 () Bool)

(declare-fun b_and!41691 () Bool)

(assert (=> start!100068 (= tp!88946 b_and!41691)))

(declare-fun b!1188316 () Bool)

(declare-fun res!789667 () Bool)

(declare-fun e!675767 () Bool)

(assert (=> b!1188316 (=> (not res!789667) (not e!675767))))

(declare-datatypes ((array!76723 0))(
  ( (array!76724 (arr!37005 (Array (_ BitVec 32) (_ BitVec 64))) (size!37542 (_ BitVec 32))) )
))
(declare-fun lt!539964 () array!76723)

(declare-datatypes ((List!26063 0))(
  ( (Nil!26060) (Cons!26059 (h!27277 (_ BitVec 64)) (t!38458 List!26063)) )
))
(declare-fun arrayNoDuplicates!0 (array!76723 (_ BitVec 32) List!26063) Bool)

(assert (=> b!1188316 (= res!789667 (arrayNoDuplicates!0 lt!539964 #b00000000000000000000000000000000 Nil!26060))))

(declare-fun mapIsEmpty!46739 () Bool)

(declare-fun mapRes!46739 () Bool)

(assert (=> mapIsEmpty!46739 mapRes!46739))

(declare-fun b!1188318 () Bool)

(declare-fun res!789668 () Bool)

(declare-fun e!675761 () Bool)

(assert (=> b!1188318 (=> (not res!789668) (not e!675761))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188318 (= res!789668 (validKeyInArray!0 k0!934))))

(declare-fun b!1188319 () Bool)

(declare-fun e!675765 () Bool)

(declare-fun tp_is_empty!29941 () Bool)

(assert (=> b!1188319 (= e!675765 tp_is_empty!29941)))

(declare-fun _keys!1208 () array!76723)

(declare-fun e!675760 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1188320 () Bool)

(declare-fun arrayContainsKey!0 (array!76723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188320 (= e!675760 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188321 () Bool)

(declare-fun e!675768 () Bool)

(declare-fun e!675762 () Bool)

(assert (=> b!1188321 (= e!675768 e!675762)))

(declare-fun res!789659 () Bool)

(assert (=> b!1188321 (=> res!789659 e!675762)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188321 (= res!789659 (not (validKeyInArray!0 (select (arr!37005 _keys!1208) from!1455))))))

(declare-datatypes ((V!45049 0))(
  ( (V!45050 (val!15027 Int)) )
))
(declare-datatypes ((tuple2!19326 0))(
  ( (tuple2!19327 (_1!9674 (_ BitVec 64)) (_2!9674 V!45049)) )
))
(declare-datatypes ((List!26064 0))(
  ( (Nil!26061) (Cons!26060 (h!27278 tuple2!19326) (t!38459 List!26064)) )
))
(declare-datatypes ((ListLongMap!17303 0))(
  ( (ListLongMap!17304 (toList!8667 List!26064)) )
))
(declare-fun lt!539953 () ListLongMap!17303)

(declare-fun lt!539966 () ListLongMap!17303)

(assert (=> b!1188321 (= lt!539953 lt!539966)))

(declare-fun lt!539952 () ListLongMap!17303)

(declare-fun -!1687 (ListLongMap!17303 (_ BitVec 64)) ListLongMap!17303)

(assert (=> b!1188321 (= lt!539966 (-!1687 lt!539952 k0!934))))

(declare-fun zeroValue!944 () V!45049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14261 0))(
  ( (ValueCellFull!14261 (v!17661 V!45049)) (EmptyCell!14261) )
))
(declare-datatypes ((array!76725 0))(
  ( (array!76726 (arr!37006 (Array (_ BitVec 32) ValueCell!14261)) (size!37543 (_ BitVec 32))) )
))
(declare-fun lt!539954 () array!76725)

(declare-fun minValue!944 () V!45049)

(declare-fun getCurrentListMapNoExtraKeys!5136 (array!76723 array!76725 (_ BitVec 32) (_ BitVec 32) V!45049 V!45049 (_ BitVec 32) Int) ListLongMap!17303)

(assert (=> b!1188321 (= lt!539953 (getCurrentListMapNoExtraKeys!5136 lt!539964 lt!539954 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76725)

(assert (=> b!1188321 (= lt!539952 (getCurrentListMapNoExtraKeys!5136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39342 0))(
  ( (Unit!39343) )
))
(declare-fun lt!539955 () Unit!39342)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 (array!76723 array!76725 (_ BitVec 32) (_ BitVec 32) V!45049 V!45049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39342)

(assert (=> b!1188321 (= lt!539955 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188322 () Bool)

(declare-fun e!675764 () Bool)

(assert (=> b!1188322 (= e!675767 (not e!675764))))

(declare-fun res!789661 () Bool)

(assert (=> b!1188322 (=> res!789661 e!675764)))

(assert (=> b!1188322 (= res!789661 (bvsgt from!1455 i!673))))

(assert (=> b!1188322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539950 () Unit!39342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76723 (_ BitVec 64) (_ BitVec 32)) Unit!39342)

(assert (=> b!1188322 (= lt!539950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188323 () Bool)

(assert (=> b!1188323 (= e!675764 e!675768)))

(declare-fun res!789663 () Bool)

(assert (=> b!1188323 (=> res!789663 e!675768)))

(assert (=> b!1188323 (= res!789663 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!539960 () ListLongMap!17303)

(assert (=> b!1188323 (= lt!539960 (getCurrentListMapNoExtraKeys!5136 lt!539964 lt!539954 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539967 () V!45049)

(assert (=> b!1188323 (= lt!539954 (array!76726 (store (arr!37006 _values!996) i!673 (ValueCellFull!14261 lt!539967)) (size!37543 _values!996)))))

(declare-fun dynLambda!3095 (Int (_ BitVec 64)) V!45049)

(assert (=> b!1188323 (= lt!539967 (dynLambda!3095 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539962 () ListLongMap!17303)

(assert (=> b!1188323 (= lt!539962 (getCurrentListMapNoExtraKeys!5136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188324 () Bool)

(assert (=> b!1188324 (= e!675761 e!675767)))

(declare-fun res!789658 () Bool)

(assert (=> b!1188324 (=> (not res!789658) (not e!675767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76723 (_ BitVec 32)) Bool)

(assert (=> b!1188324 (= res!789658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539964 mask!1564))))

(assert (=> b!1188324 (= lt!539964 (array!76724 (store (arr!37005 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37542 _keys!1208)))))

(declare-fun b!1188325 () Bool)

(declare-fun res!789670 () Bool)

(assert (=> b!1188325 (=> (not res!789670) (not e!675761))))

(assert (=> b!1188325 (= res!789670 (= (select (arr!37005 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46739 () Bool)

(declare-fun tp!88947 () Bool)

(assert (=> mapNonEmpty!46739 (= mapRes!46739 (and tp!88947 e!675765))))

(declare-fun mapValue!46739 () ValueCell!14261)

(declare-fun mapRest!46739 () (Array (_ BitVec 32) ValueCell!14261))

(declare-fun mapKey!46739 () (_ BitVec 32))

(assert (=> mapNonEmpty!46739 (= (arr!37006 _values!996) (store mapRest!46739 mapKey!46739 mapValue!46739))))

(declare-fun b!1188326 () Bool)

(declare-fun e!675770 () Unit!39342)

(declare-fun Unit!39344 () Unit!39342)

(assert (=> b!1188326 (= e!675770 Unit!39344)))

(declare-fun lt!539951 () Unit!39342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39342)

(assert (=> b!1188326 (= lt!539951 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1188326 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539963 () Unit!39342)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76723 (_ BitVec 32) (_ BitVec 32)) Unit!39342)

(assert (=> b!1188326 (= lt!539963 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1188326 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26060)))

(declare-fun lt!539957 () Unit!39342)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76723 (_ BitVec 64) (_ BitVec 32) List!26063) Unit!39342)

(assert (=> b!1188326 (= lt!539957 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26060))))

(assert (=> b!1188326 false))

(declare-fun b!1188327 () Bool)

(declare-fun Unit!39345 () Unit!39342)

(assert (=> b!1188327 (= e!675770 Unit!39345)))

(declare-fun b!1188317 () Bool)

(declare-fun e!675759 () Bool)

(declare-fun e!675766 () Bool)

(assert (=> b!1188317 (= e!675759 (and e!675766 mapRes!46739))))

(declare-fun condMapEmpty!46739 () Bool)

(declare-fun mapDefault!46739 () ValueCell!14261)

(assert (=> b!1188317 (= condMapEmpty!46739 (= (arr!37006 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14261)) mapDefault!46739)))))

(declare-fun res!789664 () Bool)

(assert (=> start!100068 (=> (not res!789664) (not e!675761))))

(assert (=> start!100068 (= res!789664 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37542 _keys!1208))))))

(assert (=> start!100068 e!675761))

(assert (=> start!100068 tp_is_empty!29941))

(declare-fun array_inv!28308 (array!76723) Bool)

(assert (=> start!100068 (array_inv!28308 _keys!1208)))

(assert (=> start!100068 true))

(assert (=> start!100068 tp!88946))

(declare-fun array_inv!28309 (array!76725) Bool)

(assert (=> start!100068 (and (array_inv!28309 _values!996) e!675759)))

(declare-fun b!1188328 () Bool)

(declare-fun e!675763 () Bool)

(assert (=> b!1188328 (= e!675763 e!675760)))

(declare-fun res!789657 () Bool)

(assert (=> b!1188328 (=> res!789657 e!675760)))

(assert (=> b!1188328 (= res!789657 (not (= (select (arr!37005 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188329 () Bool)

(assert (=> b!1188329 (= e!675766 tp_is_empty!29941)))

(declare-fun b!1188330 () Bool)

(assert (=> b!1188330 (= e!675762 true)))

(declare-fun lt!539956 () ListLongMap!17303)

(declare-fun lt!539958 () ListLongMap!17303)

(assert (=> b!1188330 (= (-!1687 lt!539956 k0!934) lt!539958)))

(declare-fun lt!539959 () Unit!39342)

(declare-fun lt!539965 () V!45049)

(declare-fun addRemoveCommutativeForDiffKeys!200 (ListLongMap!17303 (_ BitVec 64) V!45049 (_ BitVec 64)) Unit!39342)

(assert (=> b!1188330 (= lt!539959 (addRemoveCommutativeForDiffKeys!200 lt!539952 (select (arr!37005 _keys!1208) from!1455) lt!539965 k0!934))))

(assert (=> b!1188330 (and (= lt!539962 lt!539956) (= lt!539966 lt!539953))))

(declare-fun lt!539961 () tuple2!19326)

(declare-fun +!3984 (ListLongMap!17303 tuple2!19326) ListLongMap!17303)

(assert (=> b!1188330 (= lt!539956 (+!3984 lt!539952 lt!539961))))

(assert (=> b!1188330 (not (= (select (arr!37005 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539968 () Unit!39342)

(assert (=> b!1188330 (= lt!539968 e!675770)))

(declare-fun c!117638 () Bool)

(assert (=> b!1188330 (= c!117638 (= (select (arr!37005 _keys!1208) from!1455) k0!934))))

(assert (=> b!1188330 e!675763))

(declare-fun res!789665 () Bool)

(assert (=> b!1188330 (=> (not res!789665) (not e!675763))))

(assert (=> b!1188330 (= res!789665 (= lt!539960 lt!539958))))

(assert (=> b!1188330 (= lt!539958 (+!3984 lt!539966 lt!539961))))

(assert (=> b!1188330 (= lt!539961 (tuple2!19327 (select (arr!37005 _keys!1208) from!1455) lt!539965))))

(declare-fun get!18999 (ValueCell!14261 V!45049) V!45049)

(assert (=> b!1188330 (= lt!539965 (get!18999 (select (arr!37006 _values!996) from!1455) lt!539967))))

(declare-fun b!1188331 () Bool)

(declare-fun res!789671 () Bool)

(assert (=> b!1188331 (=> (not res!789671) (not e!675761))))

(assert (=> b!1188331 (= res!789671 (and (= (size!37543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37542 _keys!1208) (size!37543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188332 () Bool)

(declare-fun res!789662 () Bool)

(assert (=> b!1188332 (=> (not res!789662) (not e!675761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188332 (= res!789662 (validMask!0 mask!1564))))

(declare-fun b!1188333 () Bool)

(declare-fun res!789666 () Bool)

(assert (=> b!1188333 (=> (not res!789666) (not e!675761))))

(assert (=> b!1188333 (= res!789666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188334 () Bool)

(declare-fun res!789669 () Bool)

(assert (=> b!1188334 (=> (not res!789669) (not e!675761))))

(assert (=> b!1188334 (= res!789669 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26060))))

(declare-fun b!1188335 () Bool)

(declare-fun res!789660 () Bool)

(assert (=> b!1188335 (=> (not res!789660) (not e!675761))))

(assert (=> b!1188335 (= res!789660 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37542 _keys!1208))))))

(assert (= (and start!100068 res!789664) b!1188332))

(assert (= (and b!1188332 res!789662) b!1188331))

(assert (= (and b!1188331 res!789671) b!1188333))

(assert (= (and b!1188333 res!789666) b!1188334))

(assert (= (and b!1188334 res!789669) b!1188335))

(assert (= (and b!1188335 res!789660) b!1188318))

(assert (= (and b!1188318 res!789668) b!1188325))

(assert (= (and b!1188325 res!789670) b!1188324))

(assert (= (and b!1188324 res!789658) b!1188316))

(assert (= (and b!1188316 res!789667) b!1188322))

(assert (= (and b!1188322 (not res!789661)) b!1188323))

(assert (= (and b!1188323 (not res!789663)) b!1188321))

(assert (= (and b!1188321 (not res!789659)) b!1188330))

(assert (= (and b!1188330 res!789665) b!1188328))

(assert (= (and b!1188328 (not res!789657)) b!1188320))

(assert (= (and b!1188330 c!117638) b!1188326))

(assert (= (and b!1188330 (not c!117638)) b!1188327))

(assert (= (and b!1188317 condMapEmpty!46739) mapIsEmpty!46739))

(assert (= (and b!1188317 (not condMapEmpty!46739)) mapNonEmpty!46739))

(get-info :version)

(assert (= (and mapNonEmpty!46739 ((_ is ValueCellFull!14261) mapValue!46739)) b!1188319))

(assert (= (and b!1188317 ((_ is ValueCellFull!14261) mapDefault!46739)) b!1188329))

(assert (= start!100068 b!1188317))

(declare-fun b_lambda!20549 () Bool)

(assert (=> (not b_lambda!20549) (not b!1188323)))

(declare-fun t!38457 () Bool)

(declare-fun tb!10215 () Bool)

(assert (=> (and start!100068 (= defaultEntry!1004 defaultEntry!1004) t!38457) tb!10215))

(declare-fun result!21005 () Bool)

(assert (=> tb!10215 (= result!21005 tp_is_empty!29941)))

(assert (=> b!1188323 t!38457))

(declare-fun b_and!41693 () Bool)

(assert (= b_and!41691 (and (=> t!38457 result!21005) b_and!41693)))

(declare-fun m!1097217 () Bool)

(assert (=> b!1188320 m!1097217))

(declare-fun m!1097219 () Bool)

(assert (=> b!1188323 m!1097219))

(declare-fun m!1097221 () Bool)

(assert (=> b!1188323 m!1097221))

(declare-fun m!1097223 () Bool)

(assert (=> b!1188323 m!1097223))

(declare-fun m!1097225 () Bool)

(assert (=> b!1188323 m!1097225))

(declare-fun m!1097227 () Bool)

(assert (=> b!1188321 m!1097227))

(declare-fun m!1097229 () Bool)

(assert (=> b!1188321 m!1097229))

(declare-fun m!1097231 () Bool)

(assert (=> b!1188321 m!1097231))

(declare-fun m!1097233 () Bool)

(assert (=> b!1188321 m!1097233))

(declare-fun m!1097235 () Bool)

(assert (=> b!1188321 m!1097235))

(declare-fun m!1097237 () Bool)

(assert (=> b!1188321 m!1097237))

(assert (=> b!1188321 m!1097235))

(declare-fun m!1097239 () Bool)

(assert (=> b!1188326 m!1097239))

(declare-fun m!1097241 () Bool)

(assert (=> b!1188326 m!1097241))

(declare-fun m!1097243 () Bool)

(assert (=> b!1188326 m!1097243))

(declare-fun m!1097245 () Bool)

(assert (=> b!1188326 m!1097245))

(declare-fun m!1097247 () Bool)

(assert (=> b!1188326 m!1097247))

(declare-fun m!1097249 () Bool)

(assert (=> b!1188334 m!1097249))

(declare-fun m!1097251 () Bool)

(assert (=> b!1188316 m!1097251))

(declare-fun m!1097253 () Bool)

(assert (=> b!1188322 m!1097253))

(declare-fun m!1097255 () Bool)

(assert (=> b!1188322 m!1097255))

(declare-fun m!1097257 () Bool)

(assert (=> b!1188325 m!1097257))

(declare-fun m!1097259 () Bool)

(assert (=> b!1188333 m!1097259))

(declare-fun m!1097261 () Bool)

(assert (=> b!1188318 m!1097261))

(declare-fun m!1097263 () Bool)

(assert (=> b!1188332 m!1097263))

(declare-fun m!1097265 () Bool)

(assert (=> mapNonEmpty!46739 m!1097265))

(declare-fun m!1097267 () Bool)

(assert (=> b!1188324 m!1097267))

(declare-fun m!1097269 () Bool)

(assert (=> b!1188324 m!1097269))

(declare-fun m!1097271 () Bool)

(assert (=> start!100068 m!1097271))

(declare-fun m!1097273 () Bool)

(assert (=> start!100068 m!1097273))

(assert (=> b!1188328 m!1097235))

(declare-fun m!1097275 () Bool)

(assert (=> b!1188330 m!1097275))

(assert (=> b!1188330 m!1097235))

(declare-fun m!1097277 () Bool)

(assert (=> b!1188330 m!1097277))

(declare-fun m!1097279 () Bool)

(assert (=> b!1188330 m!1097279))

(declare-fun m!1097281 () Bool)

(assert (=> b!1188330 m!1097281))

(assert (=> b!1188330 m!1097235))

(declare-fun m!1097283 () Bool)

(assert (=> b!1188330 m!1097283))

(assert (=> b!1188330 m!1097275))

(declare-fun m!1097285 () Bool)

(assert (=> b!1188330 m!1097285))

(check-sat tp_is_empty!29941 (not b!1188324) b_and!41693 (not mapNonEmpty!46739) (not b!1188323) (not b!1188332) (not b!1188321) (not b!1188322) (not b!1188326) (not b!1188320) (not b!1188333) (not b!1188330) (not b_lambda!20549) (not b!1188318) (not b!1188334) (not start!100068) (not b_next!25411) (not b!1188316))
(check-sat b_and!41693 (not b_next!25411))
