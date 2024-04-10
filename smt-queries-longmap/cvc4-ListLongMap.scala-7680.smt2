; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96430 () Bool)

(assert start!96430)

(declare-fun b_free!23009 () Bool)

(declare-fun b_next!23009 () Bool)

(assert (=> start!96430 (= b_free!23009 (not b_next!23009))))

(declare-fun tp!80953 () Bool)

(declare-fun b_and!36681 () Bool)

(assert (=> start!96430 (= tp!80953 b_and!36681)))

(declare-fun b!1096256 () Bool)

(declare-fun res!731647 () Bool)

(declare-fun e!625776 () Bool)

(assert (=> b!1096256 (=> (not res!731647) (not e!625776))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71031 0))(
  ( (array!71032 (arr!34187 (Array (_ BitVec 32) (_ BitVec 64))) (size!34723 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71031)

(assert (=> b!1096256 (= res!731647 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34723 _keys!1070))))))

(declare-fun b!1096257 () Bool)

(declare-fun res!731644 () Bool)

(declare-fun e!625773 () Bool)

(assert (=> b!1096257 (=> (not res!731644) (not e!625773))))

(declare-fun lt!490091 () array!71031)

(declare-datatypes ((List!23874 0))(
  ( (Nil!23871) (Cons!23870 (h!25079 (_ BitVec 64)) (t!33929 List!23874)) )
))
(declare-fun arrayNoDuplicates!0 (array!71031 (_ BitVec 32) List!23874) Bool)

(assert (=> b!1096257 (= res!731644 (arrayNoDuplicates!0 lt!490091 #b00000000000000000000000000000000 Nil!23871))))

(declare-fun b!1096258 () Bool)

(declare-fun e!625777 () Bool)

(declare-fun tp_is_empty!27059 () Bool)

(assert (=> b!1096258 (= e!625777 tp_is_empty!27059)))

(declare-fun b!1096259 () Bool)

(declare-fun res!731639 () Bool)

(assert (=> b!1096259 (=> (not res!731639) (not e!625776))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41205 0))(
  ( (V!41206 (val!13586 Int)) )
))
(declare-datatypes ((ValueCell!12820 0))(
  ( (ValueCellFull!12820 (v!16207 V!41205)) (EmptyCell!12820) )
))
(declare-datatypes ((array!71033 0))(
  ( (array!71034 (arr!34188 (Array (_ BitVec 32) ValueCell!12820)) (size!34724 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71033)

(assert (=> b!1096259 (= res!731639 (and (= (size!34724 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34723 _keys!1070) (size!34724 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!731642 () Bool)

(assert (=> start!96430 (=> (not res!731642) (not e!625776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96430 (= res!731642 (validMask!0 mask!1414))))

(assert (=> start!96430 e!625776))

(assert (=> start!96430 tp!80953))

(assert (=> start!96430 true))

(assert (=> start!96430 tp_is_empty!27059))

(declare-fun array_inv!26342 (array!71031) Bool)

(assert (=> start!96430 (array_inv!26342 _keys!1070)))

(declare-fun e!625772 () Bool)

(declare-fun array_inv!26343 (array!71033) Bool)

(assert (=> start!96430 (and (array_inv!26343 _values!874) e!625772)))

(declare-fun b!1096260 () Bool)

(declare-fun res!731646 () Bool)

(assert (=> b!1096260 (=> (not res!731646) (not e!625776))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1096260 (= res!731646 (= (select (arr!34187 _keys!1070) i!650) k!904))))

(declare-fun b!1096261 () Bool)

(declare-fun res!731640 () Bool)

(assert (=> b!1096261 (=> (not res!731640) (not e!625776))))

(assert (=> b!1096261 (= res!731640 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23871))))

(declare-fun b!1096262 () Bool)

(declare-fun e!625774 () Bool)

(assert (=> b!1096262 (= e!625774 tp_is_empty!27059)))

(declare-fun b!1096263 () Bool)

(declare-fun res!731643 () Bool)

(assert (=> b!1096263 (=> (not res!731643) (not e!625776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096263 (= res!731643 (validKeyInArray!0 k!904))))

(declare-fun b!1096264 () Bool)

(assert (=> b!1096264 (= e!625776 e!625773)))

(declare-fun res!731641 () Bool)

(assert (=> b!1096264 (=> (not res!731641) (not e!625773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71031 (_ BitVec 32)) Bool)

(assert (=> b!1096264 (= res!731641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490091 mask!1414))))

(assert (=> b!1096264 (= lt!490091 (array!71032 (store (arr!34187 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34723 _keys!1070)))))

(declare-fun mapIsEmpty!42349 () Bool)

(declare-fun mapRes!42349 () Bool)

(assert (=> mapIsEmpty!42349 mapRes!42349))

(declare-fun b!1096265 () Bool)

(assert (=> b!1096265 (= e!625773 (not true))))

(declare-fun minValue!831 () V!41205)

(declare-datatypes ((tuple2!17254 0))(
  ( (tuple2!17255 (_1!8638 (_ BitVec 64)) (_2!8638 V!41205)) )
))
(declare-datatypes ((List!23875 0))(
  ( (Nil!23872) (Cons!23871 (h!25080 tuple2!17254) (t!33930 List!23875)) )
))
(declare-datatypes ((ListLongMap!15223 0))(
  ( (ListLongMap!15224 (toList!7627 List!23875)) )
))
(declare-fun lt!490092 () ListLongMap!15223)

(declare-fun zeroValue!831 () V!41205)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4143 (array!71031 array!71033 (_ BitVec 32) (_ BitVec 32) V!41205 V!41205 (_ BitVec 32) Int) ListLongMap!15223)

(declare-fun dynLambda!2278 (Int (_ BitVec 64)) V!41205)

(assert (=> b!1096265 (= lt!490092 (getCurrentListMapNoExtraKeys!4143 lt!490091 (array!71034 (store (arr!34188 _values!874) i!650 (ValueCellFull!12820 (dynLambda!2278 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34724 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490093 () ListLongMap!15223)

(assert (=> b!1096265 (= lt!490093 (getCurrentListMapNoExtraKeys!4143 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096265 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36066 0))(
  ( (Unit!36067) )
))
(declare-fun lt!490090 () Unit!36066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71031 (_ BitVec 64) (_ BitVec 32)) Unit!36066)

(assert (=> b!1096265 (= lt!490090 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096266 () Bool)

(declare-fun res!731645 () Bool)

(assert (=> b!1096266 (=> (not res!731645) (not e!625776))))

(assert (=> b!1096266 (= res!731645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096267 () Bool)

(assert (=> b!1096267 (= e!625772 (and e!625774 mapRes!42349))))

(declare-fun condMapEmpty!42349 () Bool)

(declare-fun mapDefault!42349 () ValueCell!12820)

