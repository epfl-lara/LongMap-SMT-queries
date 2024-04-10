; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96484 () Bool)

(assert start!96484)

(declare-fun b_free!23063 () Bool)

(declare-fun b_next!23063 () Bool)

(assert (=> start!96484 (= b_free!23063 (not b_next!23063))))

(declare-fun tp!81116 () Bool)

(declare-fun b_and!36789 () Bool)

(assert (=> start!96484 (= tp!81116 b_and!36789)))

(declare-fun b!1097282 () Bool)

(declare-fun e!626263 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((V!41277 0))(
  ( (V!41278 (val!13613 Int)) )
))
(declare-datatypes ((ValueCell!12847 0))(
  ( (ValueCellFull!12847 (v!16234 V!41277)) (EmptyCell!12847) )
))
(declare-datatypes ((array!71137 0))(
  ( (array!71138 (arr!34240 (Array (_ BitVec 32) ValueCell!12847)) (size!34776 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71137)

(assert (=> b!1097282 (= e!626263 (not (bvslt i!650 (size!34776 _values!874))))))

(declare-datatypes ((tuple2!17288 0))(
  ( (tuple2!17289 (_1!8655 (_ BitVec 64)) (_2!8655 V!41277)) )
))
(declare-datatypes ((List!23911 0))(
  ( (Nil!23908) (Cons!23907 (h!25116 tuple2!17288) (t!34020 List!23911)) )
))
(declare-datatypes ((ListLongMap!15257 0))(
  ( (ListLongMap!15258 (toList!7644 List!23911)) )
))
(declare-fun lt!490468 () ListLongMap!15257)

(declare-fun lt!490470 () ListLongMap!15257)

(assert (=> b!1097282 (and (= lt!490468 lt!490470) (= lt!490470 lt!490468))))

(declare-fun lt!490467 () ListLongMap!15257)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!934 (ListLongMap!15257 (_ BitVec 64)) ListLongMap!15257)

(assert (=> b!1097282 (= lt!490470 (-!934 lt!490467 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!36100 0))(
  ( (Unit!36101) )
))
(declare-fun lt!490471 () Unit!36100)

(declare-fun minValue!831 () V!41277)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41277)

(declare-datatypes ((array!71139 0))(
  ( (array!71140 (arr!34241 (Array (_ BitVec 32) (_ BitVec 64))) (size!34777 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71139)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 (array!71139 array!71137 (_ BitVec 32) (_ BitVec 32) V!41277 V!41277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36100)

(assert (=> b!1097282 (= lt!490471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490466 () array!71139)

(declare-fun getCurrentListMapNoExtraKeys!4160 (array!71139 array!71137 (_ BitVec 32) (_ BitVec 32) V!41277 V!41277 (_ BitVec 32) Int) ListLongMap!15257)

(declare-fun dynLambda!2295 (Int (_ BitVec 64)) V!41277)

(assert (=> b!1097282 (= lt!490468 (getCurrentListMapNoExtraKeys!4160 lt!490466 (array!71138 (store (arr!34240 _values!874) i!650 (ValueCellFull!12847 (dynLambda!2295 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34776 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097282 (= lt!490467 (getCurrentListMapNoExtraKeys!4160 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097282 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490469 () Unit!36100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71139 (_ BitVec 64) (_ BitVec 32)) Unit!36100)

(assert (=> b!1097282 (= lt!490469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1097283 () Bool)

(declare-fun e!626261 () Bool)

(declare-fun e!626259 () Bool)

(declare-fun mapRes!42430 () Bool)

(assert (=> b!1097283 (= e!626261 (and e!626259 mapRes!42430))))

(declare-fun condMapEmpty!42430 () Bool)

(declare-fun mapDefault!42430 () ValueCell!12847)

