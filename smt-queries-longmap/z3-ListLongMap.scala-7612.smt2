; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96228 () Bool)

(assert start!96228)

(declare-fun b_free!22645 () Bool)

(declare-fun b_next!22645 () Bool)

(assert (=> start!96228 (= b_free!22645 (not b_next!22645))))

(declare-fun tp!79783 () Bool)

(declare-fun b_and!35975 () Bool)

(assert (=> start!96228 (= tp!79783 b_and!35975)))

(declare-fun b!1089257 () Bool)

(declare-fun e!622286 () Bool)

(declare-fun e!622288 () Bool)

(assert (=> b!1089257 (= e!622286 e!622288)))

(declare-fun res!726091 () Bool)

(assert (=> b!1089257 (=> res!726091 e!622288)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1089257 (= res!726091 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40657 0))(
  ( (V!40658 (val!13380 Int)) )
))
(declare-datatypes ((tuple2!16998 0))(
  ( (tuple2!16999 (_1!8510 (_ BitVec 64)) (_2!8510 V!40657)) )
))
(declare-datatypes ((List!23591 0))(
  ( (Nil!23588) (Cons!23587 (h!24805 tuple2!16998) (t!33286 List!23591)) )
))
(declare-datatypes ((ListLongMap!14975 0))(
  ( (ListLongMap!14976 (toList!7503 List!23591)) )
))
(declare-fun lt!484871 () ListLongMap!14975)

(declare-fun lt!484860 () ListLongMap!14975)

(assert (=> b!1089257 (= lt!484871 lt!484860)))

(declare-fun lt!484866 () ListLongMap!14975)

(declare-fun lt!484867 () tuple2!16998)

(declare-fun +!3325 (ListLongMap!14975 tuple2!16998) ListLongMap!14975)

(assert (=> b!1089257 (= lt!484860 (+!3325 lt!484866 lt!484867))))

(declare-fun lt!484864 () ListLongMap!14975)

(declare-fun lt!484865 () ListLongMap!14975)

(assert (=> b!1089257 (= lt!484864 lt!484865)))

(declare-fun lt!484868 () ListLongMap!14975)

(assert (=> b!1089257 (= lt!484865 (+!3325 lt!484868 lt!484867))))

(declare-fun lt!484872 () ListLongMap!14975)

(assert (=> b!1089257 (= lt!484871 (+!3325 lt!484872 lt!484867))))

(declare-fun zeroValue!831 () V!40657)

