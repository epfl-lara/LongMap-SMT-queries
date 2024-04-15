; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95698 () Bool)

(assert start!95698)

(declare-fun b_free!22357 () Bool)

(declare-fun b_next!22357 () Bool)

(assert (=> start!95698 (= b_free!22357 (not b_next!22357))))

(declare-fun tp!78919 () Bool)

(declare-fun b_and!35363 () Bool)

(assert (=> start!95698 (= tp!78919 b_and!35363)))

(declare-fun mapIsEmpty!41293 () Bool)

(declare-fun mapRes!41293 () Bool)

(assert (=> mapIsEmpty!41293 mapRes!41293))

(declare-fun b!1081842 () Bool)

(declare-fun res!721153 () Bool)

(declare-fun e!618299 () Bool)

(assert (=> b!1081842 (=> (not res!721153) (not e!618299))))

(declare-datatypes ((array!69592 0))(
  ( (array!69593 (arr!33470 (Array (_ BitVec 32) (_ BitVec 64))) (size!34008 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69592)

(declare-datatypes ((List!23394 0))(
  ( (Nil!23391) (Cons!23390 (h!24599 (_ BitVec 64)) (t!32800 List!23394)) )
))
(declare-fun arrayNoDuplicates!0 (array!69592 (_ BitVec 32) List!23394) Bool)

(assert (=> b!1081842 (= res!721153 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23391))))

(declare-fun b!1081843 () Bool)

(declare-fun res!721154 () Bool)

(assert (=> b!1081843 (=> (not res!721154) (not e!618299))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081843 (= res!721154 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41293 () Bool)

(declare-fun tp!78920 () Bool)

(declare-fun e!618301 () Bool)

(assert (=> mapNonEmpty!41293 (= mapRes!41293 (and tp!78920 e!618301))))

(declare-datatypes ((V!40273 0))(
  ( (V!40274 (val!13236 Int)) )
))
(declare-datatypes ((ValueCell!12470 0))(
  ( (ValueCellFull!12470 (v!15856 V!40273)) (EmptyCell!12470) )
))
(declare-datatypes ((array!69594 0))(
  ( (array!69595 (arr!33471 (Array (_ BitVec 32) ValueCell!12470)) (size!34009 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69594)

(declare-fun mapValue!41293 () ValueCell!12470)

(declare-fun mapKey!41293 () (_ BitVec 32))

(declare-fun mapRest!41293 () (Array (_ BitVec 32) ValueCell!12470))

(assert (=> mapNonEmpty!41293 (= (arr!33471 _values!874) (store mapRest!41293 mapKey!41293 mapValue!41293))))

(declare-fun b!1081844 () Bool)

(declare-fun res!721149 () Bool)

(assert (=> b!1081844 (=> (not res!721149) (not e!618299))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081844 (= res!721149 (and (= (size!34009 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34008 _keys!1070) (size!34009 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081845 () Bool)

(declare-fun res!721151 () Bool)

(assert (=> b!1081845 (=> (not res!721151) (not e!618299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69592 (_ BitVec 32)) Bool)

(assert (=> b!1081845 (= res!721151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!721148 () Bool)

(assert (=> start!95698 (=> (not res!721148) (not e!618299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95698 (= res!721148 (validMask!0 mask!1414))))

(assert (=> start!95698 e!618299))

(assert (=> start!95698 tp!78919))

(assert (=> start!95698 true))

(declare-fun tp_is_empty!26359 () Bool)

(assert (=> start!95698 tp_is_empty!26359))

(declare-fun array_inv!25874 (array!69592) Bool)

(assert (=> start!95698 (array_inv!25874 _keys!1070)))

(declare-fun e!618297 () Bool)

(declare-fun array_inv!25875 (array!69594) Bool)

(assert (=> start!95698 (and (array_inv!25875 _values!874) e!618297)))

(declare-fun b!1081846 () Bool)

(assert (=> b!1081846 (= e!618301 tp_is_empty!26359)))

(declare-fun b!1081847 () Bool)

(declare-fun res!721155 () Bool)

(declare-fun e!618302 () Bool)

(assert (=> b!1081847 (=> (not res!721155) (not e!618302))))

(declare-fun lt!479277 () array!69592)

(assert (=> b!1081847 (= res!721155 (arrayNoDuplicates!0 lt!479277 #b00000000000000000000000000000000 Nil!23391))))

(declare-fun b!1081848 () Bool)

(assert (=> b!1081848 (= e!618299 e!618302)))

(declare-fun res!721152 () Bool)

(assert (=> b!1081848 (=> (not res!721152) (not e!618302))))

(assert (=> b!1081848 (= res!721152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479277 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081848 (= lt!479277 (array!69593 (store (arr!33470 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34008 _keys!1070)))))

(declare-fun b!1081849 () Bool)

(declare-fun res!721150 () Bool)

(assert (=> b!1081849 (=> (not res!721150) (not e!618299))))

(assert (=> b!1081849 (= res!721150 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34008 _keys!1070))))))

(declare-fun b!1081850 () Bool)

(declare-fun e!618298 () Bool)

(assert (=> b!1081850 (= e!618297 (and e!618298 mapRes!41293))))

(declare-fun condMapEmpty!41293 () Bool)

(declare-fun mapDefault!41293 () ValueCell!12470)

(assert (=> b!1081850 (= condMapEmpty!41293 (= (arr!33471 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12470)) mapDefault!41293)))))

(declare-fun b!1081851 () Bool)

(assert (=> b!1081851 (= e!618298 tp_is_empty!26359)))

(declare-fun b!1081852 () Bool)

(assert (=> b!1081852 (= e!618302 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40273)

(declare-fun zeroValue!831 () V!40273)

(declare-datatypes ((tuple2!16830 0))(
  ( (tuple2!16831 (_1!8426 (_ BitVec 64)) (_2!8426 V!40273)) )
))
(declare-datatypes ((List!23395 0))(
  ( (Nil!23392) (Cons!23391 (h!24600 tuple2!16830) (t!32801 List!23395)) )
))
(declare-datatypes ((ListLongMap!14799 0))(
  ( (ListLongMap!14800 (toList!7415 List!23395)) )
))
(declare-fun lt!479276 () ListLongMap!14799)

(declare-fun getCurrentListMapNoExtraKeys!3978 (array!69592 array!69594 (_ BitVec 32) (_ BitVec 32) V!40273 V!40273 (_ BitVec 32) Int) ListLongMap!14799)

(declare-fun dynLambda!2049 (Int (_ BitVec 64)) V!40273)

(assert (=> b!1081852 (= lt!479276 (getCurrentListMapNoExtraKeys!3978 lt!479277 (array!69595 (store (arr!33471 _values!874) i!650 (ValueCellFull!12470 (dynLambda!2049 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34009 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479279 () ListLongMap!14799)

(assert (=> b!1081852 (= lt!479279 (getCurrentListMapNoExtraKeys!3978 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081852 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35423 0))(
  ( (Unit!35424) )
))
(declare-fun lt!479278 () Unit!35423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69592 (_ BitVec 64) (_ BitVec 32)) Unit!35423)

(assert (=> b!1081852 (= lt!479278 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081853 () Bool)

(declare-fun res!721147 () Bool)

(assert (=> b!1081853 (=> (not res!721147) (not e!618299))))

(assert (=> b!1081853 (= res!721147 (= (select (arr!33470 _keys!1070) i!650) k0!904))))

(assert (= (and start!95698 res!721148) b!1081844))

(assert (= (and b!1081844 res!721149) b!1081845))

(assert (= (and b!1081845 res!721151) b!1081842))

(assert (= (and b!1081842 res!721153) b!1081849))

(assert (= (and b!1081849 res!721150) b!1081843))

(assert (= (and b!1081843 res!721154) b!1081853))

(assert (= (and b!1081853 res!721147) b!1081848))

(assert (= (and b!1081848 res!721152) b!1081847))

(assert (= (and b!1081847 res!721155) b!1081852))

(assert (= (and b!1081850 condMapEmpty!41293) mapIsEmpty!41293))

(assert (= (and b!1081850 (not condMapEmpty!41293)) mapNonEmpty!41293))

(get-info :version)

(assert (= (and mapNonEmpty!41293 ((_ is ValueCellFull!12470) mapValue!41293)) b!1081846))

(assert (= (and b!1081850 ((_ is ValueCellFull!12470) mapDefault!41293)) b!1081851))

(assert (= start!95698 b!1081850))

(declare-fun b_lambda!17005 () Bool)

(assert (=> (not b_lambda!17005) (not b!1081852)))

(declare-fun t!32799 () Bool)

(declare-fun tb!7227 () Bool)

(assert (=> (and start!95698 (= defaultEntry!882 defaultEntry!882) t!32799) tb!7227))

(declare-fun result!14981 () Bool)

(assert (=> tb!7227 (= result!14981 tp_is_empty!26359)))

(assert (=> b!1081852 t!32799))

(declare-fun b_and!35365 () Bool)

(assert (= b_and!35363 (and (=> t!32799 result!14981) b_and!35365)))

(declare-fun m!999101 () Bool)

(assert (=> b!1081842 m!999101))

(declare-fun m!999103 () Bool)

(assert (=> b!1081848 m!999103))

(declare-fun m!999105 () Bool)

(assert (=> b!1081848 m!999105))

(declare-fun m!999107 () Bool)

(assert (=> b!1081853 m!999107))

(declare-fun m!999109 () Bool)

(assert (=> b!1081845 m!999109))

(declare-fun m!999111 () Bool)

(assert (=> b!1081847 m!999111))

(declare-fun m!999113 () Bool)

(assert (=> b!1081852 m!999113))

(declare-fun m!999115 () Bool)

(assert (=> b!1081852 m!999115))

(declare-fun m!999117 () Bool)

(assert (=> b!1081852 m!999117))

(declare-fun m!999119 () Bool)

(assert (=> b!1081852 m!999119))

(declare-fun m!999121 () Bool)

(assert (=> b!1081852 m!999121))

(declare-fun m!999123 () Bool)

(assert (=> b!1081852 m!999123))

(declare-fun m!999125 () Bool)

(assert (=> start!95698 m!999125))

(declare-fun m!999127 () Bool)

(assert (=> start!95698 m!999127))

(declare-fun m!999129 () Bool)

(assert (=> start!95698 m!999129))

(declare-fun m!999131 () Bool)

(assert (=> b!1081843 m!999131))

(declare-fun m!999133 () Bool)

(assert (=> mapNonEmpty!41293 m!999133))

(check-sat tp_is_empty!26359 (not b!1081843) (not b!1081845) b_and!35365 (not b!1081848) (not b_lambda!17005) (not b!1081847) (not b_next!22357) (not start!95698) (not b!1081852) (not mapNonEmpty!41293) (not b!1081842))
(check-sat b_and!35365 (not b_next!22357))
