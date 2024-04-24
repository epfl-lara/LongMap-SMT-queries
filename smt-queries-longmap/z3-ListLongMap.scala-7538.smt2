; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95784 () Bool)

(assert start!95784)

(declare-fun b!1080460 () Bool)

(declare-fun res!719639 () Bool)

(declare-fun e!617844 () Bool)

(assert (=> b!1080460 (=> (not res!719639) (not e!617844))))

(declare-datatypes ((array!69397 0))(
  ( (array!69398 (arr!33366 (Array (_ BitVec 32) (_ BitVec 64))) (size!33903 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69397)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69397 (_ BitVec 32)) Bool)

(assert (=> b!1080460 (= res!719639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080461 () Bool)

(declare-fun res!719637 () Bool)

(declare-fun e!617845 () Bool)

(assert (=> b!1080461 (=> (not res!719637) (not e!617845))))

(declare-fun lt!479276 () array!69397)

(declare-datatypes ((List!23261 0))(
  ( (Nil!23258) (Cons!23257 (h!24475 (_ BitVec 64)) (t!32612 List!23261)) )
))
(declare-fun arrayNoDuplicates!0 (array!69397 (_ BitVec 32) List!23261) Bool)

(assert (=> b!1080461 (= res!719637 (arrayNoDuplicates!0 lt!479276 #b00000000000000000000000000000000 Nil!23258))))

(declare-fun b!1080462 () Bool)

(declare-fun e!617842 () Bool)

(declare-fun tp_is_empty!26203 () Bool)

(assert (=> b!1080462 (= e!617842 tp_is_empty!26203)))

(declare-fun b!1080463 () Bool)

(declare-fun res!719640 () Bool)

(assert (=> b!1080463 (=> (not res!719640) (not e!617844))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080463 (= res!719640 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33903 _keys!1070))))))

(declare-fun b!1080464 () Bool)

(declare-fun e!617843 () Bool)

(declare-fun e!617841 () Bool)

(declare-fun mapRes!41059 () Bool)

(assert (=> b!1080464 (= e!617843 (and e!617841 mapRes!41059))))

(declare-fun condMapEmpty!41059 () Bool)

(declare-datatypes ((V!40065 0))(
  ( (V!40066 (val!13158 Int)) )
))
(declare-datatypes ((ValueCell!12392 0))(
  ( (ValueCellFull!12392 (v!15775 V!40065)) (EmptyCell!12392) )
))
(declare-datatypes ((array!69399 0))(
  ( (array!69400 (arr!33367 (Array (_ BitVec 32) ValueCell!12392)) (size!33904 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69399)

(declare-fun mapDefault!41059 () ValueCell!12392)

(assert (=> b!1080464 (= condMapEmpty!41059 (= (arr!33367 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12392)) mapDefault!41059)))))

(declare-fun b!1080465 () Bool)

(declare-fun res!719638 () Bool)

(assert (=> b!1080465 (=> (not res!719638) (not e!617844))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1080465 (= res!719638 (= (select (arr!33366 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41059 () Bool)

(assert (=> mapIsEmpty!41059 mapRes!41059))

(declare-fun b!1080467 () Bool)

(assert (=> b!1080467 (= e!617845 (not true))))

(declare-fun arrayContainsKey!0 (array!69397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080467 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35455 0))(
  ( (Unit!35456) )
))
(declare-fun lt!479277 () Unit!35455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69397 (_ BitVec 64) (_ BitVec 32)) Unit!35455)

(assert (=> b!1080467 (= lt!479277 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080468 () Bool)

(assert (=> b!1080468 (= e!617844 e!617845)))

(declare-fun res!719636 () Bool)

(assert (=> b!1080468 (=> (not res!719636) (not e!617845))))

(assert (=> b!1080468 (= res!719636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479276 mask!1414))))

(assert (=> b!1080468 (= lt!479276 (array!69398 (store (arr!33366 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33903 _keys!1070)))))

(declare-fun b!1080469 () Bool)

(declare-fun res!719633 () Bool)

(assert (=> b!1080469 (=> (not res!719633) (not e!617844))))

(assert (=> b!1080469 (= res!719633 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23258))))

(declare-fun b!1080470 () Bool)

(declare-fun res!719632 () Bool)

(assert (=> b!1080470 (=> (not res!719632) (not e!617844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080470 (= res!719632 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41059 () Bool)

(declare-fun tp!78521 () Bool)

(assert (=> mapNonEmpty!41059 (= mapRes!41059 (and tp!78521 e!617842))))

(declare-fun mapRest!41059 () (Array (_ BitVec 32) ValueCell!12392))

(declare-fun mapKey!41059 () (_ BitVec 32))

(declare-fun mapValue!41059 () ValueCell!12392)

(assert (=> mapNonEmpty!41059 (= (arr!33367 _values!874) (store mapRest!41059 mapKey!41059 mapValue!41059))))

(declare-fun b!1080471 () Bool)

(assert (=> b!1080471 (= e!617841 tp_is_empty!26203)))

(declare-fun b!1080466 () Bool)

(declare-fun res!719635 () Bool)

(assert (=> b!1080466 (=> (not res!719635) (not e!617844))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080466 (= res!719635 (and (= (size!33904 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33903 _keys!1070) (size!33904 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719634 () Bool)

(assert (=> start!95784 (=> (not res!719634) (not e!617844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95784 (= res!719634 (validMask!0 mask!1414))))

(assert (=> start!95784 e!617844))

(assert (=> start!95784 true))

(declare-fun array_inv!25804 (array!69397) Bool)

(assert (=> start!95784 (array_inv!25804 _keys!1070)))

(declare-fun array_inv!25805 (array!69399) Bool)

(assert (=> start!95784 (and (array_inv!25805 _values!874) e!617843)))

(assert (= (and start!95784 res!719634) b!1080466))

(assert (= (and b!1080466 res!719635) b!1080460))

(assert (= (and b!1080460 res!719639) b!1080469))

(assert (= (and b!1080469 res!719633) b!1080463))

(assert (= (and b!1080463 res!719640) b!1080470))

(assert (= (and b!1080470 res!719632) b!1080465))

(assert (= (and b!1080465 res!719638) b!1080468))

(assert (= (and b!1080468 res!719636) b!1080461))

(assert (= (and b!1080461 res!719637) b!1080467))

(assert (= (and b!1080464 condMapEmpty!41059) mapIsEmpty!41059))

(assert (= (and b!1080464 (not condMapEmpty!41059)) mapNonEmpty!41059))

(get-info :version)

(assert (= (and mapNonEmpty!41059 ((_ is ValueCellFull!12392) mapValue!41059)) b!1080462))

(assert (= (and b!1080464 ((_ is ValueCellFull!12392) mapDefault!41059)) b!1080471))

(assert (= start!95784 b!1080464))

(declare-fun m!999101 () Bool)

(assert (=> b!1080460 m!999101))

(declare-fun m!999103 () Bool)

(assert (=> mapNonEmpty!41059 m!999103))

(declare-fun m!999105 () Bool)

(assert (=> b!1080470 m!999105))

(declare-fun m!999107 () Bool)

(assert (=> b!1080467 m!999107))

(declare-fun m!999109 () Bool)

(assert (=> b!1080467 m!999109))

(declare-fun m!999111 () Bool)

(assert (=> b!1080461 m!999111))

(declare-fun m!999113 () Bool)

(assert (=> start!95784 m!999113))

(declare-fun m!999115 () Bool)

(assert (=> start!95784 m!999115))

(declare-fun m!999117 () Bool)

(assert (=> start!95784 m!999117))

(declare-fun m!999119 () Bool)

(assert (=> b!1080469 m!999119))

(declare-fun m!999121 () Bool)

(assert (=> b!1080468 m!999121))

(declare-fun m!999123 () Bool)

(assert (=> b!1080468 m!999123))

(declare-fun m!999125 () Bool)

(assert (=> b!1080465 m!999125))

(check-sat (not b!1080469) (not b!1080467) (not b!1080460) (not start!95784) (not b!1080461) (not b!1080468) tp_is_empty!26203 (not b!1080470) (not mapNonEmpty!41059))
(check-sat)