(assert (=> b!1089257 (= lt!484867 (tuple2!16999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089258 () Bool)

(declare-fun res!726093 () Bool)

(declare-fun e!622289 () Bool)

(assert (=> b!1089258 (=> (not res!726093) (not e!622289))))

(declare-datatypes ((array!70259 0))(
  ( (array!70260 (arr!33797 (Array (_ BitVec 32) (_ BitVec 64))) (size!34334 (_ BitVec 32))) )
))
(declare-fun lt!484863 () array!70259)

(declare-datatypes ((List!23592 0))(
  ( (Nil!23589) (Cons!23588 (h!24806 (_ BitVec 64)) (t!33287 List!23592)) )
))
(declare-fun arrayNoDuplicates!0 (array!70259 (_ BitVec 32) List!23592) Bool)

(assert (=> b!1089258 (= res!726093 (arrayNoDuplicates!0 lt!484863 #b00000000000000000000000000000000 Nil!23589))))

(declare-fun res!726098 () Bool)

(declare-fun e!622283 () Bool)

(assert (=> start!96228 (=> (not res!726098) (not e!622283))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96228 (= res!726098 (validMask!0 mask!1414))))

(assert (=> start!96228 e!622283))

(assert (=> start!96228 tp!79783))

(assert (=> start!96228 true))

(declare-fun tp_is_empty!26647 () Bool)

(assert (=> start!96228 tp_is_empty!26647))

(declare-fun _keys!1070 () array!70259)

(declare-fun array_inv!26120 (array!70259) Bool)

(assert (=> start!96228 (array_inv!26120 _keys!1070)))

(declare-datatypes ((ValueCell!12614 0))(
  ( (ValueCellFull!12614 (v!15997 V!40657)) (EmptyCell!12614) )
))
(declare-datatypes ((array!70261 0))(
  ( (array!70262 (arr!33798 (Array (_ BitVec 32) ValueCell!12614)) (size!34335 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70261)

(declare-fun e!622287 () Bool)

(declare-fun array_inv!26121 (array!70261) Bool)

(assert (=> start!96228 (and (array_inv!26121 _values!874) e!622287)))

(declare-fun b!1089259 () Bool)

(declare-fun res!726092 () Bool)

(assert (=> b!1089259 (=> (not res!726092) (not e!622283))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089259 (= res!726092 (= (select (arr!33797 _keys!1070) i!650) k0!904))))

(declare-fun b!1089260 () Bool)

(assert (=> b!1089260 (= e!622289 (not e!622286))))

(declare-fun res!726090 () Bool)

(assert (=> b!1089260 (=> res!726090 e!622286)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089260 (= res!726090 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40657)

(declare-fun getCurrentListMap!4263 (array!70259 array!70261 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!14975)

(assert (=> b!1089260 (= lt!484864 (getCurrentListMap!4263 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484862 () array!70261)

(assert (=> b!1089260 (= lt!484871 (getCurrentListMap!4263 lt!484863 lt!484862 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089260 (and (= lt!484872 lt!484866) (= lt!484866 lt!484872))))

(declare-fun -!814 (ListLongMap!14975 (_ BitVec 64)) ListLongMap!14975)

(assert (=> b!1089260 (= lt!484866 (-!814 lt!484868 k0!904))))

(declare-datatypes ((Unit!35795 0))(
  ( (Unit!35796) )
))
(declare-fun lt!484869 () Unit!35795)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!92 (array!70259 array!70261 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35795)

(assert (=> b!1089260 (= lt!484869 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!92 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4068 (array!70259 array!70261 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!14975)

(assert (=> b!1089260 (= lt!484872 (getCurrentListMapNoExtraKeys!4068 lt!484863 lt!484862 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2189 (Int (_ BitVec 64)) V!40657)

(assert (=> b!1089260 (= lt!484862 (array!70262 (store (arr!33798 _values!874) i!650 (ValueCellFull!12614 (dynLambda!2189 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34335 _values!874)))))

(assert (=> b!1089260 (= lt!484868 (getCurrentListMapNoExtraKeys!4068 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089260 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484861 () Unit!35795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70259 (_ BitVec 64) (_ BitVec 32)) Unit!35795)

(assert (=> b!1089260 (= lt!484861 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089261 () Bool)

(declare-fun e!622282 () Bool)

(assert (=> b!1089261 (= e!622282 tp_is_empty!26647)))

(declare-fun b!1089262 () Bool)

(declare-fun res!726099 () Bool)

(assert (=> b!1089262 (=> (not res!726099) (not e!622283))))

(assert (=> b!1089262 (= res!726099 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34334 _keys!1070))))))

(declare-fun mapIsEmpty!41725 () Bool)

(declare-fun mapRes!41725 () Bool)

(assert (=> mapIsEmpty!41725 mapRes!41725))

(declare-fun b!1089263 () Bool)

(declare-fun res!726095 () Bool)

(assert (=> b!1089263 (=> (not res!726095) (not e!622283))))

(assert (=> b!1089263 (= res!726095 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23589))))

(declare-fun b!1089264 () Bool)

(declare-fun e!622285 () Bool)

(assert (=> b!1089264 (= e!622285 tp_is_empty!26647)))

(declare-fun mapNonEmpty!41725 () Bool)

(declare-fun tp!79784 () Bool)

(assert (=> mapNonEmpty!41725 (= mapRes!41725 (and tp!79784 e!622285))))

(declare-fun mapRest!41725 () (Array (_ BitVec 32) ValueCell!12614))

(declare-fun mapKey!41725 () (_ BitVec 32))

(declare-fun mapValue!41725 () ValueCell!12614)

(assert (=> mapNonEmpty!41725 (= (arr!33798 _values!874) (store mapRest!41725 mapKey!41725 mapValue!41725))))

(declare-fun b!1089265 () Bool)

(declare-fun res!726094 () Bool)

(assert (=> b!1089265 (=> (not res!726094) (not e!622283))))

(assert (=> b!1089265 (= res!726094 (and (= (size!34335 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34334 _keys!1070) (size!34335 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089266 () Bool)

(assert (=> b!1089266 (= e!622283 e!622289)))

(declare-fun res!726089 () Bool)

(assert (=> b!1089266 (=> (not res!726089) (not e!622289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70259 (_ BitVec 32)) Bool)

(assert (=> b!1089266 (= res!726089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484863 mask!1414))))

(assert (=> b!1089266 (= lt!484863 (array!70260 (store (arr!33797 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34334 _keys!1070)))))

(declare-fun b!1089267 () Bool)

(assert (=> b!1089267 (= e!622287 (and e!622282 mapRes!41725))))

(declare-fun condMapEmpty!41725 () Bool)

(declare-fun mapDefault!41725 () ValueCell!12614)

(assert (=> b!1089267 (= condMapEmpty!41725 (= (arr!33798 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12614)) mapDefault!41725)))))

(declare-fun b!1089268 () Bool)

(declare-fun res!726097 () Bool)

(assert (=> b!1089268 (=> (not res!726097) (not e!622283))))

(assert (=> b!1089268 (= res!726097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089269 () Bool)

(assert (=> b!1089269 (= e!622288 true)))

(assert (=> b!1089269 (= (-!814 lt!484865 k0!904) lt!484860)))

(declare-fun lt!484870 () Unit!35795)

(declare-fun addRemoveCommutativeForDiffKeys!56 (ListLongMap!14975 (_ BitVec 64) V!40657 (_ BitVec 64)) Unit!35795)

(assert (=> b!1089269 (= lt!484870 (addRemoveCommutativeForDiffKeys!56 lt!484868 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089270 () Bool)

(declare-fun res!726096 () Bool)

(assert (=> b!1089270 (=> (not res!726096) (not e!622283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089270 (= res!726096 (validKeyInArray!0 k0!904))))

(assert (= (and start!96228 res!726098) b!1089265))

(assert (= (and b!1089265 res!726094) b!1089268))

(assert (= (and b!1089268 res!726097) b!1089263))

(assert (= (and b!1089263 res!726095) b!1089262))

(assert (= (and b!1089262 res!726099) b!1089270))

(assert (= (and b!1089270 res!726096) b!1089259))

(assert (= (and b!1089259 res!726092) b!1089266))

(assert (= (and b!1089266 res!726089) b!1089258))

(assert (= (and b!1089258 res!726093) b!1089260))

(assert (= (and b!1089260 (not res!726090)) b!1089257))

(assert (= (and b!1089257 (not res!726091)) b!1089269))

(assert (= (and b!1089267 condMapEmpty!41725) mapIsEmpty!41725))

(assert (= (and b!1089267 (not condMapEmpty!41725)) mapNonEmpty!41725))

(get-info :version)

(assert (= (and mapNonEmpty!41725 ((_ is ValueCellFull!12614) mapValue!41725)) b!1089264))

(assert (= (and b!1089267 ((_ is ValueCellFull!12614) mapDefault!41725)) b!1089261))

(assert (= start!96228 b!1089267))

(declare-fun b_lambda!17325 () Bool)

(assert (=> (not b_lambda!17325) (not b!1089260)))

(declare-fun t!33285 () Bool)

(declare-fun tb!7515 () Bool)

(assert (=> (and start!96228 (= defaultEntry!882 defaultEntry!882) t!33285) tb!7515))

(declare-fun result!15557 () Bool)

(assert (=> tb!7515 (= result!15557 tp_is_empty!26647)))

(assert (=> b!1089260 t!33285))

(declare-fun b_and!35977 () Bool)

(assert (= b_and!35975 (and (=> t!33285 result!15557) b_and!35977)))

(declare-fun m!1008575 () Bool)

(assert (=> b!1089269 m!1008575))

(declare-fun m!1008577 () Bool)

(assert (=> b!1089269 m!1008577))

(declare-fun m!1008579 () Bool)

(assert (=> start!96228 m!1008579))

(declare-fun m!1008581 () Bool)

(assert (=> start!96228 m!1008581))

(declare-fun m!1008583 () Bool)

(assert (=> start!96228 m!1008583))

(declare-fun m!1008585 () Bool)

(assert (=> b!1089260 m!1008585))

(declare-fun m!1008587 () Bool)

(assert (=> b!1089260 m!1008587))

(declare-fun m!1008589 () Bool)

(assert (=> b!1089260 m!1008589))

(declare-fun m!1008591 () Bool)

(assert (=> b!1089260 m!1008591))

(declare-fun m!1008593 () Bool)

(assert (=> b!1089260 m!1008593))

(declare-fun m!1008595 () Bool)

(assert (=> b!1089260 m!1008595))

(declare-fun m!1008597 () Bool)

(assert (=> b!1089260 m!1008597))

(declare-fun m!1008599 () Bool)

(assert (=> b!1089260 m!1008599))

(declare-fun m!1008601 () Bool)

(assert (=> b!1089260 m!1008601))

(declare-fun m!1008603 () Bool)

(assert (=> b!1089260 m!1008603))

(declare-fun m!1008605 () Bool)

(assert (=> b!1089258 m!1008605))

(declare-fun m!1008607 () Bool)

(assert (=> b!1089266 m!1008607))

(declare-fun m!1008609 () Bool)

(assert (=> b!1089266 m!1008609))

(declare-fun m!1008611 () Bool)

(assert (=> mapNonEmpty!41725 m!1008611))

(declare-fun m!1008613 () Bool)

(assert (=> b!1089259 m!1008613))

(declare-fun m!1008615 () Bool)

(assert (=> b!1089268 m!1008615))

(declare-fun m!1008617 () Bool)

(assert (=> b!1089270 m!1008617))

(declare-fun m!1008619 () Bool)

(assert (=> b!1089263 m!1008619))

(declare-fun m!1008621 () Bool)

(assert (=> b!1089257 m!1008621))

(declare-fun m!1008623 () Bool)

(assert (=> b!1089257 m!1008623))

(declare-fun m!1008625 () Bool)

(assert (=> b!1089257 m!1008625))

(check-sat b_and!35977 (not b!1089260) (not b!1089269) (not start!96228) tp_is_empty!26647 (not b!1089263) (not b!1089257) (not b!1089270) (not b!1089268) (not b!1089258) (not b_next!22645) (not b_lambda!17325) (not mapNonEmpty!41725) (not b!1089266))
(check-sat b_and!35977 (not b_next!22645))
