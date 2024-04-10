; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95800 () Bool)

(assert start!95800)

(declare-fun b_free!22453 () Bool)

(declare-fun b_next!22453 () Bool)

(assert (=> start!95800 (= b_free!22453 (not b_next!22453))))

(declare-fun tp!79208 () Bool)

(declare-fun b_and!35581 () Bool)

(assert (=> start!95800 (= tp!79208 b_and!35581)))

(declare-fun res!722513 () Bool)

(declare-fun e!619258 () Bool)

(assert (=> start!95800 (=> (not res!722513) (not e!619258))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95800 (= res!722513 (validMask!0 mask!1414))))

(assert (=> start!95800 e!619258))

(assert (=> start!95800 tp!79208))

(assert (=> start!95800 true))

(declare-fun tp_is_empty!26455 () Bool)

(assert (=> start!95800 tp_is_empty!26455))

(declare-datatypes ((array!69853 0))(
  ( (array!69854 (arr!33600 (Array (_ BitVec 32) (_ BitVec 64))) (size!34136 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69853)

(declare-fun array_inv!25934 (array!69853) Bool)

(assert (=> start!95800 (array_inv!25934 _keys!1070)))

(declare-datatypes ((V!40401 0))(
  ( (V!40402 (val!13284 Int)) )
))
(declare-datatypes ((ValueCell!12518 0))(
  ( (ValueCellFull!12518 (v!15905 V!40401)) (EmptyCell!12518) )
))
(declare-datatypes ((array!69855 0))(
  ( (array!69856 (arr!33601 (Array (_ BitVec 32) ValueCell!12518)) (size!34137 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69855)

(declare-fun e!619256 () Bool)

(declare-fun array_inv!25935 (array!69855) Bool)

(assert (=> start!95800 (and (array_inv!25935 _values!874) e!619256)))

(declare-fun b!1083819 () Bool)

(declare-fun res!722514 () Bool)

(assert (=> b!1083819 (=> (not res!722514) (not e!619258))))

(declare-datatypes ((List!23425 0))(
  ( (Nil!23422) (Cons!23421 (h!24630 (_ BitVec 64)) (t!32936 List!23425)) )
))
(declare-fun arrayNoDuplicates!0 (array!69853 (_ BitVec 32) List!23425) Bool)

(assert (=> b!1083819 (= res!722514 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23422))))

(declare-fun mapNonEmpty!41437 () Bool)

(declare-fun mapRes!41437 () Bool)

(declare-fun tp!79207 () Bool)

(declare-fun e!619257 () Bool)

(assert (=> mapNonEmpty!41437 (= mapRes!41437 (and tp!79207 e!619257))))

(declare-fun mapRest!41437 () (Array (_ BitVec 32) ValueCell!12518))

(declare-fun mapKey!41437 () (_ BitVec 32))

(declare-fun mapValue!41437 () ValueCell!12518)

(assert (=> mapNonEmpty!41437 (= (arr!33601 _values!874) (store mapRest!41437 mapKey!41437 mapValue!41437))))

(declare-fun b!1083820 () Bool)

(declare-fun res!722512 () Bool)

(assert (=> b!1083820 (=> (not res!722512) (not e!619258))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083820 (= res!722512 (= (select (arr!33600 _keys!1070) i!650) k!904))))

(declare-fun b!1083821 () Bool)

(declare-fun res!722520 () Bool)

(assert (=> b!1083821 (=> (not res!722520) (not e!619258))))

(assert (=> b!1083821 (= res!722520 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34136 _keys!1070))))))

(declare-fun mapIsEmpty!41437 () Bool)

(assert (=> mapIsEmpty!41437 mapRes!41437))

(declare-fun b!1083822 () Bool)

(declare-fun res!722518 () Bool)

(assert (=> b!1083822 (=> (not res!722518) (not e!619258))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083822 (= res!722518 (and (= (size!34137 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34136 _keys!1070) (size!34137 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083823 () Bool)

(declare-fun e!619254 () Bool)

(assert (=> b!1083823 (= e!619258 e!619254)))

(declare-fun res!722516 () Bool)

(assert (=> b!1083823 (=> (not res!722516) (not e!619254))))

(declare-fun lt!480295 () array!69853)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69853 (_ BitVec 32)) Bool)

(assert (=> b!1083823 (= res!722516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480295 mask!1414))))

(assert (=> b!1083823 (= lt!480295 (array!69854 (store (arr!33600 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34136 _keys!1070)))))

(declare-fun b!1083824 () Bool)

(assert (=> b!1083824 (= e!619254 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40401)

(declare-fun lt!480294 () array!69855)

(declare-fun zeroValue!831 () V!40401)

(declare-datatypes ((tuple2!16838 0))(
  ( (tuple2!16839 (_1!8430 (_ BitVec 64)) (_2!8430 V!40401)) )
))
(declare-datatypes ((List!23426 0))(
  ( (Nil!23423) (Cons!23422 (h!24631 tuple2!16838) (t!32937 List!23426)) )
))
(declare-datatypes ((ListLongMap!14807 0))(
  ( (ListLongMap!14808 (toList!7419 List!23426)) )
))
(declare-fun lt!480299 () ListLongMap!14807)

(declare-fun getCurrentListMap!4207 (array!69853 array!69855 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14807)

(assert (=> b!1083824 (= lt!480299 (getCurrentListMap!4207 lt!480295 lt!480294 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480300 () ListLongMap!14807)

(declare-fun lt!480301 () ListLongMap!14807)

(assert (=> b!1083824 (and (= lt!480300 lt!480301) (= lt!480301 lt!480300))))

(declare-fun lt!480297 () ListLongMap!14807)

(declare-fun -!746 (ListLongMap!14807 (_ BitVec 64)) ListLongMap!14807)

(assert (=> b!1083824 (= lt!480301 (-!746 lt!480297 k!904))))

(declare-datatypes ((Unit!35658 0))(
  ( (Unit!35659) )
))
(declare-fun lt!480296 () Unit!35658)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!26 (array!69853 array!69855 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35658)

(assert (=> b!1083824 (= lt!480296 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!26 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3967 (array!69853 array!69855 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14807)

(assert (=> b!1083824 (= lt!480300 (getCurrentListMapNoExtraKeys!3967 lt!480295 lt!480294 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2104 (Int (_ BitVec 64)) V!40401)

(assert (=> b!1083824 (= lt!480294 (array!69856 (store (arr!33601 _values!874) i!650 (ValueCellFull!12518 (dynLambda!2104 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34137 _values!874)))))

(assert (=> b!1083824 (= lt!480297 (getCurrentListMapNoExtraKeys!3967 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083824 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480298 () Unit!35658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69853 (_ BitVec 64) (_ BitVec 32)) Unit!35658)

(assert (=> b!1083824 (= lt!480298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083825 () Bool)

(declare-fun res!722515 () Bool)

(assert (=> b!1083825 (=> (not res!722515) (not e!619258))))

(assert (=> b!1083825 (= res!722515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083826 () Bool)

(assert (=> b!1083826 (= e!619257 tp_is_empty!26455)))

(declare-fun b!1083827 () Bool)

(declare-fun e!619259 () Bool)

(assert (=> b!1083827 (= e!619259 tp_is_empty!26455)))

(declare-fun b!1083828 () Bool)

(declare-fun res!722517 () Bool)

(assert (=> b!1083828 (=> (not res!722517) (not e!619258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083828 (= res!722517 (validKeyInArray!0 k!904))))

(declare-fun b!1083829 () Bool)

(assert (=> b!1083829 (= e!619256 (and e!619259 mapRes!41437))))

(declare-fun condMapEmpty!41437 () Bool)

(declare-fun mapDefault!41437 () ValueCell!12518)

