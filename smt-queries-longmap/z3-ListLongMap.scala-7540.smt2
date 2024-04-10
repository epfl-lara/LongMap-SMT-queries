; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95562 () Bool)

(assert start!95562)

(declare-fun b!1079386 () Bool)

(declare-fun e!617115 () Bool)

(declare-fun e!617114 () Bool)

(assert (=> b!1079386 (= e!617115 e!617114)))

(declare-fun res!719306 () Bool)

(assert (=> b!1079386 (=> (not res!719306) (not e!617114))))

(declare-datatypes ((array!69389 0))(
  ( (array!69390 (arr!33368 (Array (_ BitVec 32) (_ BitVec 64))) (size!33904 (_ BitVec 32))) )
))
(declare-fun lt!478803 () array!69389)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69389 (_ BitVec 32)) Bool)

(assert (=> b!1079386 (= res!719306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478803 mask!1414))))

(declare-fun _keys!1070 () array!69389)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079386 (= lt!478803 (array!69390 (store (arr!33368 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33904 _keys!1070)))))

(declare-fun b!1079387 () Bool)

(declare-fun e!617112 () Bool)

(declare-fun tp_is_empty!26217 () Bool)

(assert (=> b!1079387 (= e!617112 tp_is_empty!26217)))

(declare-fun b!1079388 () Bool)

(declare-fun res!719305 () Bool)

(assert (=> b!1079388 (=> (not res!719305) (not e!617115))))

(assert (=> b!1079388 (= res!719305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079389 () Bool)

(assert (=> b!1079389 (= e!617114 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079389 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35490 0))(
  ( (Unit!35491) )
))
(declare-fun lt!478804 () Unit!35490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69389 (_ BitVec 64) (_ BitVec 32)) Unit!35490)

(assert (=> b!1079389 (= lt!478804 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079390 () Bool)

(declare-fun res!719303 () Bool)

(assert (=> b!1079390 (=> (not res!719303) (not e!617115))))

(declare-datatypes ((List!23258 0))(
  ( (Nil!23255) (Cons!23254 (h!24463 (_ BitVec 64)) (t!32617 List!23258)) )
))
(declare-fun arrayNoDuplicates!0 (array!69389 (_ BitVec 32) List!23258) Bool)

(assert (=> b!1079390 (= res!719303 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23255))))

(declare-fun b!1079391 () Bool)

(declare-fun res!719300 () Bool)

(assert (=> b!1079391 (=> (not res!719300) (not e!617115))))

(assert (=> b!1079391 (= res!719300 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33904 _keys!1070))))))

(declare-fun mapNonEmpty!41080 () Bool)

(declare-fun mapRes!41080 () Bool)

(declare-fun tp!78542 () Bool)

(assert (=> mapNonEmpty!41080 (= mapRes!41080 (and tp!78542 e!617112))))

