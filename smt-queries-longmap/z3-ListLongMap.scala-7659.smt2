; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96510 () Bool)

(assert start!96510)

(declare-fun b_free!22927 () Bool)

(declare-fun b_next!22927 () Bool)

(assert (=> start!96510 (= b_free!22927 (not b_next!22927))))

(declare-fun tp!80630 () Bool)

(declare-fun b_and!36539 () Bool)

(assert (=> start!96510 (= tp!80630 b_and!36539)))

(declare-fun b!1095214 () Bool)

(declare-fun e!625415 () Bool)

(assert (=> b!1095214 (= e!625415 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41033 0))(
  ( (V!41034 (val!13521 Int)) )
))
(declare-fun minValue!831 () V!41033)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17208 0))(
  ( (tuple2!17209 (_1!8615 (_ BitVec 64)) (_2!8615 V!41033)) )
))
(declare-datatypes ((List!23805 0))(
  ( (Nil!23802) (Cons!23801 (h!25019 tuple2!17208) (t!33782 List!23805)) )
))
(declare-datatypes ((ListLongMap!15185 0))(
  ( (ListLongMap!15186 (toList!7608 List!23805)) )
))
(declare-fun lt!489830 () ListLongMap!15185)

(declare-fun zeroValue!831 () V!41033)

