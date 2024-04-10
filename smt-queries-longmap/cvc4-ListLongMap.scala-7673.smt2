; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96388 () Bool)

(assert start!96388)

(declare-fun b_free!22967 () Bool)

(declare-fun b_next!22967 () Bool)

(assert (=> start!96388 (= b_free!22967 (not b_next!22967))))

(declare-fun tp!80828 () Bool)

(declare-fun b_and!36597 () Bool)

(assert (=> start!96388 (= tp!80828 b_and!36597)))

(declare-fun b!1095458 () Bool)

(declare-fun e!625399 () Bool)

(declare-fun e!625397 () Bool)

(assert (=> b!1095458 (= e!625399 e!625397)))

(declare-fun res!731077 () Bool)

(assert (=> b!1095458 (=> (not res!731077) (not e!625397))))

(declare-datatypes ((array!70947 0))(
  ( (array!70948 (arr!34145 (Array (_ BitVec 32) (_ BitVec 64))) (size!34681 (_ BitVec 32))) )
))
(declare-fun lt!489839 () array!70947)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70947 (_ BitVec 32)) Bool)

(assert (=> b!1095458 (= res!731077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489839 mask!1414))))

(declare-fun _keys!1070 () array!70947)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095458 (= lt!489839 (array!70948 (store (arr!34145 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34681 _keys!1070)))))

(declare-fun b!1095459 () Bool)

(assert (=> b!1095459 (= e!625397 (not (bvsle #b00000000000000000000000000000000 (size!34681 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41149 0))(
  ( (V!41150 (val!13565 Int)) )
))
(declare-datatypes ((ValueCell!12799 0))(
  ( (ValueCellFull!12799 (v!16186 V!41149)) (EmptyCell!12799) )
))
(declare-datatypes ((array!70949 0))(
  ( (array!70950 (arr!34146 (Array (_ BitVec 32) ValueCell!12799)) (size!34682 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70949)

(declare-fun minValue!831 () V!41149)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41149)

(declare-datatypes ((tuple2!17224 0))(
  ( (tuple2!17225 (_1!8623 (_ BitVec 64)) (_2!8623 V!41149)) )
))
(declare-datatypes ((List!23843 0))(
  ( (Nil!23840) (Cons!23839 (h!25048 tuple2!17224) (t!33856 List!23843)) )
))
(declare-datatypes ((ListLongMap!15193 0))(
  ( (ListLongMap!15194 (toList!7612 List!23843)) )
))
(declare-fun lt!489841 () ListLongMap!15193)

(declare-fun getCurrentListMapNoExtraKeys!4128 (array!70947 array!70949 (_ BitVec 32) (_ BitVec 32) V!41149 V!41149 (_ BitVec 32) Int) ListLongMap!15193)

(declare-fun dynLambda!2263 (Int (_ BitVec 64)) V!41149)

(assert (=> b!1095459 (= lt!489841 (getCurrentListMapNoExtraKeys!4128 lt!489839 (array!70950 (store (arr!34146 _values!874) i!650 (ValueCellFull!12799 (dynLambda!2263 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34682 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489840 () ListLongMap!15193)

(assert (=> b!1095459 (= lt!489840 (getCurrentListMapNoExtraKeys!4128 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095459 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36036 0))(
  ( (Unit!36037) )
))
(declare-fun lt!489838 () Unit!36036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70947 (_ BitVec 64) (_ BitVec 32)) Unit!36036)

(assert (=> b!1095459 (= lt!489838 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1095460 () Bool)

(declare-fun res!731076 () Bool)

(assert (=> b!1095460 (=> (not res!731076) (not e!625399))))

(assert (=> b!1095460 (= res!731076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095461 () Bool)

(declare-fun res!731074 () Bool)

(assert (=> b!1095461 (=> (not res!731074) (not e!625399))))

(assert (=> b!1095461 (= res!731074 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34681 _keys!1070))))))

(declare-fun res!731079 () Bool)

(assert (=> start!96388 (=> (not res!731079) (not e!625399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96388 (= res!731079 (validMask!0 mask!1414))))

(assert (=> start!96388 e!625399))

(assert (=> start!96388 tp!80828))

(assert (=> start!96388 true))

(declare-fun tp_is_empty!27017 () Bool)

(assert (=> start!96388 tp_is_empty!27017))

(declare-fun array_inv!26312 (array!70947) Bool)

(assert (=> start!96388 (array_inv!26312 _keys!1070)))

(declare-fun e!625395 () Bool)

(declare-fun array_inv!26313 (array!70949) Bool)

(assert (=> start!96388 (and (array_inv!26313 _values!874) e!625395)))

(declare-fun mapNonEmpty!42286 () Bool)

(declare-fun mapRes!42286 () Bool)

(declare-fun tp!80827 () Bool)

(declare-fun e!625398 () Bool)

(assert (=> mapNonEmpty!42286 (= mapRes!42286 (and tp!80827 e!625398))))

(declare-fun mapRest!42286 () (Array (_ BitVec 32) ValueCell!12799))

(declare-fun mapValue!42286 () ValueCell!12799)

(declare-fun mapKey!42286 () (_ BitVec 32))

(assert (=> mapNonEmpty!42286 (= (arr!34146 _values!874) (store mapRest!42286 mapKey!42286 mapValue!42286))))

(declare-fun b!1095462 () Bool)

(assert (=> b!1095462 (= e!625398 tp_is_empty!27017)))

(declare-fun b!1095463 () Bool)

(declare-fun res!731073 () Bool)

(assert (=> b!1095463 (=> (not res!731073) (not e!625399))))

(assert (=> b!1095463 (= res!731073 (and (= (size!34682 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34681 _keys!1070) (size!34682 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42286 () Bool)

(assert (=> mapIsEmpty!42286 mapRes!42286))

(declare-fun b!1095464 () Bool)

(declare-fun e!625394 () Bool)

(assert (=> b!1095464 (= e!625394 tp_is_empty!27017)))

(declare-fun b!1095465 () Bool)

(declare-fun res!731075 () Bool)

(assert (=> b!1095465 (=> (not res!731075) (not e!625397))))

(declare-datatypes ((List!23844 0))(
  ( (Nil!23841) (Cons!23840 (h!25049 (_ BitVec 64)) (t!33857 List!23844)) )
))
(declare-fun arrayNoDuplicates!0 (array!70947 (_ BitVec 32) List!23844) Bool)

(assert (=> b!1095465 (= res!731075 (arrayNoDuplicates!0 lt!489839 #b00000000000000000000000000000000 Nil!23841))))

(declare-fun b!1095466 () Bool)

(declare-fun res!731080 () Bool)

(assert (=> b!1095466 (=> (not res!731080) (not e!625399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095466 (= res!731080 (validKeyInArray!0 k!904))))

(declare-fun b!1095467 () Bool)

(declare-fun res!731078 () Bool)

(assert (=> b!1095467 (=> (not res!731078) (not e!625399))))

(assert (=> b!1095467 (= res!731078 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23841))))

(declare-fun b!1095468 () Bool)

(declare-fun res!731072 () Bool)

(assert (=> b!1095468 (=> (not res!731072) (not e!625399))))

(assert (=> b!1095468 (= res!731072 (= (select (arr!34145 _keys!1070) i!650) k!904))))

(declare-fun b!1095469 () Bool)

(assert (=> b!1095469 (= e!625395 (and e!625394 mapRes!42286))))

(declare-fun condMapEmpty!42286 () Bool)

(declare-fun mapDefault!42286 () ValueCell!12799)

