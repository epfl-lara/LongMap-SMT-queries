; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95876 () Bool)

(assert start!95876)

(declare-fun b_free!22529 () Bool)

(declare-fun b_next!22529 () Bool)

(assert (=> start!95876 (= b_free!22529 (not b_next!22529))))

(declare-fun tp!79436 () Bool)

(declare-fun b_and!35733 () Bool)

(assert (=> start!95876 (= tp!79436 b_and!35733)))

(declare-fun b!1085369 () Bool)

(declare-fun res!723650 () Bool)

(declare-fun e!620041 () Bool)

(assert (=> b!1085369 (=> (not res!723650) (not e!620041))))

(declare-datatypes ((array!69997 0))(
  ( (array!69998 (arr!33672 (Array (_ BitVec 32) (_ BitVec 64))) (size!34208 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69997)

(declare-datatypes ((List!23479 0))(
  ( (Nil!23476) (Cons!23475 (h!24684 (_ BitVec 64)) (t!33066 List!23479)) )
))
(declare-fun arrayNoDuplicates!0 (array!69997 (_ BitVec 32) List!23479) Bool)

(assert (=> b!1085369 (= res!723650 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23476))))

(declare-fun res!723647 () Bool)

(assert (=> start!95876 (=> (not res!723647) (not e!620041))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95876 (= res!723647 (validMask!0 mask!1414))))

(assert (=> start!95876 e!620041))

(assert (=> start!95876 tp!79436))

(assert (=> start!95876 true))

(declare-fun tp_is_empty!26531 () Bool)

(assert (=> start!95876 tp_is_empty!26531))

(declare-fun array_inv!25984 (array!69997) Bool)

(assert (=> start!95876 (array_inv!25984 _keys!1070)))

(declare-datatypes ((V!40501 0))(
  ( (V!40502 (val!13322 Int)) )
))
(declare-datatypes ((ValueCell!12556 0))(
  ( (ValueCellFull!12556 (v!15943 V!40501)) (EmptyCell!12556) )
))
(declare-datatypes ((array!69999 0))(
  ( (array!70000 (arr!33673 (Array (_ BitVec 32) ValueCell!12556)) (size!34209 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69999)

(declare-fun e!620037 () Bool)

(declare-fun array_inv!25985 (array!69999) Bool)

(assert (=> start!95876 (and (array_inv!25985 _values!874) e!620037)))

(declare-fun mapNonEmpty!41551 () Bool)

(declare-fun mapRes!41551 () Bool)

(declare-fun tp!79435 () Bool)

(declare-fun e!620042 () Bool)

(assert (=> mapNonEmpty!41551 (= mapRes!41551 (and tp!79435 e!620042))))

(declare-fun mapKey!41551 () (_ BitVec 32))

(declare-fun mapValue!41551 () ValueCell!12556)

(declare-fun mapRest!41551 () (Array (_ BitVec 32) ValueCell!12556))

(assert (=> mapNonEmpty!41551 (= (arr!33673 _values!874) (store mapRest!41551 mapKey!41551 mapValue!41551))))

(declare-fun b!1085370 () Bool)

(declare-fun e!620040 () Bool)

(assert (=> b!1085370 (= e!620041 e!620040)))

(declare-fun res!723653 () Bool)

(assert (=> b!1085370 (=> (not res!723653) (not e!620040))))

(declare-fun lt!481603 () array!69997)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69997 (_ BitVec 32)) Bool)

(assert (=> b!1085370 (= res!723653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481603 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085370 (= lt!481603 (array!69998 (store (arr!33672 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34208 _keys!1070)))))

(declare-fun b!1085371 () Bool)

(assert (=> b!1085371 (= e!620042 tp_is_empty!26531)))

(declare-fun b!1085372 () Bool)

(declare-fun res!723649 () Bool)

(assert (=> b!1085372 (=> (not res!723649) (not e!620041))))

(assert (=> b!1085372 (= res!723649 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34208 _keys!1070))))))

(declare-fun b!1085373 () Bool)

(declare-fun e!620038 () Bool)

(assert (=> b!1085373 (= e!620040 (not e!620038))))

(declare-fun res!723646 () Bool)

(assert (=> b!1085373 (=> res!723646 e!620038)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085373 (= res!723646 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16890 0))(
  ( (tuple2!16891 (_1!8456 (_ BitVec 64)) (_2!8456 V!40501)) )
))
(declare-datatypes ((List!23480 0))(
  ( (Nil!23477) (Cons!23476 (h!24685 tuple2!16890) (t!33067 List!23480)) )
))
(declare-datatypes ((ListLongMap!14859 0))(
  ( (ListLongMap!14860 (toList!7445 List!23480)) )
))
(declare-fun lt!481605 () ListLongMap!14859)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40501)

(declare-fun zeroValue!831 () V!40501)

(declare-fun getCurrentListMap!4230 (array!69997 array!69999 (_ BitVec 32) (_ BitVec 32) V!40501 V!40501 (_ BitVec 32) Int) ListLongMap!14859)

(assert (=> b!1085373 (= lt!481605 (getCurrentListMap!4230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481602 () array!69999)

(declare-fun lt!481607 () ListLongMap!14859)

(assert (=> b!1085373 (= lt!481607 (getCurrentListMap!4230 lt!481603 lt!481602 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481608 () ListLongMap!14859)

(declare-fun lt!481604 () ListLongMap!14859)

(assert (=> b!1085373 (and (= lt!481608 lt!481604) (= lt!481604 lt!481608))))

(declare-fun lt!481611 () ListLongMap!14859)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!771 (ListLongMap!14859 (_ BitVec 64)) ListLongMap!14859)

(assert (=> b!1085373 (= lt!481604 (-!771 lt!481611 k!904))))

(declare-datatypes ((Unit!35708 0))(
  ( (Unit!35709) )
))
(declare-fun lt!481614 () Unit!35708)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!49 (array!69997 array!69999 (_ BitVec 32) (_ BitVec 32) V!40501 V!40501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35708)

(assert (=> b!1085373 (= lt!481614 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!49 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3990 (array!69997 array!69999 (_ BitVec 32) (_ BitVec 32) V!40501 V!40501 (_ BitVec 32) Int) ListLongMap!14859)

(assert (=> b!1085373 (= lt!481608 (getCurrentListMapNoExtraKeys!3990 lt!481603 lt!481602 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2127 (Int (_ BitVec 64)) V!40501)

(assert (=> b!1085373 (= lt!481602 (array!70000 (store (arr!33673 _values!874) i!650 (ValueCellFull!12556 (dynLambda!2127 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34209 _values!874)))))

(assert (=> b!1085373 (= lt!481611 (getCurrentListMapNoExtraKeys!3990 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085373 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481606 () Unit!35708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69997 (_ BitVec 64) (_ BitVec 32)) Unit!35708)

(assert (=> b!1085373 (= lt!481606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1085374 () Bool)

(declare-fun res!723644 () Bool)

(assert (=> b!1085374 (=> (not res!723644) (not e!620041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085374 (= res!723644 (validKeyInArray!0 k!904))))

(declare-fun b!1085375 () Bool)

(declare-fun res!723648 () Bool)

(assert (=> b!1085375 (=> (not res!723648) (not e!620041))))

(assert (=> b!1085375 (= res!723648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085376 () Bool)

(declare-fun e!620035 () Bool)

(assert (=> b!1085376 (= e!620037 (and e!620035 mapRes!41551))))

(declare-fun condMapEmpty!41551 () Bool)

(declare-fun mapDefault!41551 () ValueCell!12556)

