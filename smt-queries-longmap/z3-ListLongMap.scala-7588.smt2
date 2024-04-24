; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96084 () Bool)

(assert start!96084)

(declare-fun b_free!22501 () Bool)

(declare-fun b_next!22501 () Bool)

(assert (=> start!96084 (= b_free!22501 (not b_next!22501))))

(declare-fun tp!79351 () Bool)

(declare-fun b_and!35687 () Bool)

(assert (=> start!96084 (= tp!79351 b_and!35687)))

(declare-fun res!723718 () Bool)

(declare-fun e!620564 () Bool)

(assert (=> start!96084 (=> (not res!723718) (not e!620564))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96084 (= res!723718 (validMask!0 mask!1414))))

(assert (=> start!96084 e!620564))

(assert (=> start!96084 tp!79351))

(assert (=> start!96084 true))

(declare-fun tp_is_empty!26503 () Bool)

(assert (=> start!96084 tp_is_empty!26503))

(declare-datatypes ((array!69981 0))(
  ( (array!69982 (arr!33658 (Array (_ BitVec 32) (_ BitVec 64))) (size!34195 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69981)

(declare-fun array_inv!26020 (array!69981) Bool)

(assert (=> start!96084 (array_inv!26020 _keys!1070)))

(declare-datatypes ((V!40465 0))(
  ( (V!40466 (val!13308 Int)) )
))
(declare-datatypes ((ValueCell!12542 0))(
  ( (ValueCellFull!12542 (v!15925 V!40465)) (EmptyCell!12542) )
))
(declare-datatypes ((array!69983 0))(
  ( (array!69984 (arr!33659 (Array (_ BitVec 32) ValueCell!12542)) (size!34196 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69983)

(declare-fun e!620566 () Bool)

(declare-fun array_inv!26021 (array!69983) Bool)

(assert (=> start!96084 (and (array_inv!26021 _values!874) e!620566)))

(declare-fun b!1086087 () Bool)

(declare-fun res!723712 () Bool)

(assert (=> b!1086087 (=> (not res!723712) (not e!620564))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086087 (= res!723712 (= (select (arr!33658 _keys!1070) i!650) k0!904))))

(declare-fun b!1086088 () Bool)

(declare-fun e!620567 () Bool)

(declare-fun mapRes!41509 () Bool)

(assert (=> b!1086088 (= e!620566 (and e!620567 mapRes!41509))))

(declare-fun condMapEmpty!41509 () Bool)

(declare-fun mapDefault!41509 () ValueCell!12542)

(assert (=> b!1086088 (= condMapEmpty!41509 (= (arr!33659 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12542)) mapDefault!41509)))))

(declare-fun mapIsEmpty!41509 () Bool)

(assert (=> mapIsEmpty!41509 mapRes!41509))

(declare-fun b!1086089 () Bool)

(declare-fun e!620563 () Bool)

(assert (=> b!1086089 (= e!620563 true)))

(declare-datatypes ((tuple2!16874 0))(
  ( (tuple2!16875 (_1!8448 (_ BitVec 64)) (_2!8448 V!40465)) )
))
(declare-datatypes ((List!23473 0))(
  ( (Nil!23470) (Cons!23469 (h!24687 tuple2!16874) (t!33024 List!23473)) )
))
(declare-datatypes ((ListLongMap!14851 0))(
  ( (ListLongMap!14852 (toList!7441 List!23473)) )
))
(declare-fun lt!481426 () ListLongMap!14851)

(declare-fun lt!481433 () ListLongMap!14851)

(declare-fun -!753 (ListLongMap!14851 (_ BitVec 64)) ListLongMap!14851)

(assert (=> b!1086089 (= (-!753 lt!481426 k0!904) lt!481433)))

(declare-datatypes ((Unit!35673 0))(
  ( (Unit!35674) )
))
(declare-fun lt!481431 () Unit!35673)

(declare-fun lt!481432 () ListLongMap!14851)

(declare-fun zeroValue!831 () V!40465)

(declare-fun addRemoveCommutativeForDiffKeys!1 (ListLongMap!14851 (_ BitVec 64) V!40465 (_ BitVec 64)) Unit!35673)

(assert (=> b!1086089 (= lt!481431 (addRemoveCommutativeForDiffKeys!1 lt!481432 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481425 () ListLongMap!14851)

(declare-fun lt!481436 () tuple2!16874)

(declare-fun +!3267 (ListLongMap!14851 tuple2!16874) ListLongMap!14851)

(assert (=> b!1086089 (= lt!481425 (+!3267 lt!481433 lt!481436))))

(declare-fun lt!481430 () ListLongMap!14851)

(declare-fun lt!481424 () tuple2!16874)

(assert (=> b!1086089 (= lt!481433 (+!3267 lt!481430 lt!481424))))

(declare-fun lt!481429 () ListLongMap!14851)

(assert (=> b!1086089 (= lt!481429 (+!3267 lt!481426 lt!481436))))

(assert (=> b!1086089 (= lt!481426 (+!3267 lt!481432 lt!481424))))

(declare-fun lt!481435 () ListLongMap!14851)

(assert (=> b!1086089 (= lt!481425 (+!3267 (+!3267 lt!481435 lt!481424) lt!481436))))

(declare-fun minValue!831 () V!40465)

(assert (=> b!1086089 (= lt!481436 (tuple2!16875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086089 (= lt!481424 (tuple2!16875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41509 () Bool)

(declare-fun tp!79352 () Bool)

(declare-fun e!620565 () Bool)

(assert (=> mapNonEmpty!41509 (= mapRes!41509 (and tp!79352 e!620565))))

(declare-fun mapRest!41509 () (Array (_ BitVec 32) ValueCell!12542))

(declare-fun mapValue!41509 () ValueCell!12542)

(declare-fun mapKey!41509 () (_ BitVec 32))

(assert (=> mapNonEmpty!41509 (= (arr!33659 _values!874) (store mapRest!41509 mapKey!41509 mapValue!41509))))

(declare-fun b!1086090 () Bool)

(declare-fun res!723716 () Bool)

(declare-fun e!620561 () Bool)

(assert (=> b!1086090 (=> (not res!723716) (not e!620561))))

(declare-fun lt!481437 () array!69981)

(declare-datatypes ((List!23474 0))(
  ( (Nil!23471) (Cons!23470 (h!24688 (_ BitVec 64)) (t!33025 List!23474)) )
))
(declare-fun arrayNoDuplicates!0 (array!69981 (_ BitVec 32) List!23474) Bool)

(assert (=> b!1086090 (= res!723716 (arrayNoDuplicates!0 lt!481437 #b00000000000000000000000000000000 Nil!23471))))

(declare-fun b!1086091 () Bool)

(assert (=> b!1086091 (= e!620561 (not e!620563))))

(declare-fun res!723713 () Bool)

(assert (=> b!1086091 (=> res!723713 e!620563)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086091 (= res!723713 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4213 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) Int) ListLongMap!14851)

(assert (=> b!1086091 (= lt!481429 (getCurrentListMap!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481428 () array!69983)

(assert (=> b!1086091 (= lt!481425 (getCurrentListMap!4213 lt!481437 lt!481428 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086091 (and (= lt!481435 lt!481430) (= lt!481430 lt!481435))))

(assert (=> b!1086091 (= lt!481430 (-!753 lt!481432 k0!904))))

(declare-fun lt!481434 () Unit!35673)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35673)

(assert (=> b!1086091 (= lt!481434 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4018 (array!69981 array!69983 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) Int) ListLongMap!14851)

(assert (=> b!1086091 (= lt!481435 (getCurrentListMapNoExtraKeys!4018 lt!481437 lt!481428 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2139 (Int (_ BitVec 64)) V!40465)

(assert (=> b!1086091 (= lt!481428 (array!69984 (store (arr!33659 _values!874) i!650 (ValueCellFull!12542 (dynLambda!2139 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34196 _values!874)))))

(assert (=> b!1086091 (= lt!481432 (getCurrentListMapNoExtraKeys!4018 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086091 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481427 () Unit!35673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69981 (_ BitVec 64) (_ BitVec 32)) Unit!35673)

(assert (=> b!1086091 (= lt!481427 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086092 () Bool)

(assert (=> b!1086092 (= e!620565 tp_is_empty!26503)))

(declare-fun b!1086093 () Bool)

(declare-fun res!723717 () Bool)

(assert (=> b!1086093 (=> (not res!723717) (not e!620564))))

(assert (=> b!1086093 (= res!723717 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23471))))

(declare-fun b!1086094 () Bool)

(declare-fun res!723714 () Bool)

(assert (=> b!1086094 (=> (not res!723714) (not e!620564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69981 (_ BitVec 32)) Bool)

(assert (=> b!1086094 (= res!723714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086095 () Bool)

(assert (=> b!1086095 (= e!620564 e!620561)))

(declare-fun res!723711 () Bool)

(assert (=> b!1086095 (=> (not res!723711) (not e!620561))))

(assert (=> b!1086095 (= res!723711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481437 mask!1414))))

(assert (=> b!1086095 (= lt!481437 (array!69982 (store (arr!33658 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34195 _keys!1070)))))

(declare-fun b!1086096 () Bool)

(declare-fun res!723719 () Bool)

(assert (=> b!1086096 (=> (not res!723719) (not e!620564))))

(assert (=> b!1086096 (= res!723719 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34195 _keys!1070))))))

(declare-fun b!1086097 () Bool)

(declare-fun res!723720 () Bool)

(assert (=> b!1086097 (=> (not res!723720) (not e!620564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086097 (= res!723720 (validKeyInArray!0 k0!904))))

(declare-fun b!1086098 () Bool)

(assert (=> b!1086098 (= e!620567 tp_is_empty!26503)))

(declare-fun b!1086099 () Bool)

(declare-fun res!723715 () Bool)

(assert (=> b!1086099 (=> (not res!723715) (not e!620564))))

(assert (=> b!1086099 (= res!723715 (and (= (size!34196 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34195 _keys!1070) (size!34196 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96084 res!723718) b!1086099))

(assert (= (and b!1086099 res!723715) b!1086094))

(assert (= (and b!1086094 res!723714) b!1086093))

(assert (= (and b!1086093 res!723717) b!1086096))

(assert (= (and b!1086096 res!723719) b!1086097))

(assert (= (and b!1086097 res!723720) b!1086087))

(assert (= (and b!1086087 res!723712) b!1086095))

(assert (= (and b!1086095 res!723711) b!1086090))

(assert (= (and b!1086090 res!723716) b!1086091))

(assert (= (and b!1086091 (not res!723713)) b!1086089))

(assert (= (and b!1086088 condMapEmpty!41509) mapIsEmpty!41509))

(assert (= (and b!1086088 (not condMapEmpty!41509)) mapNonEmpty!41509))

(get-info :version)

(assert (= (and mapNonEmpty!41509 ((_ is ValueCellFull!12542) mapValue!41509)) b!1086092))

(assert (= (and b!1086088 ((_ is ValueCellFull!12542) mapDefault!41509)) b!1086098))

(assert (= start!96084 b!1086088))

(declare-fun b_lambda!17181 () Bool)

(assert (=> (not b_lambda!17181) (not b!1086091)))

(declare-fun t!33023 () Bool)

(declare-fun tb!7371 () Bool)

(assert (=> (and start!96084 (= defaultEntry!882 defaultEntry!882) t!33023) tb!7371))

(declare-fun result!15269 () Bool)

(assert (=> tb!7371 (= result!15269 tp_is_empty!26503)))

(assert (=> b!1086091 t!33023))

(declare-fun b_and!35689 () Bool)

(assert (= b_and!35687 (and (=> t!33023 result!15269) b_and!35689)))

(declare-fun m!1004177 () Bool)

(assert (=> b!1086087 m!1004177))

(declare-fun m!1004179 () Bool)

(assert (=> mapNonEmpty!41509 m!1004179))

(declare-fun m!1004181 () Bool)

(assert (=> b!1086097 m!1004181))

(declare-fun m!1004183 () Bool)

(assert (=> b!1086089 m!1004183))

(declare-fun m!1004185 () Bool)

(assert (=> b!1086089 m!1004185))

(declare-fun m!1004187 () Bool)

(assert (=> b!1086089 m!1004187))

(declare-fun m!1004189 () Bool)

(assert (=> b!1086089 m!1004189))

(declare-fun m!1004191 () Bool)

(assert (=> b!1086089 m!1004191))

(declare-fun m!1004193 () Bool)

(assert (=> b!1086089 m!1004193))

(declare-fun m!1004195 () Bool)

(assert (=> b!1086089 m!1004195))

(declare-fun m!1004197 () Bool)

(assert (=> b!1086089 m!1004197))

(assert (=> b!1086089 m!1004191))

(declare-fun m!1004199 () Bool)

(assert (=> b!1086093 m!1004199))

(declare-fun m!1004201 () Bool)

(assert (=> b!1086090 m!1004201))

(declare-fun m!1004203 () Bool)

(assert (=> start!96084 m!1004203))

(declare-fun m!1004205 () Bool)

(assert (=> start!96084 m!1004205))

(declare-fun m!1004207 () Bool)

(assert (=> start!96084 m!1004207))

(declare-fun m!1004209 () Bool)

(assert (=> b!1086095 m!1004209))

(declare-fun m!1004211 () Bool)

(assert (=> b!1086095 m!1004211))

(declare-fun m!1004213 () Bool)

(assert (=> b!1086094 m!1004213))

(declare-fun m!1004215 () Bool)

(assert (=> b!1086091 m!1004215))

(declare-fun m!1004217 () Bool)

(assert (=> b!1086091 m!1004217))

(declare-fun m!1004219 () Bool)

(assert (=> b!1086091 m!1004219))

(declare-fun m!1004221 () Bool)

(assert (=> b!1086091 m!1004221))

(declare-fun m!1004223 () Bool)

(assert (=> b!1086091 m!1004223))

(declare-fun m!1004225 () Bool)

(assert (=> b!1086091 m!1004225))

(declare-fun m!1004227 () Bool)

(assert (=> b!1086091 m!1004227))

(declare-fun m!1004229 () Bool)

(assert (=> b!1086091 m!1004229))

(declare-fun m!1004231 () Bool)

(assert (=> b!1086091 m!1004231))

(declare-fun m!1004233 () Bool)

(assert (=> b!1086091 m!1004233))

(check-sat (not b!1086091) (not b!1086093) (not b!1086097) (not b_lambda!17181) b_and!35689 (not mapNonEmpty!41509) (not b!1086094) (not b!1086095) (not start!96084) (not b!1086089) tp_is_empty!26503 (not b_next!22501) (not b!1086090))
(check-sat b_and!35689 (not b_next!22501))
