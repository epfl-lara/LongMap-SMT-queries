; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99852 () Bool)

(assert start!99852)

(declare-fun b_free!25431 () Bool)

(declare-fun b_next!25431 () Bool)

(assert (=> start!99852 (= b_free!25431 (not b_next!25431))))

(declare-fun tp!89006 () Bool)

(declare-fun b_and!41729 () Bool)

(assert (=> start!99852 (= tp!89006 b_and!41729)))

(declare-fun b!1187647 () Bool)

(declare-fun e!675295 () Bool)

(declare-fun e!675296 () Bool)

(assert (=> b!1187647 (= e!675295 e!675296)))

(declare-fun res!789611 () Bool)

(assert (=> b!1187647 (=> (not res!789611) (not e!675296))))

(declare-datatypes ((array!76717 0))(
  ( (array!76718 (arr!37008 (Array (_ BitVec 32) (_ BitVec 64))) (size!37544 (_ BitVec 32))) )
))
(declare-fun lt!540040 () array!76717)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76717 (_ BitVec 32)) Bool)

(assert (=> b!1187647 (= res!789611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540040 mask!1564))))

(declare-fun _keys!1208 () array!76717)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187647 (= lt!540040 (array!76718 (store (arr!37008 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37544 _keys!1208)))))

(declare-fun b!1187648 () Bool)

(declare-fun e!675292 () Bool)

(declare-fun tp_is_empty!29961 () Bool)

(assert (=> b!1187648 (= e!675292 tp_is_empty!29961)))

(declare-fun b!1187649 () Bool)

(declare-fun e!675298 () Bool)

(declare-fun e!675287 () Bool)

(declare-fun mapRes!46769 () Bool)

(assert (=> b!1187649 (= e!675298 (and e!675287 mapRes!46769))))

(declare-fun condMapEmpty!46769 () Bool)

(declare-datatypes ((V!45075 0))(
  ( (V!45076 (val!15037 Int)) )
))
(declare-datatypes ((ValueCell!14271 0))(
  ( (ValueCellFull!14271 (v!17675 V!45075)) (EmptyCell!14271) )
))
(declare-datatypes ((array!76719 0))(
  ( (array!76720 (arr!37009 (Array (_ BitVec 32) ValueCell!14271)) (size!37545 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76719)

(declare-fun mapDefault!46769 () ValueCell!14271)

(assert (=> b!1187649 (= condMapEmpty!46769 (= (arr!37009 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14271)) mapDefault!46769)))))

(declare-fun b!1187650 () Bool)

(declare-fun res!789606 () Bool)

(assert (=> b!1187650 (=> (not res!789606) (not e!675295))))

(declare-datatypes ((List!26045 0))(
  ( (Nil!26042) (Cons!26041 (h!27250 (_ BitVec 64)) (t!38468 List!26045)) )
))
(declare-fun arrayNoDuplicates!0 (array!76717 (_ BitVec 32) List!26045) Bool)

(assert (=> b!1187650 (= res!789606 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26042))))

(declare-fun b!1187651 () Bool)

(declare-fun e!675290 () Bool)

(assert (=> b!1187651 (= e!675290 true)))

(declare-datatypes ((tuple2!19306 0))(
  ( (tuple2!19307 (_1!9664 (_ BitVec 64)) (_2!9664 V!45075)) )
))
(declare-datatypes ((List!26046 0))(
  ( (Nil!26043) (Cons!26042 (h!27251 tuple2!19306) (t!38469 List!26046)) )
))
(declare-datatypes ((ListLongMap!17275 0))(
  ( (ListLongMap!17276 (toList!8653 List!26046)) )
))
(declare-fun lt!540049 () ListLongMap!17275)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!540038 () ListLongMap!17275)

(declare-fun -!1684 (ListLongMap!17275 (_ BitVec 64)) ListLongMap!17275)

(assert (=> b!1187651 (= (-!1684 lt!540049 k0!934) lt!540038)))

