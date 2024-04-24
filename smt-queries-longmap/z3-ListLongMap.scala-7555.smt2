; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95886 () Bool)

(assert start!95886)

(declare-fun b_free!22303 () Bool)

(declare-fun b_next!22303 () Bool)

(assert (=> start!95886 (= b_free!22303 (not b_next!22303))))

(declare-fun tp!78757 () Bool)

(declare-fun b_and!35291 () Bool)

(assert (=> start!95886 (= tp!78757 b_and!35291)))

(declare-fun b!1082297 () Bool)

(declare-fun e!618764 () Bool)

(assert (=> b!1082297 (= e!618764 (not true))))

(declare-datatypes ((array!69595 0))(
  ( (array!69596 (arr!33465 (Array (_ BitVec 32) (_ BitVec 64))) (size!34002 (_ BitVec 32))) )
))
(declare-fun lt!479669 () array!69595)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40201 0))(
  ( (V!40202 (val!13209 Int)) )
))
(declare-datatypes ((ValueCell!12443 0))(
  ( (ValueCellFull!12443 (v!15826 V!40201)) (EmptyCell!12443) )
))
(declare-datatypes ((array!69597 0))(
  ( (array!69598 (arr!33466 (Array (_ BitVec 32) ValueCell!12443)) (size!34003 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69597)

(declare-fun minValue!831 () V!40201)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40201)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16730 0))(
  ( (tuple2!16731 (_1!8376 (_ BitVec 64)) (_2!8376 V!40201)) )
))
(declare-datatypes ((List!23320 0))(
  ( (Nil!23317) (Cons!23316 (h!24534 tuple2!16730) (t!32673 List!23320)) )
))
(declare-datatypes ((ListLongMap!14707 0))(
  ( (ListLongMap!14708 (toList!7369 List!23320)) )
))
(declare-fun lt!479667 () ListLongMap!14707)

(declare-fun getCurrentListMapNoExtraKeys!3946 (array!69595 array!69597 (_ BitVec 32) (_ BitVec 32) V!40201 V!40201 (_ BitVec 32) Int) ListLongMap!14707)

(declare-fun dynLambda!2067 (Int (_ BitVec 64)) V!40201)

