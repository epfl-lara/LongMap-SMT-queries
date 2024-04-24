; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95982 () Bool)

(assert start!95982)

(declare-fun b_free!22399 () Bool)

(declare-fun b_next!22399 () Bool)

(assert (=> start!95982 (= b_free!22399 (not b_next!22399))))

(declare-fun tp!79046 () Bool)

(declare-fun b_and!35483 () Bool)

(assert (=> start!95982 (= tp!79046 b_and!35483)))

(declare-fun mapIsEmpty!41356 () Bool)

(declare-fun mapRes!41356 () Bool)

(assert (=> mapIsEmpty!41356 mapRes!41356))

(declare-fun mapNonEmpty!41356 () Bool)

(declare-fun tp!79045 () Bool)

(declare-fun e!619627 () Bool)

(assert (=> mapNonEmpty!41356 (= mapRes!41356 (and tp!79045 e!619627))))

(declare-datatypes ((V!40329 0))(
  ( (V!40330 (val!13257 Int)) )
))
(declare-datatypes ((ValueCell!12491 0))(
  ( (ValueCellFull!12491 (v!15874 V!40329)) (EmptyCell!12491) )
))
(declare-datatypes ((array!69785 0))(
  ( (array!69786 (arr!33560 (Array (_ BitVec 32) ValueCell!12491)) (size!34097 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69785)

(declare-fun mapRest!41356 () (Array (_ BitVec 32) ValueCell!12491))

(declare-fun mapValue!41356 () ValueCell!12491)

(declare-fun mapKey!41356 () (_ BitVec 32))

(assert (=> mapNonEmpty!41356 (= (arr!33560 _values!874) (store mapRest!41356 mapKey!41356 mapValue!41356))))

(declare-fun b!1084121 () Bool)

(declare-fun e!619626 () Bool)

(declare-fun e!619625 () Bool)

(assert (=> b!1084121 (= e!619626 e!619625)))

(declare-fun res!722312 () Bool)

(assert (=> b!1084121 (=> (not res!722312) (not e!619625))))

(declare-datatypes ((array!69787 0))(
  ( (array!69788 (arr!33561 (Array (_ BitVec 32) (_ BitVec 64))) (size!34098 (_ BitVec 32))) )
))
(declare-fun lt!480288 () array!69787)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69787 (_ BitVec 32)) Bool)

(assert (=> b!1084121 (= res!722312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480288 mask!1414))))

(declare-fun _keys!1070 () array!69787)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084121 (= lt!480288 (array!69788 (store (arr!33561 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34098 _keys!1070)))))

(declare-fun b!1084122 () Bool)

(declare-fun res!722305 () Bool)

(assert (=> b!1084122 (=> (not res!722305) (not e!619626))))

(assert (=> b!1084122 (= res!722305 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34098 _keys!1070))))))

(declare-fun b!1084123 () Bool)

(declare-fun res!722310 () Bool)

(assert (=> b!1084123 (=> (not res!722310) (not e!619625))))

(declare-datatypes ((List!23394 0))(
  ( (Nil!23391) (Cons!23390 (h!24608 (_ BitVec 64)) (t!32843 List!23394)) )
))
(declare-fun arrayNoDuplicates!0 (array!69787 (_ BitVec 32) List!23394) Bool)

