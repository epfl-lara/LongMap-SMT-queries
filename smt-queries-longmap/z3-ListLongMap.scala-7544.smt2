; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95820 () Bool)

(assert start!95820)

(declare-fun mapNonEmpty!41113 () Bool)

(declare-fun mapRes!41113 () Bool)

(declare-fun tp!78575 () Bool)

(declare-fun e!618168 () Bool)

(assert (=> mapNonEmpty!41113 (= mapRes!41113 (and tp!78575 e!618168))))

(declare-datatypes ((V!40113 0))(
  ( (V!40114 (val!13176 Int)) )
))
(declare-datatypes ((ValueCell!12410 0))(
  ( (ValueCellFull!12410 (v!15793 V!40113)) (EmptyCell!12410) )
))
(declare-fun mapRest!41113 () (Array (_ BitVec 32) ValueCell!12410))

(declare-datatypes ((array!69467 0))(
  ( (array!69468 (arr!33401 (Array (_ BitVec 32) ValueCell!12410)) (size!33938 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69467)

(declare-fun mapValue!41113 () ValueCell!12410)

(declare-fun mapKey!41113 () (_ BitVec 32))

(assert (=> mapNonEmpty!41113 (= (arr!33401 _values!874) (store mapRest!41113 mapKey!41113 mapValue!41113))))

(declare-fun b!1081108 () Bool)

(declare-fun tp_is_empty!26239 () Bool)

(assert (=> b!1081108 (= e!618168 tp_is_empty!26239)))

(declare-fun res!720120 () Bool)

(declare-fun e!618167 () Bool)

(assert (=> start!95820 (=> (not res!720120) (not e!618167))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95820 (= res!720120 (validMask!0 mask!1414))))

(assert (=> start!95820 e!618167))

(assert (=> start!95820 true))

(declare-datatypes ((array!69469 0))(
  ( (array!69470 (arr!33402 (Array (_ BitVec 32) (_ BitVec 64))) (size!33939 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69469)

(declare-fun array_inv!25828 (array!69469) Bool)

(assert (=> start!95820 (array_inv!25828 _keys!1070)))

(declare-fun e!618169 () Bool)

(declare-fun array_inv!25829 (array!69467) Bool)

(assert (=> start!95820 (and (array_inv!25829 _values!874) e!618169)))

(declare-fun b!1081109 () Bool)

(declare-fun e!618166 () Bool)

(assert (=> b!1081109 (= e!618169 (and e!618166 mapRes!41113))))

(declare-fun condMapEmpty!41113 () Bool)

(declare-fun mapDefault!41113 () ValueCell!12410)

(assert (=> b!1081109 (= condMapEmpty!41113 (= (arr!33401 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12410)) mapDefault!41113)))))

(declare-fun b!1081110 () Bool)

(declare-fun res!720121 () Bool)

(declare-fun e!618170 () Bool)

(assert (=> b!1081110 (=> (not res!720121) (not e!618170))))

(declare-fun lt!479384 () array!69469)

(declare-datatypes ((List!23275 0))(
  ( (Nil!23272) (Cons!23271 (h!24489 (_ BitVec 64)) (t!32626 List!23275)) )
))
(declare-fun arrayNoDuplicates!0 (array!69469 (_ BitVec 32) List!23275) Bool)

(assert (=> b!1081110 (= res!720121 (arrayNoDuplicates!0 lt!479384 #b00000000000000000000000000000000 Nil!23272))))

(declare-fun b!1081111 () Bool)

(declare-fun res!720118 () Bool)

(assert (=> b!1081111 (=> (not res!720118) (not e!618167))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081111 (= res!720118 (= (select (arr!33402 _keys!1070) i!650) k0!904))))

(declare-fun b!1081112 () Bool)

(declare-fun res!720124 () Bool)

(assert (=> b!1081112 (=> (not res!720124) (not e!618167))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081112 (= res!720124 (and (= (size!33938 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33939 _keys!1070) (size!33938 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081113 () Bool)

(declare-fun res!720123 () Bool)

(assert (=> b!1081113 (=> (not res!720123) (not e!618167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081113 (= res!720123 (validKeyInArray!0 k0!904))))

(declare-fun b!1081114 () Bool)

(declare-fun res!720126 () Bool)

(assert (=> b!1081114 (=> (not res!720126) (not e!618167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69469 (_ BitVec 32)) Bool)

(assert (=> b!1081114 (= res!720126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081115 () Bool)

(declare-fun res!720119 () Bool)

(assert (=> b!1081115 (=> (not res!720119) (not e!618167))))

(assert (=> b!1081115 (= res!720119 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23272))))

(declare-fun b!1081116 () Bool)

(assert (=> b!1081116 (= e!618170 (not true))))

(declare-fun arrayContainsKey!0 (array!69469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081116 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35479 0))(
  ( (Unit!35480) )
))
(declare-fun lt!479385 () Unit!35479)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69469 (_ BitVec 64) (_ BitVec 32)) Unit!35479)

(assert (=> b!1081116 (= lt!479385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081117 () Bool)

(assert (=> b!1081117 (= e!618166 tp_is_empty!26239)))

(declare-fun mapIsEmpty!41113 () Bool)

(assert (=> mapIsEmpty!41113 mapRes!41113))

(declare-fun b!1081118 () Bool)

(declare-fun res!720125 () Bool)

(assert (=> b!1081118 (=> (not res!720125) (not e!618167))))

(assert (=> b!1081118 (= res!720125 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33939 _keys!1070))))))

(declare-fun b!1081119 () Bool)

(assert (=> b!1081119 (= e!618167 e!618170)))

(declare-fun res!720122 () Bool)

(assert (=> b!1081119 (=> (not res!720122) (not e!618170))))

(assert (=> b!1081119 (= res!720122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479384 mask!1414))))

(assert (=> b!1081119 (= lt!479384 (array!69470 (store (arr!33402 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33939 _keys!1070)))))

(assert (= (and start!95820 res!720120) b!1081112))

(assert (= (and b!1081112 res!720124) b!1081114))

(assert (= (and b!1081114 res!720126) b!1081115))

(assert (= (and b!1081115 res!720119) b!1081118))

(assert (= (and b!1081118 res!720125) b!1081113))

(assert (= (and b!1081113 res!720123) b!1081111))

(assert (= (and b!1081111 res!720118) b!1081119))

(assert (= (and b!1081119 res!720122) b!1081110))

(assert (= (and b!1081110 res!720121) b!1081116))

(assert (= (and b!1081109 condMapEmpty!41113) mapIsEmpty!41113))

(assert (= (and b!1081109 (not condMapEmpty!41113)) mapNonEmpty!41113))

(get-info :version)

(assert (= (and mapNonEmpty!41113 ((_ is ValueCellFull!12410) mapValue!41113)) b!1081108))

(assert (= (and b!1081109 ((_ is ValueCellFull!12410) mapDefault!41113)) b!1081117))

(assert (= start!95820 b!1081109))

(declare-fun m!999569 () Bool)

(assert (=> mapNonEmpty!41113 m!999569))

(declare-fun m!999571 () Bool)

(assert (=> b!1081119 m!999571))

(declare-fun m!999573 () Bool)

(assert (=> b!1081119 m!999573))

(declare-fun m!999575 () Bool)

(assert (=> b!1081110 m!999575))

(declare-fun m!999577 () Bool)

(assert (=> b!1081116 m!999577))

(declare-fun m!999579 () Bool)

(assert (=> b!1081116 m!999579))

(declare-fun m!999581 () Bool)

(assert (=> b!1081113 m!999581))

(declare-fun m!999583 () Bool)

(assert (=> start!95820 m!999583))

(declare-fun m!999585 () Bool)

(assert (=> start!95820 m!999585))

(declare-fun m!999587 () Bool)

(assert (=> start!95820 m!999587))

(declare-fun m!999589 () Bool)

(assert (=> b!1081115 m!999589))

(declare-fun m!999591 () Bool)

(assert (=> b!1081114 m!999591))

(declare-fun m!999593 () Bool)

(assert (=> b!1081111 m!999593))

(check-sat (not b!1081119) (not mapNonEmpty!41113) (not b!1081116) (not b!1081113) tp_is_empty!26239 (not b!1081114) (not start!95820) (not b!1081110) (not b!1081115))
(check-sat)
