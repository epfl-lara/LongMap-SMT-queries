; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96120 () Bool)

(assert start!96120)

(declare-fun b_free!22537 () Bool)

(declare-fun b_next!22537 () Bool)

(assert (=> start!96120 (= b_free!22537 (not b_next!22537))))

(declare-fun tp!79459 () Bool)

(declare-fun b_and!35759 () Bool)

(assert (=> start!96120 (= tp!79459 b_and!35759)))

(declare-fun b!1086872 () Bool)

(declare-fun res!724304 () Bool)

(declare-fun e!620988 () Bool)

(assert (=> b!1086872 (=> (not res!724304) (not e!620988))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70051 0))(
  ( (array!70052 (arr!33693 (Array (_ BitVec 32) (_ BitVec 64))) (size!34230 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70051)

(assert (=> b!1086872 (= res!724304 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34230 _keys!1070))))))

(declare-fun mapIsEmpty!41563 () Bool)

(declare-fun mapRes!41563 () Bool)

(assert (=> mapIsEmpty!41563 mapRes!41563))

(declare-fun b!1086873 () Bool)

(declare-fun res!724303 () Bool)

(assert (=> b!1086873 (=> (not res!724303) (not e!620988))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086873 (= res!724303 (validKeyInArray!0 k0!904))))

(declare-fun b!1086874 () Bool)

(declare-fun res!724307 () Bool)

(declare-fun e!620992 () Bool)

(assert (=> b!1086874 (=> (not res!724307) (not e!620992))))

(declare-fun lt!482330 () array!70051)

(declare-datatypes ((List!23504 0))(
  ( (Nil!23501) (Cons!23500 (h!24718 (_ BitVec 64)) (t!33091 List!23504)) )
))
(declare-fun arrayNoDuplicates!0 (array!70051 (_ BitVec 32) List!23504) Bool)

