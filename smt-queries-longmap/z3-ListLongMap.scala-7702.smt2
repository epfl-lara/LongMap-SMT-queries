; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96744 () Bool)

(assert start!96744)

(declare-fun b_free!23139 () Bool)

(declare-fun b_next!23139 () Bool)

(assert (=> start!96744 (= b_free!23139 (not b_next!23139))))

(declare-fun tp!81364 () Bool)

(declare-fun b_and!37039 () Bool)

(assert (=> start!96744 (= tp!81364 b_and!37039)))

(declare-fun b!1100338 () Bool)

(declare-fun e!628049 () Bool)

(declare-fun e!628047 () Bool)

(assert (=> b!1100338 (= e!628049 (not e!628047))))

(declare-fun res!734245 () Bool)

(assert (=> b!1100338 (=> res!734245 e!628047)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100338 (= res!734245 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41379 0))(
  ( (V!41380 (val!13651 Int)) )
))
(declare-fun minValue!831 () V!41379)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17354 0))(
  ( (tuple2!17355 (_1!8688 (_ BitVec 64)) (_2!8688 V!41379)) )
))
(declare-datatypes ((List!23971 0))(
  ( (Nil!23968) (Cons!23967 (h!25176 tuple2!17354) (t!34156 List!23971)) )
))
(declare-datatypes ((ListLongMap!15323 0))(
  ( (ListLongMap!15324 (toList!7677 List!23971)) )
))
(declare-fun lt!492971 () ListLongMap!15323)

(declare-fun zeroValue!831 () V!41379)

