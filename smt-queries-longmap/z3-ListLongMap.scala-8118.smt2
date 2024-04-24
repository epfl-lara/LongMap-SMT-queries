; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99810 () Bool)

(assert start!99810)

(declare-fun b_free!25153 () Bool)

(declare-fun b_next!25153 () Bool)

(assert (=> start!99810 (= b_free!25153 (not b_next!25153))))

(declare-fun tp!88172 () Bool)

(declare-fun b_and!41175 () Bool)

(assert (=> start!99810 (= tp!88172 b_and!41175)))

(declare-fun b!1180104 () Bool)

(declare-fun e!670991 () Bool)

(declare-fun tp_is_empty!29683 () Bool)

(assert (=> b!1180104 (= e!670991 tp_is_empty!29683)))

(declare-fun b!1180105 () Bool)

(declare-fun res!783643 () Bool)

(declare-fun e!670998 () Bool)

(assert (=> b!1180105 (=> (not res!783643) (not e!670998))))

(declare-datatypes ((array!76219 0))(
  ( (array!76220 (arr!36753 (Array (_ BitVec 32) (_ BitVec 64))) (size!37290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76219)

(declare-datatypes ((List!25844 0))(
  ( (Nil!25841) (Cons!25840 (h!27058 (_ BitVec 64)) (t!37981 List!25844)) )
))
(declare-fun arrayNoDuplicates!0 (array!76219 (_ BitVec 32) List!25844) Bool)

(assert (=> b!1180105 (= res!783643 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25841))))

(declare-fun b!1180106 () Bool)

(declare-fun res!783640 () Bool)

(assert (=> b!1180106 (=> (not res!783640) (not e!670998))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180106 (= res!783640 (= (select (arr!36753 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46352 () Bool)

(declare-fun mapRes!46352 () Bool)

(declare-fun tp!88173 () Bool)

(declare-fun e!670996 () Bool)

(assert (=> mapNonEmpty!46352 (= mapRes!46352 (and tp!88173 e!670996))))

(declare-datatypes ((V!44705 0))(
  ( (V!44706 (val!14898 Int)) )
))
(declare-datatypes ((ValueCell!14132 0))(
  ( (ValueCellFull!14132 (v!17532 V!44705)) (EmptyCell!14132) )
))
(declare-fun mapRest!46352 () (Array (_ BitVec 32) ValueCell!14132))

(declare-fun mapValue!46352 () ValueCell!14132)

(declare-datatypes ((array!76221 0))(
  ( (array!76222 (arr!36754 (Array (_ BitVec 32) ValueCell!14132)) (size!37291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76221)

(declare-fun mapKey!46352 () (_ BitVec 32))

(assert (=> mapNonEmpty!46352 (= (arr!36754 _values!996) (store mapRest!46352 mapKey!46352 mapValue!46352))))

(declare-fun b!1180107 () Bool)

(declare-fun e!671002 () Bool)

(declare-fun e!671001 () Bool)

(assert (=> b!1180107 (= e!671002 e!671001)))

(declare-fun res!783652 () Bool)

(assert (=> b!1180107 (=> res!783652 e!671001)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180107 (= res!783652 (not (validKeyInArray!0 (select (arr!36753 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19114 0))(
  ( (tuple2!19115 (_1!9568 (_ BitVec 64)) (_2!9568 V!44705)) )
))
(declare-datatypes ((List!25845 0))(
  ( (Nil!25842) (Cons!25841 (h!27059 tuple2!19114) (t!37982 List!25845)) )
))
(declare-datatypes ((ListLongMap!17091 0))(
  ( (ListLongMap!17092 (toList!8561 List!25845)) )
))
(declare-fun lt!533104 () ListLongMap!17091)

(declare-fun lt!533100 () ListLongMap!17091)

(assert (=> b!1180107 (= lt!533104 lt!533100)))

(declare-fun lt!533093 () ListLongMap!17091)

(declare-fun -!1592 (ListLongMap!17091 (_ BitVec 64)) ListLongMap!17091)

(assert (=> b!1180107 (= lt!533100 (-!1592 lt!533093 k0!934))))

(declare-fun zeroValue!944 () V!44705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533095 () array!76221)

(declare-fun minValue!944 () V!44705)

(declare-fun lt!533102 () array!76219)

(declare-fun getCurrentListMapNoExtraKeys!5040 (array!76219 array!76221 (_ BitVec 32) (_ BitVec 32) V!44705 V!44705 (_ BitVec 32) Int) ListLongMap!17091)

(assert (=> b!1180107 (= lt!533104 (getCurrentListMapNoExtraKeys!5040 lt!533102 lt!533095 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180107 (= lt!533093 (getCurrentListMapNoExtraKeys!5040 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38945 0))(
  ( (Unit!38946) )
))
(declare-fun lt!533096 () Unit!38945)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!817 (array!76219 array!76221 (_ BitVec 32) (_ BitVec 32) V!44705 V!44705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38945)

(assert (=> b!1180107 (= lt!533096 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!817 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!670997 () Bool)

(declare-fun b!1180109 () Bool)

(declare-fun arrayContainsKey!0 (array!76219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180109 (= e!670997 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!533106 () tuple2!19114)

(declare-fun b!1180110 () Bool)

(declare-fun lt!533098 () ListLongMap!17091)

(declare-fun e!670995 () Bool)

(declare-fun +!3886 (ListLongMap!17091 tuple2!19114) ListLongMap!17091)

(assert (=> b!1180110 (= e!670995 (= lt!533098 (+!3886 lt!533093 lt!533106)))))

(declare-fun b!1180111 () Bool)

(declare-fun res!783651 () Bool)

(assert (=> b!1180111 (=> (not res!783651) (not e!670998))))

(assert (=> b!1180111 (= res!783651 (and (= (size!37291 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37290 _keys!1208) (size!37291 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180112 () Bool)

(declare-fun e!670994 () Bool)

(assert (=> b!1180112 (= e!670998 e!670994)))

(declare-fun res!783642 () Bool)

(assert (=> b!1180112 (=> (not res!783642) (not e!670994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76219 (_ BitVec 32)) Bool)

(assert (=> b!1180112 (= res!783642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533102 mask!1564))))

(assert (=> b!1180112 (= lt!533102 (array!76220 (store (arr!36753 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37290 _keys!1208)))))

(declare-fun b!1180113 () Bool)

(declare-fun res!783649 () Bool)

(assert (=> b!1180113 (=> (not res!783649) (not e!670998))))

(assert (=> b!1180113 (= res!783649 (validKeyInArray!0 k0!934))))

(declare-fun b!1180114 () Bool)

(declare-fun e!670992 () Unit!38945)

(declare-fun Unit!38947 () Unit!38945)

(assert (=> b!1180114 (= e!670992 Unit!38947)))

(declare-fun b!1180115 () Bool)

(declare-fun Unit!38948 () Unit!38945)

(assert (=> b!1180115 (= e!670992 Unit!38948)))

(declare-fun lt!533099 () Unit!38945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76219 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38945)

(assert (=> b!1180115 (= lt!533099 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180115 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533105 () Unit!38945)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76219 (_ BitVec 32) (_ BitVec 32)) Unit!38945)

(assert (=> b!1180115 (= lt!533105 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180115 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25841)))

(declare-fun lt!533103 () Unit!38945)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76219 (_ BitVec 64) (_ BitVec 32) List!25844) Unit!38945)

(assert (=> b!1180115 (= lt!533103 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25841))))

(assert (=> b!1180115 false))

(declare-fun res!783641 () Bool)

(assert (=> start!99810 (=> (not res!783641) (not e!670998))))

(assert (=> start!99810 (= res!783641 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37290 _keys!1208))))))

(assert (=> start!99810 e!670998))

(assert (=> start!99810 tp_is_empty!29683))

(declare-fun array_inv!28138 (array!76219) Bool)

(assert (=> start!99810 (array_inv!28138 _keys!1208)))

(assert (=> start!99810 true))

(assert (=> start!99810 tp!88172))

(declare-fun e!670993 () Bool)

(declare-fun array_inv!28139 (array!76221) Bool)

(assert (=> start!99810 (and (array_inv!28139 _values!996) e!670993)))

(declare-fun b!1180108 () Bool)

(declare-fun res!783648 () Bool)

(assert (=> b!1180108 (=> (not res!783648) (not e!670998))))

(assert (=> b!1180108 (= res!783648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180116 () Bool)

(declare-fun res!783644 () Bool)

(assert (=> b!1180116 (=> (not res!783644) (not e!670994))))

(assert (=> b!1180116 (= res!783644 (arrayNoDuplicates!0 lt!533102 #b00000000000000000000000000000000 Nil!25841))))

(declare-fun b!1180117 () Bool)

(declare-fun res!783645 () Bool)

(assert (=> b!1180117 (=> (not res!783645) (not e!670998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180117 (= res!783645 (validMask!0 mask!1564))))

(declare-fun b!1180118 () Bool)

(assert (=> b!1180118 (= e!671001 true)))

(assert (=> b!1180118 e!670995))

(declare-fun res!783639 () Bool)

(assert (=> b!1180118 (=> (not res!783639) (not e!670995))))

(assert (=> b!1180118 (= res!783639 (not (= (select (arr!36753 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533097 () Unit!38945)

(assert (=> b!1180118 (= lt!533097 e!670992)))

(declare-fun c!117251 () Bool)

(assert (=> b!1180118 (= c!117251 (= (select (arr!36753 _keys!1208) from!1455) k0!934))))

(declare-fun e!671000 () Bool)

(assert (=> b!1180118 e!671000))

(declare-fun res!783647 () Bool)

(assert (=> b!1180118 (=> (not res!783647) (not e!671000))))

(declare-fun lt!533107 () ListLongMap!17091)

(assert (=> b!1180118 (= res!783647 (= lt!533107 (+!3886 lt!533100 lt!533106)))))

(declare-fun lt!533101 () V!44705)

(declare-fun get!18819 (ValueCell!14132 V!44705) V!44705)

(assert (=> b!1180118 (= lt!533106 (tuple2!19115 (select (arr!36753 _keys!1208) from!1455) (get!18819 (select (arr!36754 _values!996) from!1455) lt!533101)))))

(declare-fun b!1180119 () Bool)

(assert (=> b!1180119 (= e!671000 e!670997)))

(declare-fun res!783653 () Bool)

(assert (=> b!1180119 (=> res!783653 e!670997)))

(assert (=> b!1180119 (= res!783653 (not (= (select (arr!36753 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180120 () Bool)

(declare-fun res!783650 () Bool)

(assert (=> b!1180120 (=> (not res!783650) (not e!670998))))

(assert (=> b!1180120 (= res!783650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37290 _keys!1208))))))

(declare-fun mapIsEmpty!46352 () Bool)

(assert (=> mapIsEmpty!46352 mapRes!46352))

(declare-fun b!1180121 () Bool)

(assert (=> b!1180121 (= e!670993 (and e!670991 mapRes!46352))))

(declare-fun condMapEmpty!46352 () Bool)

(declare-fun mapDefault!46352 () ValueCell!14132)

(assert (=> b!1180121 (= condMapEmpty!46352 (= (arr!36754 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14132)) mapDefault!46352)))))

(declare-fun b!1180122 () Bool)

(assert (=> b!1180122 (= e!670996 tp_is_empty!29683)))

(declare-fun b!1180123 () Bool)

(declare-fun e!670999 () Bool)

(assert (=> b!1180123 (= e!670994 (not e!670999))))

(declare-fun res!783638 () Bool)

(assert (=> b!1180123 (=> res!783638 e!670999)))

(assert (=> b!1180123 (= res!783638 (bvsgt from!1455 i!673))))

(assert (=> b!1180123 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533094 () Unit!38945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76219 (_ BitVec 64) (_ BitVec 32)) Unit!38945)

(assert (=> b!1180123 (= lt!533094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180124 () Bool)

(assert (=> b!1180124 (= e!670999 e!671002)))

(declare-fun res!783646 () Bool)

(assert (=> b!1180124 (=> res!783646 e!671002)))

(assert (=> b!1180124 (= res!783646 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1180124 (= lt!533107 (getCurrentListMapNoExtraKeys!5040 lt!533102 lt!533095 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180124 (= lt!533095 (array!76222 (store (arr!36754 _values!996) i!673 (ValueCellFull!14132 lt!533101)) (size!37291 _values!996)))))

(declare-fun dynLambda!3010 (Int (_ BitVec 64)) V!44705)

(assert (=> b!1180124 (= lt!533101 (dynLambda!3010 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180124 (= lt!533098 (getCurrentListMapNoExtraKeys!5040 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99810 res!783641) b!1180117))

(assert (= (and b!1180117 res!783645) b!1180111))

(assert (= (and b!1180111 res!783651) b!1180108))

(assert (= (and b!1180108 res!783648) b!1180105))

(assert (= (and b!1180105 res!783643) b!1180120))

(assert (= (and b!1180120 res!783650) b!1180113))

(assert (= (and b!1180113 res!783649) b!1180106))

(assert (= (and b!1180106 res!783640) b!1180112))

(assert (= (and b!1180112 res!783642) b!1180116))

(assert (= (and b!1180116 res!783644) b!1180123))

(assert (= (and b!1180123 (not res!783638)) b!1180124))

(assert (= (and b!1180124 (not res!783646)) b!1180107))

(assert (= (and b!1180107 (not res!783652)) b!1180118))

(assert (= (and b!1180118 res!783647) b!1180119))

(assert (= (and b!1180119 (not res!783653)) b!1180109))

(assert (= (and b!1180118 c!117251) b!1180115))

(assert (= (and b!1180118 (not c!117251)) b!1180114))

(assert (= (and b!1180118 res!783639) b!1180110))

(assert (= (and b!1180121 condMapEmpty!46352) mapIsEmpty!46352))

(assert (= (and b!1180121 (not condMapEmpty!46352)) mapNonEmpty!46352))

(get-info :version)

(assert (= (and mapNonEmpty!46352 ((_ is ValueCellFull!14132) mapValue!46352)) b!1180122))

(assert (= (and b!1180121 ((_ is ValueCellFull!14132) mapDefault!46352)) b!1180104))

(assert (= start!99810 b!1180121))

(declare-fun b_lambda!20291 () Bool)

(assert (=> (not b_lambda!20291) (not b!1180124)))

(declare-fun t!37980 () Bool)

(declare-fun tb!9957 () Bool)

(assert (=> (and start!99810 (= defaultEntry!1004 defaultEntry!1004) t!37980) tb!9957))

(declare-fun result!20489 () Bool)

(assert (=> tb!9957 (= result!20489 tp_is_empty!29683)))

(assert (=> b!1180124 t!37980))

(declare-fun b_and!41177 () Bool)

(assert (= b_and!41175 (and (=> t!37980 result!20489) b_and!41177)))

(declare-fun m!1088355 () Bool)

(assert (=> mapNonEmpty!46352 m!1088355))

(declare-fun m!1088357 () Bool)

(assert (=> b!1180105 m!1088357))

(declare-fun m!1088359 () Bool)

(assert (=> b!1180110 m!1088359))

(declare-fun m!1088361 () Bool)

(assert (=> b!1180106 m!1088361))

(declare-fun m!1088363 () Bool)

(assert (=> start!99810 m!1088363))

(declare-fun m!1088365 () Bool)

(assert (=> start!99810 m!1088365))

(declare-fun m!1088367 () Bool)

(assert (=> b!1180108 m!1088367))

(declare-fun m!1088369 () Bool)

(assert (=> b!1180118 m!1088369))

(declare-fun m!1088371 () Bool)

(assert (=> b!1180118 m!1088371))

(declare-fun m!1088373 () Bool)

(assert (=> b!1180118 m!1088373))

(assert (=> b!1180118 m!1088373))

(declare-fun m!1088375 () Bool)

(assert (=> b!1180118 m!1088375))

(declare-fun m!1088377 () Bool)

(assert (=> b!1180112 m!1088377))

(declare-fun m!1088379 () Bool)

(assert (=> b!1180112 m!1088379))

(declare-fun m!1088381 () Bool)

(assert (=> b!1180115 m!1088381))

(declare-fun m!1088383 () Bool)

(assert (=> b!1180115 m!1088383))

(declare-fun m!1088385 () Bool)

(assert (=> b!1180115 m!1088385))

(declare-fun m!1088387 () Bool)

(assert (=> b!1180115 m!1088387))

(declare-fun m!1088389 () Bool)

(assert (=> b!1180115 m!1088389))

(declare-fun m!1088391 () Bool)

(assert (=> b!1180113 m!1088391))

(declare-fun m!1088393 () Bool)

(assert (=> b!1180107 m!1088393))

(declare-fun m!1088395 () Bool)

(assert (=> b!1180107 m!1088395))

(declare-fun m!1088397 () Bool)

(assert (=> b!1180107 m!1088397))

(assert (=> b!1180107 m!1088369))

(declare-fun m!1088399 () Bool)

(assert (=> b!1180107 m!1088399))

(assert (=> b!1180107 m!1088369))

(declare-fun m!1088401 () Bool)

(assert (=> b!1180107 m!1088401))

(declare-fun m!1088403 () Bool)

(assert (=> b!1180116 m!1088403))

(declare-fun m!1088405 () Bool)

(assert (=> b!1180117 m!1088405))

(declare-fun m!1088407 () Bool)

(assert (=> b!1180123 m!1088407))

(declare-fun m!1088409 () Bool)

(assert (=> b!1180123 m!1088409))

(declare-fun m!1088411 () Bool)

(assert (=> b!1180124 m!1088411))

(declare-fun m!1088413 () Bool)

(assert (=> b!1180124 m!1088413))

(declare-fun m!1088415 () Bool)

(assert (=> b!1180124 m!1088415))

(declare-fun m!1088417 () Bool)

(assert (=> b!1180124 m!1088417))

(declare-fun m!1088419 () Bool)

(assert (=> b!1180109 m!1088419))

(assert (=> b!1180119 m!1088369))

(check-sat (not b_next!25153) (not b!1180123) (not b!1180113) (not b!1180118) tp_is_empty!29683 (not b!1180124) (not b!1180112) b_and!41177 (not b!1180110) (not b!1180116) (not mapNonEmpty!46352) (not b!1180117) (not b_lambda!20291) (not b!1180108) (not b!1180105) (not b!1180115) (not b!1180109) (not start!99810) (not b!1180107))
(check-sat b_and!41177 (not b_next!25153))
