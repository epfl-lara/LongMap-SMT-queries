; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96206 () Bool)

(assert start!96206)

(declare-fun b_free!22859 () Bool)

(declare-fun b_next!22859 () Bool)

(assert (=> start!96206 (= b_free!22859 (not b_next!22859))))

(declare-fun tp!80425 () Bool)

(declare-fun b_and!36393 () Bool)

(assert (=> start!96206 (= tp!80425 b_and!36393)))

(declare-fun b!1092595 () Bool)

(declare-fun e!623948 () Bool)

(assert (=> b!1092595 (= e!623948 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40941 0))(
  ( (V!40942 (val!13487 Int)) )
))
(declare-fun zeroValue!831 () V!40941)

(declare-datatypes ((tuple2!17162 0))(
  ( (tuple2!17163 (_1!8592 (_ BitVec 64)) (_2!8592 V!40941)) )
))
(declare-datatypes ((List!23747 0))(
  ( (Nil!23744) (Cons!23743 (h!24952 tuple2!17162) (t!33664 List!23747)) )
))
(declare-datatypes ((ListLongMap!15131 0))(
  ( (ListLongMap!15132 (toList!7581 List!23747)) )
))
(declare-fun lt!488389 () ListLongMap!15131)

(declare-datatypes ((array!70641 0))(
  ( (array!70642 (arr!33994 (Array (_ BitVec 32) (_ BitVec 64))) (size!34530 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70641)

(declare-datatypes ((ValueCell!12721 0))(
  ( (ValueCellFull!12721 (v!16108 V!40941)) (EmptyCell!12721) )
))
(declare-datatypes ((array!70643 0))(
  ( (array!70644 (arr!33995 (Array (_ BitVec 32) ValueCell!12721)) (size!34531 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70643)

(declare-fun minValue!831 () V!40941)

(declare-fun getCurrentListMap!4337 (array!70641 array!70643 (_ BitVec 32) (_ BitVec 32) V!40941 V!40941 (_ BitVec 32) Int) ListLongMap!15131)

(assert (=> b!1092595 (= lt!488389 (getCurrentListMap!4337 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488391 () ListLongMap!15131)

(declare-fun lt!488388 () array!70641)

(declare-fun lt!488387 () array!70643)

(assert (=> b!1092595 (= lt!488391 (getCurrentListMap!4337 lt!488388 lt!488387 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488395 () ListLongMap!15131)

(declare-fun lt!488392 () ListLongMap!15131)

(assert (=> b!1092595 (and (= lt!488395 lt!488392) (= lt!488392 lt!488395))))

(declare-fun lt!488393 () ListLongMap!15131)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!900 (ListLongMap!15131 (_ BitVec 64)) ListLongMap!15131)

(assert (=> b!1092595 (= lt!488392 (-!900 lt!488393 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35966 0))(
  ( (Unit!35967) )
))
(declare-fun lt!488390 () Unit!35966)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 (array!70641 array!70643 (_ BitVec 32) (_ BitVec 32) V!40941 V!40941 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35966)

(assert (=> b!1092595 (= lt!488390 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4097 (array!70641 array!70643 (_ BitVec 32) (_ BitVec 32) V!40941 V!40941 (_ BitVec 32) Int) ListLongMap!15131)

(assert (=> b!1092595 (= lt!488395 (getCurrentListMapNoExtraKeys!4097 lt!488388 lt!488387 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2234 (Int (_ BitVec 64)) V!40941)

(assert (=> b!1092595 (= lt!488387 (array!70644 (store (arr!33995 _values!874) i!650 (ValueCellFull!12721 (dynLambda!2234 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34531 _values!874)))))

(assert (=> b!1092595 (= lt!488393 (getCurrentListMapNoExtraKeys!4097 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092595 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488394 () Unit!35966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70641 (_ BitVec 64) (_ BitVec 32)) Unit!35966)

(assert (=> b!1092595 (= lt!488394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092596 () Bool)

(declare-fun res!729055 () Bool)

(declare-fun e!623947 () Bool)

(assert (=> b!1092596 (=> (not res!729055) (not e!623947))))

(assert (=> b!1092596 (= res!729055 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34530 _keys!1070))))))

(declare-fun mapNonEmpty!42046 () Bool)

(declare-fun mapRes!42046 () Bool)

(declare-fun tp!80426 () Bool)

(declare-fun e!623943 () Bool)

(assert (=> mapNonEmpty!42046 (= mapRes!42046 (and tp!80426 e!623943))))

(declare-fun mapRest!42046 () (Array (_ BitVec 32) ValueCell!12721))

(declare-fun mapValue!42046 () ValueCell!12721)

(declare-fun mapKey!42046 () (_ BitVec 32))

(assert (=> mapNonEmpty!42046 (= (arr!33995 _values!874) (store mapRest!42046 mapKey!42046 mapValue!42046))))

(declare-fun b!1092598 () Bool)

(declare-fun res!729063 () Bool)

(assert (=> b!1092598 (=> (not res!729063) (not e!623947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092598 (= res!729063 (validKeyInArray!0 k!904))))

(declare-fun b!1092599 () Bool)

(declare-fun e!623946 () Bool)

(declare-fun tp_is_empty!26861 () Bool)

(assert (=> b!1092599 (= e!623946 tp_is_empty!26861)))

(declare-fun b!1092600 () Bool)

(declare-fun res!729056 () Bool)

(assert (=> b!1092600 (=> (not res!729056) (not e!623947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70641 (_ BitVec 32)) Bool)

(assert (=> b!1092600 (= res!729056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092601 () Bool)

(declare-fun res!729060 () Bool)

(assert (=> b!1092601 (=> (not res!729060) (not e!623947))))

(assert (=> b!1092601 (= res!729060 (= (select (arr!33994 _keys!1070) i!650) k!904))))

(declare-fun b!1092602 () Bool)

(assert (=> b!1092602 (= e!623947 e!623948)))

(declare-fun res!729059 () Bool)

(assert (=> b!1092602 (=> (not res!729059) (not e!623948))))

(assert (=> b!1092602 (= res!729059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488388 mask!1414))))

(assert (=> b!1092602 (= lt!488388 (array!70642 (store (arr!33994 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34530 _keys!1070)))))

(declare-fun b!1092603 () Bool)

(assert (=> b!1092603 (= e!623943 tp_is_empty!26861)))

(declare-fun b!1092604 () Bool)

(declare-fun res!729062 () Bool)

(assert (=> b!1092604 (=> (not res!729062) (not e!623947))))

(assert (=> b!1092604 (= res!729062 (and (= (size!34531 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34530 _keys!1070) (size!34531 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092605 () Bool)

(declare-fun res!729061 () Bool)

(assert (=> b!1092605 (=> (not res!729061) (not e!623948))))

(declare-datatypes ((List!23748 0))(
  ( (Nil!23745) (Cons!23744 (h!24953 (_ BitVec 64)) (t!33665 List!23748)) )
))
(declare-fun arrayNoDuplicates!0 (array!70641 (_ BitVec 32) List!23748) Bool)

(assert (=> b!1092605 (= res!729061 (arrayNoDuplicates!0 lt!488388 #b00000000000000000000000000000000 Nil!23745))))

(declare-fun res!729057 () Bool)

(assert (=> start!96206 (=> (not res!729057) (not e!623947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96206 (= res!729057 (validMask!0 mask!1414))))

(assert (=> start!96206 e!623947))

(assert (=> start!96206 tp!80425))

(assert (=> start!96206 true))

(assert (=> start!96206 tp_is_empty!26861))

(declare-fun array_inv!26208 (array!70641) Bool)

(assert (=> start!96206 (array_inv!26208 _keys!1070)))

(declare-fun e!623945 () Bool)

(declare-fun array_inv!26209 (array!70643) Bool)

(assert (=> start!96206 (and (array_inv!26209 _values!874) e!623945)))

(declare-fun b!1092597 () Bool)

(declare-fun res!729058 () Bool)

(assert (=> b!1092597 (=> (not res!729058) (not e!623947))))

(assert (=> b!1092597 (= res!729058 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23745))))

(declare-fun mapIsEmpty!42046 () Bool)

(assert (=> mapIsEmpty!42046 mapRes!42046))

(declare-fun b!1092606 () Bool)

(assert (=> b!1092606 (= e!623945 (and e!623946 mapRes!42046))))

(declare-fun condMapEmpty!42046 () Bool)

(declare-fun mapDefault!42046 () ValueCell!12721)