(declare-datatypes ((V!40083 0))(
  ( (V!40084 (val!13165 Int)) )
))
(declare-datatypes ((ValueCell!12399 0))(
  ( (ValueCellFull!12399 (v!15786 V!40083)) (EmptyCell!12399) )
))
(declare-datatypes ((array!69391 0))(
  ( (array!69392 (arr!33369 (Array (_ BitVec 32) ValueCell!12399)) (size!33905 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69391)

(declare-fun mapValue!41080 () ValueCell!12399)

(declare-fun mapRest!41080 () (Array (_ BitVec 32) ValueCell!12399))

(declare-fun mapKey!41080 () (_ BitVec 32))

(assert (=> mapNonEmpty!41080 (= (arr!33369 _values!874) (store mapRest!41080 mapKey!41080 mapValue!41080))))

(declare-fun b!1079392 () Bool)

(declare-fun res!719302 () Bool)

(assert (=> b!1079392 (=> (not res!719302) (not e!617114))))

(assert (=> b!1079392 (= res!719302 (arrayNoDuplicates!0 lt!478803 #b00000000000000000000000000000000 Nil!23255))))

(declare-fun b!1079393 () Bool)

(declare-fun e!617117 () Bool)

(declare-fun e!617113 () Bool)

(assert (=> b!1079393 (= e!617117 (and e!617113 mapRes!41080))))

(declare-fun condMapEmpty!41080 () Bool)

(declare-fun mapDefault!41080 () ValueCell!12399)

(assert (=> b!1079393 (= condMapEmpty!41080 (= (arr!33369 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12399)) mapDefault!41080)))))

(declare-fun b!1079394 () Bool)

(declare-fun res!719307 () Bool)

(assert (=> b!1079394 (=> (not res!719307) (not e!617115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079394 (= res!719307 (validKeyInArray!0 k0!904))))

(declare-fun res!719301 () Bool)

(assert (=> start!95562 (=> (not res!719301) (not e!617115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95562 (= res!719301 (validMask!0 mask!1414))))

(assert (=> start!95562 e!617115))

(assert (=> start!95562 true))

(declare-fun array_inv!25770 (array!69389) Bool)

(assert (=> start!95562 (array_inv!25770 _keys!1070)))

(declare-fun array_inv!25771 (array!69391) Bool)

(assert (=> start!95562 (and (array_inv!25771 _values!874) e!617117)))

(declare-fun b!1079385 () Bool)

(assert (=> b!1079385 (= e!617113 tp_is_empty!26217)))

(declare-fun b!1079395 () Bool)

(declare-fun res!719299 () Bool)

(assert (=> b!1079395 (=> (not res!719299) (not e!617115))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079395 (= res!719299 (and (= (size!33905 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33904 _keys!1070) (size!33905 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079396 () Bool)

(declare-fun res!719304 () Bool)

(assert (=> b!1079396 (=> (not res!719304) (not e!617115))))

(assert (=> b!1079396 (= res!719304 (= (select (arr!33368 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41080 () Bool)

(assert (=> mapIsEmpty!41080 mapRes!41080))

(assert (= (and start!95562 res!719301) b!1079395))

(assert (= (and b!1079395 res!719299) b!1079388))

(assert (= (and b!1079388 res!719305) b!1079390))

(assert (= (and b!1079390 res!719303) b!1079391))

(assert (= (and b!1079391 res!719300) b!1079394))

(assert (= (and b!1079394 res!719307) b!1079396))

(assert (= (and b!1079396 res!719304) b!1079386))

(assert (= (and b!1079386 res!719306) b!1079392))

(assert (= (and b!1079392 res!719302) b!1079389))

(assert (= (and b!1079393 condMapEmpty!41080) mapIsEmpty!41080))

(assert (= (and b!1079393 (not condMapEmpty!41080)) mapNonEmpty!41080))

(get-info :version)

(assert (= (and mapNonEmpty!41080 ((_ is ValueCellFull!12399) mapValue!41080)) b!1079387))

(assert (= (and b!1079393 ((_ is ValueCellFull!12399) mapDefault!41080)) b!1079385))

(assert (= start!95562 b!1079393))

(declare-fun m!997611 () Bool)

(assert (=> b!1079389 m!997611))

(declare-fun m!997613 () Bool)

(assert (=> b!1079389 m!997613))

(declare-fun m!997615 () Bool)

(assert (=> mapNonEmpty!41080 m!997615))

(declare-fun m!997617 () Bool)

(assert (=> b!1079396 m!997617))

(declare-fun m!997619 () Bool)

(assert (=> b!1079386 m!997619))

(declare-fun m!997621 () Bool)

(assert (=> b!1079386 m!997621))

(declare-fun m!997623 () Bool)

(assert (=> b!1079390 m!997623))

(declare-fun m!997625 () Bool)

(assert (=> b!1079394 m!997625))

(declare-fun m!997627 () Bool)

(assert (=> b!1079388 m!997627))

(declare-fun m!997629 () Bool)

(assert (=> start!95562 m!997629))

(declare-fun m!997631 () Bool)

(assert (=> start!95562 m!997631))

(declare-fun m!997633 () Bool)

(assert (=> start!95562 m!997633))

(declare-fun m!997635 () Bool)

(assert (=> b!1079392 m!997635))

(check-sat (not b!1079389) (not b!1079388) (not b!1079392) (not b!1079394) (not start!95562) (not b!1079390) tp_is_empty!26217 (not b!1079386) (not mapNonEmpty!41080))
(check-sat)
