; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96384 () Bool)

(assert start!96384)

(declare-fun b_free!22969 () Bool)

(declare-fun b_next!22969 () Bool)

(assert (=> start!96384 (= b_free!22969 (not b_next!22969))))

(declare-fun tp!80834 () Bool)

(declare-fun b_and!36575 () Bool)

(assert (=> start!96384 (= tp!80834 b_and!36575)))

(declare-fun b!1095343 () Bool)

(declare-fun res!731030 () Bool)

(declare-fun e!625320 () Bool)

(assert (=> b!1095343 (=> (not res!731030) (not e!625320))))

(declare-datatypes ((array!70864 0))(
  ( (array!70865 (arr!34104 (Array (_ BitVec 32) (_ BitVec 64))) (size!34642 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70864)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70864 (_ BitVec 32)) Bool)

(assert (=> b!1095343 (= res!731030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095344 () Bool)

(declare-fun res!731032 () Bool)

(assert (=> b!1095344 (=> (not res!731032) (not e!625320))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095344 (= res!731032 (= (select (arr!34104 _keys!1070) i!650) k0!904))))

(declare-fun res!731034 () Bool)

(assert (=> start!96384 (=> (not res!731034) (not e!625320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96384 (= res!731034 (validMask!0 mask!1414))))

(assert (=> start!96384 e!625320))

(assert (=> start!96384 tp!80834))

(assert (=> start!96384 true))

(declare-fun tp_is_empty!27019 () Bool)

(assert (=> start!96384 tp_is_empty!27019))

(declare-fun array_inv!26318 (array!70864) Bool)

(assert (=> start!96384 (array_inv!26318 _keys!1070)))

(declare-datatypes ((V!41153 0))(
  ( (V!41154 (val!13566 Int)) )
))
(declare-datatypes ((ValueCell!12800 0))(
  ( (ValueCellFull!12800 (v!16186 V!41153)) (EmptyCell!12800) )
))
(declare-datatypes ((array!70866 0))(
  ( (array!70867 (arr!34105 (Array (_ BitVec 32) ValueCell!12800)) (size!34643 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70866)

(declare-fun e!625322 () Bool)

(declare-fun array_inv!26319 (array!70866) Bool)

(assert (=> start!96384 (and (array_inv!26319 _values!874) e!625322)))

(declare-fun b!1095345 () Bool)

(declare-fun e!625319 () Bool)

(assert (=> b!1095345 (= e!625320 e!625319)))

(declare-fun res!731037 () Bool)

(assert (=> b!1095345 (=> (not res!731037) (not e!625319))))

(declare-fun lt!489652 () array!70864)

(assert (=> b!1095345 (= res!731037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489652 mask!1414))))

(assert (=> b!1095345 (= lt!489652 (array!70865 (store (arr!34104 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34642 _keys!1070)))))

(declare-fun b!1095346 () Bool)

(declare-fun e!625321 () Bool)

(assert (=> b!1095346 (= e!625321 tp_is_empty!27019)))

(declare-fun b!1095347 () Bool)

(declare-fun res!731035 () Bool)

(assert (=> b!1095347 (=> (not res!731035) (not e!625320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095347 (= res!731035 (validKeyInArray!0 k0!904))))

(declare-fun b!1095348 () Bool)

(declare-fun res!731038 () Bool)

(assert (=> b!1095348 (=> (not res!731038) (not e!625319))))

(declare-datatypes ((List!23878 0))(
  ( (Nil!23875) (Cons!23874 (h!25083 (_ BitVec 64)) (t!33884 List!23878)) )
))
(declare-fun arrayNoDuplicates!0 (array!70864 (_ BitVec 32) List!23878) Bool)

(assert (=> b!1095348 (= res!731038 (arrayNoDuplicates!0 lt!489652 #b00000000000000000000000000000000 Nil!23875))))

(declare-fun mapNonEmpty!42289 () Bool)

(declare-fun mapRes!42289 () Bool)

(declare-fun tp!80833 () Bool)

(assert (=> mapNonEmpty!42289 (= mapRes!42289 (and tp!80833 e!625321))))

(declare-fun mapValue!42289 () ValueCell!12800)

(declare-fun mapKey!42289 () (_ BitVec 32))

(declare-fun mapRest!42289 () (Array (_ BitVec 32) ValueCell!12800))

(assert (=> mapNonEmpty!42289 (= (arr!34105 _values!874) (store mapRest!42289 mapKey!42289 mapValue!42289))))

(declare-fun b!1095349 () Bool)

(declare-fun res!731033 () Bool)

(assert (=> b!1095349 (=> (not res!731033) (not e!625320))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095349 (= res!731033 (and (= (size!34643 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34642 _keys!1070) (size!34643 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095350 () Bool)

(declare-fun res!731031 () Bool)

(assert (=> b!1095350 (=> (not res!731031) (not e!625320))))

(assert (=> b!1095350 (= res!731031 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34642 _keys!1070))))))

(declare-fun b!1095351 () Bool)

(assert (=> b!1095351 (= e!625319 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41153)

(declare-datatypes ((tuple2!17284 0))(
  ( (tuple2!17285 (_1!8653 (_ BitVec 64)) (_2!8653 V!41153)) )
))
(declare-datatypes ((List!23879 0))(
  ( (Nil!23876) (Cons!23875 (h!25084 tuple2!17284) (t!33885 List!23879)) )
))
(declare-datatypes ((ListLongMap!15253 0))(
  ( (ListLongMap!15254 (toList!7642 List!23879)) )
))
(declare-fun lt!489650 () ListLongMap!15253)

(declare-fun zeroValue!831 () V!41153)

(declare-fun getCurrentListMapNoExtraKeys!4175 (array!70864 array!70866 (_ BitVec 32) (_ BitVec 32) V!41153 V!41153 (_ BitVec 32) Int) ListLongMap!15253)

(declare-fun dynLambda!2244 (Int (_ BitVec 64)) V!41153)

(assert (=> b!1095351 (= lt!489650 (getCurrentListMapNoExtraKeys!4175 lt!489652 (array!70867 (store (arr!34105 _values!874) i!650 (ValueCellFull!12800 (dynLambda!2244 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34643 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489653 () ListLongMap!15253)

(assert (=> b!1095351 (= lt!489653 (getCurrentListMapNoExtraKeys!4175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095351 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35871 0))(
  ( (Unit!35872) )
))
(declare-fun lt!489651 () Unit!35871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70864 (_ BitVec 64) (_ BitVec 32)) Unit!35871)

(assert (=> b!1095351 (= lt!489651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095352 () Bool)

(declare-fun e!625323 () Bool)

(assert (=> b!1095352 (= e!625322 (and e!625323 mapRes!42289))))

(declare-fun condMapEmpty!42289 () Bool)

(declare-fun mapDefault!42289 () ValueCell!12800)

(assert (=> b!1095352 (= condMapEmpty!42289 (= (arr!34105 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12800)) mapDefault!42289)))))

(declare-fun mapIsEmpty!42289 () Bool)

(assert (=> mapIsEmpty!42289 mapRes!42289))

(declare-fun b!1095353 () Bool)

(assert (=> b!1095353 (= e!625323 tp_is_empty!27019)))

(declare-fun b!1095354 () Bool)

(declare-fun res!731036 () Bool)

(assert (=> b!1095354 (=> (not res!731036) (not e!625320))))

(assert (=> b!1095354 (= res!731036 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23875))))

(assert (= (and start!96384 res!731034) b!1095349))

(assert (= (and b!1095349 res!731033) b!1095343))

(assert (= (and b!1095343 res!731030) b!1095354))

(assert (= (and b!1095354 res!731036) b!1095350))

(assert (= (and b!1095350 res!731031) b!1095347))

(assert (= (and b!1095347 res!731035) b!1095344))

(assert (= (and b!1095344 res!731032) b!1095345))

(assert (= (and b!1095345 res!731037) b!1095348))

(assert (= (and b!1095348 res!731038) b!1095351))

(assert (= (and b!1095352 condMapEmpty!42289) mapIsEmpty!42289))

(assert (= (and b!1095352 (not condMapEmpty!42289)) mapNonEmpty!42289))

(get-info :version)

(assert (= (and mapNonEmpty!42289 ((_ is ValueCellFull!12800) mapValue!42289)) b!1095346))

(assert (= (and b!1095352 ((_ is ValueCellFull!12800) mapDefault!42289)) b!1095353))

(assert (= start!96384 b!1095352))

(declare-fun b_lambda!17605 () Bool)

(assert (=> (not b_lambda!17605) (not b!1095351)))

(declare-fun t!33883 () Bool)

(declare-fun tb!7827 () Bool)

(assert (=> (and start!96384 (= defaultEntry!882 defaultEntry!882) t!33883) tb!7827))

(declare-fun result!16185 () Bool)

(assert (=> tb!7827 (= result!16185 tp_is_empty!27019)))

(assert (=> b!1095351 t!33883))

(declare-fun b_and!36577 () Bool)

(assert (= b_and!36575 (and (=> t!33883 result!16185) b_and!36577)))

(declare-fun m!1014501 () Bool)

(assert (=> b!1095344 m!1014501))

(declare-fun m!1014503 () Bool)

(assert (=> b!1095347 m!1014503))

(declare-fun m!1014505 () Bool)

(assert (=> b!1095354 m!1014505))

(declare-fun m!1014507 () Bool)

(assert (=> mapNonEmpty!42289 m!1014507))

(declare-fun m!1014509 () Bool)

(assert (=> b!1095351 m!1014509))

(declare-fun m!1014511 () Bool)

(assert (=> b!1095351 m!1014511))

(declare-fun m!1014513 () Bool)

(assert (=> b!1095351 m!1014513))

(declare-fun m!1014515 () Bool)

(assert (=> b!1095351 m!1014515))

(declare-fun m!1014517 () Bool)

(assert (=> b!1095351 m!1014517))

(declare-fun m!1014519 () Bool)

(assert (=> b!1095351 m!1014519))

(declare-fun m!1014521 () Bool)

(assert (=> b!1095343 m!1014521))

(declare-fun m!1014523 () Bool)

(assert (=> b!1095345 m!1014523))

(declare-fun m!1014525 () Bool)

(assert (=> b!1095345 m!1014525))

(declare-fun m!1014527 () Bool)

(assert (=> start!96384 m!1014527))

(declare-fun m!1014529 () Bool)

(assert (=> start!96384 m!1014529))

(declare-fun m!1014531 () Bool)

(assert (=> start!96384 m!1014531))

(declare-fun m!1014533 () Bool)

(assert (=> b!1095348 m!1014533))

(check-sat (not b!1095345) (not b!1095354) (not b!1095348) (not b!1095347) (not b!1095351) (not mapNonEmpty!42289) (not b!1095343) tp_is_empty!27019 b_and!36577 (not b_lambda!17605) (not b_next!22969) (not start!96384))
(check-sat b_and!36577 (not b_next!22969))
