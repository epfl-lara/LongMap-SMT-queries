; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95964 () Bool)

(assert start!95964)

(declare-fun b_free!22381 () Bool)

(declare-fun b_next!22381 () Bool)

(assert (=> start!95964 (= b_free!22381 (not b_next!22381))))

(declare-fun tp!78992 () Bool)

(declare-fun b_and!35447 () Bool)

(assert (=> start!95964 (= tp!78992 b_and!35447)))

(declare-fun res!722064 () Bool)

(declare-fun e!619462 () Bool)

(assert (=> start!95964 (=> (not res!722064) (not e!619462))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95964 (= res!722064 (validMask!0 mask!1414))))

(assert (=> start!95964 e!619462))

(assert (=> start!95964 tp!78992))

(assert (=> start!95964 true))

(declare-fun tp_is_empty!26383 () Bool)

(assert (=> start!95964 tp_is_empty!26383))

(declare-datatypes ((array!69749 0))(
  ( (array!69750 (arr!33542 (Array (_ BitVec 32) (_ BitVec 64))) (size!34079 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69749)

(declare-fun array_inv!25936 (array!69749) Bool)

(assert (=> start!95964 (array_inv!25936 _keys!1070)))

(declare-datatypes ((V!40305 0))(
  ( (V!40306 (val!13248 Int)) )
))
(declare-datatypes ((ValueCell!12482 0))(
  ( (ValueCellFull!12482 (v!15865 V!40305)) (EmptyCell!12482) )
))
(declare-datatypes ((array!69751 0))(
  ( (array!69752 (arr!33543 (Array (_ BitVec 32) ValueCell!12482)) (size!34080 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69751)

(declare-fun e!619464 () Bool)

(declare-fun array_inv!25937 (array!69751) Bool)

(assert (=> start!95964 (and (array_inv!25937 _values!874) e!619464)))

(declare-fun b!1083778 () Bool)

(declare-fun res!722068 () Bool)

(assert (=> b!1083778 (=> (not res!722068) (not e!619462))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083778 (= res!722068 (validKeyInArray!0 k0!904))))

(declare-fun b!1083779 () Bool)

(declare-fun res!722062 () Bool)

(assert (=> b!1083779 (=> (not res!722062) (not e!619462))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083779 (= res!722062 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34079 _keys!1070))))))

(declare-fun b!1083780 () Bool)

(declare-fun res!722066 () Bool)

(assert (=> b!1083780 (=> (not res!722066) (not e!619462))))

(assert (=> b!1083780 (= res!722066 (= (select (arr!33542 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41329 () Bool)

(declare-fun mapRes!41329 () Bool)

(assert (=> mapIsEmpty!41329 mapRes!41329))

(declare-fun b!1083781 () Bool)

(declare-fun res!722069 () Bool)

(assert (=> b!1083781 (=> (not res!722069) (not e!619462))))

(declare-datatypes ((List!23379 0))(
  ( (Nil!23376) (Cons!23375 (h!24593 (_ BitVec 64)) (t!32810 List!23379)) )
))
(declare-fun arrayNoDuplicates!0 (array!69749 (_ BitVec 32) List!23379) Bool)

(assert (=> b!1083781 (= res!722069 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23376))))

(declare-fun b!1083782 () Bool)

(declare-fun res!722067 () Bool)

(assert (=> b!1083782 (=> (not res!722067) (not e!619462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69749 (_ BitVec 32)) Bool)

(assert (=> b!1083782 (= res!722067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083783 () Bool)

(declare-fun e!619463 () Bool)

(assert (=> b!1083783 (= e!619464 (and e!619463 mapRes!41329))))

(declare-fun condMapEmpty!41329 () Bool)

(declare-fun mapDefault!41329 () ValueCell!12482)

(assert (=> b!1083783 (= condMapEmpty!41329 (= (arr!33543 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12482)) mapDefault!41329)))))

(declare-fun b!1083784 () Bool)

(declare-fun e!619466 () Bool)

(assert (=> b!1083784 (= e!619462 e!619466)))

(declare-fun res!722065 () Bool)

(assert (=> b!1083784 (=> (not res!722065) (not e!619466))))

(declare-fun lt!480138 () array!69749)

(assert (=> b!1083784 (= res!722065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480138 mask!1414))))

(assert (=> b!1083784 (= lt!480138 (array!69750 (store (arr!33542 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34079 _keys!1070)))))

(declare-fun b!1083785 () Bool)

(assert (=> b!1083785 (= e!619466 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40305)

(declare-datatypes ((tuple2!16788 0))(
  ( (tuple2!16789 (_1!8405 (_ BitVec 64)) (_2!8405 V!40305)) )
))
(declare-datatypes ((List!23380 0))(
  ( (Nil!23377) (Cons!23376 (h!24594 tuple2!16788) (t!32811 List!23380)) )
))
(declare-datatypes ((ListLongMap!14765 0))(
  ( (ListLongMap!14766 (toList!7398 List!23380)) )
))
(declare-fun lt!480137 () ListLongMap!14765)

(declare-fun zeroValue!831 () V!40305)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3975 (array!69749 array!69751 (_ BitVec 32) (_ BitVec 32) V!40305 V!40305 (_ BitVec 32) Int) ListLongMap!14765)

(declare-fun dynLambda!2096 (Int (_ BitVec 64)) V!40305)

(assert (=> b!1083785 (= lt!480137 (getCurrentListMapNoExtraKeys!3975 lt!480138 (array!69752 (store (arr!33543 _values!874) i!650 (ValueCellFull!12482 (dynLambda!2096 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34080 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480136 () ListLongMap!14765)

(assert (=> b!1083785 (= lt!480136 (getCurrentListMapNoExtraKeys!3975 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083785 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35587 0))(
  ( (Unit!35588) )
))
(declare-fun lt!480135 () Unit!35587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69749 (_ BitVec 64) (_ BitVec 32)) Unit!35587)

(assert (=> b!1083785 (= lt!480135 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083786 () Bool)

(declare-fun res!722063 () Bool)

(assert (=> b!1083786 (=> (not res!722063) (not e!619462))))

(assert (=> b!1083786 (= res!722063 (and (= (size!34080 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34079 _keys!1070) (size!34080 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083787 () Bool)

(declare-fun res!722070 () Bool)

(assert (=> b!1083787 (=> (not res!722070) (not e!619466))))

(assert (=> b!1083787 (= res!722070 (arrayNoDuplicates!0 lt!480138 #b00000000000000000000000000000000 Nil!23376))))

(declare-fun b!1083788 () Bool)

(assert (=> b!1083788 (= e!619463 tp_is_empty!26383)))

(declare-fun mapNonEmpty!41329 () Bool)

(declare-fun tp!78991 () Bool)

(declare-fun e!619465 () Bool)

(assert (=> mapNonEmpty!41329 (= mapRes!41329 (and tp!78991 e!619465))))

(declare-fun mapRest!41329 () (Array (_ BitVec 32) ValueCell!12482))

(declare-fun mapKey!41329 () (_ BitVec 32))

(declare-fun mapValue!41329 () ValueCell!12482)

(assert (=> mapNonEmpty!41329 (= (arr!33543 _values!874) (store mapRest!41329 mapKey!41329 mapValue!41329))))

(declare-fun b!1083789 () Bool)

(assert (=> b!1083789 (= e!619465 tp_is_empty!26383)))

(assert (= (and start!95964 res!722064) b!1083786))

(assert (= (and b!1083786 res!722063) b!1083782))

(assert (= (and b!1083782 res!722067) b!1083781))

(assert (= (and b!1083781 res!722069) b!1083779))

(assert (= (and b!1083779 res!722062) b!1083778))

(assert (= (and b!1083778 res!722068) b!1083780))

(assert (= (and b!1083780 res!722066) b!1083784))

(assert (= (and b!1083784 res!722065) b!1083787))

(assert (= (and b!1083787 res!722070) b!1083785))

(assert (= (and b!1083783 condMapEmpty!41329) mapIsEmpty!41329))

(assert (= (and b!1083783 (not condMapEmpty!41329)) mapNonEmpty!41329))

(get-info :version)

(assert (= (and mapNonEmpty!41329 ((_ is ValueCellFull!12482) mapValue!41329)) b!1083789))

(assert (= (and b!1083783 ((_ is ValueCellFull!12482) mapDefault!41329)) b!1083788))

(assert (= start!95964 b!1083783))

(declare-fun b_lambda!17061 () Bool)

(assert (=> (not b_lambda!17061) (not b!1083785)))

(declare-fun t!32809 () Bool)

(declare-fun tb!7251 () Bool)

(assert (=> (and start!95964 (= defaultEntry!882 defaultEntry!882) t!32809) tb!7251))

(declare-fun result!15029 () Bool)

(assert (=> tb!7251 (= result!15029 tp_is_empty!26383)))

(assert (=> b!1083785 t!32809))

(declare-fun b_and!35449 () Bool)

(assert (= b_and!35447 (and (=> t!32809 result!15029) b_and!35449)))

(declare-fun m!1001807 () Bool)

(assert (=> b!1083785 m!1001807))

(declare-fun m!1001809 () Bool)

(assert (=> b!1083785 m!1001809))

(declare-fun m!1001811 () Bool)

(assert (=> b!1083785 m!1001811))

(declare-fun m!1001813 () Bool)

(assert (=> b!1083785 m!1001813))

(declare-fun m!1001815 () Bool)

(assert (=> b!1083785 m!1001815))

(declare-fun m!1001817 () Bool)

(assert (=> b!1083785 m!1001817))

(declare-fun m!1001819 () Bool)

(assert (=> b!1083778 m!1001819))

(declare-fun m!1001821 () Bool)

(assert (=> b!1083782 m!1001821))

(declare-fun m!1001823 () Bool)

(assert (=> b!1083780 m!1001823))

(declare-fun m!1001825 () Bool)

(assert (=> b!1083784 m!1001825))

(declare-fun m!1001827 () Bool)

(assert (=> b!1083784 m!1001827))

(declare-fun m!1001829 () Bool)

(assert (=> b!1083781 m!1001829))

(declare-fun m!1001831 () Bool)

(assert (=> mapNonEmpty!41329 m!1001831))

(declare-fun m!1001833 () Bool)

(assert (=> start!95964 m!1001833))

(declare-fun m!1001835 () Bool)

(assert (=> start!95964 m!1001835))

(declare-fun m!1001837 () Bool)

(assert (=> start!95964 m!1001837))

(declare-fun m!1001839 () Bool)

(assert (=> b!1083787 m!1001839))

(check-sat b_and!35449 (not start!95964) (not b_lambda!17061) (not b_next!22381) (not b!1083782) (not b!1083787) (not b!1083778) tp_is_empty!26383 (not b!1083785) (not b!1083781) (not b!1083784) (not mapNonEmpty!41329))
(check-sat b_and!35449 (not b_next!22381))
