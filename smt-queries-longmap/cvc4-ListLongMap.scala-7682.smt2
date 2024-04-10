; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96442 () Bool)

(assert start!96442)

(declare-fun b_free!23021 () Bool)

(declare-fun b_next!23021 () Bool)

(assert (=> start!96442 (= b_free!23021 (not b_next!23021))))

(declare-fun tp!80990 () Bool)

(declare-fun b_and!36705 () Bool)

(assert (=> start!96442 (= tp!80990 b_and!36705)))

(declare-fun mapIsEmpty!42367 () Bool)

(declare-fun mapRes!42367 () Bool)

(assert (=> mapIsEmpty!42367 mapRes!42367))

(declare-fun b!1096484 () Bool)

(declare-fun res!731803 () Bool)

(declare-fun e!625880 () Bool)

(assert (=> b!1096484 (=> (not res!731803) (not e!625880))))

(declare-datatypes ((array!71055 0))(
  ( (array!71056 (arr!34199 (Array (_ BitVec 32) (_ BitVec 64))) (size!34735 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71055)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096484 (= res!731803 (= (select (arr!34199 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!42367 () Bool)

(declare-fun tp!80989 () Bool)

(declare-fun e!625882 () Bool)

(assert (=> mapNonEmpty!42367 (= mapRes!42367 (and tp!80989 e!625882))))

(declare-datatypes ((V!41221 0))(
  ( (V!41222 (val!13592 Int)) )
))
(declare-datatypes ((ValueCell!12826 0))(
  ( (ValueCellFull!12826 (v!16213 V!41221)) (EmptyCell!12826) )
))
(declare-datatypes ((array!71057 0))(
  ( (array!71058 (arr!34200 (Array (_ BitVec 32) ValueCell!12826)) (size!34736 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71057)

(declare-fun mapRest!42367 () (Array (_ BitVec 32) ValueCell!12826))

(declare-fun mapValue!42367 () ValueCell!12826)

(declare-fun mapKey!42367 () (_ BitVec 32))

(assert (=> mapNonEmpty!42367 (= (arr!34200 _values!874) (store mapRest!42367 mapKey!42367 mapValue!42367))))

(declare-fun b!1096485 () Bool)

(declare-fun tp_is_empty!27071 () Bool)

(assert (=> b!1096485 (= e!625882 tp_is_empty!27071)))

(declare-fun b!1096486 () Bool)

(declare-fun e!625883 () Bool)

(assert (=> b!1096486 (= e!625880 e!625883)))

(declare-fun res!731809 () Bool)

(assert (=> b!1096486 (=> (not res!731809) (not e!625883))))

(declare-fun lt!490162 () array!71055)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71055 (_ BitVec 32)) Bool)

(assert (=> b!1096486 (= res!731809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490162 mask!1414))))

(assert (=> b!1096486 (= lt!490162 (array!71056 (store (arr!34199 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34735 _keys!1070)))))

(declare-fun b!1096487 () Bool)

(declare-fun res!731807 () Bool)

(assert (=> b!1096487 (=> (not res!731807) (not e!625880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096487 (= res!731807 (validKeyInArray!0 k!904))))

(declare-fun b!1096488 () Bool)

(declare-fun res!731805 () Bool)

(assert (=> b!1096488 (=> (not res!731805) (not e!625883))))

(declare-datatypes ((List!23884 0))(
  ( (Nil!23881) (Cons!23880 (h!25089 (_ BitVec 64)) (t!33951 List!23884)) )
))
(declare-fun arrayNoDuplicates!0 (array!71055 (_ BitVec 32) List!23884) Bool)

(assert (=> b!1096488 (= res!731805 (arrayNoDuplicates!0 lt!490162 #b00000000000000000000000000000000 Nil!23881))))

(declare-fun b!1096489 () Bool)

(declare-fun e!625885 () Bool)

(assert (=> b!1096489 (= e!625885 tp_is_empty!27071)))

(declare-fun b!1096490 () Bool)

(declare-fun res!731801 () Bool)

(assert (=> b!1096490 (=> (not res!731801) (not e!625880))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096490 (= res!731801 (and (= (size!34736 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34735 _keys!1070) (size!34736 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096491 () Bool)

(assert (=> b!1096491 (= e!625883 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41221)

(declare-datatypes ((tuple2!17264 0))(
  ( (tuple2!17265 (_1!8643 (_ BitVec 64)) (_2!8643 V!41221)) )
))
(declare-datatypes ((List!23885 0))(
  ( (Nil!23882) (Cons!23881 (h!25090 tuple2!17264) (t!33952 List!23885)) )
))
(declare-datatypes ((ListLongMap!15233 0))(
  ( (ListLongMap!15234 (toList!7632 List!23885)) )
))
(declare-fun lt!490165 () ListLongMap!15233)

(declare-fun zeroValue!831 () V!41221)

(declare-fun getCurrentListMapNoExtraKeys!4148 (array!71055 array!71057 (_ BitVec 32) (_ BitVec 32) V!41221 V!41221 (_ BitVec 32) Int) ListLongMap!15233)

(declare-fun dynLambda!2283 (Int (_ BitVec 64)) V!41221)

(assert (=> b!1096491 (= lt!490165 (getCurrentListMapNoExtraKeys!4148 lt!490162 (array!71058 (store (arr!34200 _values!874) i!650 (ValueCellFull!12826 (dynLambda!2283 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34736 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490163 () ListLongMap!15233)

(assert (=> b!1096491 (= lt!490163 (getCurrentListMapNoExtraKeys!4148 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096491 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36076 0))(
  ( (Unit!36077) )
))
(declare-fun lt!490164 () Unit!36076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71055 (_ BitVec 64) (_ BitVec 32)) Unit!36076)

(assert (=> b!1096491 (= lt!490164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096492 () Bool)

(declare-fun res!731802 () Bool)

(assert (=> b!1096492 (=> (not res!731802) (not e!625880))))

(assert (=> b!1096492 (= res!731802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096493 () Bool)

(declare-fun e!625881 () Bool)

(assert (=> b!1096493 (= e!625881 (and e!625885 mapRes!42367))))

(declare-fun condMapEmpty!42367 () Bool)

(declare-fun mapDefault!42367 () ValueCell!12826)

