; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96876 () Bool)

(assert start!96876)

(declare-fun b_free!23193 () Bool)

(declare-fun b_next!23193 () Bool)

(assert (=> start!96876 (= b_free!23193 (not b_next!23193))))

(declare-fun tp!81535 () Bool)

(declare-fun b_and!37189 () Bool)

(assert (=> start!96876 (= tp!81535 b_and!37189)))

(declare-fun res!735388 () Bool)

(declare-fun e!629070 () Bool)

(assert (=> start!96876 (=> (not res!735388) (not e!629070))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96876 (= res!735388 (validMask!0 mask!1414))))

(assert (=> start!96876 e!629070))

(assert (=> start!96876 tp!81535))

(assert (=> start!96876 true))

(declare-fun tp_is_empty!27243 () Bool)

(assert (=> start!96876 tp_is_empty!27243))

(declare-datatypes ((array!71407 0))(
  ( (array!71408 (arr!34365 (Array (_ BitVec 32) (_ BitVec 64))) (size!34901 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71407)

(declare-fun array_inv!26470 (array!71407) Bool)

(assert (=> start!96876 (array_inv!26470 _keys!1070)))

(declare-datatypes ((V!41451 0))(
  ( (V!41452 (val!13678 Int)) )
))
(declare-datatypes ((ValueCell!12912 0))(
  ( (ValueCellFull!12912 (v!16309 V!41451)) (EmptyCell!12912) )
))
(declare-datatypes ((array!71409 0))(
  ( (array!71410 (arr!34366 (Array (_ BitVec 32) ValueCell!12912)) (size!34902 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71409)

(declare-fun e!629068 () Bool)

(declare-fun array_inv!26471 (array!71409) Bool)

(assert (=> start!96876 (and (array_inv!26471 _values!874) e!629068)))

(declare-fun b!1102116 () Bool)

(declare-fun res!735394 () Bool)

(assert (=> b!1102116 (=> (not res!735394) (not e!629070))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102116 (= res!735394 (validKeyInArray!0 k0!904))))

(declare-fun b!1102117 () Bool)

(declare-fun res!735397 () Bool)

(declare-fun e!629065 () Bool)

(assert (=> b!1102117 (=> (not res!735397) (not e!629065))))

(declare-fun lt!494376 () array!71407)

(declare-datatypes ((List!24013 0))(
  ( (Nil!24010) (Cons!24009 (h!25218 (_ BitVec 64)) (t!34252 List!24013)) )
))
(declare-fun arrayNoDuplicates!0 (array!71407 (_ BitVec 32) List!24013) Bool)

(assert (=> b!1102117 (= res!735397 (arrayNoDuplicates!0 lt!494376 #b00000000000000000000000000000000 Nil!24010))))

(declare-fun b!1102118 () Bool)

(declare-fun e!629069 () Bool)

(assert (=> b!1102118 (= e!629069 tp_is_empty!27243)))

(declare-fun b!1102119 () Bool)

(declare-fun e!629064 () Bool)

(declare-fun e!629071 () Bool)

(assert (=> b!1102119 (= e!629064 e!629071)))

(declare-fun res!735387 () Bool)

(assert (=> b!1102119 (=> res!735387 e!629071)))

(assert (=> b!1102119 (= res!735387 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17398 0))(
  ( (tuple2!17399 (_1!8710 (_ BitVec 64)) (_2!8710 V!41451)) )
))
(declare-datatypes ((List!24014 0))(
  ( (Nil!24011) (Cons!24010 (h!25219 tuple2!17398) (t!34253 List!24014)) )
))
(declare-datatypes ((ListLongMap!15367 0))(
  ( (ListLongMap!15368 (toList!7699 List!24014)) )
))
(declare-fun lt!494374 () ListLongMap!15367)

(declare-fun lt!494371 () ListLongMap!15367)

(assert (=> b!1102119 (= lt!494374 lt!494371)))

(declare-fun lt!494377 () ListLongMap!15367)

(declare-fun lt!494366 () tuple2!17398)

(declare-fun +!3402 (ListLongMap!15367 tuple2!17398) ListLongMap!15367)

(assert (=> b!1102119 (= lt!494371 (+!3402 lt!494377 lt!494366))))

(declare-fun lt!494369 () ListLongMap!15367)

(declare-fun lt!494365 () ListLongMap!15367)

(assert (=> b!1102119 (= lt!494369 lt!494365)))

(declare-fun lt!494367 () ListLongMap!15367)

(assert (=> b!1102119 (= lt!494365 (+!3402 lt!494367 lt!494366))))

(declare-fun lt!494375 () ListLongMap!15367)

(assert (=> b!1102119 (= lt!494369 (+!3402 lt!494375 lt!494366))))

(declare-fun minValue!831 () V!41451)

(assert (=> b!1102119 (= lt!494366 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!42655 () Bool)

(declare-fun mapRes!42655 () Bool)

(declare-fun tp!81536 () Bool)

(assert (=> mapNonEmpty!42655 (= mapRes!42655 (and tp!81536 e!629069))))

(declare-fun mapRest!42655 () (Array (_ BitVec 32) ValueCell!12912))

(declare-fun mapKey!42655 () (_ BitVec 32))

(declare-fun mapValue!42655 () ValueCell!12912)

(assert (=> mapNonEmpty!42655 (= (arr!34366 _values!874) (store mapRest!42655 mapKey!42655 mapValue!42655))))

(declare-fun b!1102120 () Bool)

(declare-fun e!629067 () Bool)

(assert (=> b!1102120 (= e!629067 tp_is_empty!27243)))

(declare-fun b!1102121 () Bool)

(declare-fun res!735393 () Bool)

(assert (=> b!1102121 (=> (not res!735393) (not e!629070))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102121 (= res!735393 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34901 _keys!1070))))))

(declare-fun b!1102122 () Bool)

(assert (=> b!1102122 (= e!629065 (not e!629064))))

(declare-fun res!735396 () Bool)

(assert (=> b!1102122 (=> res!735396 e!629064)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102122 (= res!735396 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41451)

(declare-fun getCurrentListMap!4403 (array!71407 array!71409 (_ BitVec 32) (_ BitVec 32) V!41451 V!41451 (_ BitVec 32) Int) ListLongMap!15367)

(assert (=> b!1102122 (= lt!494374 (getCurrentListMap!4403 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494370 () array!71409)

(assert (=> b!1102122 (= lt!494369 (getCurrentListMap!4403 lt!494376 lt!494370 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1102122 (and (= lt!494375 lt!494367) (= lt!494367 lt!494375))))

(declare-fun -!982 (ListLongMap!15367 (_ BitVec 64)) ListLongMap!15367)

(assert (=> b!1102122 (= lt!494367 (-!982 lt!494377 k0!904))))

(declare-datatypes ((Unit!36216 0))(
  ( (Unit!36217) )
))
(declare-fun lt!494373 () Unit!36216)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!229 (array!71407 array!71409 (_ BitVec 32) (_ BitVec 32) V!41451 V!41451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36216)

(assert (=> b!1102122 (= lt!494373 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4199 (array!71407 array!71409 (_ BitVec 32) (_ BitVec 32) V!41451 V!41451 (_ BitVec 32) Int) ListLongMap!15367)

(assert (=> b!1102122 (= lt!494375 (getCurrentListMapNoExtraKeys!4199 lt!494376 lt!494370 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2334 (Int (_ BitVec 64)) V!41451)

(assert (=> b!1102122 (= lt!494370 (array!71410 (store (arr!34366 _values!874) i!650 (ValueCellFull!12912 (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34902 _values!874)))))

(assert (=> b!1102122 (= lt!494377 (getCurrentListMapNoExtraKeys!4199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102122 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494372 () Unit!36216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71407 (_ BitVec 64) (_ BitVec 32)) Unit!36216)

(assert (=> b!1102122 (= lt!494372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102123 () Bool)

(declare-fun res!735389 () Bool)

(assert (=> b!1102123 (=> (not res!735389) (not e!629070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71407 (_ BitVec 32)) Bool)

(assert (=> b!1102123 (= res!735389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102124 () Bool)

(assert (=> b!1102124 (= e!629070 e!629065)))

(declare-fun res!735395 () Bool)

(assert (=> b!1102124 (=> (not res!735395) (not e!629065))))

(assert (=> b!1102124 (= res!735395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494376 mask!1414))))

(assert (=> b!1102124 (= lt!494376 (array!71408 (store (arr!34365 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34901 _keys!1070)))))

(declare-fun b!1102125 () Bool)

(declare-fun res!735391 () Bool)

(assert (=> b!1102125 (=> (not res!735391) (not e!629070))))

(assert (=> b!1102125 (= res!735391 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24010))))

(declare-fun b!1102126 () Bool)

(declare-fun res!735392 () Bool)

(assert (=> b!1102126 (=> (not res!735392) (not e!629070))))

(assert (=> b!1102126 (= res!735392 (= (select (arr!34365 _keys!1070) i!650) k0!904))))

(declare-fun b!1102127 () Bool)

(assert (=> b!1102127 (= e!629068 (and e!629067 mapRes!42655))))

(declare-fun condMapEmpty!42655 () Bool)

(declare-fun mapDefault!42655 () ValueCell!12912)

(assert (=> b!1102127 (= condMapEmpty!42655 (= (arr!34366 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12912)) mapDefault!42655)))))

(declare-fun b!1102128 () Bool)

(declare-fun res!735390 () Bool)

(assert (=> b!1102128 (=> (not res!735390) (not e!629070))))

(assert (=> b!1102128 (= res!735390 (and (= (size!34902 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34901 _keys!1070) (size!34902 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102129 () Bool)

(assert (=> b!1102129 (= e!629071 (= (-!982 lt!494374 k0!904) lt!494369))))

(assert (=> b!1102129 (= (-!982 lt!494371 k0!904) lt!494365)))

(declare-fun lt!494368 () Unit!36216)

(declare-fun addRemoveCommutativeForDiffKeys!139 (ListLongMap!15367 (_ BitVec 64) V!41451 (_ BitVec 64)) Unit!36216)

(assert (=> b!1102129 (= lt!494368 (addRemoveCommutativeForDiffKeys!139 lt!494377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!42655 () Bool)

(assert (=> mapIsEmpty!42655 mapRes!42655))

(assert (= (and start!96876 res!735388) b!1102128))

(assert (= (and b!1102128 res!735390) b!1102123))

(assert (= (and b!1102123 res!735389) b!1102125))

(assert (= (and b!1102125 res!735391) b!1102121))

(assert (= (and b!1102121 res!735393) b!1102116))

(assert (= (and b!1102116 res!735394) b!1102126))

(assert (= (and b!1102126 res!735392) b!1102124))

(assert (= (and b!1102124 res!735395) b!1102117))

(assert (= (and b!1102117 res!735397) b!1102122))

(assert (= (and b!1102122 (not res!735396)) b!1102119))

(assert (= (and b!1102119 (not res!735387)) b!1102129))

(assert (= (and b!1102127 condMapEmpty!42655) mapIsEmpty!42655))

(assert (= (and b!1102127 (not condMapEmpty!42655)) mapNonEmpty!42655))

(get-info :version)

(assert (= (and mapNonEmpty!42655 ((_ is ValueCellFull!12912) mapValue!42655)) b!1102118))

(assert (= (and b!1102127 ((_ is ValueCellFull!12912) mapDefault!42655)) b!1102120))

(assert (= start!96876 b!1102127))

(declare-fun b_lambda!18151 () Bool)

(assert (=> (not b_lambda!18151) (not b!1102122)))

(declare-fun t!34251 () Bool)

(declare-fun tb!8059 () Bool)

(assert (=> (and start!96876 (= defaultEntry!882 defaultEntry!882) t!34251) tb!8059))

(declare-fun result!16661 () Bool)

(assert (=> tb!8059 (= result!16661 tp_is_empty!27243)))

(assert (=> b!1102122 t!34251))

(declare-fun b_and!37191 () Bool)

(assert (= b_and!37189 (and (=> t!34251 result!16661) b_and!37191)))

(declare-fun m!1022383 () Bool)

(assert (=> b!1102117 m!1022383))

(declare-fun m!1022385 () Bool)

(assert (=> b!1102119 m!1022385))

(declare-fun m!1022387 () Bool)

(assert (=> b!1102119 m!1022387))

(declare-fun m!1022389 () Bool)

(assert (=> b!1102119 m!1022389))

(declare-fun m!1022391 () Bool)

(assert (=> start!96876 m!1022391))

(declare-fun m!1022393 () Bool)

(assert (=> start!96876 m!1022393))

(declare-fun m!1022395 () Bool)

(assert (=> start!96876 m!1022395))

(declare-fun m!1022397 () Bool)

(assert (=> b!1102116 m!1022397))

(declare-fun m!1022399 () Bool)

(assert (=> b!1102125 m!1022399))

(declare-fun m!1022401 () Bool)

(assert (=> mapNonEmpty!42655 m!1022401))

(declare-fun m!1022403 () Bool)

(assert (=> b!1102122 m!1022403))

(declare-fun m!1022405 () Bool)

(assert (=> b!1102122 m!1022405))

(declare-fun m!1022407 () Bool)

(assert (=> b!1102122 m!1022407))

(declare-fun m!1022409 () Bool)

(assert (=> b!1102122 m!1022409))

(declare-fun m!1022411 () Bool)

(assert (=> b!1102122 m!1022411))

(declare-fun m!1022413 () Bool)

(assert (=> b!1102122 m!1022413))

(declare-fun m!1022415 () Bool)

(assert (=> b!1102122 m!1022415))

(declare-fun m!1022417 () Bool)

(assert (=> b!1102122 m!1022417))

(declare-fun m!1022419 () Bool)

(assert (=> b!1102122 m!1022419))

(declare-fun m!1022421 () Bool)

(assert (=> b!1102122 m!1022421))

(declare-fun m!1022423 () Bool)

(assert (=> b!1102124 m!1022423))

(declare-fun m!1022425 () Bool)

(assert (=> b!1102124 m!1022425))

(declare-fun m!1022427 () Bool)

(assert (=> b!1102129 m!1022427))

(declare-fun m!1022429 () Bool)

(assert (=> b!1102129 m!1022429))

(declare-fun m!1022431 () Bool)

(assert (=> b!1102129 m!1022431))

(declare-fun m!1022433 () Bool)

(assert (=> b!1102126 m!1022433))

(declare-fun m!1022435 () Bool)

(assert (=> b!1102123 m!1022435))

(check-sat (not b!1102116) (not b!1102122) (not start!96876) (not b!1102123) tp_is_empty!27243 (not b!1102125) b_and!37191 (not mapNonEmpty!42655) (not b!1102117) (not b!1102124) (not b_next!23193) (not b_lambda!18151) (not b!1102119) (not b!1102129))
(check-sat b_and!37191 (not b_next!23193))