(declare-datatypes ((array!71297 0))(
  ( (array!71298 (arr!34313 (Array (_ BitVec 32) (_ BitVec 64))) (size!34849 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71297)

(declare-datatypes ((ValueCell!12885 0))(
  ( (ValueCellFull!12885 (v!16279 V!41379)) (EmptyCell!12885) )
))
(declare-datatypes ((array!71299 0))(
  ( (array!71300 (arr!34314 (Array (_ BitVec 32) ValueCell!12885)) (size!34850 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71299)

(declare-fun getCurrentListMap!4388 (array!71297 array!71299 (_ BitVec 32) (_ BitVec 32) V!41379 V!41379 (_ BitVec 32) Int) ListLongMap!15323)

(assert (=> b!1100338 (= lt!492971 (getCurrentListMap!4388 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492974 () ListLongMap!15323)

(declare-fun lt!492976 () array!71297)

(declare-fun lt!492972 () array!71299)

(assert (=> b!1100338 (= lt!492974 (getCurrentListMap!4388 lt!492976 lt!492972 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492973 () ListLongMap!15323)

(declare-fun lt!492970 () ListLongMap!15323)

(assert (=> b!1100338 (and (= lt!492973 lt!492970) (= lt!492970 lt!492973))))

(declare-fun lt!492969 () ListLongMap!15323)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!963 (ListLongMap!15323 (_ BitVec 64)) ListLongMap!15323)

(assert (=> b!1100338 (= lt!492970 (-!963 lt!492969 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36172 0))(
  ( (Unit!36173) )
))
(declare-fun lt!492967 () Unit!36172)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!214 (array!71297 array!71299 (_ BitVec 32) (_ BitVec 32) V!41379 V!41379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36172)

(assert (=> b!1100338 (= lt!492967 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4184 (array!71297 array!71299 (_ BitVec 32) (_ BitVec 32) V!41379 V!41379 (_ BitVec 32) Int) ListLongMap!15323)

(assert (=> b!1100338 (= lt!492973 (getCurrentListMapNoExtraKeys!4184 lt!492976 lt!492972 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2319 (Int (_ BitVec 64)) V!41379)

(assert (=> b!1100338 (= lt!492972 (array!71300 (store (arr!34314 _values!874) i!650 (ValueCellFull!12885 (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34850 _values!874)))))

(assert (=> b!1100338 (= lt!492969 (getCurrentListMapNoExtraKeys!4184 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100338 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492977 () Unit!36172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71297 (_ BitVec 64) (_ BitVec 32)) Unit!36172)

(assert (=> b!1100338 (= lt!492977 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100339 () Bool)

(declare-fun res!734238 () Bool)

(assert (=> b!1100339 (=> (not res!734238) (not e!628049))))

(declare-datatypes ((List!23972 0))(
  ( (Nil!23969) (Cons!23968 (h!25177 (_ BitVec 64)) (t!34157 List!23972)) )
))
(declare-fun arrayNoDuplicates!0 (array!71297 (_ BitVec 32) List!23972) Bool)

(assert (=> b!1100339 (= res!734238 (arrayNoDuplicates!0 lt!492976 #b00000000000000000000000000000000 Nil!23969))))

(declare-fun res!734240 () Bool)

(declare-fun e!628048 () Bool)

(assert (=> start!96744 (=> (not res!734240) (not e!628048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96744 (= res!734240 (validMask!0 mask!1414))))

(assert (=> start!96744 e!628048))

(assert (=> start!96744 tp!81364))

(assert (=> start!96744 true))

(declare-fun tp_is_empty!27189 () Bool)

(assert (=> start!96744 tp_is_empty!27189))

(declare-fun array_inv!26430 (array!71297) Bool)

(assert (=> start!96744 (array_inv!26430 _keys!1070)))

(declare-fun e!628050 () Bool)

(declare-fun array_inv!26431 (array!71299) Bool)

(assert (=> start!96744 (and (array_inv!26431 _values!874) e!628050)))

(declare-fun b!1100340 () Bool)

(declare-fun e!628046 () Bool)

(assert (=> b!1100340 (= e!628046 true)))

(declare-fun lt!492966 () ListLongMap!15323)

(declare-fun lt!492968 () ListLongMap!15323)

(assert (=> b!1100340 (= (-!963 lt!492966 k0!904) lt!492968)))

(declare-fun lt!492975 () Unit!36172)

(declare-fun addRemoveCommutativeForDiffKeys!126 (ListLongMap!15323 (_ BitVec 64) V!41379 (_ BitVec 64)) Unit!36172)

(assert (=> b!1100340 (= lt!492975 (addRemoveCommutativeForDiffKeys!126 lt!492969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun mapNonEmpty!42565 () Bool)

(declare-fun mapRes!42565 () Bool)

(declare-fun tp!81365 () Bool)

(declare-fun e!628045 () Bool)

(assert (=> mapNonEmpty!42565 (= mapRes!42565 (and tp!81365 e!628045))))

(declare-fun mapKey!42565 () (_ BitVec 32))

(declare-fun mapValue!42565 () ValueCell!12885)

(declare-fun mapRest!42565 () (Array (_ BitVec 32) ValueCell!12885))

(assert (=> mapNonEmpty!42565 (= (arr!34314 _values!874) (store mapRest!42565 mapKey!42565 mapValue!42565))))

(declare-fun b!1100341 () Bool)

(declare-fun res!734246 () Bool)

(assert (=> b!1100341 (=> (not res!734246) (not e!628048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71297 (_ BitVec 32)) Bool)

(assert (=> b!1100341 (= res!734246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100342 () Bool)

(assert (=> b!1100342 (= e!628048 e!628049)))

(declare-fun res!734243 () Bool)

(assert (=> b!1100342 (=> (not res!734243) (not e!628049))))

(assert (=> b!1100342 (= res!734243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492976 mask!1414))))

(assert (=> b!1100342 (= lt!492976 (array!71298 (store (arr!34313 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34849 _keys!1070)))))

(declare-fun b!1100343 () Bool)

(declare-fun res!734244 () Bool)

(assert (=> b!1100343 (=> (not res!734244) (not e!628048))))

(assert (=> b!1100343 (= res!734244 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34849 _keys!1070))))))

(declare-fun b!1100344 () Bool)

(assert (=> b!1100344 (= e!628045 tp_is_empty!27189)))

(declare-fun b!1100345 () Bool)

(assert (=> b!1100345 (= e!628047 e!628046)))

(declare-fun res!734242 () Bool)

(assert (=> b!1100345 (=> res!734242 e!628046)))

(assert (=> b!1100345 (= res!734242 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1100345 (= lt!492974 lt!492968)))

(declare-fun lt!492978 () tuple2!17354)

(declare-fun +!3384 (ListLongMap!15323 tuple2!17354) ListLongMap!15323)

(assert (=> b!1100345 (= lt!492968 (+!3384 lt!492970 lt!492978))))

(assert (=> b!1100345 (= lt!492971 lt!492966)))

(assert (=> b!1100345 (= lt!492966 (+!3384 lt!492969 lt!492978))))

(assert (=> b!1100345 (= lt!492974 (+!3384 lt!492973 lt!492978))))

(assert (=> b!1100345 (= lt!492978 (tuple2!17355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!42565 () Bool)

(assert (=> mapIsEmpty!42565 mapRes!42565))

(declare-fun b!1100346 () Bool)

(declare-fun e!628043 () Bool)

(assert (=> b!1100346 (= e!628050 (and e!628043 mapRes!42565))))

(declare-fun condMapEmpty!42565 () Bool)

(declare-fun mapDefault!42565 () ValueCell!12885)

(assert (=> b!1100346 (= condMapEmpty!42565 (= (arr!34314 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12885)) mapDefault!42565)))))

(declare-fun b!1100347 () Bool)

(declare-fun res!734241 () Bool)

(assert (=> b!1100347 (=> (not res!734241) (not e!628048))))

(assert (=> b!1100347 (= res!734241 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23969))))

(declare-fun b!1100348 () Bool)

(assert (=> b!1100348 (= e!628043 tp_is_empty!27189)))

(declare-fun b!1100349 () Bool)

(declare-fun res!734239 () Bool)

(assert (=> b!1100349 (=> (not res!734239) (not e!628048))))

(assert (=> b!1100349 (= res!734239 (= (select (arr!34313 _keys!1070) i!650) k0!904))))

(declare-fun b!1100350 () Bool)

(declare-fun res!734237 () Bool)

(assert (=> b!1100350 (=> (not res!734237) (not e!628048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100350 (= res!734237 (validKeyInArray!0 k0!904))))

(declare-fun b!1100351 () Bool)

(declare-fun res!734236 () Bool)

(assert (=> b!1100351 (=> (not res!734236) (not e!628048))))

(assert (=> b!1100351 (= res!734236 (and (= (size!34850 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34849 _keys!1070) (size!34850 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96744 res!734240) b!1100351))

(assert (= (and b!1100351 res!734236) b!1100341))

(assert (= (and b!1100341 res!734246) b!1100347))

(assert (= (and b!1100347 res!734241) b!1100343))

(assert (= (and b!1100343 res!734244) b!1100350))

(assert (= (and b!1100350 res!734237) b!1100349))

(assert (= (and b!1100349 res!734239) b!1100342))

(assert (= (and b!1100342 res!734243) b!1100339))

(assert (= (and b!1100339 res!734238) b!1100338))

(assert (= (and b!1100338 (not res!734245)) b!1100345))

(assert (= (and b!1100345 (not res!734242)) b!1100340))

(assert (= (and b!1100346 condMapEmpty!42565) mapIsEmpty!42565))

(assert (= (and b!1100346 (not condMapEmpty!42565)) mapNonEmpty!42565))

(get-info :version)

(assert (= (and mapNonEmpty!42565 ((_ is ValueCellFull!12885) mapValue!42565)) b!1100344))

(assert (= (and b!1100346 ((_ is ValueCellFull!12885) mapDefault!42565)) b!1100348))

(assert (= start!96744 b!1100346))

(declare-fun b_lambda!18007 () Bool)

(assert (=> (not b_lambda!18007) (not b!1100338)))

(declare-fun t!34155 () Bool)

(declare-fun tb!8005 () Bool)

(assert (=> (and start!96744 (= defaultEntry!882 defaultEntry!882) t!34155) tb!8005))

(declare-fun result!16547 () Bool)

(assert (=> tb!8005 (= result!16547 tp_is_empty!27189)))

(assert (=> b!1100338 t!34155))

(declare-fun b_and!37041 () Bool)

(assert (= b_and!37039 (and (=> t!34155 result!16547) b_and!37041)))

(declare-fun m!1020389 () Bool)

(assert (=> b!1100341 m!1020389))

(declare-fun m!1020391 () Bool)

(assert (=> mapNonEmpty!42565 m!1020391))

(declare-fun m!1020393 () Bool)

(assert (=> b!1100349 m!1020393))

(declare-fun m!1020395 () Bool)

(assert (=> b!1100342 m!1020395))

(declare-fun m!1020397 () Bool)

(assert (=> b!1100342 m!1020397))

(declare-fun m!1020399 () Bool)

(assert (=> b!1100339 m!1020399))

(declare-fun m!1020401 () Bool)

(assert (=> start!96744 m!1020401))

(declare-fun m!1020403 () Bool)

(assert (=> start!96744 m!1020403))

(declare-fun m!1020405 () Bool)

(assert (=> start!96744 m!1020405))

(declare-fun m!1020407 () Bool)

(assert (=> b!1100338 m!1020407))

(declare-fun m!1020409 () Bool)

(assert (=> b!1100338 m!1020409))

(declare-fun m!1020411 () Bool)

(assert (=> b!1100338 m!1020411))

(declare-fun m!1020413 () Bool)

(assert (=> b!1100338 m!1020413))

(declare-fun m!1020415 () Bool)

(assert (=> b!1100338 m!1020415))

(declare-fun m!1020417 () Bool)

(assert (=> b!1100338 m!1020417))

(declare-fun m!1020419 () Bool)

(assert (=> b!1100338 m!1020419))

(declare-fun m!1020421 () Bool)

(assert (=> b!1100338 m!1020421))

(declare-fun m!1020423 () Bool)

(assert (=> b!1100338 m!1020423))

(declare-fun m!1020425 () Bool)

(assert (=> b!1100338 m!1020425))

(declare-fun m!1020427 () Bool)

(assert (=> b!1100340 m!1020427))

(declare-fun m!1020429 () Bool)

(assert (=> b!1100340 m!1020429))

(declare-fun m!1020431 () Bool)

(assert (=> b!1100345 m!1020431))

(declare-fun m!1020433 () Bool)

(assert (=> b!1100345 m!1020433))

(declare-fun m!1020435 () Bool)

(assert (=> b!1100345 m!1020435))

(declare-fun m!1020437 () Bool)

(assert (=> b!1100347 m!1020437))

(declare-fun m!1020439 () Bool)

(assert (=> b!1100350 m!1020439))

(check-sat b_and!37041 (not b!1100338) (not b!1100339) (not b!1100341) (not b_next!23139) (not b_lambda!18007) (not b!1100340) (not b!1100345) (not b!1100347) tp_is_empty!27189 (not b!1100342) (not b!1100350) (not mapNonEmpty!42565) (not start!96744))
(check-sat b_and!37041 (not b_next!23139))