(assert (=> b!1084123 (= res!722310 (arrayNoDuplicates!0 lt!480288 #b00000000000000000000000000000000 Nil!23391))))

(declare-fun b!1084124 () Bool)

(declare-fun tp_is_empty!26401 () Bool)

(assert (=> b!1084124 (= e!619627 tp_is_empty!26401)))

(declare-fun b!1084125 () Bool)

(declare-fun res!722309 () Bool)

(assert (=> b!1084125 (=> (not res!722309) (not e!619626))))

(assert (=> b!1084125 (= res!722309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084126 () Bool)

(declare-fun res!722311 () Bool)

(assert (=> b!1084126 (=> (not res!722311) (not e!619626))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084126 (= res!722311 (= (select (arr!33561 _keys!1070) i!650) k0!904))))

(declare-fun b!1084127 () Bool)

(declare-fun res!722306 () Bool)

(assert (=> b!1084127 (=> (not res!722306) (not e!619626))))

(assert (=> b!1084127 (= res!722306 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23391))))

(declare-fun b!1084128 () Bool)

(assert (=> b!1084128 (= e!619625 (not true))))

(declare-datatypes ((tuple2!16800 0))(
  ( (tuple2!16801 (_1!8411 (_ BitVec 64)) (_2!8411 V!40329)) )
))
(declare-datatypes ((List!23395 0))(
  ( (Nil!23392) (Cons!23391 (h!24609 tuple2!16800) (t!32844 List!23395)) )
))
(declare-datatypes ((ListLongMap!14777 0))(
  ( (ListLongMap!14778 (toList!7404 List!23395)) )
))
(declare-fun lt!480285 () ListLongMap!14777)

(declare-fun lt!480283 () ListLongMap!14777)

(assert (=> b!1084128 (and (= lt!480285 lt!480283) (= lt!480283 lt!480285))))

(declare-fun lt!480284 () ListLongMap!14777)

(declare-fun -!716 (ListLongMap!14777 (_ BitVec 64)) ListLongMap!14777)

(assert (=> b!1084128 (= lt!480283 (-!716 lt!480284 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40329)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35599 0))(
  ( (Unit!35600) )
))
(declare-fun lt!480286 () Unit!35599)

(declare-fun zeroValue!831 () V!40329)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!5 (array!69787 array!69785 (_ BitVec 32) (_ BitVec 32) V!40329 V!40329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35599)

(assert (=> b!1084128 (= lt!480286 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!5 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3981 (array!69787 array!69785 (_ BitVec 32) (_ BitVec 32) V!40329 V!40329 (_ BitVec 32) Int) ListLongMap!14777)

(declare-fun dynLambda!2102 (Int (_ BitVec 64)) V!40329)

(assert (=> b!1084128 (= lt!480285 (getCurrentListMapNoExtraKeys!3981 lt!480288 (array!69786 (store (arr!33560 _values!874) i!650 (ValueCellFull!12491 (dynLambda!2102 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34097 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084128 (= lt!480284 (getCurrentListMapNoExtraKeys!3981 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084128 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480287 () Unit!35599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69787 (_ BitVec 64) (_ BitVec 32)) Unit!35599)

(assert (=> b!1084128 (= lt!480287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084120 () Bool)

(declare-fun e!619624 () Bool)

(assert (=> b!1084120 (= e!619624 tp_is_empty!26401)))

(declare-fun res!722313 () Bool)

(assert (=> start!95982 (=> (not res!722313) (not e!619626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95982 (= res!722313 (validMask!0 mask!1414))))

(assert (=> start!95982 e!619626))

(assert (=> start!95982 tp!79046))

(assert (=> start!95982 true))

(assert (=> start!95982 tp_is_empty!26401))

(declare-fun array_inv!25950 (array!69787) Bool)

(assert (=> start!95982 (array_inv!25950 _keys!1070)))

(declare-fun e!619628 () Bool)

(declare-fun array_inv!25951 (array!69785) Bool)

(assert (=> start!95982 (and (array_inv!25951 _values!874) e!619628)))

(declare-fun b!1084129 () Bool)

(declare-fun res!722308 () Bool)

(assert (=> b!1084129 (=> (not res!722308) (not e!619626))))

(assert (=> b!1084129 (= res!722308 (and (= (size!34097 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34098 _keys!1070) (size!34097 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084130 () Bool)

(assert (=> b!1084130 (= e!619628 (and e!619624 mapRes!41356))))

(declare-fun condMapEmpty!41356 () Bool)

(declare-fun mapDefault!41356 () ValueCell!12491)

(assert (=> b!1084130 (= condMapEmpty!41356 (= (arr!33560 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12491)) mapDefault!41356)))))

(declare-fun b!1084131 () Bool)

(declare-fun res!722307 () Bool)

(assert (=> b!1084131 (=> (not res!722307) (not e!619626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084131 (= res!722307 (validKeyInArray!0 k0!904))))

(assert (= (and start!95982 res!722313) b!1084129))

(assert (= (and b!1084129 res!722308) b!1084125))

(assert (= (and b!1084125 res!722309) b!1084127))

(assert (= (and b!1084127 res!722306) b!1084122))

(assert (= (and b!1084122 res!722305) b!1084131))

(assert (= (and b!1084131 res!722307) b!1084126))

(assert (= (and b!1084126 res!722311) b!1084121))

(assert (= (and b!1084121 res!722312) b!1084123))

(assert (= (and b!1084123 res!722310) b!1084128))

(assert (= (and b!1084130 condMapEmpty!41356) mapIsEmpty!41356))

(assert (= (and b!1084130 (not condMapEmpty!41356)) mapNonEmpty!41356))

(get-info :version)

(assert (= (and mapNonEmpty!41356 ((_ is ValueCellFull!12491) mapValue!41356)) b!1084124))

(assert (= (and b!1084130 ((_ is ValueCellFull!12491) mapDefault!41356)) b!1084120))

(assert (= start!95982 b!1084130))

(declare-fun b_lambda!17079 () Bool)

(assert (=> (not b_lambda!17079) (not b!1084128)))

(declare-fun t!32842 () Bool)

(declare-fun tb!7269 () Bool)

(assert (=> (and start!95982 (= defaultEntry!882 defaultEntry!882) t!32842) tb!7269))

(declare-fun result!15065 () Bool)

(assert (=> tb!7269 (= result!15065 tp_is_empty!26401)))

(assert (=> b!1084128 t!32842))

(declare-fun b_and!35485 () Bool)

(assert (= b_and!35483 (and (=> t!32842 result!15065) b_and!35485)))

(declare-fun m!1002137 () Bool)

(assert (=> mapNonEmpty!41356 m!1002137))

(declare-fun m!1002139 () Bool)

(assert (=> b!1084131 m!1002139))

(declare-fun m!1002141 () Bool)

(assert (=> b!1084127 m!1002141))

(declare-fun m!1002143 () Bool)

(assert (=> b!1084128 m!1002143))

(declare-fun m!1002145 () Bool)

(assert (=> b!1084128 m!1002145))

(declare-fun m!1002147 () Bool)

(assert (=> b!1084128 m!1002147))

(declare-fun m!1002149 () Bool)

(assert (=> b!1084128 m!1002149))

(declare-fun m!1002151 () Bool)

(assert (=> b!1084128 m!1002151))

(declare-fun m!1002153 () Bool)

(assert (=> b!1084128 m!1002153))

(declare-fun m!1002155 () Bool)

(assert (=> b!1084128 m!1002155))

(declare-fun m!1002157 () Bool)

(assert (=> b!1084128 m!1002157))

(declare-fun m!1002159 () Bool)

(assert (=> start!95982 m!1002159))

(declare-fun m!1002161 () Bool)

(assert (=> start!95982 m!1002161))

(declare-fun m!1002163 () Bool)

(assert (=> start!95982 m!1002163))

(declare-fun m!1002165 () Bool)

(assert (=> b!1084125 m!1002165))

(declare-fun m!1002167 () Bool)

(assert (=> b!1084126 m!1002167))

(declare-fun m!1002169 () Bool)

(assert (=> b!1084123 m!1002169))

(declare-fun m!1002171 () Bool)

(assert (=> b!1084121 m!1002171))

(declare-fun m!1002173 () Bool)

(assert (=> b!1084121 m!1002173))

(check-sat (not b!1084121) tp_is_empty!26401 (not b!1084128) (not start!95982) (not b_next!22399) (not mapNonEmpty!41356) (not b!1084131) (not b_lambda!17079) (not b!1084123) b_and!35485 (not b!1084125) (not b!1084127))
(check-sat b_and!35485 (not b_next!22399))
