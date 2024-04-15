; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95950 () Bool)

(assert start!95950)

(declare-fun b_free!22609 () Bool)

(declare-fun b_next!22609 () Bool)

(assert (=> start!95950 (= b_free!22609 (not b_next!22609))))

(declare-fun tp!79675 () Bool)

(declare-fun b_and!35867 () Bool)

(assert (=> start!95950 (= tp!79675 b_and!35867)))

(declare-fun b!1086976 () Bool)

(declare-fun res!724898 () Bool)

(declare-fun e!620908 () Bool)

(assert (=> b!1086976 (=> (not res!724898) (not e!620908))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70074 0))(
  ( (array!70075 (arr!33711 (Array (_ BitVec 32) (_ BitVec 64))) (size!34249 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70074)

(assert (=> b!1086976 (= res!724898 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34249 _keys!1070))))))

(declare-fun b!1086977 () Bool)

(declare-fun e!620903 () Bool)

(declare-fun tp_is_empty!26611 () Bool)

(assert (=> b!1086977 (= e!620903 tp_is_empty!26611)))

(declare-fun b!1086978 () Bool)

(declare-fun res!724903 () Bool)

(assert (=> b!1086978 (=> (not res!724903) (not e!620908))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40609 0))(
  ( (V!40610 (val!13362 Int)) )
))
(declare-datatypes ((ValueCell!12596 0))(
  ( (ValueCellFull!12596 (v!15982 V!40609)) (EmptyCell!12596) )
))
(declare-datatypes ((array!70076 0))(
  ( (array!70077 (arr!33712 (Array (_ BitVec 32) ValueCell!12596)) (size!34250 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70076)

(assert (=> b!1086978 (= res!724903 (and (= (size!34250 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34249 _keys!1070) (size!34250 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086979 () Bool)

(declare-fun e!620902 () Bool)

(assert (=> b!1086979 (= e!620908 e!620902)))

(declare-fun res!724902 () Bool)

(assert (=> b!1086979 (=> (not res!724902) (not e!620902))))

(declare-fun lt!483456 () array!70074)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70074 (_ BitVec 32)) Bool)

(assert (=> b!1086979 (= res!724902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483456 mask!1414))))

(assert (=> b!1086979 (= lt!483456 (array!70075 (store (arr!33711 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34249 _keys!1070)))))

(declare-fun b!1086980 () Bool)

(declare-fun e!620904 () Bool)

(assert (=> b!1086980 (= e!620902 (not e!620904))))

(declare-fun res!724901 () Bool)

(assert (=> b!1086980 (=> res!724901 e!620904)))

(assert (=> b!1086980 (= res!724901 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40609)

(declare-datatypes ((tuple2!17012 0))(
  ( (tuple2!17013 (_1!8517 (_ BitVec 64)) (_2!8517 V!40609)) )
))
(declare-datatypes ((List!23581 0))(
  ( (Nil!23578) (Cons!23577 (h!24786 tuple2!17012) (t!33239 List!23581)) )
))
(declare-datatypes ((ListLongMap!14981 0))(
  ( (ListLongMap!14982 (toList!7506 List!23581)) )
))
(declare-fun lt!483452 () ListLongMap!14981)

(declare-fun zeroValue!831 () V!40609)

(declare-fun getCurrentListMap!4190 (array!70074 array!70076 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) Int) ListLongMap!14981)

(assert (=> b!1086980 (= lt!483452 (getCurrentListMap!4190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483444 () array!70076)

(declare-fun lt!483458 () ListLongMap!14981)

(assert (=> b!1086980 (= lt!483458 (getCurrentListMap!4190 lt!483456 lt!483444 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483450 () ListLongMap!14981)

(declare-fun lt!483457 () ListLongMap!14981)

(assert (=> b!1086980 (and (= lt!483450 lt!483457) (= lt!483457 lt!483450))))

(declare-fun lt!483447 () ListLongMap!14981)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!785 (ListLongMap!14981 (_ BitVec 64)) ListLongMap!14981)

(assert (=> b!1086980 (= lt!483457 (-!785 lt!483447 k0!904))))

(declare-datatypes ((Unit!35605 0))(
  ( (Unit!35606) )
))
(declare-fun lt!483442 () Unit!35605)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 (array!70074 array!70076 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35605)

(assert (=> b!1086980 (= lt!483442 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4060 (array!70074 array!70076 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) Int) ListLongMap!14981)

(assert (=> b!1086980 (= lt!483450 (getCurrentListMapNoExtraKeys!4060 lt!483456 lt!483444 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2131 (Int (_ BitVec 64)) V!40609)

(assert (=> b!1086980 (= lt!483444 (array!70077 (store (arr!33712 _values!874) i!650 (ValueCellFull!12596 (dynLambda!2131 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34250 _values!874)))))

(assert (=> b!1086980 (= lt!483447 (getCurrentListMapNoExtraKeys!4060 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086980 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483454 () Unit!35605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70074 (_ BitVec 64) (_ BitVec 32)) Unit!35605)

(assert (=> b!1086980 (= lt!483454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086981 () Bool)

(declare-fun e!620907 () Bool)

(declare-fun e!620905 () Bool)

(declare-fun mapRes!41671 () Bool)

(assert (=> b!1086981 (= e!620907 (and e!620905 mapRes!41671))))

(declare-fun condMapEmpty!41671 () Bool)

(declare-fun mapDefault!41671 () ValueCell!12596)

(assert (=> b!1086981 (= condMapEmpty!41671 (= (arr!33712 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12596)) mapDefault!41671)))))

(declare-fun b!1086982 () Bool)

(assert (=> b!1086982 (= e!620905 tp_is_empty!26611)))

(declare-fun b!1086983 () Bool)

(declare-fun res!724900 () Bool)

(assert (=> b!1086983 (=> (not res!724900) (not e!620902))))

(declare-datatypes ((List!23582 0))(
  ( (Nil!23579) (Cons!23578 (h!24787 (_ BitVec 64)) (t!33240 List!23582)) )
))
(declare-fun arrayNoDuplicates!0 (array!70074 (_ BitVec 32) List!23582) Bool)

(assert (=> b!1086983 (= res!724900 (arrayNoDuplicates!0 lt!483456 #b00000000000000000000000000000000 Nil!23579))))

(declare-fun b!1086984 () Bool)

(declare-fun res!724896 () Bool)

(assert (=> b!1086984 (=> (not res!724896) (not e!620908))))

(assert (=> b!1086984 (= res!724896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086985 () Bool)

(declare-fun res!724905 () Bool)

(assert (=> b!1086985 (=> (not res!724905) (not e!620908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086985 (= res!724905 (validKeyInArray!0 k0!904))))

(declare-fun b!1086986 () Bool)

(declare-fun res!724897 () Bool)

(assert (=> b!1086986 (=> (not res!724897) (not e!620908))))

(assert (=> b!1086986 (= res!724897 (= (select (arr!33711 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41671 () Bool)

(assert (=> mapIsEmpty!41671 mapRes!41671))

(declare-fun b!1086987 () Bool)

(declare-fun e!620906 () Bool)

(assert (=> b!1086987 (= e!620904 e!620906)))

(declare-fun res!724895 () Bool)

(assert (=> b!1086987 (=> res!724895 e!620906)))

(assert (=> b!1086987 (= res!724895 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483448 () ListLongMap!14981)

(declare-fun lt!483451 () ListLongMap!14981)

(assert (=> b!1086987 (= lt!483448 lt!483451)))

(declare-fun lt!483453 () ListLongMap!14981)

(assert (=> b!1086987 (= lt!483448 (-!785 lt!483453 k0!904))))

(declare-fun lt!483443 () Unit!35605)

(declare-fun addRemoveCommutativeForDiffKeys!41 (ListLongMap!14981 (_ BitVec 64) V!40609 (_ BitVec 64)) Unit!35605)

(assert (=> b!1086987 (= lt!483443 (addRemoveCommutativeForDiffKeys!41 lt!483447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483449 () tuple2!17012)

(declare-fun +!3312 (ListLongMap!14981 tuple2!17012) ListLongMap!14981)

(assert (=> b!1086987 (= lt!483458 (+!3312 lt!483451 lt!483449))))

(declare-fun lt!483455 () tuple2!17012)

(assert (=> b!1086987 (= lt!483451 (+!3312 lt!483457 lt!483455))))

(declare-fun lt!483445 () ListLongMap!14981)

(assert (=> b!1086987 (= lt!483452 lt!483445)))

(assert (=> b!1086987 (= lt!483445 (+!3312 lt!483453 lt!483449))))

(assert (=> b!1086987 (= lt!483453 (+!3312 lt!483447 lt!483455))))

(assert (=> b!1086987 (= lt!483458 (+!3312 (+!3312 lt!483450 lt!483455) lt!483449))))

(assert (=> b!1086987 (= lt!483449 (tuple2!17013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086987 (= lt!483455 (tuple2!17013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086988 () Bool)

(assert (=> b!1086988 (= e!620906 (bvsle #b00000000000000000000000000000000 (size!34249 _keys!1070)))))

(assert (=> b!1086988 (= (-!785 lt!483445 k0!904) (+!3312 lt!483448 lt!483449))))

(declare-fun lt!483446 () Unit!35605)

(assert (=> b!1086988 (= lt!483446 (addRemoveCommutativeForDiffKeys!41 lt!483453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!724899 () Bool)

(assert (=> start!95950 (=> (not res!724899) (not e!620908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95950 (= res!724899 (validMask!0 mask!1414))))

(assert (=> start!95950 e!620908))

(assert (=> start!95950 tp!79675))

(assert (=> start!95950 true))

(assert (=> start!95950 tp_is_empty!26611))

(declare-fun array_inv!26054 (array!70074) Bool)

(assert (=> start!95950 (array_inv!26054 _keys!1070)))

(declare-fun array_inv!26055 (array!70076) Bool)

(assert (=> start!95950 (and (array_inv!26055 _values!874) e!620907)))

(declare-fun b!1086989 () Bool)

(declare-fun res!724904 () Bool)

(assert (=> b!1086989 (=> (not res!724904) (not e!620908))))

(assert (=> b!1086989 (= res!724904 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23579))))

(declare-fun mapNonEmpty!41671 () Bool)

(declare-fun tp!79676 () Bool)

(assert (=> mapNonEmpty!41671 (= mapRes!41671 (and tp!79676 e!620903))))

(declare-fun mapKey!41671 () (_ BitVec 32))

(declare-fun mapRest!41671 () (Array (_ BitVec 32) ValueCell!12596))

(declare-fun mapValue!41671 () ValueCell!12596)

(assert (=> mapNonEmpty!41671 (= (arr!33712 _values!874) (store mapRest!41671 mapKey!41671 mapValue!41671))))

(assert (= (and start!95950 res!724899) b!1086978))

(assert (= (and b!1086978 res!724903) b!1086984))

(assert (= (and b!1086984 res!724896) b!1086989))

(assert (= (and b!1086989 res!724904) b!1086976))

(assert (= (and b!1086976 res!724898) b!1086985))

(assert (= (and b!1086985 res!724905) b!1086986))

(assert (= (and b!1086986 res!724897) b!1086979))

(assert (= (and b!1086979 res!724902) b!1086983))

(assert (= (and b!1086983 res!724900) b!1086980))

(assert (= (and b!1086980 (not res!724901)) b!1086987))

(assert (= (and b!1086987 (not res!724895)) b!1086988))

(assert (= (and b!1086981 condMapEmpty!41671) mapIsEmpty!41671))

(assert (= (and b!1086981 (not condMapEmpty!41671)) mapNonEmpty!41671))

(get-info :version)

(assert (= (and mapNonEmpty!41671 ((_ is ValueCellFull!12596) mapValue!41671)) b!1086977))

(assert (= (and b!1086981 ((_ is ValueCellFull!12596) mapDefault!41671)) b!1086982))

(assert (= start!95950 b!1086981))

(declare-fun b_lambda!17257 () Bool)

(assert (=> (not b_lambda!17257) (not b!1086980)))

(declare-fun t!33238 () Bool)

(declare-fun tb!7479 () Bool)

(assert (=> (and start!95950 (= defaultEntry!882 defaultEntry!882) t!33238) tb!7479))

(declare-fun result!15485 () Bool)

(assert (=> tb!7479 (= result!15485 tp_is_empty!26611)))

(assert (=> b!1086980 t!33238))

(declare-fun b_and!35869 () Bool)

(assert (= b_and!35867 (and (=> t!33238 result!15485) b_and!35869)))

(declare-fun m!1005317 () Bool)

(assert (=> b!1086980 m!1005317))

(declare-fun m!1005319 () Bool)

(assert (=> b!1086980 m!1005319))

(declare-fun m!1005321 () Bool)

(assert (=> b!1086980 m!1005321))

(declare-fun m!1005323 () Bool)

(assert (=> b!1086980 m!1005323))

(declare-fun m!1005325 () Bool)

(assert (=> b!1086980 m!1005325))

(declare-fun m!1005327 () Bool)

(assert (=> b!1086980 m!1005327))

(declare-fun m!1005329 () Bool)

(assert (=> b!1086980 m!1005329))

(declare-fun m!1005331 () Bool)

(assert (=> b!1086980 m!1005331))

(declare-fun m!1005333 () Bool)

(assert (=> b!1086980 m!1005333))

(declare-fun m!1005335 () Bool)

(assert (=> b!1086980 m!1005335))

(declare-fun m!1005337 () Bool)

(assert (=> b!1086987 m!1005337))

(declare-fun m!1005339 () Bool)

(assert (=> b!1086987 m!1005339))

(declare-fun m!1005341 () Bool)

(assert (=> b!1086987 m!1005341))

(declare-fun m!1005343 () Bool)

(assert (=> b!1086987 m!1005343))

(declare-fun m!1005345 () Bool)

(assert (=> b!1086987 m!1005345))

(assert (=> b!1086987 m!1005341))

(declare-fun m!1005347 () Bool)

(assert (=> b!1086987 m!1005347))

(declare-fun m!1005349 () Bool)

(assert (=> b!1086987 m!1005349))

(declare-fun m!1005351 () Bool)

(assert (=> b!1086987 m!1005351))

(declare-fun m!1005353 () Bool)

(assert (=> b!1086988 m!1005353))

(declare-fun m!1005355 () Bool)

(assert (=> b!1086988 m!1005355))

(declare-fun m!1005357 () Bool)

(assert (=> b!1086988 m!1005357))

(declare-fun m!1005359 () Bool)

(assert (=> start!95950 m!1005359))

(declare-fun m!1005361 () Bool)

(assert (=> start!95950 m!1005361))

(declare-fun m!1005363 () Bool)

(assert (=> start!95950 m!1005363))

(declare-fun m!1005365 () Bool)

(assert (=> b!1086986 m!1005365))

(declare-fun m!1005367 () Bool)

(assert (=> b!1086989 m!1005367))

(declare-fun m!1005369 () Bool)

(assert (=> b!1086985 m!1005369))

(declare-fun m!1005371 () Bool)

(assert (=> b!1086979 m!1005371))

(declare-fun m!1005373 () Bool)

(assert (=> b!1086979 m!1005373))

(declare-fun m!1005375 () Bool)

(assert (=> b!1086983 m!1005375))

(declare-fun m!1005377 () Bool)

(assert (=> b!1086984 m!1005377))

(declare-fun m!1005379 () Bool)

(assert (=> mapNonEmpty!41671 m!1005379))

(check-sat (not b!1086988) (not b_next!22609) (not b!1086979) tp_is_empty!26611 b_and!35869 (not b!1086980) (not mapNonEmpty!41671) (not b!1086984) (not b!1086985) (not b_lambda!17257) (not b!1086989) (not start!95950) (not b!1086983) (not b!1086987))
(check-sat b_and!35869 (not b_next!22609))
