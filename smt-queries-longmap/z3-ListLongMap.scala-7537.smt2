; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95544 () Bool)

(assert start!95544)

(declare-fun b!1079061 () Bool)

(declare-fun res!719060 () Bool)

(declare-fun e!616952 () Bool)

(assert (=> b!1079061 (=> (not res!719060) (not e!616952))))

(declare-datatypes ((array!69355 0))(
  ( (array!69356 (arr!33351 (Array (_ BitVec 32) (_ BitVec 64))) (size!33887 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69355)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69355 (_ BitVec 32)) Bool)

(assert (=> b!1079061 (= res!719060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079062 () Bool)

(declare-fun e!616953 () Bool)

(assert (=> b!1079062 (= e!616953 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079062 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35480 0))(
  ( (Unit!35481) )
))
(declare-fun lt!478749 () Unit!35480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69355 (_ BitVec 64) (_ BitVec 32)) Unit!35480)

(assert (=> b!1079062 (= lt!478749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079064 () Bool)

(declare-fun res!719056 () Bool)

(assert (=> b!1079064 (=> (not res!719056) (not e!616952))))

(assert (=> b!1079064 (= res!719056 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33887 _keys!1070))))))

(declare-fun b!1079065 () Bool)

(declare-fun res!719057 () Bool)

(assert (=> b!1079065 (=> (not res!719057) (not e!616952))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40059 0))(
  ( (V!40060 (val!13156 Int)) )
))
(declare-datatypes ((ValueCell!12390 0))(
  ( (ValueCellFull!12390 (v!15777 V!40059)) (EmptyCell!12390) )
))
(declare-datatypes ((array!69357 0))(
  ( (array!69358 (arr!33352 (Array (_ BitVec 32) ValueCell!12390)) (size!33888 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69357)

(assert (=> b!1079065 (= res!719057 (and (= (size!33888 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33887 _keys!1070) (size!33888 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079066 () Bool)

(declare-fun e!616951 () Bool)

(declare-fun tp_is_empty!26199 () Bool)

(assert (=> b!1079066 (= e!616951 tp_is_empty!26199)))

(declare-fun mapIsEmpty!41053 () Bool)

(declare-fun mapRes!41053 () Bool)

(assert (=> mapIsEmpty!41053 mapRes!41053))

(declare-fun mapNonEmpty!41053 () Bool)

(declare-fun tp!78515 () Bool)

(assert (=> mapNonEmpty!41053 (= mapRes!41053 (and tp!78515 e!616951))))

(declare-fun mapRest!41053 () (Array (_ BitVec 32) ValueCell!12390))

(declare-fun mapValue!41053 () ValueCell!12390)

(declare-fun mapKey!41053 () (_ BitVec 32))

(assert (=> mapNonEmpty!41053 (= (arr!33352 _values!874) (store mapRest!41053 mapKey!41053 mapValue!41053))))

(declare-fun b!1079067 () Bool)

(declare-fun res!719059 () Bool)

(assert (=> b!1079067 (=> (not res!719059) (not e!616952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079067 (= res!719059 (validKeyInArray!0 k0!904))))

(declare-fun b!1079068 () Bool)

(declare-fun res!719063 () Bool)

(assert (=> b!1079068 (=> (not res!719063) (not e!616953))))

(declare-fun lt!478750 () array!69355)

(declare-datatypes ((List!23251 0))(
  ( (Nil!23248) (Cons!23247 (h!24456 (_ BitVec 64)) (t!32610 List!23251)) )
))
(declare-fun arrayNoDuplicates!0 (array!69355 (_ BitVec 32) List!23251) Bool)

(assert (=> b!1079068 (= res!719063 (arrayNoDuplicates!0 lt!478750 #b00000000000000000000000000000000 Nil!23248))))

(declare-fun b!1079069 () Bool)

(declare-fun res!719058 () Bool)

(assert (=> b!1079069 (=> (not res!719058) (not e!616952))))

(assert (=> b!1079069 (= res!719058 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23248))))

(declare-fun b!1079070 () Bool)

(declare-fun res!719062 () Bool)

(assert (=> b!1079070 (=> (not res!719062) (not e!616952))))

(assert (=> b!1079070 (= res!719062 (= (select (arr!33351 _keys!1070) i!650) k0!904))))

(declare-fun b!1079071 () Bool)

(assert (=> b!1079071 (= e!616952 e!616953)))

(declare-fun res!719061 () Bool)

(assert (=> b!1079071 (=> (not res!719061) (not e!616953))))

(assert (=> b!1079071 (= res!719061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478750 mask!1414))))

(assert (=> b!1079071 (= lt!478750 (array!69356 (store (arr!33351 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33887 _keys!1070)))))

(declare-fun b!1079072 () Bool)

(declare-fun e!616950 () Bool)

(assert (=> b!1079072 (= e!616950 tp_is_empty!26199)))

(declare-fun res!719064 () Bool)

(assert (=> start!95544 (=> (not res!719064) (not e!616952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95544 (= res!719064 (validMask!0 mask!1414))))

(assert (=> start!95544 e!616952))

(assert (=> start!95544 true))

(declare-fun array_inv!25762 (array!69355) Bool)

(assert (=> start!95544 (array_inv!25762 _keys!1070)))

(declare-fun e!616955 () Bool)

(declare-fun array_inv!25763 (array!69357) Bool)

(assert (=> start!95544 (and (array_inv!25763 _values!874) e!616955)))

(declare-fun b!1079063 () Bool)

(assert (=> b!1079063 (= e!616955 (and e!616950 mapRes!41053))))

(declare-fun condMapEmpty!41053 () Bool)

(declare-fun mapDefault!41053 () ValueCell!12390)

(assert (=> b!1079063 (= condMapEmpty!41053 (= (arr!33352 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12390)) mapDefault!41053)))))

(assert (= (and start!95544 res!719064) b!1079065))

(assert (= (and b!1079065 res!719057) b!1079061))

(assert (= (and b!1079061 res!719060) b!1079069))

(assert (= (and b!1079069 res!719058) b!1079064))

(assert (= (and b!1079064 res!719056) b!1079067))

(assert (= (and b!1079067 res!719059) b!1079070))

(assert (= (and b!1079070 res!719062) b!1079071))

(assert (= (and b!1079071 res!719061) b!1079068))

(assert (= (and b!1079068 res!719063) b!1079062))

(assert (= (and b!1079063 condMapEmpty!41053) mapIsEmpty!41053))

(assert (= (and b!1079063 (not condMapEmpty!41053)) mapNonEmpty!41053))

(get-info :version)

(assert (= (and mapNonEmpty!41053 ((_ is ValueCellFull!12390) mapValue!41053)) b!1079066))

(assert (= (and b!1079063 ((_ is ValueCellFull!12390) mapDefault!41053)) b!1079072))

(assert (= start!95544 b!1079063))

(declare-fun m!997377 () Bool)

(assert (=> b!1079070 m!997377))

(declare-fun m!997379 () Bool)

(assert (=> b!1079062 m!997379))

(declare-fun m!997381 () Bool)

(assert (=> b!1079062 m!997381))

(declare-fun m!997383 () Bool)

(assert (=> b!1079067 m!997383))

(declare-fun m!997385 () Bool)

(assert (=> mapNonEmpty!41053 m!997385))

(declare-fun m!997387 () Bool)

(assert (=> start!95544 m!997387))

(declare-fun m!997389 () Bool)

(assert (=> start!95544 m!997389))

(declare-fun m!997391 () Bool)

(assert (=> start!95544 m!997391))

(declare-fun m!997393 () Bool)

(assert (=> b!1079071 m!997393))

(declare-fun m!997395 () Bool)

(assert (=> b!1079071 m!997395))

(declare-fun m!997397 () Bool)

(assert (=> b!1079069 m!997397))

(declare-fun m!997399 () Bool)

(assert (=> b!1079061 m!997399))

(declare-fun m!997401 () Bool)

(assert (=> b!1079068 m!997401))

(check-sat (not b!1079068) (not b!1079061) (not b!1079071) (not mapNonEmpty!41053) (not b!1079062) (not start!95544) (not b!1079067) (not b!1079069) tp_is_empty!26199)
(check-sat)