(declare-datatypes ((array!70803 0))(
  ( (array!70804 (arr!34069 (Array (_ BitVec 32) (_ BitVec 64))) (size!34606 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70803)

(declare-datatypes ((ValueCell!12755 0))(
  ( (ValueCellFull!12755 (v!16138 V!41033)) (EmptyCell!12755) )
))
(declare-datatypes ((array!70805 0))(
  ( (array!70806 (arr!34070 (Array (_ BitVec 32) ValueCell!12755)) (size!34607 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70805)

(declare-fun getCurrentListMap!4356 (array!70803 array!70805 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15185)

(assert (=> b!1095214 (= lt!489830 (getCurrentListMap!4356 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489836 () array!70805)

(declare-fun lt!489832 () array!70803)

(declare-fun lt!489835 () ListLongMap!15185)

(assert (=> b!1095214 (= lt!489835 (getCurrentListMap!4356 lt!489832 lt!489836 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489829 () ListLongMap!15185)

(declare-fun lt!489831 () ListLongMap!15185)

(assert (=> b!1095214 (and (= lt!489829 lt!489831) (= lt!489831 lt!489829))))

(declare-fun lt!489834 () ListLongMap!15185)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!913 (ListLongMap!15185 (_ BitVec 64)) ListLongMap!15185)

(assert (=> b!1095214 (= lt!489831 (-!913 lt!489834 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35993 0))(
  ( (Unit!35994) )
))
(declare-fun lt!489833 () Unit!35993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 (array!70803 array!70805 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35993)

(assert (=> b!1095214 (= lt!489833 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4161 (array!70803 array!70805 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15185)

(assert (=> b!1095214 (= lt!489829 (getCurrentListMapNoExtraKeys!4161 lt!489832 lt!489836 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2282 (Int (_ BitVec 64)) V!41033)

(assert (=> b!1095214 (= lt!489836 (array!70806 (store (arr!34070 _values!874) i!650 (ValueCellFull!12755 (dynLambda!2282 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34607 _values!874)))))

(assert (=> b!1095214 (= lt!489834 (getCurrentListMapNoExtraKeys!4161 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095214 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489837 () Unit!35993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70803 (_ BitVec 64) (_ BitVec 32)) Unit!35993)

(assert (=> b!1095214 (= lt!489837 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095215 () Bool)

(declare-fun res!730496 () Bool)

(assert (=> b!1095215 (=> (not res!730496) (not e!625415))))

(declare-datatypes ((List!23806 0))(
  ( (Nil!23803) (Cons!23802 (h!25020 (_ BitVec 64)) (t!33783 List!23806)) )
))
(declare-fun arrayNoDuplicates!0 (array!70803 (_ BitVec 32) List!23806) Bool)

(assert (=> b!1095215 (= res!730496 (arrayNoDuplicates!0 lt!489832 #b00000000000000000000000000000000 Nil!23803))))

(declare-fun b!1095216 () Bool)

(declare-fun e!625410 () Bool)

(declare-fun e!625412 () Bool)

(declare-fun mapRes!42148 () Bool)

(assert (=> b!1095216 (= e!625410 (and e!625412 mapRes!42148))))

(declare-fun condMapEmpty!42148 () Bool)

(declare-fun mapDefault!42148 () ValueCell!12755)

(assert (=> b!1095216 (= condMapEmpty!42148 (= (arr!34070 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12755)) mapDefault!42148)))))

(declare-fun b!1095217 () Bool)

(declare-fun res!730503 () Bool)

(declare-fun e!625413 () Bool)

(assert (=> b!1095217 (=> (not res!730503) (not e!625413))))

(assert (=> b!1095217 (= res!730503 (= (select (arr!34069 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42148 () Bool)

(assert (=> mapIsEmpty!42148 mapRes!42148))

(declare-fun b!1095219 () Bool)

(declare-fun e!625414 () Bool)

(declare-fun tp_is_empty!26929 () Bool)

(assert (=> b!1095219 (= e!625414 tp_is_empty!26929)))

(declare-fun b!1095220 () Bool)

(assert (=> b!1095220 (= e!625412 tp_is_empty!26929)))

(declare-fun b!1095221 () Bool)

(declare-fun res!730502 () Bool)

(assert (=> b!1095221 (=> (not res!730502) (not e!625413))))

(assert (=> b!1095221 (= res!730502 (and (= (size!34607 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34606 _keys!1070) (size!34607 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095222 () Bool)

(declare-fun res!730498 () Bool)

(assert (=> b!1095222 (=> (not res!730498) (not e!625413))))

(assert (=> b!1095222 (= res!730498 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23803))))

(declare-fun b!1095223 () Bool)

(declare-fun res!730499 () Bool)

(assert (=> b!1095223 (=> (not res!730499) (not e!625413))))

(assert (=> b!1095223 (= res!730499 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34606 _keys!1070))))))

(declare-fun mapNonEmpty!42148 () Bool)

(declare-fun tp!80629 () Bool)

(assert (=> mapNonEmpty!42148 (= mapRes!42148 (and tp!80629 e!625414))))

(declare-fun mapKey!42148 () (_ BitVec 32))

(declare-fun mapValue!42148 () ValueCell!12755)

(declare-fun mapRest!42148 () (Array (_ BitVec 32) ValueCell!12755))

(assert (=> mapNonEmpty!42148 (= (arr!34070 _values!874) (store mapRest!42148 mapKey!42148 mapValue!42148))))

(declare-fun b!1095224 () Bool)

(declare-fun res!730500 () Bool)

(assert (=> b!1095224 (=> (not res!730500) (not e!625413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70803 (_ BitVec 32)) Bool)

(assert (=> b!1095224 (= res!730500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095225 () Bool)

(assert (=> b!1095225 (= e!625413 e!625415)))

(declare-fun res!730501 () Bool)

(assert (=> b!1095225 (=> (not res!730501) (not e!625415))))

(assert (=> b!1095225 (= res!730501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489832 mask!1414))))

(assert (=> b!1095225 (= lt!489832 (array!70804 (store (arr!34069 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34606 _keys!1070)))))

(declare-fun b!1095218 () Bool)

(declare-fun res!730497 () Bool)

(assert (=> b!1095218 (=> (not res!730497) (not e!625413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095218 (= res!730497 (validKeyInArray!0 k0!904))))

(declare-fun res!730495 () Bool)

(assert (=> start!96510 (=> (not res!730495) (not e!625413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96510 (= res!730495 (validMask!0 mask!1414))))

(assert (=> start!96510 e!625413))

(assert (=> start!96510 tp!80630))

(assert (=> start!96510 true))

(assert (=> start!96510 tp_is_empty!26929))

(declare-fun array_inv!26296 (array!70803) Bool)

(assert (=> start!96510 (array_inv!26296 _keys!1070)))

(declare-fun array_inv!26297 (array!70805) Bool)

(assert (=> start!96510 (and (array_inv!26297 _values!874) e!625410)))

(assert (= (and start!96510 res!730495) b!1095221))

(assert (= (and b!1095221 res!730502) b!1095224))

(assert (= (and b!1095224 res!730500) b!1095222))

(assert (= (and b!1095222 res!730498) b!1095223))

(assert (= (and b!1095223 res!730499) b!1095218))

(assert (= (and b!1095218 res!730497) b!1095217))

(assert (= (and b!1095217 res!730503) b!1095225))

(assert (= (and b!1095225 res!730501) b!1095215))

(assert (= (and b!1095215 res!730496) b!1095214))

(assert (= (and b!1095216 condMapEmpty!42148) mapIsEmpty!42148))

(assert (= (and b!1095216 (not condMapEmpty!42148)) mapNonEmpty!42148))

(get-info :version)

(assert (= (and mapNonEmpty!42148 ((_ is ValueCellFull!12755) mapValue!42148)) b!1095219))

(assert (= (and b!1095216 ((_ is ValueCellFull!12755) mapDefault!42148)) b!1095220))

(assert (= start!96510 b!1095216))

(declare-fun b_lambda!17607 () Bool)

(assert (=> (not b_lambda!17607) (not b!1095214)))

(declare-fun t!33781 () Bool)

(declare-fun tb!7797 () Bool)

(assert (=> (and start!96510 (= defaultEntry!882 defaultEntry!882) t!33781) tb!7797))

(declare-fun result!16121 () Bool)

(assert (=> tb!7797 (= result!16121 tp_is_empty!26929)))

(assert (=> b!1095214 t!33781))

(declare-fun b_and!36541 () Bool)

(assert (= b_and!36539 (and (=> t!33781 result!16121) b_and!36541)))

(declare-fun m!1015475 () Bool)

(assert (=> mapNonEmpty!42148 m!1015475))

(declare-fun m!1015477 () Bool)

(assert (=> b!1095224 m!1015477))

(declare-fun m!1015479 () Bool)

(assert (=> b!1095225 m!1015479))

(declare-fun m!1015481 () Bool)

(assert (=> b!1095225 m!1015481))

(declare-fun m!1015483 () Bool)

(assert (=> start!96510 m!1015483))

(declare-fun m!1015485 () Bool)

(assert (=> start!96510 m!1015485))

(declare-fun m!1015487 () Bool)

(assert (=> start!96510 m!1015487))

(declare-fun m!1015489 () Bool)

(assert (=> b!1095217 m!1015489))

(declare-fun m!1015491 () Bool)

(assert (=> b!1095215 m!1015491))

(declare-fun m!1015493 () Bool)

(assert (=> b!1095222 m!1015493))

(declare-fun m!1015495 () Bool)

(assert (=> b!1095218 m!1015495))

(declare-fun m!1015497 () Bool)

(assert (=> b!1095214 m!1015497))

(declare-fun m!1015499 () Bool)

(assert (=> b!1095214 m!1015499))

(declare-fun m!1015501 () Bool)

(assert (=> b!1095214 m!1015501))

(declare-fun m!1015503 () Bool)

(assert (=> b!1095214 m!1015503))

(declare-fun m!1015505 () Bool)

(assert (=> b!1095214 m!1015505))

(declare-fun m!1015507 () Bool)

(assert (=> b!1095214 m!1015507))

(declare-fun m!1015509 () Bool)

(assert (=> b!1095214 m!1015509))

(declare-fun m!1015511 () Bool)

(assert (=> b!1095214 m!1015511))

(declare-fun m!1015513 () Bool)

(assert (=> b!1095214 m!1015513))

(declare-fun m!1015515 () Bool)

(assert (=> b!1095214 m!1015515))

(check-sat (not start!96510) b_and!36541 (not b!1095222) (not mapNonEmpty!42148) (not b_next!22927) (not b_lambda!17607) (not b!1095218) (not b!1095214) (not b!1095215) (not b!1095225) tp_is_empty!26929 (not b!1095224))
(check-sat b_and!36541 (not b_next!22927))
