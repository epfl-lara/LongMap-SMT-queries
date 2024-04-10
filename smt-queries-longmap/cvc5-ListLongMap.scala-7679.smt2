; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96420 () Bool)

(assert start!96420)

(declare-fun b_free!22999 () Bool)

(declare-fun b_next!22999 () Bool)

(assert (=> start!96420 (= b_free!22999 (not b_next!22999))))

(declare-fun tp!80923 () Bool)

(declare-fun b_and!36661 () Bool)

(assert (=> start!96420 (= tp!80923 b_and!36661)))

(declare-fun b!1096066 () Bool)

(declare-fun res!731510 () Bool)

(declare-fun e!625685 () Bool)

(assert (=> b!1096066 (=> (not res!731510) (not e!625685))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71011 0))(
  ( (array!71012 (arr!34177 (Array (_ BitVec 32) (_ BitVec 64))) (size!34713 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71011)

(declare-datatypes ((V!41193 0))(
  ( (V!41194 (val!13581 Int)) )
))
(declare-datatypes ((ValueCell!12815 0))(
  ( (ValueCellFull!12815 (v!16202 V!41193)) (EmptyCell!12815) )
))
(declare-datatypes ((array!71013 0))(
  ( (array!71014 (arr!34178 (Array (_ BitVec 32) ValueCell!12815)) (size!34714 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71013)

(assert (=> b!1096066 (= res!731510 (and (= (size!34714 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34713 _keys!1070) (size!34714 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096067 () Bool)

(declare-fun e!625684 () Bool)

(declare-fun tp_is_empty!27049 () Bool)

(assert (=> b!1096067 (= e!625684 tp_is_empty!27049)))

(declare-fun b!1096068 () Bool)

(declare-fun e!625687 () Bool)

(assert (=> b!1096068 (= e!625685 e!625687)))

(declare-fun res!731509 () Bool)

(assert (=> b!1096068 (=> (not res!731509) (not e!625687))))

(declare-fun lt!490031 () array!71011)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71011 (_ BitVec 32)) Bool)

(assert (=> b!1096068 (= res!731509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490031 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096068 (= lt!490031 (array!71012 (store (arr!34177 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34713 _keys!1070)))))

(declare-fun b!1096069 () Bool)

(declare-fun res!731504 () Bool)

(assert (=> b!1096069 (=> (not res!731504) (not e!625685))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096069 (= res!731504 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!42334 () Bool)

(declare-fun mapRes!42334 () Bool)

(declare-fun tp!80924 () Bool)

(assert (=> mapNonEmpty!42334 (= mapRes!42334 (and tp!80924 e!625684))))

(declare-fun mapKey!42334 () (_ BitVec 32))

(declare-fun mapValue!42334 () ValueCell!12815)

(declare-fun mapRest!42334 () (Array (_ BitVec 32) ValueCell!12815))

(assert (=> mapNonEmpty!42334 (= (arr!34178 _values!874) (store mapRest!42334 mapKey!42334 mapValue!42334))))

(declare-fun b!1096070 () Bool)

(declare-fun res!731507 () Bool)

(assert (=> b!1096070 (=> (not res!731507) (not e!625685))))

(declare-datatypes ((List!23866 0))(
  ( (Nil!23863) (Cons!23862 (h!25071 (_ BitVec 64)) (t!33911 List!23866)) )
))
(declare-fun arrayNoDuplicates!0 (array!71011 (_ BitVec 32) List!23866) Bool)

(assert (=> b!1096070 (= res!731507 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23863))))

(declare-fun b!1096071 () Bool)

(declare-fun res!731512 () Bool)

(assert (=> b!1096071 (=> (not res!731512) (not e!625685))))

(assert (=> b!1096071 (= res!731512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!731508 () Bool)

(assert (=> start!96420 (=> (not res!731508) (not e!625685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96420 (= res!731508 (validMask!0 mask!1414))))

(assert (=> start!96420 e!625685))

(assert (=> start!96420 tp!80923))

(assert (=> start!96420 true))

(assert (=> start!96420 tp_is_empty!27049))

(declare-fun array_inv!26334 (array!71011) Bool)

(assert (=> start!96420 (array_inv!26334 _keys!1070)))

(declare-fun e!625683 () Bool)

(declare-fun array_inv!26335 (array!71013) Bool)

(assert (=> start!96420 (and (array_inv!26335 _values!874) e!625683)))

(declare-fun b!1096072 () Bool)

(assert (=> b!1096072 (= e!625687 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17246 0))(
  ( (tuple2!17247 (_1!8634 (_ BitVec 64)) (_2!8634 V!41193)) )
))
(declare-datatypes ((List!23867 0))(
  ( (Nil!23864) (Cons!23863 (h!25072 tuple2!17246) (t!33912 List!23867)) )
))
(declare-datatypes ((ListLongMap!15215 0))(
  ( (ListLongMap!15216 (toList!7623 List!23867)) )
))
(declare-fun lt!490030 () ListLongMap!15215)

(declare-fun minValue!831 () V!41193)

(declare-fun zeroValue!831 () V!41193)

(declare-fun getCurrentListMapNoExtraKeys!4139 (array!71011 array!71013 (_ BitVec 32) (_ BitVec 32) V!41193 V!41193 (_ BitVec 32) Int) ListLongMap!15215)

(declare-fun dynLambda!2274 (Int (_ BitVec 64)) V!41193)

(assert (=> b!1096072 (= lt!490030 (getCurrentListMapNoExtraKeys!4139 lt!490031 (array!71014 (store (arr!34178 _values!874) i!650 (ValueCellFull!12815 (dynLambda!2274 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34714 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490033 () ListLongMap!15215)

(assert (=> b!1096072 (= lt!490033 (getCurrentListMapNoExtraKeys!4139 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096072 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36058 0))(
  ( (Unit!36059) )
))
(declare-fun lt!490032 () Unit!36058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71011 (_ BitVec 64) (_ BitVec 32)) Unit!36058)

(assert (=> b!1096072 (= lt!490032 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096073 () Bool)

(declare-fun e!625686 () Bool)

(assert (=> b!1096073 (= e!625686 tp_is_empty!27049)))

(declare-fun b!1096074 () Bool)

(declare-fun res!731505 () Bool)

(assert (=> b!1096074 (=> (not res!731505) (not e!625685))))

(assert (=> b!1096074 (= res!731505 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34713 _keys!1070))))))

(declare-fun b!1096075 () Bool)

(assert (=> b!1096075 (= e!625683 (and e!625686 mapRes!42334))))

(declare-fun condMapEmpty!42334 () Bool)

(declare-fun mapDefault!42334 () ValueCell!12815)