(assert (=> b!1082297 (= lt!479667 (getCurrentListMapNoExtraKeys!3946 lt!479669 (array!69598 (store (arr!33466 _values!874) i!650 (ValueCellFull!12443 (dynLambda!2067 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34003 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479668 () ListLongMap!14707)

(declare-fun _keys!1070 () array!69595)

(assert (=> b!1082297 (= lt!479668 (getCurrentListMapNoExtraKeys!3946 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082297 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35529 0))(
  ( (Unit!35530) )
))
(declare-fun lt!479670 () Unit!35529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69595 (_ BitVec 64) (_ BitVec 32)) Unit!35529)

(assert (=> b!1082297 (= lt!479670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082298 () Bool)

(declare-fun e!618759 () Bool)

(assert (=> b!1082298 (= e!618759 e!618764)))

(declare-fun res!721015 () Bool)

(assert (=> b!1082298 (=> (not res!721015) (not e!618764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69595 (_ BitVec 32)) Bool)

(assert (=> b!1082298 (= res!721015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479669 mask!1414))))

(assert (=> b!1082298 (= lt!479669 (array!69596 (store (arr!33465 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34002 _keys!1070)))))

(declare-fun b!1082299 () Bool)

(declare-fun e!618761 () Bool)

(declare-fun tp_is_empty!26305 () Bool)

(assert (=> b!1082299 (= e!618761 tp_is_empty!26305)))

(declare-fun mapIsEmpty!41212 () Bool)

(declare-fun mapRes!41212 () Bool)

(assert (=> mapIsEmpty!41212 mapRes!41212))

(declare-fun b!1082300 () Bool)

(declare-fun e!618763 () Bool)

(assert (=> b!1082300 (= e!618763 (and e!618761 mapRes!41212))))

(declare-fun condMapEmpty!41212 () Bool)

(declare-fun mapDefault!41212 () ValueCell!12443)

(assert (=> b!1082300 (= condMapEmpty!41212 (= (arr!33466 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12443)) mapDefault!41212)))))

(declare-fun b!1082301 () Bool)

(declare-fun e!618762 () Bool)

(assert (=> b!1082301 (= e!618762 tp_is_empty!26305)))

(declare-fun res!721016 () Bool)

(assert (=> start!95886 (=> (not res!721016) (not e!618759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95886 (= res!721016 (validMask!0 mask!1414))))

(assert (=> start!95886 e!618759))

(assert (=> start!95886 tp!78757))

(assert (=> start!95886 true))

(assert (=> start!95886 tp_is_empty!26305))

(declare-fun array_inv!25876 (array!69595) Bool)

(assert (=> start!95886 (array_inv!25876 _keys!1070)))

(declare-fun array_inv!25877 (array!69597) Bool)

(assert (=> start!95886 (and (array_inv!25877 _values!874) e!618763)))

(declare-fun b!1082296 () Bool)

(declare-fun res!721017 () Bool)

(assert (=> b!1082296 (=> (not res!721017) (not e!618759))))

(assert (=> b!1082296 (= res!721017 (and (= (size!34003 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34002 _keys!1070) (size!34003 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082302 () Bool)

(declare-fun res!721012 () Bool)

(assert (=> b!1082302 (=> (not res!721012) (not e!618759))))

(assert (=> b!1082302 (= res!721012 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34002 _keys!1070))))))

(declare-fun b!1082303 () Bool)

(declare-fun res!721014 () Bool)

(assert (=> b!1082303 (=> (not res!721014) (not e!618759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082303 (= res!721014 (validKeyInArray!0 k0!904))))

(declare-fun b!1082304 () Bool)

(declare-fun res!721010 () Bool)

(assert (=> b!1082304 (=> (not res!721010) (not e!618759))))

(assert (=> b!1082304 (= res!721010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082305 () Bool)

(declare-fun res!721013 () Bool)

(assert (=> b!1082305 (=> (not res!721013) (not e!618759))))

(assert (=> b!1082305 (= res!721013 (= (select (arr!33465 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41212 () Bool)

(declare-fun tp!78758 () Bool)

(assert (=> mapNonEmpty!41212 (= mapRes!41212 (and tp!78758 e!618762))))

(declare-fun mapValue!41212 () ValueCell!12443)

(declare-fun mapRest!41212 () (Array (_ BitVec 32) ValueCell!12443))

(declare-fun mapKey!41212 () (_ BitVec 32))

(assert (=> mapNonEmpty!41212 (= (arr!33466 _values!874) (store mapRest!41212 mapKey!41212 mapValue!41212))))

(declare-fun b!1082306 () Bool)

(declare-fun res!721011 () Bool)

(assert (=> b!1082306 (=> (not res!721011) (not e!618764))))

(declare-datatypes ((List!23321 0))(
  ( (Nil!23318) (Cons!23317 (h!24535 (_ BitVec 64)) (t!32674 List!23321)) )
))
(declare-fun arrayNoDuplicates!0 (array!69595 (_ BitVec 32) List!23321) Bool)

(assert (=> b!1082306 (= res!721011 (arrayNoDuplicates!0 lt!479669 #b00000000000000000000000000000000 Nil!23318))))

(declare-fun b!1082307 () Bool)

(declare-fun res!721009 () Bool)

(assert (=> b!1082307 (=> (not res!721009) (not e!618759))))

(assert (=> b!1082307 (= res!721009 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23318))))

(assert (= (and start!95886 res!721016) b!1082296))

(assert (= (and b!1082296 res!721017) b!1082304))

(assert (= (and b!1082304 res!721010) b!1082307))

(assert (= (and b!1082307 res!721009) b!1082302))

(assert (= (and b!1082302 res!721012) b!1082303))

(assert (= (and b!1082303 res!721014) b!1082305))

(assert (= (and b!1082305 res!721013) b!1082298))

(assert (= (and b!1082298 res!721015) b!1082306))

(assert (= (and b!1082306 res!721011) b!1082297))

(assert (= (and b!1082300 condMapEmpty!41212) mapIsEmpty!41212))

(assert (= (and b!1082300 (not condMapEmpty!41212)) mapNonEmpty!41212))

(get-info :version)

(assert (= (and mapNonEmpty!41212 ((_ is ValueCellFull!12443) mapValue!41212)) b!1082301))

(assert (= (and b!1082300 ((_ is ValueCellFull!12443) mapDefault!41212)) b!1082299))

(assert (= start!95886 b!1082300))

(declare-fun b_lambda!16983 () Bool)

(assert (=> (not b_lambda!16983) (not b!1082297)))

(declare-fun t!32672 () Bool)

(declare-fun tb!7173 () Bool)

(assert (=> (and start!95886 (= defaultEntry!882 defaultEntry!882) t!32672) tb!7173))

(declare-fun result!14873 () Bool)

(assert (=> tb!7173 (= result!14873 tp_is_empty!26305)))

(assert (=> b!1082297 t!32672))

(declare-fun b_and!35293 () Bool)

(assert (= b_and!35291 (and (=> t!32672 result!14873) b_and!35293)))

(declare-fun m!1000481 () Bool)

(assert (=> start!95886 m!1000481))

(declare-fun m!1000483 () Bool)

(assert (=> start!95886 m!1000483))

(declare-fun m!1000485 () Bool)

(assert (=> start!95886 m!1000485))

(declare-fun m!1000487 () Bool)

(assert (=> mapNonEmpty!41212 m!1000487))

(declare-fun m!1000489 () Bool)

(assert (=> b!1082304 m!1000489))

(declare-fun m!1000491 () Bool)

(assert (=> b!1082303 m!1000491))

(declare-fun m!1000493 () Bool)

(assert (=> b!1082298 m!1000493))

(declare-fun m!1000495 () Bool)

(assert (=> b!1082298 m!1000495))

(declare-fun m!1000497 () Bool)

(assert (=> b!1082307 m!1000497))

(declare-fun m!1000499 () Bool)

(assert (=> b!1082306 m!1000499))

(declare-fun m!1000501 () Bool)

(assert (=> b!1082297 m!1000501))

(declare-fun m!1000503 () Bool)

(assert (=> b!1082297 m!1000503))

(declare-fun m!1000505 () Bool)

(assert (=> b!1082297 m!1000505))

(declare-fun m!1000507 () Bool)

(assert (=> b!1082297 m!1000507))

(declare-fun m!1000509 () Bool)

(assert (=> b!1082297 m!1000509))

(declare-fun m!1000511 () Bool)

(assert (=> b!1082297 m!1000511))

(declare-fun m!1000513 () Bool)

(assert (=> b!1082305 m!1000513))

(check-sat (not b!1082303) (not b_lambda!16983) (not mapNonEmpty!41212) tp_is_empty!26305 b_and!35293 (not b!1082304) (not b!1082307) (not start!95886) (not b!1082298) (not b!1082306) (not b_next!22303) (not b!1082297))
(check-sat b_and!35293 (not b_next!22303))
