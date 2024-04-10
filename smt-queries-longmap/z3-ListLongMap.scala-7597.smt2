; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95904 () Bool)

(assert start!95904)

(declare-fun b_free!22557 () Bool)

(declare-fun b_next!22557 () Bool)

(assert (=> start!95904 (= b_free!22557 (not b_next!22557))))

(declare-fun tp!79520 () Bool)

(declare-fun b_and!35789 () Bool)

(assert (=> start!95904 (= tp!79520 b_and!35789)))

(declare-fun b!1085985 () Bool)

(declare-fun res!724116 () Bool)

(declare-fun e!620373 () Bool)

(assert (=> b!1085985 (=> (not res!724116) (not e!620373))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70053 0))(
  ( (array!70054 (arr!33700 (Array (_ BitVec 32) (_ BitVec 64))) (size!34236 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70053)

(assert (=> b!1085985 (= res!724116 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34236 _keys!1070))))))

(declare-fun b!1085986 () Bool)

(declare-fun e!620371 () Bool)

(declare-fun e!620377 () Bool)

(assert (=> b!1085986 (= e!620371 (not e!620377))))

(declare-fun res!724110 () Bool)

(assert (=> b!1085986 (=> res!724110 e!620377)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085986 (= res!724110 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40539 0))(
  ( (V!40540 (val!13336 Int)) )
))
(declare-fun minValue!831 () V!40539)

(declare-datatypes ((tuple2!16914 0))(
  ( (tuple2!16915 (_1!8468 (_ BitVec 64)) (_2!8468 V!40539)) )
))
(declare-datatypes ((List!23502 0))(
  ( (Nil!23499) (Cons!23498 (h!24707 tuple2!16914) (t!33117 List!23502)) )
))
(declare-datatypes ((ListLongMap!14883 0))(
  ( (ListLongMap!14884 (toList!7457 List!23502)) )
))
(declare-fun lt!482331 () ListLongMap!14883)

(declare-fun zeroValue!831 () V!40539)

