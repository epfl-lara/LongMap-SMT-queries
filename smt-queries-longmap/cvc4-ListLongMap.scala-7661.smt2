; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96290 () Bool)

(assert start!96290)

(declare-fun b_free!22943 () Bool)

(declare-fun b_next!22943 () Bool)

(assert (=> start!96290 (= b_free!22943 (not b_next!22943))))

(declare-fun tp!80678 () Bool)

(declare-fun b_and!36561 () Bool)

(assert (=> start!96290 (= tp!80678 b_and!36561)))

(declare-fun b!1094191 () Bool)

(declare-fun e!624703 () Bool)

(assert (=> b!1094191 (= e!624703 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41053 0))(
  ( (V!41054 (val!13529 Int)) )
))
(declare-fun minValue!831 () V!41053)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17210 0))(
  ( (tuple2!17211 (_1!8616 (_ BitVec 64)) (_2!8616 V!41053)) )
))
(declare-datatypes ((List!23808 0))(
  ( (Nil!23805) (Cons!23804 (h!25013 tuple2!17210) (t!33809 List!23808)) )
))
(declare-datatypes ((ListLongMap!15179 0))(
  ( (ListLongMap!15180 (toList!7605 List!23808)) )
))
(declare-fun lt!489531 () ListLongMap!15179)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41053)

(declare-datatypes ((array!70805 0))(
  ( (array!70806 (arr!34076 (Array (_ BitVec 32) (_ BitVec 64))) (size!34612 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70805)

(declare-datatypes ((ValueCell!12763 0))(
  ( (ValueCellFull!12763 (v!16150 V!41053)) (EmptyCell!12763) )
))
(declare-datatypes ((array!70807 0))(
  ( (array!70808 (arr!34077 (Array (_ BitVec 32) ValueCell!12763)) (size!34613 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70807)

(declare-fun getCurrentListMap!4361 (array!70805 array!70807 (_ BitVec 32) (_ BitVec 32) V!41053 V!41053 (_ BitVec 32) Int) ListLongMap!15179)

(assert (=> b!1094191 (= lt!489531 (getCurrentListMap!4361 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489537 () array!70805)

(declare-fun lt!489532 () ListLongMap!15179)

(declare-fun lt!489535 () array!70807)

(assert (=> b!1094191 (= lt!489532 (getCurrentListMap!4361 lt!489537 lt!489535 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489533 () ListLongMap!15179)

(declare-fun lt!489534 () ListLongMap!15179)

(assert (=> b!1094191 (and (= lt!489533 lt!489534) (= lt!489534 lt!489533))))

(declare-fun lt!489530 () ListLongMap!15179)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!924 (ListLongMap!15179 (_ BitVec 64)) ListLongMap!15179)

(assert (=> b!1094191 (= lt!489534 (-!924 lt!489530 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36014 0))(
  ( (Unit!36015) )
))
(declare-fun lt!489538 () Unit!36014)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!180 (array!70805 array!70807 (_ BitVec 32) (_ BitVec 32) V!41053 V!41053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36014)

(assert (=> b!1094191 (= lt!489538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!180 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4121 (array!70805 array!70807 (_ BitVec 32) (_ BitVec 32) V!41053 V!41053 (_ BitVec 32) Int) ListLongMap!15179)

(assert (=> b!1094191 (= lt!489533 (getCurrentListMapNoExtraKeys!4121 lt!489537 lt!489535 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2258 (Int (_ BitVec 64)) V!41053)

(assert (=> b!1094191 (= lt!489535 (array!70808 (store (arr!34077 _values!874) i!650 (ValueCellFull!12763 (dynLambda!2258 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34613 _values!874)))))

(assert (=> b!1094191 (= lt!489530 (getCurrentListMapNoExtraKeys!4121 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094191 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489536 () Unit!36014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70805 (_ BitVec 64) (_ BitVec 32)) Unit!36014)

(assert (=> b!1094191 (= lt!489536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1094192 () Bool)

(declare-fun e!624702 () Bool)

(declare-fun e!624704 () Bool)

(declare-fun mapRes!42172 () Bool)

(assert (=> b!1094192 (= e!624702 (and e!624704 mapRes!42172))))

(declare-fun condMapEmpty!42172 () Bool)

(declare-fun mapDefault!42172 () ValueCell!12763)

