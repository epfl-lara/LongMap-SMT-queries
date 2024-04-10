; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96234 () Bool)

(assert start!96234)

(declare-fun b_free!22887 () Bool)

(declare-fun b_next!22887 () Bool)

(assert (=> start!96234 (= b_free!22887 (not b_next!22887))))

(declare-fun tp!80510 () Bool)

(declare-fun b_and!36449 () Bool)

(assert (=> start!96234 (= tp!80510 b_and!36449)))

(declare-fun b!1093127 () Bool)

(declare-fun res!729440 () Bool)

(declare-fun e!624195 () Bool)

(assert (=> b!1093127 (=> (not res!729440) (not e!624195))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093127 (= res!729440 (validKeyInArray!0 k0!904))))

(declare-fun b!1093128 () Bool)

(declare-fun e!624196 () Bool)

(declare-fun tp_is_empty!26889 () Bool)

(assert (=> b!1093128 (= e!624196 tp_is_empty!26889)))

(declare-fun b!1093129 () Bool)

(declare-fun e!624199 () Bool)

(declare-fun e!624198 () Bool)

(declare-fun mapRes!42088 () Bool)

(assert (=> b!1093129 (= e!624199 (and e!624198 mapRes!42088))))

(declare-fun condMapEmpty!42088 () Bool)

