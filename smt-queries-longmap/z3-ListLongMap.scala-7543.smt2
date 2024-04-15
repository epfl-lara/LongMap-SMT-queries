; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95572 () Bool)

(assert start!95572)

(declare-fun mapNonEmpty!41104 () Bool)

(declare-fun mapRes!41104 () Bool)

(declare-fun tp!78566 () Bool)

(declare-fun e!617163 () Bool)

(assert (=> mapNonEmpty!41104 (= mapRes!41104 (and tp!78566 e!617163))))

(declare-datatypes ((V!40105 0))(
  ( (V!40106 (val!13173 Int)) )
))
(declare-datatypes ((ValueCell!12407 0))(
  ( (ValueCellFull!12407 (v!15793 V!40105)) (EmptyCell!12407) )
))
(declare-datatypes ((array!69350 0))(
  ( (array!69351 (arr!33349 (Array (_ BitVec 32) ValueCell!12407)) (size!33887 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69350)

(declare-fun mapValue!41104 () ValueCell!12407)

(declare-fun mapRest!41104 () (Array (_ BitVec 32) ValueCell!12407))

(declare-fun mapKey!41104 () (_ BitVec 32))

(assert (=> mapNonEmpty!41104 (= (arr!33349 _values!874) (store mapRest!41104 mapKey!41104 mapValue!41104))))

(declare-fun b!1079520 () Bool)

(declare-fun res!719454 () Bool)

(declare-fun e!617167 () Bool)

(assert (=> b!1079520 (=> (not res!719454) (not e!617167))))

(declare-datatypes ((array!69352 0))(
  ( (array!69353 (arr!33350 (Array (_ BitVec 32) (_ BitVec 64))) (size!33888 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69352)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079520 (= res!719454 (= (select (arr!33350 _keys!1070) i!650) k0!904))))

(declare-fun b!1079521 () Bool)

(declare-fun res!719447 () Bool)

(assert (=> b!1079521 (=> (not res!719447) (not e!617167))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079521 (= res!719447 (and (= (size!33887 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33888 _keys!1070) (size!33887 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079523 () Bool)

(declare-fun e!617168 () Bool)

(declare-fun tp_is_empty!26233 () Bool)

(assert (=> b!1079523 (= e!617168 tp_is_empty!26233)))

(declare-fun b!1079524 () Bool)

(declare-fun res!719450 () Bool)

(declare-fun e!617164 () Bool)

(assert (=> b!1079524 (=> (not res!719450) (not e!617164))))

(declare-fun lt!478652 () array!69352)

(declare-datatypes ((List!23316 0))(
  ( (Nil!23313) (Cons!23312 (h!24521 (_ BitVec 64)) (t!32666 List!23316)) )
))
(declare-fun arrayNoDuplicates!0 (array!69352 (_ BitVec 32) List!23316) Bool)

(assert (=> b!1079524 (= res!719450 (arrayNoDuplicates!0 lt!478652 #b00000000000000000000000000000000 Nil!23313))))

(declare-fun b!1079525 () Bool)

(declare-fun res!719449 () Bool)

(assert (=> b!1079525 (=> (not res!719449) (not e!617167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69352 (_ BitVec 32)) Bool)

(assert (=> b!1079525 (= res!719449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079526 () Bool)

(declare-fun res!719452 () Bool)

(assert (=> b!1079526 (=> (not res!719452) (not e!617167))))

(assert (=> b!1079526 (= res!719452 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33888 _keys!1070))))))

(declare-fun b!1079527 () Bool)

(assert (=> b!1079527 (= e!617164 (not true))))

(declare-fun arrayContainsKey!0 (array!69352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079527 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35347 0))(
  ( (Unit!35348) )
))
(declare-fun lt!478651 () Unit!35347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69352 (_ BitVec 64) (_ BitVec 32)) Unit!35347)

(assert (=> b!1079527 (= lt!478651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079528 () Bool)

(assert (=> b!1079528 (= e!617163 tp_is_empty!26233)))

(declare-fun b!1079529 () Bool)

(declare-fun e!617165 () Bool)

(assert (=> b!1079529 (= e!617165 (and e!617168 mapRes!41104))))

(declare-fun condMapEmpty!41104 () Bool)

(declare-fun mapDefault!41104 () ValueCell!12407)

(assert (=> b!1079529 (= condMapEmpty!41104 (= (arr!33349 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12407)) mapDefault!41104)))))

(declare-fun mapIsEmpty!41104 () Bool)

(assert (=> mapIsEmpty!41104 mapRes!41104))

(declare-fun b!1079530 () Bool)

(declare-fun res!719453 () Bool)

(assert (=> b!1079530 (=> (not res!719453) (not e!617167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079530 (= res!719453 (validKeyInArray!0 k0!904))))

(declare-fun b!1079531 () Bool)

(declare-fun res!719446 () Bool)

(assert (=> b!1079531 (=> (not res!719446) (not e!617167))))

(assert (=> b!1079531 (= res!719446 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23313))))

(declare-fun b!1079522 () Bool)

(assert (=> b!1079522 (= e!617167 e!617164)))

(declare-fun res!719448 () Bool)

(assert (=> b!1079522 (=> (not res!719448) (not e!617164))))

(assert (=> b!1079522 (= res!719448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478652 mask!1414))))

(assert (=> b!1079522 (= lt!478652 (array!69353 (store (arr!33350 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33888 _keys!1070)))))

(declare-fun res!719451 () Bool)

(assert (=> start!95572 (=> (not res!719451) (not e!617167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95572 (= res!719451 (validMask!0 mask!1414))))

(assert (=> start!95572 e!617167))

(assert (=> start!95572 true))

(declare-fun array_inv!25790 (array!69352) Bool)

(assert (=> start!95572 (array_inv!25790 _keys!1070)))

(declare-fun array_inv!25791 (array!69350) Bool)

(assert (=> start!95572 (and (array_inv!25791 _values!874) e!617165)))

(assert (= (and start!95572 res!719451) b!1079521))

(assert (= (and b!1079521 res!719447) b!1079525))

(assert (= (and b!1079525 res!719449) b!1079531))

(assert (= (and b!1079531 res!719446) b!1079526))

(assert (= (and b!1079526 res!719452) b!1079530))

(assert (= (and b!1079530 res!719453) b!1079520))

(assert (= (and b!1079520 res!719454) b!1079522))

(assert (= (and b!1079522 res!719448) b!1079524))

(assert (= (and b!1079524 res!719450) b!1079527))

(assert (= (and b!1079529 condMapEmpty!41104) mapIsEmpty!41104))

(assert (= (and b!1079529 (not condMapEmpty!41104)) mapNonEmpty!41104))

(get-info :version)

(assert (= (and mapNonEmpty!41104 ((_ is ValueCellFull!12407) mapValue!41104)) b!1079528))

(assert (= (and b!1079529 ((_ is ValueCellFull!12407) mapDefault!41104)) b!1079523))

(assert (= start!95572 b!1079529))

(declare-fun m!997193 () Bool)

(assert (=> b!1079531 m!997193))

(declare-fun m!997195 () Bool)

(assert (=> start!95572 m!997195))

(declare-fun m!997197 () Bool)

(assert (=> start!95572 m!997197))

(declare-fun m!997199 () Bool)

(assert (=> start!95572 m!997199))

(declare-fun m!997201 () Bool)

(assert (=> b!1079527 m!997201))

(declare-fun m!997203 () Bool)

(assert (=> b!1079527 m!997203))

(declare-fun m!997205 () Bool)

(assert (=> mapNonEmpty!41104 m!997205))

(declare-fun m!997207 () Bool)

(assert (=> b!1079525 m!997207))

(declare-fun m!997209 () Bool)

(assert (=> b!1079522 m!997209))

(declare-fun m!997211 () Bool)

(assert (=> b!1079522 m!997211))

(declare-fun m!997213 () Bool)

(assert (=> b!1079520 m!997213))

(declare-fun m!997215 () Bool)

(assert (=> b!1079530 m!997215))

(declare-fun m!997217 () Bool)

(assert (=> b!1079524 m!997217))

(check-sat (not start!95572) (not b!1079525) (not b!1079527) tp_is_empty!26233 (not mapNonEmpty!41104) (not b!1079530) (not b!1079522) (not b!1079524) (not b!1079531))
(check-sat)
