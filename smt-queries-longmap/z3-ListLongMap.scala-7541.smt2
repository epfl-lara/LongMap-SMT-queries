; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95560 () Bool)

(assert start!95560)

(declare-fun b!1079304 () Bool)

(declare-fun e!617060 () Bool)

(declare-fun tp_is_empty!26221 () Bool)

(assert (=> b!1079304 (= e!617060 tp_is_empty!26221)))

(declare-fun b!1079305 () Bool)

(declare-fun e!617057 () Bool)

(declare-fun mapRes!41086 () Bool)

(assert (=> b!1079305 (= e!617057 (and e!617060 mapRes!41086))))

(declare-fun condMapEmpty!41086 () Bool)

(declare-datatypes ((V!40089 0))(
  ( (V!40090 (val!13167 Int)) )
))
(declare-datatypes ((ValueCell!12401 0))(
  ( (ValueCellFull!12401 (v!15787 V!40089)) (EmptyCell!12401) )
))
(declare-datatypes ((array!69326 0))(
  ( (array!69327 (arr!33337 (Array (_ BitVec 32) ValueCell!12401)) (size!33875 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69326)

(declare-fun mapDefault!41086 () ValueCell!12401)

(assert (=> b!1079305 (= condMapEmpty!41086 (= (arr!33337 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12401)) mapDefault!41086)))))

(declare-fun b!1079306 () Bool)

(declare-fun res!719290 () Bool)

(declare-fun e!617058 () Bool)

(assert (=> b!1079306 (=> (not res!719290) (not e!617058))))

(declare-datatypes ((array!69328 0))(
  ( (array!69329 (arr!33338 (Array (_ BitVec 32) (_ BitVec 64))) (size!33876 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69328)

(declare-datatypes ((List!23311 0))(
  ( (Nil!23308) (Cons!23307 (h!24516 (_ BitVec 64)) (t!32661 List!23311)) )
))
(declare-fun arrayNoDuplicates!0 (array!69328 (_ BitVec 32) List!23311) Bool)

(assert (=> b!1079306 (= res!719290 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23308))))

(declare-fun mapNonEmpty!41086 () Bool)

(declare-fun tp!78548 () Bool)

(declare-fun e!617059 () Bool)

(assert (=> mapNonEmpty!41086 (= mapRes!41086 (and tp!78548 e!617059))))

(declare-fun mapKey!41086 () (_ BitVec 32))

(declare-fun mapValue!41086 () ValueCell!12401)

(declare-fun mapRest!41086 () (Array (_ BitVec 32) ValueCell!12401))

(assert (=> mapNonEmpty!41086 (= (arr!33337 _values!874) (store mapRest!41086 mapKey!41086 mapValue!41086))))

(declare-fun b!1079307 () Bool)

(declare-fun res!719288 () Bool)

(assert (=> b!1079307 (=> (not res!719288) (not e!617058))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079307 (= res!719288 (and (= (size!33875 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33876 _keys!1070) (size!33875 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719287 () Bool)

(assert (=> start!95560 (=> (not res!719287) (not e!617058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95560 (= res!719287 (validMask!0 mask!1414))))

(assert (=> start!95560 e!617058))

(assert (=> start!95560 true))

(declare-fun array_inv!25780 (array!69328) Bool)

(assert (=> start!95560 (array_inv!25780 _keys!1070)))

(declare-fun array_inv!25781 (array!69326) Bool)

(assert (=> start!95560 (and (array_inv!25781 _values!874) e!617057)))

(declare-fun b!1079308 () Bool)

(declare-fun e!617056 () Bool)

(assert (=> b!1079308 (= e!617058 e!617056)))

(declare-fun res!719289 () Bool)

(assert (=> b!1079308 (=> (not res!719289) (not e!617056))))

(declare-fun lt!478615 () array!69328)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69328 (_ BitVec 32)) Bool)

(assert (=> b!1079308 (= res!719289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478615 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079308 (= lt!478615 (array!69329 (store (arr!33338 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33876 _keys!1070)))))

(declare-fun b!1079309 () Bool)

(assert (=> b!1079309 (= e!617059 tp_is_empty!26221)))

(declare-fun b!1079310 () Bool)

(declare-fun res!719291 () Bool)

(assert (=> b!1079310 (=> (not res!719291) (not e!617058))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079310 (= res!719291 (= (select (arr!33338 _keys!1070) i!650) k0!904))))

(declare-fun b!1079311 () Bool)

(declare-fun res!719292 () Bool)

(assert (=> b!1079311 (=> (not res!719292) (not e!617058))))

(assert (=> b!1079311 (= res!719292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079312 () Bool)

(assert (=> b!1079312 (= e!617056 (not true))))

(declare-fun arrayContainsKey!0 (array!69328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079312 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35339 0))(
  ( (Unit!35340) )
))
(declare-fun lt!478616 () Unit!35339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69328 (_ BitVec 64) (_ BitVec 32)) Unit!35339)

(assert (=> b!1079312 (= lt!478616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079313 () Bool)

(declare-fun res!719285 () Bool)

(assert (=> b!1079313 (=> (not res!719285) (not e!617058))))

(assert (=> b!1079313 (= res!719285 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33876 _keys!1070))))))

(declare-fun mapIsEmpty!41086 () Bool)

(assert (=> mapIsEmpty!41086 mapRes!41086))

(declare-fun b!1079314 () Bool)

(declare-fun res!719284 () Bool)

(assert (=> b!1079314 (=> (not res!719284) (not e!617056))))

(assert (=> b!1079314 (= res!719284 (arrayNoDuplicates!0 lt!478615 #b00000000000000000000000000000000 Nil!23308))))

(declare-fun b!1079315 () Bool)

(declare-fun res!719286 () Bool)

(assert (=> b!1079315 (=> (not res!719286) (not e!617058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079315 (= res!719286 (validKeyInArray!0 k0!904))))

(assert (= (and start!95560 res!719287) b!1079307))

(assert (= (and b!1079307 res!719288) b!1079311))

(assert (= (and b!1079311 res!719292) b!1079306))

(assert (= (and b!1079306 res!719290) b!1079313))

(assert (= (and b!1079313 res!719285) b!1079315))

(assert (= (and b!1079315 res!719286) b!1079310))

(assert (= (and b!1079310 res!719291) b!1079308))

(assert (= (and b!1079308 res!719289) b!1079314))

(assert (= (and b!1079314 res!719284) b!1079312))

(assert (= (and b!1079305 condMapEmpty!41086) mapIsEmpty!41086))

(assert (= (and b!1079305 (not condMapEmpty!41086)) mapNonEmpty!41086))

(get-info :version)

(assert (= (and mapNonEmpty!41086 ((_ is ValueCellFull!12401) mapValue!41086)) b!1079309))

(assert (= (and b!1079305 ((_ is ValueCellFull!12401) mapDefault!41086)) b!1079304))

(assert (= start!95560 b!1079305))

(declare-fun m!997037 () Bool)

(assert (=> b!1079315 m!997037))

(declare-fun m!997039 () Bool)

(assert (=> b!1079311 m!997039))

(declare-fun m!997041 () Bool)

(assert (=> mapNonEmpty!41086 m!997041))

(declare-fun m!997043 () Bool)

(assert (=> b!1079312 m!997043))

(declare-fun m!997045 () Bool)

(assert (=> b!1079312 m!997045))

(declare-fun m!997047 () Bool)

(assert (=> b!1079308 m!997047))

(declare-fun m!997049 () Bool)

(assert (=> b!1079308 m!997049))

(declare-fun m!997051 () Bool)

(assert (=> b!1079310 m!997051))

(declare-fun m!997053 () Bool)

(assert (=> start!95560 m!997053))

(declare-fun m!997055 () Bool)

(assert (=> start!95560 m!997055))

(declare-fun m!997057 () Bool)

(assert (=> start!95560 m!997057))

(declare-fun m!997059 () Bool)

(assert (=> b!1079314 m!997059))

(declare-fun m!997061 () Bool)

(assert (=> b!1079306 m!997061))

(check-sat (not b!1079306) (not b!1079315) (not b!1079308) (not start!95560) (not b!1079311) (not mapNonEmpty!41086) (not b!1079314) (not b!1079312) tp_is_empty!26221)
(check-sat)