(declare-datatypes ((ValueCell!12570 0))(
  ( (ValueCellFull!12570 (v!15957 V!40539)) (EmptyCell!12570) )
))
(declare-datatypes ((array!70055 0))(
  ( (array!70056 (arr!33701 (Array (_ BitVec 32) ValueCell!12570)) (size!34237 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70055)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun getCurrentListMap!4239 (array!70053 array!70055 (_ BitVec 32) (_ BitVec 32) V!40539 V!40539 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1085986 (= lt!482331 (getCurrentListMap!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482327 () ListLongMap!14883)

(declare-fun lt!482316 () array!70053)

(declare-fun lt!482325 () array!70055)

(assert (=> b!1085986 (= lt!482327 (getCurrentListMap!4239 lt!482316 lt!482325 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482329 () ListLongMap!14883)

(declare-fun lt!482326 () ListLongMap!14883)

(assert (=> b!1085986 (and (= lt!482329 lt!482326) (= lt!482326 lt!482329))))

(declare-fun lt!482330 () ListLongMap!14883)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!783 (ListLongMap!14883 (_ BitVec 64)) ListLongMap!14883)

(assert (=> b!1085986 (= lt!482326 (-!783 lt!482330 k0!904))))

(declare-datatypes ((Unit!35732 0))(
  ( (Unit!35733) )
))
(declare-fun lt!482323 () Unit!35732)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 (array!70053 array!70055 (_ BitVec 32) (_ BitVec 32) V!40539 V!40539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35732)

(assert (=> b!1085986 (= lt!482323 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!58 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3999 (array!70053 array!70055 (_ BitVec 32) (_ BitVec 32) V!40539 V!40539 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1085986 (= lt!482329 (getCurrentListMapNoExtraKeys!3999 lt!482316 lt!482325 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2136 (Int (_ BitVec 64)) V!40539)

(assert (=> b!1085986 (= lt!482325 (array!70056 (store (arr!33701 _values!874) i!650 (ValueCellFull!12570 (dynLambda!2136 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34237 _values!874)))))

(assert (=> b!1085986 (= lt!482330 (getCurrentListMapNoExtraKeys!3999 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085986 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482319 () Unit!35732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70053 (_ BitVec 64) (_ BitVec 32)) Unit!35732)

(assert (=> b!1085986 (= lt!482319 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085987 () Bool)

(declare-fun res!724115 () Bool)

(assert (=> b!1085987 (=> (not res!724115) (not e!620373))))

(declare-datatypes ((List!23503 0))(
  ( (Nil!23500) (Cons!23499 (h!24708 (_ BitVec 64)) (t!33118 List!23503)) )
))
(declare-fun arrayNoDuplicates!0 (array!70053 (_ BitVec 32) List!23503) Bool)

(assert (=> b!1085987 (= res!724115 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23500))))

(declare-fun mapNonEmpty!41593 () Bool)

(declare-fun mapRes!41593 () Bool)

(declare-fun tp!79519 () Bool)

(declare-fun e!620375 () Bool)

(assert (=> mapNonEmpty!41593 (= mapRes!41593 (and tp!79519 e!620375))))

(declare-fun mapRest!41593 () (Array (_ BitVec 32) ValueCell!12570))

(declare-fun mapValue!41593 () ValueCell!12570)

(declare-fun mapKey!41593 () (_ BitVec 32))

(assert (=> mapNonEmpty!41593 (= (arr!33701 _values!874) (store mapRest!41593 mapKey!41593 mapValue!41593))))

(declare-fun b!1085988 () Bool)

(declare-fun res!724108 () Bool)

(assert (=> b!1085988 (=> (not res!724108) (not e!620373))))

(assert (=> b!1085988 (= res!724108 (and (= (size!34237 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34236 _keys!1070) (size!34237 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!724107 () Bool)

(assert (=> start!95904 (=> (not res!724107) (not e!620373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95904 (= res!724107 (validMask!0 mask!1414))))

(assert (=> start!95904 e!620373))

(assert (=> start!95904 tp!79520))

(assert (=> start!95904 true))

(declare-fun tp_is_empty!26559 () Bool)

(assert (=> start!95904 tp_is_empty!26559))

(declare-fun array_inv!26006 (array!70053) Bool)

(assert (=> start!95904 (array_inv!26006 _keys!1070)))

(declare-fun e!620374 () Bool)

(declare-fun array_inv!26007 (array!70055) Bool)

(assert (=> start!95904 (and (array_inv!26007 _values!874) e!620374)))

(declare-fun b!1085989 () Bool)

(declare-fun e!620376 () Bool)

(assert (=> b!1085989 (= e!620377 e!620376)))

(declare-fun res!724106 () Bool)

(assert (=> b!1085989 (=> res!724106 e!620376)))

(assert (=> b!1085989 (= res!724106 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482318 () ListLongMap!14883)

(declare-fun lt!482324 () ListLongMap!14883)

(assert (=> b!1085989 (= lt!482318 lt!482324)))

(declare-fun lt!482320 () ListLongMap!14883)

(assert (=> b!1085989 (= lt!482318 (-!783 lt!482320 k0!904))))

(declare-fun lt!482332 () Unit!35732)

(declare-fun addRemoveCommutativeForDiffKeys!21 (ListLongMap!14883 (_ BitVec 64) V!40539 (_ BitVec 64)) Unit!35732)

(assert (=> b!1085989 (= lt!482332 (addRemoveCommutativeForDiffKeys!21 lt!482330 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482317 () tuple2!16914)

(declare-fun +!3265 (ListLongMap!14883 tuple2!16914) ListLongMap!14883)

(assert (=> b!1085989 (= lt!482327 (+!3265 lt!482324 lt!482317))))

(declare-fun lt!482321 () tuple2!16914)

(assert (=> b!1085989 (= lt!482324 (+!3265 lt!482326 lt!482321))))

(declare-fun lt!482322 () ListLongMap!14883)

(assert (=> b!1085989 (= lt!482331 lt!482322)))

(assert (=> b!1085989 (= lt!482322 (+!3265 lt!482320 lt!482317))))

(assert (=> b!1085989 (= lt!482320 (+!3265 lt!482330 lt!482321))))

(assert (=> b!1085989 (= lt!482327 (+!3265 (+!3265 lt!482329 lt!482321) lt!482317))))

(assert (=> b!1085989 (= lt!482317 (tuple2!16915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085989 (= lt!482321 (tuple2!16915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085990 () Bool)

(declare-fun res!724113 () Bool)

(assert (=> b!1085990 (=> (not res!724113) (not e!620371))))

(assert (=> b!1085990 (= res!724113 (arrayNoDuplicates!0 lt!482316 #b00000000000000000000000000000000 Nil!23500))))

(declare-fun b!1085991 () Bool)

(declare-fun res!724114 () Bool)

(assert (=> b!1085991 (=> (not res!724114) (not e!620373))))

(assert (=> b!1085991 (= res!724114 (= (select (arr!33700 _keys!1070) i!650) k0!904))))

(declare-fun b!1085992 () Bool)

(declare-fun res!724111 () Bool)

(assert (=> b!1085992 (=> (not res!724111) (not e!620373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085992 (= res!724111 (validKeyInArray!0 k0!904))))

(declare-fun b!1085993 () Bool)

(assert (=> b!1085993 (= e!620376 (bvsle #b00000000000000000000000000000000 (size!34236 _keys!1070)))))

(assert (=> b!1085993 (= (-!783 lt!482322 k0!904) (+!3265 lt!482318 lt!482317))))

(declare-fun lt!482328 () Unit!35732)

(assert (=> b!1085993 (= lt!482328 (addRemoveCommutativeForDiffKeys!21 lt!482320 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085994 () Bool)

(assert (=> b!1085994 (= e!620373 e!620371)))

(declare-fun res!724112 () Bool)

(assert (=> b!1085994 (=> (not res!724112) (not e!620371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70053 (_ BitVec 32)) Bool)

(assert (=> b!1085994 (= res!724112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482316 mask!1414))))

(assert (=> b!1085994 (= lt!482316 (array!70054 (store (arr!33700 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34236 _keys!1070)))))

(declare-fun b!1085995 () Bool)

(declare-fun e!620372 () Bool)

(assert (=> b!1085995 (= e!620374 (and e!620372 mapRes!41593))))

(declare-fun condMapEmpty!41593 () Bool)

(declare-fun mapDefault!41593 () ValueCell!12570)

(assert (=> b!1085995 (= condMapEmpty!41593 (= (arr!33701 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12570)) mapDefault!41593)))))

(declare-fun b!1085996 () Bool)

(assert (=> b!1085996 (= e!620375 tp_is_empty!26559)))

(declare-fun b!1085997 () Bool)

(declare-fun res!724109 () Bool)

(assert (=> b!1085997 (=> (not res!724109) (not e!620373))))

(assert (=> b!1085997 (= res!724109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41593 () Bool)

(assert (=> mapIsEmpty!41593 mapRes!41593))

(declare-fun b!1085998 () Bool)

(assert (=> b!1085998 (= e!620372 tp_is_empty!26559)))

(assert (= (and start!95904 res!724107) b!1085988))

(assert (= (and b!1085988 res!724108) b!1085997))

(assert (= (and b!1085997 res!724109) b!1085987))

(assert (= (and b!1085987 res!724115) b!1085985))

(assert (= (and b!1085985 res!724116) b!1085992))

(assert (= (and b!1085992 res!724111) b!1085991))

(assert (= (and b!1085991 res!724114) b!1085994))

(assert (= (and b!1085994 res!724112) b!1085990))

(assert (= (and b!1085990 res!724113) b!1085986))

(assert (= (and b!1085986 (not res!724110)) b!1085989))

(assert (= (and b!1085989 (not res!724106)) b!1085993))

(assert (= (and b!1085995 condMapEmpty!41593) mapIsEmpty!41593))

(assert (= (and b!1085995 (not condMapEmpty!41593)) mapNonEmpty!41593))

(get-info :version)

(assert (= (and mapNonEmpty!41593 ((_ is ValueCellFull!12570) mapValue!41593)) b!1085996))

(assert (= (and b!1085995 ((_ is ValueCellFull!12570) mapDefault!41593)) b!1085998))

(assert (= start!95904 b!1085995))

(declare-fun b_lambda!17227 () Bool)

(assert (=> (not b_lambda!17227) (not b!1085986)))

(declare-fun t!33116 () Bool)

(declare-fun tb!7435 () Bool)

(assert (=> (and start!95904 (= defaultEntry!882 defaultEntry!882) t!33116) tb!7435))

(declare-fun result!15389 () Bool)

(assert (=> tb!7435 (= result!15389 tp_is_empty!26559)))

(assert (=> b!1085986 t!33116))

(declare-fun b_and!35791 () Bool)

(assert (= b_and!35789 (and (=> t!33116 result!15389) b_and!35791)))

(declare-fun m!1004279 () Bool)

(assert (=> b!1085989 m!1004279))

(declare-fun m!1004281 () Bool)

(assert (=> b!1085989 m!1004281))

(declare-fun m!1004283 () Bool)

(assert (=> b!1085989 m!1004283))

(declare-fun m!1004285 () Bool)

(assert (=> b!1085989 m!1004285))

(declare-fun m!1004287 () Bool)

(assert (=> b!1085989 m!1004287))

(declare-fun m!1004289 () Bool)

(assert (=> b!1085989 m!1004289))

(assert (=> b!1085989 m!1004281))

(declare-fun m!1004291 () Bool)

(assert (=> b!1085989 m!1004291))

(declare-fun m!1004293 () Bool)

(assert (=> b!1085989 m!1004293))

(declare-fun m!1004295 () Bool)

(assert (=> mapNonEmpty!41593 m!1004295))

(declare-fun m!1004297 () Bool)

(assert (=> b!1085993 m!1004297))

(declare-fun m!1004299 () Bool)

(assert (=> b!1085993 m!1004299))

(declare-fun m!1004301 () Bool)

(assert (=> b!1085993 m!1004301))

(declare-fun m!1004303 () Bool)

(assert (=> start!95904 m!1004303))

(declare-fun m!1004305 () Bool)

(assert (=> start!95904 m!1004305))

(declare-fun m!1004307 () Bool)

(assert (=> start!95904 m!1004307))

(declare-fun m!1004309 () Bool)

(assert (=> b!1085997 m!1004309))

(declare-fun m!1004311 () Bool)

(assert (=> b!1085992 m!1004311))

(declare-fun m!1004313 () Bool)

(assert (=> b!1085987 m!1004313))

(declare-fun m!1004315 () Bool)

(assert (=> b!1085990 m!1004315))

(declare-fun m!1004317 () Bool)

(assert (=> b!1085994 m!1004317))

(declare-fun m!1004319 () Bool)

(assert (=> b!1085994 m!1004319))

(declare-fun m!1004321 () Bool)

(assert (=> b!1085991 m!1004321))

(declare-fun m!1004323 () Bool)

(assert (=> b!1085986 m!1004323))

(declare-fun m!1004325 () Bool)

(assert (=> b!1085986 m!1004325))

(declare-fun m!1004327 () Bool)

(assert (=> b!1085986 m!1004327))

(declare-fun m!1004329 () Bool)

(assert (=> b!1085986 m!1004329))

(declare-fun m!1004331 () Bool)

(assert (=> b!1085986 m!1004331))

(declare-fun m!1004333 () Bool)

(assert (=> b!1085986 m!1004333))

(declare-fun m!1004335 () Bool)

(assert (=> b!1085986 m!1004335))

(declare-fun m!1004337 () Bool)

(assert (=> b!1085986 m!1004337))

(declare-fun m!1004339 () Bool)

(assert (=> b!1085986 m!1004339))

(declare-fun m!1004341 () Bool)

(assert (=> b!1085986 m!1004341))

(check-sat (not b!1085997) (not b_lambda!17227) (not b!1085989) (not mapNonEmpty!41593) (not b_next!22557) (not start!95904) (not b!1085993) tp_is_empty!26559 (not b!1085994) b_and!35791 (not b!1085990) (not b!1085987) (not b!1085992) (not b!1085986))
(check-sat b_and!35791 (not b_next!22557))