(declare-datatypes ((V!40979 0))(
  ( (V!40980 (val!13501 Int)) )
))
(declare-datatypes ((ValueCell!12735 0))(
  ( (ValueCellFull!12735 (v!16122 V!40979)) (EmptyCell!12735) )
))
(declare-datatypes ((array!70697 0))(
  ( (array!70698 (arr!34022 (Array (_ BitVec 32) ValueCell!12735)) (size!34558 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70697)

(declare-fun mapDefault!42088 () ValueCell!12735)

(assert (=> b!1093129 (= condMapEmpty!42088 (= (arr!34022 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12735)) mapDefault!42088)))))

(declare-fun mapNonEmpty!42088 () Bool)

(declare-fun tp!80509 () Bool)

(assert (=> mapNonEmpty!42088 (= mapRes!42088 (and tp!80509 e!624196))))

(declare-fun mapRest!42088 () (Array (_ BitVec 32) ValueCell!12735))

(declare-fun mapKey!42088 () (_ BitVec 32))

(declare-fun mapValue!42088 () ValueCell!12735)

(assert (=> mapNonEmpty!42088 (= (arr!34022 _values!874) (store mapRest!42088 mapKey!42088 mapValue!42088))))

(declare-fun b!1093130 () Bool)

(declare-fun res!729437 () Bool)

(assert (=> b!1093130 (=> (not res!729437) (not e!624195))))

(declare-datatypes ((array!70699 0))(
  ( (array!70700 (arr!34023 (Array (_ BitVec 32) (_ BitVec 64))) (size!34559 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70699)

(declare-datatypes ((List!23769 0))(
  ( (Nil!23766) (Cons!23765 (h!24974 (_ BitVec 64)) (t!33714 List!23769)) )
))
(declare-fun arrayNoDuplicates!0 (array!70699 (_ BitVec 32) List!23769) Bool)

(assert (=> b!1093130 (= res!729437 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23766))))

(declare-fun b!1093131 () Bool)

(declare-fun res!729441 () Bool)

(assert (=> b!1093131 (=> (not res!729441) (not e!624195))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093131 (= res!729441 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34559 _keys!1070))))))

(declare-fun b!1093132 () Bool)

(declare-fun res!729434 () Bool)

(assert (=> b!1093132 (=> (not res!729434) (not e!624195))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093132 (= res!729434 (and (= (size!34558 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34559 _keys!1070) (size!34558 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093133 () Bool)

(declare-fun e!624200 () Bool)

(assert (=> b!1093133 (= e!624195 e!624200)))

(declare-fun res!729433 () Bool)

(assert (=> b!1093133 (=> (not res!729433) (not e!624200))))

(declare-fun lt!488771 () array!70699)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70699 (_ BitVec 32)) Bool)

(assert (=> b!1093133 (= res!729433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488771 mask!1414))))

(assert (=> b!1093133 (= lt!488771 (array!70700 (store (arr!34023 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34559 _keys!1070)))))

(declare-fun b!1093134 () Bool)

(declare-fun res!729439 () Bool)

(assert (=> b!1093134 (=> (not res!729439) (not e!624195))))

(assert (=> b!1093134 (= res!729439 (= (select (arr!34023 _keys!1070) i!650) k0!904))))

(declare-fun b!1093135 () Bool)

(declare-fun res!729438 () Bool)

(assert (=> b!1093135 (=> (not res!729438) (not e!624200))))

(assert (=> b!1093135 (= res!729438 (arrayNoDuplicates!0 lt!488771 #b00000000000000000000000000000000 Nil!23766))))

(declare-fun b!1093136 () Bool)

(assert (=> b!1093136 (= e!624200 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40979)

(declare-fun zeroValue!831 () V!40979)

(declare-datatypes ((tuple2!17178 0))(
  ( (tuple2!17179 (_1!8600 (_ BitVec 64)) (_2!8600 V!40979)) )
))
(declare-datatypes ((List!23770 0))(
  ( (Nil!23767) (Cons!23766 (h!24975 tuple2!17178) (t!33715 List!23770)) )
))
(declare-datatypes ((ListLongMap!15147 0))(
  ( (ListLongMap!15148 (toList!7589 List!23770)) )
))
(declare-fun lt!488768 () ListLongMap!15147)

(declare-fun getCurrentListMap!4345 (array!70699 array!70697 (_ BitVec 32) (_ BitVec 32) V!40979 V!40979 (_ BitVec 32) Int) ListLongMap!15147)

(assert (=> b!1093136 (= lt!488768 (getCurrentListMap!4345 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488772 () array!70697)

(declare-fun lt!488770 () ListLongMap!15147)

(assert (=> b!1093136 (= lt!488770 (getCurrentListMap!4345 lt!488771 lt!488772 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488773 () ListLongMap!15147)

(declare-fun lt!488766 () ListLongMap!15147)

(assert (=> b!1093136 (and (= lt!488773 lt!488766) (= lt!488766 lt!488773))))

(declare-fun lt!488765 () ListLongMap!15147)

(declare-fun -!908 (ListLongMap!15147 (_ BitVec 64)) ListLongMap!15147)

(assert (=> b!1093136 (= lt!488766 (-!908 lt!488765 k0!904))))

(declare-datatypes ((Unit!35982 0))(
  ( (Unit!35983) )
))
(declare-fun lt!488769 () Unit!35982)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!164 (array!70699 array!70697 (_ BitVec 32) (_ BitVec 32) V!40979 V!40979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35982)

(assert (=> b!1093136 (= lt!488769 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4105 (array!70699 array!70697 (_ BitVec 32) (_ BitVec 32) V!40979 V!40979 (_ BitVec 32) Int) ListLongMap!15147)

(assert (=> b!1093136 (= lt!488773 (getCurrentListMapNoExtraKeys!4105 lt!488771 lt!488772 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2242 (Int (_ BitVec 64)) V!40979)

(assert (=> b!1093136 (= lt!488772 (array!70698 (store (arr!34022 _values!874) i!650 (ValueCellFull!12735 (dynLambda!2242 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34558 _values!874)))))

(assert (=> b!1093136 (= lt!488765 (getCurrentListMapNoExtraKeys!4105 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093136 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488767 () Unit!35982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70699 (_ BitVec 64) (_ BitVec 32)) Unit!35982)

(assert (=> b!1093136 (= lt!488767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093137 () Bool)

(assert (=> b!1093137 (= e!624198 tp_is_empty!26889)))

(declare-fun res!729435 () Bool)

(assert (=> start!96234 (=> (not res!729435) (not e!624195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96234 (= res!729435 (validMask!0 mask!1414))))

(assert (=> start!96234 e!624195))

(assert (=> start!96234 tp!80510))

(assert (=> start!96234 true))

(assert (=> start!96234 tp_is_empty!26889))

(declare-fun array_inv!26220 (array!70699) Bool)

(assert (=> start!96234 (array_inv!26220 _keys!1070)))

(declare-fun array_inv!26221 (array!70697) Bool)

(assert (=> start!96234 (and (array_inv!26221 _values!874) e!624199)))

(declare-fun mapIsEmpty!42088 () Bool)

(assert (=> mapIsEmpty!42088 mapRes!42088))

(declare-fun b!1093138 () Bool)

(declare-fun res!729436 () Bool)

(assert (=> b!1093138 (=> (not res!729436) (not e!624195))))

(assert (=> b!1093138 (= res!729436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96234 res!729435) b!1093132))

(assert (= (and b!1093132 res!729434) b!1093138))

(assert (= (and b!1093138 res!729436) b!1093130))

(assert (= (and b!1093130 res!729437) b!1093131))

(assert (= (and b!1093131 res!729441) b!1093127))

(assert (= (and b!1093127 res!729440) b!1093134))

(assert (= (and b!1093134 res!729439) b!1093133))

(assert (= (and b!1093133 res!729433) b!1093135))

(assert (= (and b!1093135 res!729438) b!1093136))

(assert (= (and b!1093129 condMapEmpty!42088) mapIsEmpty!42088))

(assert (= (and b!1093129 (not condMapEmpty!42088)) mapNonEmpty!42088))

(get-info :version)

(assert (= (and mapNonEmpty!42088 ((_ is ValueCellFull!12735) mapValue!42088)) b!1093128))

(assert (= (and b!1093129 ((_ is ValueCellFull!12735) mapDefault!42088)) b!1093137))

(assert (= start!96234 b!1093129))

(declare-fun b_lambda!17557 () Bool)

(assert (=> (not b_lambda!17557) (not b!1093136)))

(declare-fun t!33713 () Bool)

(declare-fun tb!7765 () Bool)

(assert (=> (and start!96234 (= defaultEntry!882 defaultEntry!882) t!33713) tb!7765))

(declare-fun result!16049 () Bool)

(assert (=> tb!7765 (= result!16049 tp_is_empty!26889)))

(assert (=> b!1093136 t!33713))

(declare-fun b_and!36451 () Bool)

(assert (= b_and!36449 (and (=> t!33713 result!16049) b_and!36451)))

(declare-fun m!1012963 () Bool)

(assert (=> b!1093138 m!1012963))

(declare-fun m!1012965 () Bool)

(assert (=> b!1093130 m!1012965))

(declare-fun m!1012967 () Bool)

(assert (=> b!1093136 m!1012967))

(declare-fun m!1012969 () Bool)

(assert (=> b!1093136 m!1012969))

(declare-fun m!1012971 () Bool)

(assert (=> b!1093136 m!1012971))

(declare-fun m!1012973 () Bool)

(assert (=> b!1093136 m!1012973))

(declare-fun m!1012975 () Bool)

(assert (=> b!1093136 m!1012975))

(declare-fun m!1012977 () Bool)

(assert (=> b!1093136 m!1012977))

(declare-fun m!1012979 () Bool)

(assert (=> b!1093136 m!1012979))

(declare-fun m!1012981 () Bool)

(assert (=> b!1093136 m!1012981))

(declare-fun m!1012983 () Bool)

(assert (=> b!1093136 m!1012983))

(declare-fun m!1012985 () Bool)

(assert (=> b!1093136 m!1012985))

(declare-fun m!1012987 () Bool)

(assert (=> b!1093133 m!1012987))

(declare-fun m!1012989 () Bool)

(assert (=> b!1093133 m!1012989))

(declare-fun m!1012991 () Bool)

(assert (=> b!1093134 m!1012991))

(declare-fun m!1012993 () Bool)

(assert (=> start!96234 m!1012993))

(declare-fun m!1012995 () Bool)

(assert (=> start!96234 m!1012995))

(declare-fun m!1012997 () Bool)

(assert (=> start!96234 m!1012997))

(declare-fun m!1012999 () Bool)

(assert (=> b!1093135 m!1012999))

(declare-fun m!1013001 () Bool)

(assert (=> b!1093127 m!1013001))

(declare-fun m!1013003 () Bool)

(assert (=> mapNonEmpty!42088 m!1013003))

(check-sat (not b!1093133) (not b_lambda!17557) (not mapNonEmpty!42088) (not b!1093136) (not b!1093127) (not b!1093138) (not b!1093135) b_and!36451 (not b!1093130) (not b_next!22887) (not start!96234) tp_is_empty!26889)
(check-sat b_and!36451 (not b_next!22887))
