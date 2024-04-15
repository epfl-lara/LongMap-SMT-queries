; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95716 () Bool)

(assert start!95716)

(declare-fun b_free!22375 () Bool)

(declare-fun b_next!22375 () Bool)

(assert (=> start!95716 (= b_free!22375 (not b_next!22375))))

(declare-fun tp!78974 () Bool)

(declare-fun b_and!35399 () Bool)

(assert (=> start!95716 (= tp!78974 b_and!35399)))

(declare-fun b!1082184 () Bool)

(declare-fun e!618461 () Bool)

(declare-fun e!618463 () Bool)

(declare-fun mapRes!41320 () Bool)

(assert (=> b!1082184 (= e!618461 (and e!618463 mapRes!41320))))

(declare-fun condMapEmpty!41320 () Bool)

(declare-datatypes ((V!40297 0))(
  ( (V!40298 (val!13245 Int)) )
))
(declare-datatypes ((ValueCell!12479 0))(
  ( (ValueCellFull!12479 (v!15865 V!40297)) (EmptyCell!12479) )
))
(declare-datatypes ((array!69624 0))(
  ( (array!69625 (arr!33486 (Array (_ BitVec 32) ValueCell!12479)) (size!34024 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69624)

(declare-fun mapDefault!41320 () ValueCell!12479)

(assert (=> b!1082184 (= condMapEmpty!41320 (= (arr!33486 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12479)) mapDefault!41320)))))

(declare-fun res!721395 () Bool)

(declare-fun e!618460 () Bool)

(assert (=> start!95716 (=> (not res!721395) (not e!618460))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95716 (= res!721395 (validMask!0 mask!1414))))

(assert (=> start!95716 e!618460))

(assert (=> start!95716 tp!78974))

(assert (=> start!95716 true))

(declare-fun tp_is_empty!26377 () Bool)

(assert (=> start!95716 tp_is_empty!26377))

(declare-datatypes ((array!69626 0))(
  ( (array!69627 (arr!33487 (Array (_ BitVec 32) (_ BitVec 64))) (size!34025 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69626)

(declare-fun array_inv!25884 (array!69626) Bool)

(assert (=> start!95716 (array_inv!25884 _keys!1070)))

(declare-fun array_inv!25885 (array!69624) Bool)

(assert (=> start!95716 (and (array_inv!25885 _values!874) e!618461)))

(declare-fun b!1082185 () Bool)

(declare-fun res!721397 () Bool)

(assert (=> b!1082185 (=> (not res!721397) (not e!618460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69626 (_ BitVec 32)) Bool)

(assert (=> b!1082185 (= res!721397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082186 () Bool)

(declare-fun e!618464 () Bool)

(assert (=> b!1082186 (= e!618464 tp_is_empty!26377)))

(declare-fun b!1082187 () Bool)

(assert (=> b!1082187 (= e!618463 tp_is_empty!26377)))

(declare-fun mapIsEmpty!41320 () Bool)

(assert (=> mapIsEmpty!41320 mapRes!41320))

(declare-fun b!1082188 () Bool)

(declare-fun res!721393 () Bool)

(assert (=> b!1082188 (=> (not res!721393) (not e!618460))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082188 (= res!721393 (validKeyInArray!0 k0!904))))

(declare-fun b!1082189 () Bool)

(declare-fun e!618462 () Bool)

(assert (=> b!1082189 (= e!618462 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!479385 () array!69626)

(declare-fun zeroValue!831 () V!40297)

(declare-datatypes ((tuple2!16840 0))(
  ( (tuple2!16841 (_1!8431 (_ BitVec 64)) (_2!8431 V!40297)) )
))
(declare-datatypes ((List!23405 0))(
  ( (Nil!23402) (Cons!23401 (h!24610 tuple2!16840) (t!32829 List!23405)) )
))
(declare-datatypes ((ListLongMap!14809 0))(
  ( (ListLongMap!14810 (toList!7420 List!23405)) )
))
(declare-fun lt!479387 () ListLongMap!14809)

(declare-fun minValue!831 () V!40297)

(declare-fun getCurrentListMapNoExtraKeys!3983 (array!69626 array!69624 (_ BitVec 32) (_ BitVec 32) V!40297 V!40297 (_ BitVec 32) Int) ListLongMap!14809)

(declare-fun dynLambda!2054 (Int (_ BitVec 64)) V!40297)

(assert (=> b!1082189 (= lt!479387 (getCurrentListMapNoExtraKeys!3983 lt!479385 (array!69625 (store (arr!33486 _values!874) i!650 (ValueCellFull!12479 (dynLambda!2054 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34024 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479386 () ListLongMap!14809)

(assert (=> b!1082189 (= lt!479386 (getCurrentListMapNoExtraKeys!3983 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082189 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35433 0))(
  ( (Unit!35434) )
))
(declare-fun lt!479384 () Unit!35433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69626 (_ BitVec 64) (_ BitVec 32)) Unit!35433)

(assert (=> b!1082189 (= lt!479384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082190 () Bool)

(declare-fun res!721396 () Bool)

(assert (=> b!1082190 (=> (not res!721396) (not e!618460))))

(assert (=> b!1082190 (= res!721396 (and (= (size!34024 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34025 _keys!1070) (size!34024 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082191 () Bool)

(declare-fun res!721394 () Bool)

(assert (=> b!1082191 (=> (not res!721394) (not e!618460))))

(declare-datatypes ((List!23406 0))(
  ( (Nil!23403) (Cons!23402 (h!24611 (_ BitVec 64)) (t!32830 List!23406)) )
))
(declare-fun arrayNoDuplicates!0 (array!69626 (_ BitVec 32) List!23406) Bool)

(assert (=> b!1082191 (= res!721394 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23403))))

(declare-fun b!1082192 () Bool)

(assert (=> b!1082192 (= e!618460 e!618462)))

(declare-fun res!721390 () Bool)

(assert (=> b!1082192 (=> (not res!721390) (not e!618462))))

(assert (=> b!1082192 (= res!721390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479385 mask!1414))))

(assert (=> b!1082192 (= lt!479385 (array!69627 (store (arr!33487 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34025 _keys!1070)))))

(declare-fun b!1082193 () Bool)

(declare-fun res!721392 () Bool)

(assert (=> b!1082193 (=> (not res!721392) (not e!618460))))

(assert (=> b!1082193 (= res!721392 (= (select (arr!33487 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41320 () Bool)

(declare-fun tp!78973 () Bool)

(assert (=> mapNonEmpty!41320 (= mapRes!41320 (and tp!78973 e!618464))))

(declare-fun mapValue!41320 () ValueCell!12479)

(declare-fun mapKey!41320 () (_ BitVec 32))

(declare-fun mapRest!41320 () (Array (_ BitVec 32) ValueCell!12479))

(assert (=> mapNonEmpty!41320 (= (arr!33486 _values!874) (store mapRest!41320 mapKey!41320 mapValue!41320))))

(declare-fun b!1082194 () Bool)

(declare-fun res!721391 () Bool)

(assert (=> b!1082194 (=> (not res!721391) (not e!618460))))

(assert (=> b!1082194 (= res!721391 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34025 _keys!1070))))))

(declare-fun b!1082195 () Bool)

(declare-fun res!721398 () Bool)

(assert (=> b!1082195 (=> (not res!721398) (not e!618462))))

(assert (=> b!1082195 (= res!721398 (arrayNoDuplicates!0 lt!479385 #b00000000000000000000000000000000 Nil!23403))))

(assert (= (and start!95716 res!721395) b!1082190))

(assert (= (and b!1082190 res!721396) b!1082185))

(assert (= (and b!1082185 res!721397) b!1082191))

(assert (= (and b!1082191 res!721394) b!1082194))

(assert (= (and b!1082194 res!721391) b!1082188))

(assert (= (and b!1082188 res!721393) b!1082193))

(assert (= (and b!1082193 res!721392) b!1082192))

(assert (= (and b!1082192 res!721390) b!1082195))

(assert (= (and b!1082195 res!721398) b!1082189))

(assert (= (and b!1082184 condMapEmpty!41320) mapIsEmpty!41320))

(assert (= (and b!1082184 (not condMapEmpty!41320)) mapNonEmpty!41320))

(get-info :version)

(assert (= (and mapNonEmpty!41320 ((_ is ValueCellFull!12479) mapValue!41320)) b!1082186))

(assert (= (and b!1082184 ((_ is ValueCellFull!12479) mapDefault!41320)) b!1082187))

(assert (= start!95716 b!1082184))

(declare-fun b_lambda!17023 () Bool)

(assert (=> (not b_lambda!17023) (not b!1082189)))

(declare-fun t!32828 () Bool)

(declare-fun tb!7245 () Bool)

(assert (=> (and start!95716 (= defaultEntry!882 defaultEntry!882) t!32828) tb!7245))

(declare-fun result!15017 () Bool)

(assert (=> tb!7245 (= result!15017 tp_is_empty!26377)))

(assert (=> b!1082189 t!32828))

(declare-fun b_and!35401 () Bool)

(assert (= b_and!35399 (and (=> t!32828 result!15017) b_and!35401)))

(declare-fun m!999407 () Bool)

(assert (=> b!1082188 m!999407))

(declare-fun m!999409 () Bool)

(assert (=> mapNonEmpty!41320 m!999409))

(declare-fun m!999411 () Bool)

(assert (=> b!1082195 m!999411))

(declare-fun m!999413 () Bool)

(assert (=> b!1082191 m!999413))

(declare-fun m!999415 () Bool)

(assert (=> start!95716 m!999415))

(declare-fun m!999417 () Bool)

(assert (=> start!95716 m!999417))

(declare-fun m!999419 () Bool)

(assert (=> start!95716 m!999419))

(declare-fun m!999421 () Bool)

(assert (=> b!1082189 m!999421))

(declare-fun m!999423 () Bool)

(assert (=> b!1082189 m!999423))

(declare-fun m!999425 () Bool)

(assert (=> b!1082189 m!999425))

(declare-fun m!999427 () Bool)

(assert (=> b!1082189 m!999427))

(declare-fun m!999429 () Bool)

(assert (=> b!1082189 m!999429))

(declare-fun m!999431 () Bool)

(assert (=> b!1082189 m!999431))

(declare-fun m!999433 () Bool)

(assert (=> b!1082193 m!999433))

(declare-fun m!999435 () Bool)

(assert (=> b!1082192 m!999435))

(declare-fun m!999437 () Bool)

(assert (=> b!1082192 m!999437))

(declare-fun m!999439 () Bool)

(assert (=> b!1082185 m!999439))

(check-sat (not mapNonEmpty!41320) (not b_next!22375) b_and!35401 (not b!1082185) (not b!1082191) (not b!1082195) (not b!1082189) (not b!1082188) (not start!95716) (not b!1082192) tp_is_empty!26377 (not b_lambda!17023))
(check-sat b_and!35401 (not b_next!22375))
