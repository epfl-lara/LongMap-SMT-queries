; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96178 () Bool)

(assert start!96178)

(declare-fun b_free!22831 () Bool)

(declare-fun b_next!22831 () Bool)

(assert (=> start!96178 (= b_free!22831 (not b_next!22831))))

(declare-fun tp!80341 () Bool)

(declare-fun b_and!36337 () Bool)

(assert (=> start!96178 (= tp!80341 b_and!36337)))

(declare-fun res!728646 () Bool)

(declare-fun e!623664 () Bool)

(assert (=> start!96178 (=> (not res!728646) (not e!623664))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96178 (= res!728646 (validMask!0 mask!1414))))

(assert (=> start!96178 e!623664))

(assert (=> start!96178 tp!80341))

(assert (=> start!96178 true))

(declare-fun tp_is_empty!26833 () Bool)

(assert (=> start!96178 tp_is_empty!26833))

(declare-datatypes ((array!70585 0))(
  ( (array!70586 (arr!33966 (Array (_ BitVec 32) (_ BitVec 64))) (size!34502 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70585)

(declare-fun array_inv!26186 (array!70585) Bool)

(assert (=> start!96178 (array_inv!26186 _keys!1070)))

(declare-datatypes ((V!40905 0))(
  ( (V!40906 (val!13473 Int)) )
))
(declare-datatypes ((ValueCell!12707 0))(
  ( (ValueCellFull!12707 (v!16094 V!40905)) (EmptyCell!12707) )
))
(declare-datatypes ((array!70587 0))(
  ( (array!70588 (arr!33967 (Array (_ BitVec 32) ValueCell!12707)) (size!34503 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70587)

(declare-fun e!623659 () Bool)

(declare-fun array_inv!26187 (array!70587) Bool)

(assert (=> start!96178 (and (array_inv!26187 _values!874) e!623659)))

(declare-fun b!1092031 () Bool)

(declare-fun res!728652 () Bool)

(assert (=> b!1092031 (=> (not res!728652) (not e!623664))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092031 (= res!728652 (and (= (size!34503 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34502 _keys!1070) (size!34503 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092032 () Bool)

(declare-fun e!623663 () Bool)

(declare-fun e!623662 () Bool)

(assert (=> b!1092032 (= e!623663 e!623662)))

(declare-fun res!728648 () Bool)

(assert (=> b!1092032 (=> res!728648 e!623662)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1092032 (= res!728648 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17142 0))(
  ( (tuple2!17143 (_1!8582 (_ BitVec 64)) (_2!8582 V!40905)) )
))
(declare-datatypes ((List!23726 0))(
  ( (Nil!23723) (Cons!23722 (h!24931 tuple2!17142) (t!33615 List!23726)) )
))
(declare-datatypes ((ListLongMap!15111 0))(
  ( (ListLongMap!15112 (toList!7571 List!23726)) )
))
(declare-fun lt!487953 () ListLongMap!15111)

(declare-fun lt!487950 () ListLongMap!15111)

(assert (=> b!1092032 (= lt!487953 lt!487950)))

(declare-fun lt!487951 () ListLongMap!15111)

(declare-fun lt!487946 () tuple2!17142)

(declare-fun +!3352 (ListLongMap!15111 tuple2!17142) ListLongMap!15111)

(assert (=> b!1092032 (= lt!487950 (+!3352 lt!487951 lt!487946))))

(declare-fun lt!487945 () ListLongMap!15111)

(declare-fun lt!487952 () ListLongMap!15111)

(assert (=> b!1092032 (= lt!487945 lt!487952)))

(declare-fun lt!487947 () ListLongMap!15111)

(assert (=> b!1092032 (= lt!487952 (+!3352 lt!487947 lt!487946))))

(declare-fun lt!487957 () ListLongMap!15111)

(assert (=> b!1092032 (= lt!487945 (+!3352 lt!487957 lt!487946))))

(declare-fun minValue!831 () V!40905)

(assert (=> b!1092032 (= lt!487946 (tuple2!17143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapIsEmpty!42004 () Bool)

(declare-fun mapRes!42004 () Bool)

(assert (=> mapIsEmpty!42004 mapRes!42004))

(declare-fun b!1092033 () Bool)

(declare-fun e!623666 () Bool)

(assert (=> b!1092033 (= e!623666 tp_is_empty!26833)))

(declare-fun b!1092034 () Bool)

(declare-fun res!728649 () Bool)

(declare-fun e!623660 () Bool)

(assert (=> b!1092034 (=> (not res!728649) (not e!623660))))

(declare-fun lt!487956 () array!70585)

(declare-datatypes ((List!23727 0))(
  ( (Nil!23724) (Cons!23723 (h!24932 (_ BitVec 64)) (t!33616 List!23727)) )
))
(declare-fun arrayNoDuplicates!0 (array!70585 (_ BitVec 32) List!23727) Bool)

(assert (=> b!1092034 (= res!728649 (arrayNoDuplicates!0 lt!487956 #b00000000000000000000000000000000 Nil!23724))))

(declare-fun b!1092035 () Bool)

(assert (=> b!1092035 (= e!623659 (and e!623666 mapRes!42004))))

(declare-fun condMapEmpty!42004 () Bool)

(declare-fun mapDefault!42004 () ValueCell!12707)