(declare-fun lt!540051 () ListLongMap!17275)

(declare-fun lt!540050 () V!45075)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39388 0))(
  ( (Unit!39389) )
))
(declare-fun lt!540048 () Unit!39388)

(declare-fun addRemoveCommutativeForDiffKeys!203 (ListLongMap!17275 (_ BitVec 64) V!45075 (_ BitVec 64)) Unit!39388)

(assert (=> b!1187651 (= lt!540048 (addRemoveCommutativeForDiffKeys!203 lt!540051 (select (arr!37008 _keys!1208) from!1455) lt!540050 k0!934))))

(declare-fun lt!540042 () ListLongMap!17275)

(declare-fun lt!540036 () ListLongMap!17275)

(declare-fun lt!540041 () ListLongMap!17275)

(assert (=> b!1187651 (and (= lt!540036 lt!540049) (= lt!540041 lt!540042))))

(declare-fun lt!540047 () tuple2!19306)

(declare-fun +!3940 (ListLongMap!17275 tuple2!19306) ListLongMap!17275)

(assert (=> b!1187651 (= lt!540049 (+!3940 lt!540051 lt!540047))))

(assert (=> b!1187651 (not (= (select (arr!37008 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540052 () Unit!39388)

(declare-fun e!675291 () Unit!39388)

(assert (=> b!1187651 (= lt!540052 e!675291)))

(declare-fun c!117270 () Bool)

(assert (=> b!1187651 (= c!117270 (= (select (arr!37008 _keys!1208) from!1455) k0!934))))

(declare-fun e!675294 () Bool)

(assert (=> b!1187651 e!675294))

(declare-fun res!789600 () Bool)

(assert (=> b!1187651 (=> (not res!789600) (not e!675294))))

(declare-fun lt!540053 () ListLongMap!17275)

(assert (=> b!1187651 (= res!789600 (= lt!540053 lt!540038))))

(assert (=> b!1187651 (= lt!540038 (+!3940 lt!540041 lt!540047))))

(assert (=> b!1187651 (= lt!540047 (tuple2!19307 (select (arr!37008 _keys!1208) from!1455) lt!540050))))

(declare-fun lt!540044 () V!45075)

(declare-fun get!18957 (ValueCell!14271 V!45075) V!45075)

(assert (=> b!1187651 (= lt!540050 (get!18957 (select (arr!37009 _values!996) from!1455) lt!540044))))

(declare-fun b!1187652 () Bool)

(declare-fun e!675293 () Bool)

(assert (=> b!1187652 (= e!675296 (not e!675293))))

(declare-fun res!789613 () Bool)

(assert (=> b!1187652 (=> res!789613 e!675293)))

(assert (=> b!1187652 (= res!789613 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187652 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540039 () Unit!39388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76717 (_ BitVec 64) (_ BitVec 32)) Unit!39388)

(assert (=> b!1187652 (= lt!540039 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187654 () Bool)

(declare-fun e!675297 () Bool)

(assert (=> b!1187654 (= e!675297 e!675290)))

(declare-fun res!789599 () Bool)

(assert (=> b!1187654 (=> res!789599 e!675290)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187654 (= res!789599 (not (validKeyInArray!0 (select (arr!37008 _keys!1208) from!1455))))))

(assert (=> b!1187654 (= lt!540042 lt!540041)))

(assert (=> b!1187654 (= lt!540041 (-!1684 lt!540051 k0!934))))

(declare-fun zeroValue!944 () V!45075)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45075)

(declare-fun lt!540043 () array!76719)

(declare-fun getCurrentListMapNoExtraKeys!5094 (array!76717 array!76719 (_ BitVec 32) (_ BitVec 32) V!45075 V!45075 (_ BitVec 32) Int) ListLongMap!17275)

(assert (=> b!1187654 (= lt!540042 (getCurrentListMapNoExtraKeys!5094 lt!540040 lt!540043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187654 (= lt!540051 (getCurrentListMapNoExtraKeys!5094 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540037 () Unit!39388)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 (array!76717 array!76719 (_ BitVec 32) (_ BitVec 32) V!45075 V!45075 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39388)

(assert (=> b!1187654 (= lt!540037 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187655 () Bool)

(declare-fun Unit!39390 () Unit!39388)

(assert (=> b!1187655 (= e!675291 Unit!39390)))

(declare-fun lt!540046 () Unit!39388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76717 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39388)

(assert (=> b!1187655 (= lt!540046 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187655 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540045 () Unit!39388)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76717 (_ BitVec 32) (_ BitVec 32)) Unit!39388)

(assert (=> b!1187655 (= lt!540045 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187655 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26042)))

(declare-fun lt!540054 () Unit!39388)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76717 (_ BitVec 64) (_ BitVec 32) List!26045) Unit!39388)

(assert (=> b!1187655 (= lt!540054 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26042))))

(assert (=> b!1187655 false))

(declare-fun b!1187656 () Bool)

(declare-fun res!789605 () Bool)

(assert (=> b!1187656 (=> (not res!789605) (not e!675295))))

(assert (=> b!1187656 (= res!789605 (and (= (size!37545 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37544 _keys!1208) (size!37545 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46769 () Bool)

(assert (=> mapIsEmpty!46769 mapRes!46769))

(declare-fun b!1187657 () Bool)

(assert (=> b!1187657 (= e!675287 tp_is_empty!29961)))

(declare-fun b!1187658 () Bool)

(declare-fun res!789603 () Bool)

(assert (=> b!1187658 (=> (not res!789603) (not e!675295))))

(assert (=> b!1187658 (= res!789603 (validKeyInArray!0 k0!934))))

(declare-fun b!1187659 () Bool)

(declare-fun res!789609 () Bool)

(assert (=> b!1187659 (=> (not res!789609) (not e!675295))))

(assert (=> b!1187659 (= res!789609 (= (select (arr!37008 _keys!1208) i!673) k0!934))))

(declare-fun res!789608 () Bool)

(assert (=> start!99852 (=> (not res!789608) (not e!675295))))

(assert (=> start!99852 (= res!789608 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37544 _keys!1208))))))

(assert (=> start!99852 e!675295))

(assert (=> start!99852 tp_is_empty!29961))

(declare-fun array_inv!28236 (array!76717) Bool)

(assert (=> start!99852 (array_inv!28236 _keys!1208)))

(assert (=> start!99852 true))

(assert (=> start!99852 tp!89006))

(declare-fun array_inv!28237 (array!76719) Bool)

(assert (=> start!99852 (and (array_inv!28237 _values!996) e!675298)))

(declare-fun b!1187653 () Bool)

(declare-fun res!789602 () Bool)

(assert (=> b!1187653 (=> (not res!789602) (not e!675296))))

(assert (=> b!1187653 (= res!789602 (arrayNoDuplicates!0 lt!540040 #b00000000000000000000000000000000 Nil!26042))))

(declare-fun b!1187660 () Bool)

(assert (=> b!1187660 (= e!675293 e!675297)))

(declare-fun res!789612 () Bool)

(assert (=> b!1187660 (=> res!789612 e!675297)))

(assert (=> b!1187660 (= res!789612 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187660 (= lt!540053 (getCurrentListMapNoExtraKeys!5094 lt!540040 lt!540043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187660 (= lt!540043 (array!76720 (store (arr!37009 _values!996) i!673 (ValueCellFull!14271 lt!540044)) (size!37545 _values!996)))))

(declare-fun dynLambda!3040 (Int (_ BitVec 64)) V!45075)

(assert (=> b!1187660 (= lt!540044 (dynLambda!3040 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187660 (= lt!540036 (getCurrentListMapNoExtraKeys!5094 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187661 () Bool)

(declare-fun Unit!39391 () Unit!39388)

(assert (=> b!1187661 (= e!675291 Unit!39391)))

(declare-fun b!1187662 () Bool)

(declare-fun res!789610 () Bool)

(assert (=> b!1187662 (=> (not res!789610) (not e!675295))))

(assert (=> b!1187662 (= res!789610 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37544 _keys!1208))))))

(declare-fun b!1187663 () Bool)

(declare-fun e!675288 () Bool)

(assert (=> b!1187663 (= e!675288 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46769 () Bool)

(declare-fun tp!89007 () Bool)

(assert (=> mapNonEmpty!46769 (= mapRes!46769 (and tp!89007 e!675292))))

(declare-fun mapRest!46769 () (Array (_ BitVec 32) ValueCell!14271))

(declare-fun mapValue!46769 () ValueCell!14271)

(declare-fun mapKey!46769 () (_ BitVec 32))

(assert (=> mapNonEmpty!46769 (= (arr!37009 _values!996) (store mapRest!46769 mapKey!46769 mapValue!46769))))

(declare-fun b!1187664 () Bool)

(declare-fun res!789601 () Bool)

(assert (=> b!1187664 (=> (not res!789601) (not e!675295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187664 (= res!789601 (validMask!0 mask!1564))))

(declare-fun b!1187665 () Bool)

(declare-fun res!789607 () Bool)

(assert (=> b!1187665 (=> (not res!789607) (not e!675295))))

(assert (=> b!1187665 (= res!789607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187666 () Bool)

(assert (=> b!1187666 (= e!675294 e!675288)))

(declare-fun res!789604 () Bool)

(assert (=> b!1187666 (=> res!789604 e!675288)))

(assert (=> b!1187666 (= res!789604 (not (= (select (arr!37008 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99852 res!789608) b!1187664))

(assert (= (and b!1187664 res!789601) b!1187656))

(assert (= (and b!1187656 res!789605) b!1187665))

(assert (= (and b!1187665 res!789607) b!1187650))

(assert (= (and b!1187650 res!789606) b!1187662))

(assert (= (and b!1187662 res!789610) b!1187658))

(assert (= (and b!1187658 res!789603) b!1187659))

(assert (= (and b!1187659 res!789609) b!1187647))

(assert (= (and b!1187647 res!789611) b!1187653))

(assert (= (and b!1187653 res!789602) b!1187652))

(assert (= (and b!1187652 (not res!789613)) b!1187660))

(assert (= (and b!1187660 (not res!789612)) b!1187654))

(assert (= (and b!1187654 (not res!789599)) b!1187651))

(assert (= (and b!1187651 res!789600) b!1187666))

(assert (= (and b!1187666 (not res!789604)) b!1187663))

(assert (= (and b!1187651 c!117270) b!1187655))

(assert (= (and b!1187651 (not c!117270)) b!1187661))

(assert (= (and b!1187649 condMapEmpty!46769) mapIsEmpty!46769))

(assert (= (and b!1187649 (not condMapEmpty!46769)) mapNonEmpty!46769))

(get-info :version)

(assert (= (and mapNonEmpty!46769 ((_ is ValueCellFull!14271) mapValue!46769)) b!1187648))

(assert (= (and b!1187649 ((_ is ValueCellFull!14271) mapDefault!46769)) b!1187657))

(assert (= start!99852 b!1187649))

(declare-fun b_lambda!20575 () Bool)

(assert (=> (not b_lambda!20575) (not b!1187660)))

(declare-fun t!38467 () Bool)

(declare-fun tb!10243 () Bool)

(assert (=> (and start!99852 (= defaultEntry!1004 defaultEntry!1004) t!38467) tb!10243))

(declare-fun result!21053 () Bool)

(assert (=> tb!10243 (= result!21053 tp_is_empty!29961)))

(assert (=> b!1187660 t!38467))

(declare-fun b_and!41731 () Bool)

(assert (= b_and!41729 (and (=> t!38467 result!21053) b_and!41731)))

(declare-fun m!1096345 () Bool)

(assert (=> b!1187665 m!1096345))

(declare-fun m!1096347 () Bool)

(assert (=> b!1187659 m!1096347))

(declare-fun m!1096349 () Bool)

(assert (=> b!1187650 m!1096349))

(declare-fun m!1096351 () Bool)

(assert (=> mapNonEmpty!46769 m!1096351))

(declare-fun m!1096353 () Bool)

(assert (=> b!1187664 m!1096353))

(declare-fun m!1096355 () Bool)

(assert (=> b!1187652 m!1096355))

(declare-fun m!1096357 () Bool)

(assert (=> b!1187652 m!1096357))

(declare-fun m!1096359 () Bool)

(assert (=> b!1187660 m!1096359))

(declare-fun m!1096361 () Bool)

(assert (=> b!1187660 m!1096361))

(declare-fun m!1096363 () Bool)

(assert (=> b!1187660 m!1096363))

(declare-fun m!1096365 () Bool)

(assert (=> b!1187660 m!1096365))

(declare-fun m!1096367 () Bool)

(assert (=> b!1187654 m!1096367))

(declare-fun m!1096369 () Bool)

(assert (=> b!1187654 m!1096369))

(declare-fun m!1096371 () Bool)

(assert (=> b!1187654 m!1096371))

(declare-fun m!1096373 () Bool)

(assert (=> b!1187654 m!1096373))

(declare-fun m!1096375 () Bool)

(assert (=> b!1187654 m!1096375))

(declare-fun m!1096377 () Bool)

(assert (=> b!1187654 m!1096377))

(assert (=> b!1187654 m!1096375))

(declare-fun m!1096379 () Bool)

(assert (=> b!1187653 m!1096379))

(declare-fun m!1096381 () Bool)

(assert (=> b!1187663 m!1096381))

(declare-fun m!1096383 () Bool)

(assert (=> b!1187658 m!1096383))

(declare-fun m!1096385 () Bool)

(assert (=> b!1187647 m!1096385))

(declare-fun m!1096387 () Bool)

(assert (=> b!1187647 m!1096387))

(assert (=> b!1187666 m!1096375))

(declare-fun m!1096389 () Bool)

(assert (=> start!99852 m!1096389))

(declare-fun m!1096391 () Bool)

(assert (=> start!99852 m!1096391))

(declare-fun m!1096393 () Bool)

(assert (=> b!1187655 m!1096393))

(declare-fun m!1096395 () Bool)

(assert (=> b!1187655 m!1096395))

(declare-fun m!1096397 () Bool)

(assert (=> b!1187655 m!1096397))

(declare-fun m!1096399 () Bool)

(assert (=> b!1187655 m!1096399))

(declare-fun m!1096401 () Bool)

(assert (=> b!1187655 m!1096401))

(declare-fun m!1096403 () Bool)

(assert (=> b!1187651 m!1096403))

(declare-fun m!1096405 () Bool)

(assert (=> b!1187651 m!1096405))

(assert (=> b!1187651 m!1096405))

(declare-fun m!1096407 () Bool)

(assert (=> b!1187651 m!1096407))

(declare-fun m!1096409 () Bool)

(assert (=> b!1187651 m!1096409))

(declare-fun m!1096411 () Bool)

(assert (=> b!1187651 m!1096411))

(assert (=> b!1187651 m!1096375))

(declare-fun m!1096413 () Bool)

(assert (=> b!1187651 m!1096413))

(assert (=> b!1187651 m!1096375))

(check-sat (not b!1187658) (not b!1187652) (not b_next!25431) tp_is_empty!29961 (not b!1187651) (not b!1187654) b_and!41731 (not b!1187653) (not b!1187660) (not b!1187665) (not b!1187663) (not b!1187647) (not b!1187650) (not b!1187664) (not start!99852) (not b!1187655) (not mapNonEmpty!46769) (not b_lambda!20575))
(check-sat b_and!41731 (not b_next!25431))
