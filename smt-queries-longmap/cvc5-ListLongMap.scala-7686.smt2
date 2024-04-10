; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96462 () Bool)

(assert start!96462)

(declare-fun b_free!23041 () Bool)

(declare-fun b_next!23041 () Bool)

(assert (=> start!96462 (= b_free!23041 (not b_next!23041))))

(declare-fun tp!81050 () Bool)

(declare-fun b_and!36745 () Bool)

(assert (=> start!96462 (= tp!81050 b_and!36745)))

(declare-fun b!1096864 () Bool)

(declare-fun res!732073 () Bool)

(declare-fun e!626064 () Bool)

(assert (=> b!1096864 (=> (not res!732073) (not e!626064))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096864 (= res!732073 (validKeyInArray!0 k!904))))

(declare-fun b!1096865 () Bool)

(declare-fun e!626065 () Bool)

(declare-fun tp_is_empty!27091 () Bool)

(assert (=> b!1096865 (= e!626065 tp_is_empty!27091)))

(declare-fun b!1096866 () Bool)

(declare-fun res!732078 () Bool)

(assert (=> b!1096866 (=> (not res!732078) (not e!626064))))

(declare-datatypes ((array!71095 0))(
  ( (array!71096 (arr!34219 (Array (_ BitVec 32) (_ BitVec 64))) (size!34755 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71095)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096866 (= res!732078 (= (select (arr!34219 _keys!1070) i!650) k!904))))

(declare-fun b!1096867 () Bool)

(declare-fun e!626062 () Bool)

(assert (=> b!1096867 (= e!626062 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41249 0))(
  ( (V!41250 (val!13602 Int)) )
))
(declare-datatypes ((ValueCell!12836 0))(
  ( (ValueCellFull!12836 (v!16223 V!41249)) (EmptyCell!12836) )
))
(declare-datatypes ((array!71097 0))(
  ( (array!71098 (arr!34220 (Array (_ BitVec 32) ValueCell!12836)) (size!34756 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71097)

(declare-fun minValue!831 () V!41249)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!490284 () array!71095)

(declare-fun zeroValue!831 () V!41249)

(declare-datatypes ((tuple2!17272 0))(
  ( (tuple2!17273 (_1!8647 (_ BitVec 64)) (_2!8647 V!41249)) )
))
(declare-datatypes ((List!23896 0))(
  ( (Nil!23893) (Cons!23892 (h!25101 tuple2!17272) (t!33983 List!23896)) )
))
(declare-datatypes ((ListLongMap!15241 0))(
  ( (ListLongMap!15242 (toList!7636 List!23896)) )
))
(declare-fun lt!490283 () ListLongMap!15241)

(declare-fun getCurrentListMapNoExtraKeys!4152 (array!71095 array!71097 (_ BitVec 32) (_ BitVec 32) V!41249 V!41249 (_ BitVec 32) Int) ListLongMap!15241)

(declare-fun dynLambda!2287 (Int (_ BitVec 64)) V!41249)

(assert (=> b!1096867 (= lt!490283 (getCurrentListMapNoExtraKeys!4152 lt!490284 (array!71098 (store (arr!34220 _values!874) i!650 (ValueCellFull!12836 (dynLambda!2287 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34756 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490285 () ListLongMap!15241)

(assert (=> b!1096867 (= lt!490285 (getCurrentListMapNoExtraKeys!4152 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096867 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36084 0))(
  ( (Unit!36085) )
))
(declare-fun lt!490282 () Unit!36084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71095 (_ BitVec 64) (_ BitVec 32)) Unit!36084)

(assert (=> b!1096867 (= lt!490282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun res!732071 () Bool)

(assert (=> start!96462 (=> (not res!732071) (not e!626064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96462 (= res!732071 (validMask!0 mask!1414))))

(assert (=> start!96462 e!626064))

(assert (=> start!96462 tp!81050))

(assert (=> start!96462 true))

(assert (=> start!96462 tp_is_empty!27091))

(declare-fun array_inv!26364 (array!71095) Bool)

(assert (=> start!96462 (array_inv!26364 _keys!1070)))

(declare-fun e!626061 () Bool)

(declare-fun array_inv!26365 (array!71097) Bool)

(assert (=> start!96462 (and (array_inv!26365 _values!874) e!626061)))

(declare-fun b!1096868 () Bool)

(declare-fun res!732077 () Bool)

(assert (=> b!1096868 (=> (not res!732077) (not e!626064))))

(assert (=> b!1096868 (= res!732077 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34755 _keys!1070))))))

(declare-fun b!1096869 () Bool)

(assert (=> b!1096869 (= e!626064 e!626062)))

(declare-fun res!732072 () Bool)

(assert (=> b!1096869 (=> (not res!732072) (not e!626062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71095 (_ BitVec 32)) Bool)

(assert (=> b!1096869 (= res!732072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490284 mask!1414))))

(assert (=> b!1096869 (= lt!490284 (array!71096 (store (arr!34219 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34755 _keys!1070)))))

(declare-fun mapNonEmpty!42397 () Bool)

(declare-fun mapRes!42397 () Bool)

(declare-fun tp!81049 () Bool)

(assert (=> mapNonEmpty!42397 (= mapRes!42397 (and tp!81049 e!626065))))

(declare-fun mapValue!42397 () ValueCell!12836)

(declare-fun mapRest!42397 () (Array (_ BitVec 32) ValueCell!12836))

(declare-fun mapKey!42397 () (_ BitVec 32))

(assert (=> mapNonEmpty!42397 (= (arr!34220 _values!874) (store mapRest!42397 mapKey!42397 mapValue!42397))))

(declare-fun b!1096870 () Bool)

(declare-fun res!732075 () Bool)

(assert (=> b!1096870 (=> (not res!732075) (not e!626064))))

(assert (=> b!1096870 (= res!732075 (and (= (size!34756 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34755 _keys!1070) (size!34756 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096871 () Bool)

(declare-fun e!626060 () Bool)

(assert (=> b!1096871 (= e!626061 (and e!626060 mapRes!42397))))

(declare-fun condMapEmpty!42397 () Bool)

(declare-fun mapDefault!42397 () ValueCell!12836)