(assert (=> b!1086874 (= res!724307 (arrayNoDuplicates!0 lt!482330 #b00000000000000000000000000000000 Nil!23501))))

(declare-fun mapNonEmpty!41563 () Bool)

(declare-fun tp!79460 () Bool)

(declare-fun e!620986 () Bool)

(assert (=> mapNonEmpty!41563 (= mapRes!41563 (and tp!79460 e!620986))))

(declare-datatypes ((V!40513 0))(
  ( (V!40514 (val!13326 Int)) )
))
(declare-datatypes ((ValueCell!12560 0))(
  ( (ValueCellFull!12560 (v!15943 V!40513)) (EmptyCell!12560) )
))
(declare-fun mapValue!41563 () ValueCell!12560)

(declare-datatypes ((array!70053 0))(
  ( (array!70054 (arr!33694 (Array (_ BitVec 32) ValueCell!12560)) (size!34231 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70053)

(declare-fun mapRest!41563 () (Array (_ BitVec 32) ValueCell!12560))

(declare-fun mapKey!41563 () (_ BitVec 32))

(assert (=> mapNonEmpty!41563 (= (arr!33694 _values!874) (store mapRest!41563 mapKey!41563 mapValue!41563))))

(declare-fun b!1086875 () Bool)

(assert (=> b!1086875 (= e!620988 e!620992)))

(declare-fun res!724301 () Bool)

(assert (=> b!1086875 (=> (not res!724301) (not e!620992))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70051 (_ BitVec 32)) Bool)

(assert (=> b!1086875 (= res!724301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482330 mask!1414))))

(assert (=> b!1086875 (= lt!482330 (array!70052 (store (arr!33693 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34230 _keys!1070)))))

(declare-fun b!1086876 () Bool)

(declare-fun res!724299 () Bool)

(assert (=> b!1086876 (=> (not res!724299) (not e!620988))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086876 (= res!724299 (and (= (size!34231 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34230 _keys!1070) (size!34231 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086877 () Bool)

(declare-fun e!620993 () Bool)

(declare-fun e!620990 () Bool)

(assert (=> b!1086877 (= e!620993 e!620990)))

(declare-fun res!724306 () Bool)

(assert (=> b!1086877 (=> res!724306 e!620990)))

(assert (=> b!1086877 (= res!724306 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16906 0))(
  ( (tuple2!16907 (_1!8464 (_ BitVec 64)) (_2!8464 V!40513)) )
))
(declare-datatypes ((List!23505 0))(
  ( (Nil!23502) (Cons!23501 (h!24719 tuple2!16906) (t!33092 List!23505)) )
))
(declare-datatypes ((ListLongMap!14883 0))(
  ( (ListLongMap!14884 (toList!7457 List!23505)) )
))
(declare-fun lt!482333 () ListLongMap!14883)

(declare-fun lt!482327 () ListLongMap!14883)

(assert (=> b!1086877 (= lt!482333 lt!482327)))

(declare-fun lt!482331 () ListLongMap!14883)

(declare-fun -!769 (ListLongMap!14883 (_ BitVec 64)) ListLongMap!14883)

(assert (=> b!1086877 (= lt!482333 (-!769 lt!482331 k0!904))))

(declare-datatypes ((Unit!35705 0))(
  ( (Unit!35706) )
))
(declare-fun lt!482335 () Unit!35705)

(declare-fun lt!482323 () ListLongMap!14883)

(declare-fun zeroValue!831 () V!40513)

(declare-fun addRemoveCommutativeForDiffKeys!16 (ListLongMap!14883 (_ BitVec 64) V!40513 (_ BitVec 64)) Unit!35705)

(assert (=> b!1086877 (= lt!482335 (addRemoveCommutativeForDiffKeys!16 lt!482323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482337 () ListLongMap!14883)

(declare-fun lt!482328 () tuple2!16906)

(declare-fun +!3282 (ListLongMap!14883 tuple2!16906) ListLongMap!14883)

(assert (=> b!1086877 (= lt!482337 (+!3282 lt!482327 lt!482328))))

(declare-fun lt!482334 () ListLongMap!14883)

(declare-fun lt!482332 () tuple2!16906)

(assert (=> b!1086877 (= lt!482327 (+!3282 lt!482334 lt!482332))))

(declare-fun lt!482324 () ListLongMap!14883)

(declare-fun lt!482326 () ListLongMap!14883)

(assert (=> b!1086877 (= lt!482324 lt!482326)))

(assert (=> b!1086877 (= lt!482326 (+!3282 lt!482331 lt!482328))))

(assert (=> b!1086877 (= lt!482331 (+!3282 lt!482323 lt!482332))))

(declare-fun lt!482322 () ListLongMap!14883)

(assert (=> b!1086877 (= lt!482337 (+!3282 (+!3282 lt!482322 lt!482332) lt!482328))))

(declare-fun minValue!831 () V!40513)

(assert (=> b!1086877 (= lt!482328 (tuple2!16907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086877 (= lt!482332 (tuple2!16907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086878 () Bool)

(declare-fun e!620989 () Bool)

(declare-fun e!620987 () Bool)

(assert (=> b!1086878 (= e!620989 (and e!620987 mapRes!41563))))

(declare-fun condMapEmpty!41563 () Bool)

(declare-fun mapDefault!41563 () ValueCell!12560)

(assert (=> b!1086878 (= condMapEmpty!41563 (= (arr!33694 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12560)) mapDefault!41563)))))

(declare-fun b!1086879 () Bool)

(declare-fun res!724308 () Bool)

(assert (=> b!1086879 (=> (not res!724308) (not e!620988))))

(assert (=> b!1086879 (= res!724308 (= (select (arr!33693 _keys!1070) i!650) k0!904))))

(declare-fun res!724300 () Bool)

(assert (=> start!96120 (=> (not res!724300) (not e!620988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96120 (= res!724300 (validMask!0 mask!1414))))

(assert (=> start!96120 e!620988))

(assert (=> start!96120 tp!79459))

(assert (=> start!96120 true))

(declare-fun tp_is_empty!26539 () Bool)

(assert (=> start!96120 tp_is_empty!26539))

(declare-fun array_inv!26044 (array!70051) Bool)

(assert (=> start!96120 (array_inv!26044 _keys!1070)))

(declare-fun array_inv!26045 (array!70053) Bool)

(assert (=> start!96120 (and (array_inv!26045 _values!874) e!620989)))

(declare-fun b!1086880 () Bool)

(assert (=> b!1086880 (= e!620990 true)))

(assert (=> b!1086880 (= (-!769 lt!482326 k0!904) (+!3282 lt!482333 lt!482328))))

(declare-fun lt!482329 () Unit!35705)

(assert (=> b!1086880 (= lt!482329 (addRemoveCommutativeForDiffKeys!16 lt!482331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086881 () Bool)

(assert (=> b!1086881 (= e!620992 (not e!620993))))

(declare-fun res!724298 () Bool)

(assert (=> b!1086881 (=> res!724298 e!620993)))

(assert (=> b!1086881 (= res!724298 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4226 (array!70051 array!70053 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1086881 (= lt!482324 (getCurrentListMap!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482325 () array!70053)

(assert (=> b!1086881 (= lt!482337 (getCurrentListMap!4226 lt!482330 lt!482325 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086881 (and (= lt!482322 lt!482334) (= lt!482334 lt!482322))))

(assert (=> b!1086881 (= lt!482334 (-!769 lt!482323 k0!904))))

(declare-fun lt!482321 () Unit!35705)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 (array!70051 array!70053 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35705)

(assert (=> b!1086881 (= lt!482321 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!55 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4031 (array!70051 array!70053 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1086881 (= lt!482322 (getCurrentListMapNoExtraKeys!4031 lt!482330 lt!482325 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2152 (Int (_ BitVec 64)) V!40513)

(assert (=> b!1086881 (= lt!482325 (array!70054 (store (arr!33694 _values!874) i!650 (ValueCellFull!12560 (dynLambda!2152 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34231 _values!874)))))

(assert (=> b!1086881 (= lt!482323 (getCurrentListMapNoExtraKeys!4031 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086881 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482336 () Unit!35705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70051 (_ BitVec 64) (_ BitVec 32)) Unit!35705)

(assert (=> b!1086881 (= lt!482336 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086882 () Bool)

(assert (=> b!1086882 (= e!620986 tp_is_empty!26539)))

(declare-fun b!1086883 () Bool)

(declare-fun res!724305 () Bool)

(assert (=> b!1086883 (=> (not res!724305) (not e!620988))))

(assert (=> b!1086883 (= res!724305 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23501))))

(declare-fun b!1086884 () Bool)

(declare-fun res!724302 () Bool)

(assert (=> b!1086884 (=> (not res!724302) (not e!620988))))

(assert (=> b!1086884 (= res!724302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086885 () Bool)

(assert (=> b!1086885 (= e!620987 tp_is_empty!26539)))

(assert (= (and start!96120 res!724300) b!1086876))

(assert (= (and b!1086876 res!724299) b!1086884))

(assert (= (and b!1086884 res!724302) b!1086883))

(assert (= (and b!1086883 res!724305) b!1086872))

(assert (= (and b!1086872 res!724304) b!1086873))

(assert (= (and b!1086873 res!724303) b!1086879))

(assert (= (and b!1086879 res!724308) b!1086875))

(assert (= (and b!1086875 res!724301) b!1086874))

(assert (= (and b!1086874 res!724307) b!1086881))

(assert (= (and b!1086881 (not res!724298)) b!1086877))

(assert (= (and b!1086877 (not res!724306)) b!1086880))

(assert (= (and b!1086878 condMapEmpty!41563) mapIsEmpty!41563))

(assert (= (and b!1086878 (not condMapEmpty!41563)) mapNonEmpty!41563))

(get-info :version)

(assert (= (and mapNonEmpty!41563 ((_ is ValueCellFull!12560) mapValue!41563)) b!1086882))

(assert (= (and b!1086878 ((_ is ValueCellFull!12560) mapDefault!41563)) b!1086885))

(assert (= start!96120 b!1086878))

(declare-fun b_lambda!17217 () Bool)

(assert (=> (not b_lambda!17217) (not b!1086881)))

(declare-fun t!33090 () Bool)

(declare-fun tb!7407 () Bool)

(assert (=> (and start!96120 (= defaultEntry!882 defaultEntry!882) t!33090) tb!7407))

(declare-fun result!15341 () Bool)

(assert (=> tb!7407 (= result!15341 tp_is_empty!26539)))

(assert (=> b!1086881 t!33090))

(declare-fun b_and!35761 () Bool)

(assert (= b_and!35759 (and (=> t!33090 result!15341) b_and!35761)))

(declare-fun m!1005311 () Bool)

(assert (=> start!96120 m!1005311))

(declare-fun m!1005313 () Bool)

(assert (=> start!96120 m!1005313))

(declare-fun m!1005315 () Bool)

(assert (=> start!96120 m!1005315))

(declare-fun m!1005317 () Bool)

(assert (=> b!1086873 m!1005317))

(declare-fun m!1005319 () Bool)

(assert (=> b!1086880 m!1005319))

(declare-fun m!1005321 () Bool)

(assert (=> b!1086880 m!1005321))

(declare-fun m!1005323 () Bool)

(assert (=> b!1086880 m!1005323))

(declare-fun m!1005325 () Bool)

(assert (=> b!1086877 m!1005325))

(declare-fun m!1005327 () Bool)

(assert (=> b!1086877 m!1005327))

(declare-fun m!1005329 () Bool)

(assert (=> b!1086877 m!1005329))

(declare-fun m!1005331 () Bool)

(assert (=> b!1086877 m!1005331))

(declare-fun m!1005333 () Bool)

(assert (=> b!1086877 m!1005333))

(declare-fun m!1005335 () Bool)

(assert (=> b!1086877 m!1005335))

(declare-fun m!1005337 () Bool)

(assert (=> b!1086877 m!1005337))

(declare-fun m!1005339 () Bool)

(assert (=> b!1086877 m!1005339))

(assert (=> b!1086877 m!1005333))

(declare-fun m!1005341 () Bool)

(assert (=> mapNonEmpty!41563 m!1005341))

(declare-fun m!1005343 () Bool)

(assert (=> b!1086881 m!1005343))

(declare-fun m!1005345 () Bool)

(assert (=> b!1086881 m!1005345))

(declare-fun m!1005347 () Bool)

(assert (=> b!1086881 m!1005347))

(declare-fun m!1005349 () Bool)

(assert (=> b!1086881 m!1005349))

(declare-fun m!1005351 () Bool)

(assert (=> b!1086881 m!1005351))

(declare-fun m!1005353 () Bool)

(assert (=> b!1086881 m!1005353))

(declare-fun m!1005355 () Bool)

(assert (=> b!1086881 m!1005355))

(declare-fun m!1005357 () Bool)

(assert (=> b!1086881 m!1005357))

(declare-fun m!1005359 () Bool)

(assert (=> b!1086881 m!1005359))

(declare-fun m!1005361 () Bool)

(assert (=> b!1086881 m!1005361))

(declare-fun m!1005363 () Bool)

(assert (=> b!1086883 m!1005363))

(declare-fun m!1005365 () Bool)

(assert (=> b!1086879 m!1005365))

(declare-fun m!1005367 () Bool)

(assert (=> b!1086874 m!1005367))

(declare-fun m!1005369 () Bool)

(assert (=> b!1086875 m!1005369))

(declare-fun m!1005371 () Bool)

(assert (=> b!1086875 m!1005371))

(declare-fun m!1005373 () Bool)

(assert (=> b!1086884 m!1005373))

(check-sat (not b!1086881) (not mapNonEmpty!41563) tp_is_empty!26539 (not b_lambda!17217) (not start!96120) (not b!1086875) (not b!1086880) (not b!1086873) (not b_next!22537) (not b!1086877) (not b!1086884) (not b!1086874) (not b!1086883) b_and!35761)
(check-sat b_and!35761 (not b_next!22537))
