; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100056 () Bool)

(assert start!100056)

(declare-fun b_free!25635 () Bool)

(declare-fun b_next!25635 () Bool)

(assert (=> start!100056 (= b_free!25635 (not b_next!25635))))

(declare-fun tp!89618 () Bool)

(declare-fun b_and!42137 () Bool)

(assert (=> start!100056 (= tp!89618 b_and!42137)))

(declare-fun b!1192596 () Bool)

(declare-fun e!677861 () Bool)

(declare-fun tp_is_empty!30165 () Bool)

(assert (=> b!1192596 (= e!677861 tp_is_empty!30165)))

(declare-fun b!1192597 () Bool)

(declare-fun res!793367 () Bool)

(declare-fun e!677859 () Bool)

(assert (=> b!1192597 (=> (not res!793367) (not e!677859))))

(declare-datatypes ((array!77115 0))(
  ( (array!77116 (arr!37207 (Array (_ BitVec 32) (_ BitVec 64))) (size!37743 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77115)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192597 (= res!793367 (= (select (arr!37207 _keys!1208) i!673) k0!934))))

(declare-fun b!1192598 () Bool)

(declare-fun e!677866 () Bool)

(declare-fun e!677863 () Bool)

(declare-fun mapRes!47075 () Bool)

(assert (=> b!1192598 (= e!677866 (and e!677863 mapRes!47075))))

(declare-fun condMapEmpty!47075 () Bool)

(declare-datatypes ((V!45347 0))(
  ( (V!45348 (val!15139 Int)) )
))
(declare-datatypes ((ValueCell!14373 0))(
  ( (ValueCellFull!14373 (v!17777 V!45347)) (EmptyCell!14373) )
))
(declare-datatypes ((array!77117 0))(
  ( (array!77118 (arr!37208 (Array (_ BitVec 32) ValueCell!14373)) (size!37744 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77117)

(declare-fun mapDefault!47075 () ValueCell!14373)

(assert (=> b!1192598 (= condMapEmpty!47075 (= (arr!37208 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14373)) mapDefault!47075)))))

(declare-fun b!1192599 () Bool)

(declare-fun e!677860 () Bool)

(declare-fun e!677862 () Bool)

(assert (=> b!1192599 (= e!677860 e!677862)))

(declare-fun res!793366 () Bool)

(assert (=> b!1192599 (=> res!793366 e!677862)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192599 (= res!793366 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45347)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19460 0))(
  ( (tuple2!19461 (_1!9741 (_ BitVec 64)) (_2!9741 V!45347)) )
))
(declare-datatypes ((List!26203 0))(
  ( (Nil!26200) (Cons!26199 (h!27408 tuple2!19460) (t!38830 List!26203)) )
))
(declare-datatypes ((ListLongMap!17429 0))(
  ( (ListLongMap!17430 (toList!8730 List!26203)) )
))
(declare-fun lt!542278 () ListLongMap!17429)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!45347)

(declare-fun lt!542276 () array!77115)

(declare-fun lt!542275 () array!77117)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5171 (array!77115 array!77117 (_ BitVec 32) (_ BitVec 32) V!45347 V!45347 (_ BitVec 32) Int) ListLongMap!17429)

(assert (=> b!1192599 (= lt!542278 (getCurrentListMapNoExtraKeys!5171 lt!542276 lt!542275 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3102 (Int (_ BitVec 64)) V!45347)

(assert (=> b!1192599 (= lt!542275 (array!77118 (store (arr!37208 _values!996) i!673 (ValueCellFull!14373 (dynLambda!3102 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37744 _values!996)))))

(declare-fun lt!542277 () ListLongMap!17429)

(assert (=> b!1192599 (= lt!542277 (getCurrentListMapNoExtraKeys!5171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47075 () Bool)

(assert (=> mapIsEmpty!47075 mapRes!47075))

(declare-fun mapNonEmpty!47075 () Bool)

(declare-fun tp!89619 () Bool)

(assert (=> mapNonEmpty!47075 (= mapRes!47075 (and tp!89619 e!677861))))

(declare-fun mapRest!47075 () (Array (_ BitVec 32) ValueCell!14373))

(declare-fun mapValue!47075 () ValueCell!14373)

(declare-fun mapKey!47075 () (_ BitVec 32))

(assert (=> mapNonEmpty!47075 (= (arr!37208 _values!996) (store mapRest!47075 mapKey!47075 mapValue!47075))))

(declare-fun res!793364 () Bool)

(assert (=> start!100056 (=> (not res!793364) (not e!677859))))

(assert (=> start!100056 (= res!793364 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37743 _keys!1208))))))

(assert (=> start!100056 e!677859))

(assert (=> start!100056 tp_is_empty!30165))

(declare-fun array_inv!28368 (array!77115) Bool)

(assert (=> start!100056 (array_inv!28368 _keys!1208)))

(assert (=> start!100056 true))

(assert (=> start!100056 tp!89618))

(declare-fun array_inv!28369 (array!77117) Bool)

(assert (=> start!100056 (and (array_inv!28369 _values!996) e!677866)))

(declare-fun b!1192600 () Bool)

(declare-fun res!793375 () Bool)

(assert (=> b!1192600 (=> (not res!793375) (not e!677859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192600 (= res!793375 (validKeyInArray!0 k0!934))))

(declare-fun b!1192601 () Bool)

(declare-fun res!793368 () Bool)

(assert (=> b!1192601 (=> (not res!793368) (not e!677859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77115 (_ BitVec 32)) Bool)

(assert (=> b!1192601 (= res!793368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192602 () Bool)

(declare-fun e!677864 () Bool)

(assert (=> b!1192602 (= e!677859 e!677864)))

(declare-fun res!793373 () Bool)

(assert (=> b!1192602 (=> (not res!793373) (not e!677864))))

(assert (=> b!1192602 (= res!793373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542276 mask!1564))))

(assert (=> b!1192602 (= lt!542276 (array!77116 (store (arr!37207 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37743 _keys!1208)))))

(declare-fun b!1192603 () Bool)

(declare-fun res!793372 () Bool)

(assert (=> b!1192603 (=> (not res!793372) (not e!677859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192603 (= res!793372 (validMask!0 mask!1564))))

(declare-fun b!1192604 () Bool)

(declare-fun res!793369 () Bool)

(assert (=> b!1192604 (=> (not res!793369) (not e!677859))))

(assert (=> b!1192604 (= res!793369 (and (= (size!37744 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37743 _keys!1208) (size!37744 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192605 () Bool)

(declare-fun res!793371 () Bool)

(assert (=> b!1192605 (=> (not res!793371) (not e!677859))))

(declare-datatypes ((List!26204 0))(
  ( (Nil!26201) (Cons!26200 (h!27409 (_ BitVec 64)) (t!38831 List!26204)) )
))
(declare-fun arrayNoDuplicates!0 (array!77115 (_ BitVec 32) List!26204) Bool)

(assert (=> b!1192605 (= res!793371 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26201))))

(declare-fun b!1192606 () Bool)

(assert (=> b!1192606 (= e!677862 true)))

(declare-fun -!1755 (ListLongMap!17429 (_ BitVec 64)) ListLongMap!17429)

(assert (=> b!1192606 (= (getCurrentListMapNoExtraKeys!5171 lt!542276 lt!542275 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1755 (getCurrentListMapNoExtraKeys!5171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39564 0))(
  ( (Unit!39565) )
))
(declare-fun lt!542280 () Unit!39564)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!964 (array!77115 array!77117 (_ BitVec 32) (_ BitVec 32) V!45347 V!45347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39564)

(assert (=> b!1192606 (= lt!542280 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192607 () Bool)

(assert (=> b!1192607 (= e!677864 (not e!677860))))

(declare-fun res!793365 () Bool)

(assert (=> b!1192607 (=> res!793365 e!677860)))

(assert (=> b!1192607 (= res!793365 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192607 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542279 () Unit!39564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77115 (_ BitVec 64) (_ BitVec 32)) Unit!39564)

(assert (=> b!1192607 (= lt!542279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192608 () Bool)

(declare-fun res!793374 () Bool)

(assert (=> b!1192608 (=> (not res!793374) (not e!677859))))

(assert (=> b!1192608 (= res!793374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37743 _keys!1208))))))

(declare-fun b!1192609 () Bool)

(declare-fun res!793370 () Bool)

(assert (=> b!1192609 (=> (not res!793370) (not e!677864))))

(assert (=> b!1192609 (= res!793370 (arrayNoDuplicates!0 lt!542276 #b00000000000000000000000000000000 Nil!26201))))

(declare-fun b!1192610 () Bool)

(assert (=> b!1192610 (= e!677863 tp_is_empty!30165)))

(assert (= (and start!100056 res!793364) b!1192603))

(assert (= (and b!1192603 res!793372) b!1192604))

(assert (= (and b!1192604 res!793369) b!1192601))

(assert (= (and b!1192601 res!793368) b!1192605))

(assert (= (and b!1192605 res!793371) b!1192608))

(assert (= (and b!1192608 res!793374) b!1192600))

(assert (= (and b!1192600 res!793375) b!1192597))

(assert (= (and b!1192597 res!793367) b!1192602))

(assert (= (and b!1192602 res!793373) b!1192609))

(assert (= (and b!1192609 res!793370) b!1192607))

(assert (= (and b!1192607 (not res!793365)) b!1192599))

(assert (= (and b!1192599 (not res!793366)) b!1192606))

(assert (= (and b!1192598 condMapEmpty!47075) mapIsEmpty!47075))

(assert (= (and b!1192598 (not condMapEmpty!47075)) mapNonEmpty!47075))

(get-info :version)

(assert (= (and mapNonEmpty!47075 ((_ is ValueCellFull!14373) mapValue!47075)) b!1192596))

(assert (= (and b!1192598 ((_ is ValueCellFull!14373) mapDefault!47075)) b!1192610))

(assert (= start!100056 b!1192598))

(declare-fun b_lambda!20779 () Bool)

(assert (=> (not b_lambda!20779) (not b!1192599)))

(declare-fun t!38829 () Bool)

(declare-fun tb!10447 () Bool)

(assert (=> (and start!100056 (= defaultEntry!1004 defaultEntry!1004) t!38829) tb!10447))

(declare-fun result!21461 () Bool)

(assert (=> tb!10447 (= result!21461 tp_is_empty!30165)))

(assert (=> b!1192599 t!38829))

(declare-fun b_and!42139 () Bool)

(assert (= b_and!42137 (and (=> t!38829 result!21461) b_and!42139)))

(declare-fun m!1100937 () Bool)

(assert (=> start!100056 m!1100937))

(declare-fun m!1100939 () Bool)

(assert (=> start!100056 m!1100939))

(declare-fun m!1100941 () Bool)

(assert (=> b!1192609 m!1100941))

(declare-fun m!1100943 () Bool)

(assert (=> mapNonEmpty!47075 m!1100943))

(declare-fun m!1100945 () Bool)

(assert (=> b!1192605 m!1100945))

(declare-fun m!1100947 () Bool)

(assert (=> b!1192597 m!1100947))

(declare-fun m!1100949 () Bool)

(assert (=> b!1192606 m!1100949))

(declare-fun m!1100951 () Bool)

(assert (=> b!1192606 m!1100951))

(assert (=> b!1192606 m!1100951))

(declare-fun m!1100953 () Bool)

(assert (=> b!1192606 m!1100953))

(declare-fun m!1100955 () Bool)

(assert (=> b!1192606 m!1100955))

(declare-fun m!1100957 () Bool)

(assert (=> b!1192602 m!1100957))

(declare-fun m!1100959 () Bool)

(assert (=> b!1192602 m!1100959))

(declare-fun m!1100961 () Bool)

(assert (=> b!1192603 m!1100961))

(declare-fun m!1100963 () Bool)

(assert (=> b!1192607 m!1100963))

(declare-fun m!1100965 () Bool)

(assert (=> b!1192607 m!1100965))

(declare-fun m!1100967 () Bool)

(assert (=> b!1192599 m!1100967))

(declare-fun m!1100969 () Bool)

(assert (=> b!1192599 m!1100969))

(declare-fun m!1100971 () Bool)

(assert (=> b!1192599 m!1100971))

(declare-fun m!1100973 () Bool)

(assert (=> b!1192599 m!1100973))

(declare-fun m!1100975 () Bool)

(assert (=> b!1192600 m!1100975))

(declare-fun m!1100977 () Bool)

(assert (=> b!1192601 m!1100977))

(check-sat (not b!1192609) (not b_next!25635) (not b!1192607) (not b!1192600) (not b_lambda!20779) (not b!1192602) (not b!1192605) (not b!1192603) (not start!100056) (not b!1192599) b_and!42139 tp_is_empty!30165 (not b!1192601) (not b!1192606) (not mapNonEmpty!47075))
(check-sat b_and!42139 (not b_next!25635))
