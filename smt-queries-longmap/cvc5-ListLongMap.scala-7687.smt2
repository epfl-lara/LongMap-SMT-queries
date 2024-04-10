; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96468 () Bool)

(assert start!96468)

(declare-fun b_free!23047 () Bool)

(declare-fun b_next!23047 () Bool)

(assert (=> start!96468 (= b_free!23047 (not b_next!23047))))

(declare-fun tp!81068 () Bool)

(declare-fun b_and!36757 () Bool)

(assert (=> start!96468 (= tp!81068 b_and!36757)))

(declare-fun b!1096978 () Bool)

(declare-fun res!732158 () Bool)

(declare-fun e!626119 () Bool)

(assert (=> b!1096978 (=> (not res!732158) (not e!626119))))

(declare-datatypes ((array!71105 0))(
  ( (array!71106 (arr!34224 (Array (_ BitVec 32) (_ BitVec 64))) (size!34760 (_ BitVec 32))) )
))
(declare-fun lt!490323 () array!71105)

(declare-datatypes ((List!23899 0))(
  ( (Nil!23896) (Cons!23895 (h!25104 (_ BitVec 64)) (t!33992 List!23899)) )
))
(declare-fun arrayNoDuplicates!0 (array!71105 (_ BitVec 32) List!23899) Bool)

(assert (=> b!1096978 (= res!732158 (arrayNoDuplicates!0 lt!490323 #b00000000000000000000000000000000 Nil!23896))))

(declare-fun b!1096979 () Bool)

(declare-fun res!732156 () Bool)

(declare-fun e!626116 () Bool)

(assert (=> b!1096979 (=> (not res!732156) (not e!626116))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!71105)

(declare-datatypes ((V!41257 0))(
  ( (V!41258 (val!13605 Int)) )
))
(declare-datatypes ((ValueCell!12839 0))(
  ( (ValueCellFull!12839 (v!16226 V!41257)) (EmptyCell!12839) )
))
(declare-datatypes ((array!71107 0))(
  ( (array!71108 (arr!34225 (Array (_ BitVec 32) ValueCell!12839)) (size!34761 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71107)

(assert (=> b!1096979 (= res!732156 (and (= (size!34761 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34760 _keys!1070) (size!34761 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!732152 () Bool)

(assert (=> start!96468 (=> (not res!732152) (not e!626116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96468 (= res!732152 (validMask!0 mask!1414))))

(assert (=> start!96468 e!626116))

(assert (=> start!96468 tp!81068))

(assert (=> start!96468 true))

(declare-fun tp_is_empty!27097 () Bool)

(assert (=> start!96468 tp_is_empty!27097))

(declare-fun array_inv!26368 (array!71105) Bool)

(assert (=> start!96468 (array_inv!26368 _keys!1070)))

(declare-fun e!626117 () Bool)

(declare-fun array_inv!26369 (array!71107) Bool)

(assert (=> start!96468 (and (array_inv!26369 _values!874) e!626117)))

(declare-fun mapIsEmpty!42406 () Bool)

(declare-fun mapRes!42406 () Bool)

(assert (=> mapIsEmpty!42406 mapRes!42406))

(declare-fun b!1096980 () Bool)

(declare-fun res!732157 () Bool)

(assert (=> b!1096980 (=> (not res!732157) (not e!626116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71105 (_ BitVec 32)) Bool)

(assert (=> b!1096980 (= res!732157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096981 () Bool)

(declare-fun res!732154 () Bool)

(assert (=> b!1096981 (=> (not res!732154) (not e!626116))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096981 (= res!732154 (validKeyInArray!0 k!904))))

(declare-fun b!1096982 () Bool)

(declare-fun e!626114 () Bool)

(assert (=> b!1096982 (= e!626114 tp_is_empty!27097)))

(declare-fun b!1096983 () Bool)

(declare-fun res!732160 () Bool)

(assert (=> b!1096983 (=> (not res!732160) (not e!626116))))

(assert (=> b!1096983 (= res!732160 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23896))))

(declare-fun b!1096984 () Bool)

(assert (=> b!1096984 (= e!626116 e!626119)))

(declare-fun res!732155 () Bool)

(assert (=> b!1096984 (=> (not res!732155) (not e!626119))))

(assert (=> b!1096984 (= res!732155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490323 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096984 (= lt!490323 (array!71106 (store (arr!34224 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34760 _keys!1070)))))

(declare-fun b!1096985 () Bool)

(declare-fun res!732159 () Bool)

(assert (=> b!1096985 (=> (not res!732159) (not e!626116))))

(assert (=> b!1096985 (= res!732159 (= (select (arr!34224 _keys!1070) i!650) k!904))))

(declare-fun b!1096986 () Bool)

(declare-datatypes ((tuple2!17276 0))(
  ( (tuple2!17277 (_1!8649 (_ BitVec 64)) (_2!8649 V!41257)) )
))
(declare-datatypes ((List!23900 0))(
  ( (Nil!23897) (Cons!23896 (h!25105 tuple2!17276) (t!33993 List!23900)) )
))
(declare-datatypes ((ListLongMap!15245 0))(
  ( (ListLongMap!15246 (toList!7638 List!23900)) )
))
(declare-fun lt!490324 () ListLongMap!15245)

(declare-fun lt!490322 () ListLongMap!15245)

(assert (=> b!1096986 (= e!626119 (not (= lt!490324 lt!490322)))))

(assert (=> b!1096986 (= lt!490322 lt!490324)))

(declare-fun lt!490327 () ListLongMap!15245)

(declare-fun -!928 (ListLongMap!15245 (_ BitVec 64)) ListLongMap!15245)

(assert (=> b!1096986 (= lt!490324 (-!928 lt!490327 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41257)

(declare-datatypes ((Unit!36088 0))(
  ( (Unit!36089) )
))
(declare-fun lt!490325 () Unit!36088)

(declare-fun zeroValue!831 () V!41257)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!184 (array!71105 array!71107 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36088)

(assert (=> b!1096986 (= lt!490325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!184 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4154 (array!71105 array!71107 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) Int) ListLongMap!15245)

(declare-fun dynLambda!2289 (Int (_ BitVec 64)) V!41257)

(assert (=> b!1096986 (= lt!490322 (getCurrentListMapNoExtraKeys!4154 lt!490323 (array!71108 (store (arr!34225 _values!874) i!650 (ValueCellFull!12839 (dynLambda!2289 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34761 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1096986 (= lt!490327 (getCurrentListMapNoExtraKeys!4154 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096986 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490326 () Unit!36088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71105 (_ BitVec 64) (_ BitVec 32)) Unit!36088)

(assert (=> b!1096986 (= lt!490326 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096987 () Bool)

(declare-fun e!626118 () Bool)

(assert (=> b!1096987 (= e!626117 (and e!626118 mapRes!42406))))

(declare-fun condMapEmpty!42406 () Bool)

(declare-fun mapDefault!42406 () ValueCell!12839)

