; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96904 () Bool)

(assert start!96904)

(declare-fun b_free!23203 () Bool)

(declare-fun b_next!23203 () Bool)

(assert (=> start!96904 (= b_free!23203 (not b_next!23203))))

(declare-fun tp!81568 () Bool)

(declare-fun b_and!37197 () Bool)

(assert (=> start!96904 (= tp!81568 b_and!37197)))

(declare-fun b!1102352 () Bool)

(declare-fun res!735542 () Bool)

(declare-fun e!629197 () Bool)

(assert (=> b!1102352 (=> (not res!735542) (not e!629197))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102352 (= res!735542 (validKeyInArray!0 k0!904))))

(declare-fun b!1102353 () Bool)

(declare-fun res!735547 () Bool)

(assert (=> b!1102353 (=> (not res!735547) (not e!629197))))

(declare-datatypes ((array!71336 0))(
  ( (array!71337 (arr!34329 (Array (_ BitVec 32) (_ BitVec 64))) (size!34867 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71336)

(declare-datatypes ((List!24056 0))(
  ( (Nil!24053) (Cons!24052 (h!25261 (_ BitVec 64)) (t!34296 List!24056)) )
))
(declare-fun arrayNoDuplicates!0 (array!71336 (_ BitVec 32) List!24056) Bool)

(assert (=> b!1102353 (= res!735547 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24053))))

(declare-fun b!1102354 () Bool)

(declare-fun res!735544 () Bool)

(assert (=> b!1102354 (=> (not res!735544) (not e!629197))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41465 0))(
  ( (V!41466 (val!13683 Int)) )
))
(declare-datatypes ((ValueCell!12917 0))(
  ( (ValueCellFull!12917 (v!16313 V!41465)) (EmptyCell!12917) )
))
(declare-datatypes ((array!71338 0))(
  ( (array!71339 (arr!34330 (Array (_ BitVec 32) ValueCell!12917)) (size!34868 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71338)

(assert (=> b!1102354 (= res!735544 (and (= (size!34868 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34867 _keys!1070) (size!34868 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!735549 () Bool)

(assert (=> start!96904 (=> (not res!735549) (not e!629197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96904 (= res!735549 (validMask!0 mask!1414))))

(assert (=> start!96904 e!629197))

(assert (=> start!96904 tp!81568))

(assert (=> start!96904 true))

(declare-fun tp_is_empty!27253 () Bool)

(assert (=> start!96904 tp_is_empty!27253))

(declare-fun array_inv!26476 (array!71336) Bool)

(assert (=> start!96904 (array_inv!26476 _keys!1070)))

(declare-fun e!629200 () Bool)

(declare-fun array_inv!26477 (array!71338) Bool)

(assert (=> start!96904 (and (array_inv!26477 _values!874) e!629200)))

(declare-fun b!1102355 () Bool)

(declare-fun res!735546 () Bool)

(assert (=> b!1102355 (=> (not res!735546) (not e!629197))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102355 (= res!735546 (= (select (arr!34329 _keys!1070) i!650) k0!904))))

(declare-fun b!1102356 () Bool)

(declare-fun e!629196 () Bool)

(assert (=> b!1102356 (= e!629197 e!629196)))

(declare-fun res!735550 () Bool)

(assert (=> b!1102356 (=> (not res!735550) (not e!629196))))

(declare-fun lt!494469 () array!71336)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71336 (_ BitVec 32)) Bool)

(assert (=> b!1102356 (= res!735550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494469 mask!1414))))

(assert (=> b!1102356 (= lt!494469 (array!71337 (store (arr!34329 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34867 _keys!1070)))))

(declare-fun b!1102357 () Bool)

(declare-fun res!735543 () Bool)

(assert (=> b!1102357 (=> (not res!735543) (not e!629197))))

(assert (=> b!1102357 (= res!735543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42673 () Bool)

(declare-fun mapRes!42673 () Bool)

(assert (=> mapIsEmpty!42673 mapRes!42673))

(declare-fun b!1102358 () Bool)

(declare-fun res!735548 () Bool)

(assert (=> b!1102358 (=> (not res!735548) (not e!629196))))

(assert (=> b!1102358 (= res!735548 (arrayNoDuplicates!0 lt!494469 #b00000000000000000000000000000000 Nil!24053))))

(declare-fun b!1102359 () Bool)

(declare-fun e!629198 () Bool)

(assert (=> b!1102359 (= e!629200 (and e!629198 mapRes!42673))))

(declare-fun condMapEmpty!42673 () Bool)

(declare-fun mapDefault!42673 () ValueCell!12917)

(assert (=> b!1102359 (= condMapEmpty!42673 (= (arr!34330 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12917)) mapDefault!42673)))))

(declare-fun b!1102360 () Bool)

(assert (=> b!1102360 (= e!629196 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41465)

(declare-datatypes ((tuple2!17466 0))(
  ( (tuple2!17467 (_1!8744 (_ BitVec 64)) (_2!8744 V!41465)) )
))
(declare-datatypes ((List!24057 0))(
  ( (Nil!24054) (Cons!24053 (h!25262 tuple2!17466) (t!34297 List!24057)) )
))
(declare-datatypes ((ListLongMap!15435 0))(
  ( (ListLongMap!15436 (toList!7733 List!24057)) )
))
(declare-fun lt!494465 () ListLongMap!15435)

(declare-fun zeroValue!831 () V!41465)

(declare-fun getCurrentListMap!4345 (array!71336 array!71338 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) Int) ListLongMap!15435)

(assert (=> b!1102360 (= lt!494465 (getCurrentListMap!4345 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494462 () ListLongMap!15435)

(declare-fun lt!494467 () array!71338)

(assert (=> b!1102360 (= lt!494462 (getCurrentListMap!4345 lt!494469 lt!494467 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494468 () ListLongMap!15435)

(declare-fun lt!494463 () ListLongMap!15435)

(assert (=> b!1102360 (and (= lt!494468 lt!494463) (= lt!494463 lt!494468))))

(declare-fun lt!494466 () ListLongMap!15435)

(declare-fun -!960 (ListLongMap!15435 (_ BitVec 64)) ListLongMap!15435)

(assert (=> b!1102360 (= lt!494463 (-!960 lt!494466 k0!904))))

(declare-datatypes ((Unit!36049 0))(
  ( (Unit!36050) )
))
(declare-fun lt!494464 () Unit!36049)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!234 (array!71336 array!71338 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36049)

(assert (=> b!1102360 (= lt!494464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4252 (array!71336 array!71338 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) Int) ListLongMap!15435)

(assert (=> b!1102360 (= lt!494468 (getCurrentListMapNoExtraKeys!4252 lt!494469 lt!494467 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2321 (Int (_ BitVec 64)) V!41465)

(assert (=> b!1102360 (= lt!494467 (array!71339 (store (arr!34330 _values!874) i!650 (ValueCellFull!12917 (dynLambda!2321 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34868 _values!874)))))

(assert (=> b!1102360 (= lt!494466 (getCurrentListMapNoExtraKeys!4252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102360 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494470 () Unit!36049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71336 (_ BitVec 64) (_ BitVec 32)) Unit!36049)

(assert (=> b!1102360 (= lt!494470 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42673 () Bool)

(declare-fun tp!81569 () Bool)

(declare-fun e!629195 () Bool)

(assert (=> mapNonEmpty!42673 (= mapRes!42673 (and tp!81569 e!629195))))

(declare-fun mapKey!42673 () (_ BitVec 32))

(declare-fun mapRest!42673 () (Array (_ BitVec 32) ValueCell!12917))

(declare-fun mapValue!42673 () ValueCell!12917)

(assert (=> mapNonEmpty!42673 (= (arr!34330 _values!874) (store mapRest!42673 mapKey!42673 mapValue!42673))))

(declare-fun b!1102361 () Bool)

(assert (=> b!1102361 (= e!629198 tp_is_empty!27253)))

(declare-fun b!1102362 () Bool)

(assert (=> b!1102362 (= e!629195 tp_is_empty!27253)))

(declare-fun b!1102363 () Bool)

(declare-fun res!735545 () Bool)

(assert (=> b!1102363 (=> (not res!735545) (not e!629197))))

(assert (=> b!1102363 (= res!735545 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34867 _keys!1070))))))

(assert (= (and start!96904 res!735549) b!1102354))

(assert (= (and b!1102354 res!735544) b!1102357))

(assert (= (and b!1102357 res!735543) b!1102353))

(assert (= (and b!1102353 res!735547) b!1102363))

(assert (= (and b!1102363 res!735545) b!1102352))

(assert (= (and b!1102352 res!735542) b!1102355))

(assert (= (and b!1102355 res!735546) b!1102356))

(assert (= (and b!1102356 res!735550) b!1102358))

(assert (= (and b!1102358 res!735548) b!1102360))

(assert (= (and b!1102359 condMapEmpty!42673) mapIsEmpty!42673))

(assert (= (and b!1102359 (not condMapEmpty!42673)) mapNonEmpty!42673))

(get-info :version)

(assert (= (and mapNonEmpty!42673 ((_ is ValueCellFull!12917) mapValue!42673)) b!1102362))

(assert (= (and b!1102359 ((_ is ValueCellFull!12917) mapDefault!42673)) b!1102361))

(assert (= start!96904 b!1102359))

(declare-fun b_lambda!18169 () Bool)

(assert (=> (not b_lambda!18169) (not b!1102360)))

(declare-fun t!34295 () Bool)

(declare-fun tb!8061 () Bool)

(assert (=> (and start!96904 (= defaultEntry!882 defaultEntry!882) t!34295) tb!8061))

(declare-fun result!16675 () Bool)

(assert (=> tb!8061 (= result!16675 tp_is_empty!27253)))

(assert (=> b!1102360 t!34295))

(declare-fun b_and!37199 () Bool)

(assert (= b_and!37197 (and (=> t!34295 result!16675) b_and!37199)))

(declare-fun m!1022179 () Bool)

(assert (=> b!1102357 m!1022179))

(declare-fun m!1022181 () Bool)

(assert (=> start!96904 m!1022181))

(declare-fun m!1022183 () Bool)

(assert (=> start!96904 m!1022183))

(declare-fun m!1022185 () Bool)

(assert (=> start!96904 m!1022185))

(declare-fun m!1022187 () Bool)

(assert (=> b!1102360 m!1022187))

(declare-fun m!1022189 () Bool)

(assert (=> b!1102360 m!1022189))

(declare-fun m!1022191 () Bool)

(assert (=> b!1102360 m!1022191))

(declare-fun m!1022193 () Bool)

(assert (=> b!1102360 m!1022193))

(declare-fun m!1022195 () Bool)

(assert (=> b!1102360 m!1022195))

(declare-fun m!1022197 () Bool)

(assert (=> b!1102360 m!1022197))

(declare-fun m!1022199 () Bool)

(assert (=> b!1102360 m!1022199))

(declare-fun m!1022201 () Bool)

(assert (=> b!1102360 m!1022201))

(declare-fun m!1022203 () Bool)

(assert (=> b!1102360 m!1022203))

(declare-fun m!1022205 () Bool)

(assert (=> b!1102360 m!1022205))

(declare-fun m!1022207 () Bool)

(assert (=> b!1102358 m!1022207))

(declare-fun m!1022209 () Bool)

(assert (=> mapNonEmpty!42673 m!1022209))

(declare-fun m!1022211 () Bool)

(assert (=> b!1102356 m!1022211))

(declare-fun m!1022213 () Bool)

(assert (=> b!1102356 m!1022213))

(declare-fun m!1022215 () Bool)

(assert (=> b!1102355 m!1022215))

(declare-fun m!1022217 () Bool)

(assert (=> b!1102352 m!1022217))

(declare-fun m!1022219 () Bool)

(assert (=> b!1102353 m!1022219))

(check-sat b_and!37199 (not b!1102356) (not b!1102353) tp_is_empty!27253 (not start!96904) (not mapNonEmpty!42673) (not b_lambda!18169) (not b!1102360) (not b!1102352) (not b_next!23203) (not b!1102357) (not b!1102358))
(check-sat b_and!37199 (not b_next!23203))
