; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95792 () Bool)

(assert start!95792)

(declare-fun b_free!22445 () Bool)

(declare-fun b_next!22445 () Bool)

(assert (=> start!95792 (= b_free!22445 (not b_next!22445))))

(declare-fun tp!79184 () Bool)

(declare-fun b_and!35565 () Bool)

(assert (=> start!95792 (= tp!79184 b_and!35565)))

(declare-fun b!1083668 () Bool)

(declare-fun res!722410 () Bool)

(declare-fun e!619185 () Bool)

(assert (=> b!1083668 (=> (not res!722410) (not e!619185))))

(declare-datatypes ((array!69837 0))(
  ( (array!69838 (arr!33592 (Array (_ BitVec 32) (_ BitVec 64))) (size!34128 (_ BitVec 32))) )
))
(declare-fun lt!480205 () array!69837)

(declare-datatypes ((List!23417 0))(
  ( (Nil!23414) (Cons!23413 (h!24622 (_ BitVec 64)) (t!32920 List!23417)) )
))
(declare-fun arrayNoDuplicates!0 (array!69837 (_ BitVec 32) List!23417) Bool)

(assert (=> b!1083668 (= res!722410 (arrayNoDuplicates!0 lt!480205 #b00000000000000000000000000000000 Nil!23414))))

(declare-fun b!1083669 () Bool)

(declare-fun e!619187 () Bool)

(assert (=> b!1083669 (= e!619187 e!619185)))

(declare-fun res!722407 () Bool)

(assert (=> b!1083669 (=> (not res!722407) (not e!619185))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69837 (_ BitVec 32)) Bool)

(assert (=> b!1083669 (= res!722407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480205 mask!1414))))

(declare-fun _keys!1070 () array!69837)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083669 (= lt!480205 (array!69838 (store (arr!33592 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34128 _keys!1070)))))

(declare-fun b!1083670 () Bool)

(declare-fun e!619182 () Bool)

(declare-fun tp_is_empty!26447 () Bool)

(assert (=> b!1083670 (= e!619182 tp_is_empty!26447)))

(declare-fun b!1083671 () Bool)

(declare-fun res!722408 () Bool)

(assert (=> b!1083671 (=> (not res!722408) (not e!619187))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083671 (= res!722408 (validKeyInArray!0 k!904))))

(declare-fun b!1083672 () Bool)

(declare-fun res!722409 () Bool)

(assert (=> b!1083672 (=> (not res!722409) (not e!619187))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40389 0))(
  ( (V!40390 (val!13280 Int)) )
))
(declare-datatypes ((ValueCell!12514 0))(
  ( (ValueCellFull!12514 (v!15901 V!40389)) (EmptyCell!12514) )
))
(declare-datatypes ((array!69839 0))(
  ( (array!69840 (arr!33593 (Array (_ BitVec 32) ValueCell!12514)) (size!34129 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69839)

(assert (=> b!1083672 (= res!722409 (and (= (size!34129 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34128 _keys!1070) (size!34129 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083673 () Bool)

(declare-fun res!722405 () Bool)

(assert (=> b!1083673 (=> (not res!722405) (not e!619187))))

(assert (=> b!1083673 (= res!722405 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23414))))

(declare-fun b!1083674 () Bool)

(declare-fun e!619186 () Bool)

(assert (=> b!1083674 (= e!619186 tp_is_empty!26447)))

(declare-fun b!1083675 () Bool)

(declare-fun res!722412 () Bool)

(assert (=> b!1083675 (=> (not res!722412) (not e!619187))))

(assert (=> b!1083675 (= res!722412 (= (select (arr!33592 _keys!1070) i!650) k!904))))

(declare-fun res!722406 () Bool)

(assert (=> start!95792 (=> (not res!722406) (not e!619187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95792 (= res!722406 (validMask!0 mask!1414))))

(assert (=> start!95792 e!619187))

(assert (=> start!95792 tp!79184))

(assert (=> start!95792 true))

(assert (=> start!95792 tp_is_empty!26447))

(declare-fun array_inv!25928 (array!69837) Bool)

(assert (=> start!95792 (array_inv!25928 _keys!1070)))

(declare-fun e!619184 () Bool)

(declare-fun array_inv!25929 (array!69839) Bool)

(assert (=> start!95792 (and (array_inv!25929 _values!874) e!619184)))

(declare-fun b!1083667 () Bool)

(declare-fun res!722411 () Bool)

(assert (=> b!1083667 (=> (not res!722411) (not e!619187))))

(assert (=> b!1083667 (= res!722411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41425 () Bool)

(declare-fun mapRes!41425 () Bool)

(declare-fun tp!79183 () Bool)

(assert (=> mapNonEmpty!41425 (= mapRes!41425 (and tp!79183 e!619186))))

(declare-fun mapKey!41425 () (_ BitVec 32))

(declare-fun mapValue!41425 () ValueCell!12514)

(declare-fun mapRest!41425 () (Array (_ BitVec 32) ValueCell!12514))

(assert (=> mapNonEmpty!41425 (= (arr!33593 _values!874) (store mapRest!41425 mapKey!41425 mapValue!41425))))

(declare-fun b!1083676 () Bool)

(declare-fun res!722404 () Bool)

(assert (=> b!1083676 (=> (not res!722404) (not e!619187))))

(assert (=> b!1083676 (= res!722404 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34128 _keys!1070))))))

(declare-fun b!1083677 () Bool)

(assert (=> b!1083677 (= e!619185 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40389)

(declare-fun lt!480200 () array!69839)

(declare-datatypes ((tuple2!16830 0))(
  ( (tuple2!16831 (_1!8426 (_ BitVec 64)) (_2!8426 V!40389)) )
))
(declare-datatypes ((List!23418 0))(
  ( (Nil!23415) (Cons!23414 (h!24623 tuple2!16830) (t!32921 List!23418)) )
))
(declare-datatypes ((ListLongMap!14799 0))(
  ( (ListLongMap!14800 (toList!7415 List!23418)) )
))
(declare-fun lt!480198 () ListLongMap!14799)

(declare-fun zeroValue!831 () V!40389)

(declare-fun getCurrentListMap!4203 (array!69837 array!69839 (_ BitVec 32) (_ BitVec 32) V!40389 V!40389 (_ BitVec 32) Int) ListLongMap!14799)

(assert (=> b!1083677 (= lt!480198 (getCurrentListMap!4203 lt!480205 lt!480200 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480203 () ListLongMap!14799)

(declare-fun lt!480201 () ListLongMap!14799)

(assert (=> b!1083677 (and (= lt!480203 lt!480201) (= lt!480201 lt!480203))))

(declare-fun lt!480204 () ListLongMap!14799)

(declare-fun -!742 (ListLongMap!14799 (_ BitVec 64)) ListLongMap!14799)

(assert (=> b!1083677 (= lt!480201 (-!742 lt!480204 k!904))))

(declare-datatypes ((Unit!35650 0))(
  ( (Unit!35651) )
))
(declare-fun lt!480202 () Unit!35650)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!22 (array!69837 array!69839 (_ BitVec 32) (_ BitVec 32) V!40389 V!40389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35650)

(assert (=> b!1083677 (= lt!480202 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!22 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3963 (array!69837 array!69839 (_ BitVec 32) (_ BitVec 32) V!40389 V!40389 (_ BitVec 32) Int) ListLongMap!14799)

(assert (=> b!1083677 (= lt!480203 (getCurrentListMapNoExtraKeys!3963 lt!480205 lt!480200 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2100 (Int (_ BitVec 64)) V!40389)

(assert (=> b!1083677 (= lt!480200 (array!69840 (store (arr!33593 _values!874) i!650 (ValueCellFull!12514 (dynLambda!2100 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34129 _values!874)))))

(assert (=> b!1083677 (= lt!480204 (getCurrentListMapNoExtraKeys!3963 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083677 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480199 () Unit!35650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69837 (_ BitVec 64) (_ BitVec 32)) Unit!35650)

(assert (=> b!1083677 (= lt!480199 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41425 () Bool)

(assert (=> mapIsEmpty!41425 mapRes!41425))

(declare-fun b!1083678 () Bool)

(assert (=> b!1083678 (= e!619184 (and e!619182 mapRes!41425))))

(declare-fun condMapEmpty!41425 () Bool)

(declare-fun mapDefault!41425 () ValueCell!12514)

