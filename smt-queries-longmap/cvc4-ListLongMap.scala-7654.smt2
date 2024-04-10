; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96248 () Bool)

(assert start!96248)

(declare-fun b_free!22901 () Bool)

(declare-fun b_next!22901 () Bool)

(assert (=> start!96248 (= b_free!22901 (not b_next!22901))))

(declare-fun tp!80551 () Bool)

(declare-fun b_and!36477 () Bool)

(assert (=> start!96248 (= tp!80551 b_and!36477)))

(declare-fun b!1093393 () Bool)

(declare-fun res!729629 () Bool)

(declare-fun e!624323 () Bool)

(assert (=> b!1093393 (=> (not res!729629) (not e!624323))))

(declare-datatypes ((array!70723 0))(
  ( (array!70724 (arr!34035 (Array (_ BitVec 32) (_ BitVec 64))) (size!34571 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70723)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70723 (_ BitVec 32)) Bool)

(assert (=> b!1093393 (= res!729629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093394 () Bool)

(declare-fun res!729622 () Bool)

(assert (=> b!1093394 (=> (not res!729622) (not e!624323))))

(declare-datatypes ((List!23779 0))(
  ( (Nil!23776) (Cons!23775 (h!24984 (_ BitVec 64)) (t!33738 List!23779)) )
))
(declare-fun arrayNoDuplicates!0 (array!70723 (_ BitVec 32) List!23779) Bool)

(assert (=> b!1093394 (= res!729622 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23776))))

(declare-fun b!1093395 () Bool)

(declare-fun res!729627 () Bool)

(assert (=> b!1093395 (=> (not res!729627) (not e!624323))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40997 0))(
  ( (V!40998 (val!13508 Int)) )
))
(declare-datatypes ((ValueCell!12742 0))(
  ( (ValueCellFull!12742 (v!16129 V!40997)) (EmptyCell!12742) )
))
(declare-datatypes ((array!70725 0))(
  ( (array!70726 (arr!34036 (Array (_ BitVec 32) ValueCell!12742)) (size!34572 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70725)

(assert (=> b!1093395 (= res!729627 (and (= (size!34572 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34571 _keys!1070) (size!34572 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093396 () Bool)

(declare-fun e!624322 () Bool)

(assert (=> b!1093396 (= e!624323 e!624322)))

(declare-fun res!729628 () Bool)

(assert (=> b!1093396 (=> (not res!729628) (not e!624322))))

(declare-fun lt!488964 () array!70723)

(assert (=> b!1093396 (= res!729628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488964 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093396 (= lt!488964 (array!70724 (store (arr!34035 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34571 _keys!1070)))))

(declare-fun b!1093397 () Bool)

(assert (=> b!1093397 (= e!624322 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40997)

(declare-datatypes ((tuple2!17186 0))(
  ( (tuple2!17187 (_1!8604 (_ BitVec 64)) (_2!8604 V!40997)) )
))
(declare-datatypes ((List!23780 0))(
  ( (Nil!23777) (Cons!23776 (h!24985 tuple2!17186) (t!33739 List!23780)) )
))
(declare-datatypes ((ListLongMap!15155 0))(
  ( (ListLongMap!15156 (toList!7593 List!23780)) )
))
(declare-fun lt!488968 () ListLongMap!15155)

(declare-fun zeroValue!831 () V!40997)

(declare-fun getCurrentListMap!4349 (array!70723 array!70725 (_ BitVec 32) (_ BitVec 32) V!40997 V!40997 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1093397 (= lt!488968 (getCurrentListMap!4349 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488967 () array!70725)

(declare-fun lt!488963 () ListLongMap!15155)

(assert (=> b!1093397 (= lt!488963 (getCurrentListMap!4349 lt!488964 lt!488967 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488969 () ListLongMap!15155)

(declare-fun lt!488965 () ListLongMap!15155)

(assert (=> b!1093397 (and (= lt!488969 lt!488965) (= lt!488965 lt!488969))))

(declare-fun lt!488971 () ListLongMap!15155)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!912 (ListLongMap!15155 (_ BitVec 64)) ListLongMap!15155)

(assert (=> b!1093397 (= lt!488965 (-!912 lt!488971 k!904))))

(declare-datatypes ((Unit!35990 0))(
  ( (Unit!35991) )
))
(declare-fun lt!488966 () Unit!35990)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 (array!70723 array!70725 (_ BitVec 32) (_ BitVec 32) V!40997 V!40997 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35990)

(assert (=> b!1093397 (= lt!488966 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4109 (array!70723 array!70725 (_ BitVec 32) (_ BitVec 32) V!40997 V!40997 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1093397 (= lt!488969 (getCurrentListMapNoExtraKeys!4109 lt!488964 lt!488967 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2246 (Int (_ BitVec 64)) V!40997)

(assert (=> b!1093397 (= lt!488967 (array!70726 (store (arr!34036 _values!874) i!650 (ValueCellFull!12742 (dynLambda!2246 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34572 _values!874)))))

(assert (=> b!1093397 (= lt!488971 (getCurrentListMapNoExtraKeys!4109 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093397 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488970 () Unit!35990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70723 (_ BitVec 64) (_ BitVec 32)) Unit!35990)

(assert (=> b!1093397 (= lt!488970 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun res!729624 () Bool)

(assert (=> start!96248 (=> (not res!729624) (not e!624323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96248 (= res!729624 (validMask!0 mask!1414))))

(assert (=> start!96248 e!624323))

(assert (=> start!96248 tp!80551))

(assert (=> start!96248 true))

(declare-fun tp_is_empty!26903 () Bool)

(assert (=> start!96248 tp_is_empty!26903))

(declare-fun array_inv!26230 (array!70723) Bool)

(assert (=> start!96248 (array_inv!26230 _keys!1070)))

(declare-fun e!624321 () Bool)

(declare-fun array_inv!26231 (array!70725) Bool)

(assert (=> start!96248 (and (array_inv!26231 _values!874) e!624321)))

(declare-fun mapNonEmpty!42109 () Bool)

(declare-fun mapRes!42109 () Bool)

(declare-fun tp!80552 () Bool)

(declare-fun e!624325 () Bool)

(assert (=> mapNonEmpty!42109 (= mapRes!42109 (and tp!80552 e!624325))))

(declare-fun mapValue!42109 () ValueCell!12742)

(declare-fun mapKey!42109 () (_ BitVec 32))

(declare-fun mapRest!42109 () (Array (_ BitVec 32) ValueCell!12742))

(assert (=> mapNonEmpty!42109 (= (arr!34036 _values!874) (store mapRest!42109 mapKey!42109 mapValue!42109))))

(declare-fun mapIsEmpty!42109 () Bool)

(assert (=> mapIsEmpty!42109 mapRes!42109))

(declare-fun b!1093398 () Bool)

(declare-fun res!729626 () Bool)

(assert (=> b!1093398 (=> (not res!729626) (not e!624323))))

(assert (=> b!1093398 (= res!729626 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34571 _keys!1070))))))

(declare-fun b!1093399 () Bool)

(declare-fun e!624326 () Bool)

(assert (=> b!1093399 (= e!624321 (and e!624326 mapRes!42109))))

(declare-fun condMapEmpty!42109 () Bool)

(declare-fun mapDefault!42109 () ValueCell!12742)

