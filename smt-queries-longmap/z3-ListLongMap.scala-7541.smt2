; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95568 () Bool)

(assert start!95568)

(declare-fun b!1079493 () Bool)

(declare-fun res!719380 () Bool)

(declare-fun e!617170 () Bool)

(assert (=> b!1079493 (=> (not res!719380) (not e!617170))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69401 0))(
  ( (array!69402 (arr!33374 (Array (_ BitVec 32) (_ BitVec 64))) (size!33910 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69401)

(declare-datatypes ((V!40091 0))(
  ( (V!40092 (val!13168 Int)) )
))
(declare-datatypes ((ValueCell!12402 0))(
  ( (ValueCellFull!12402 (v!15789 V!40091)) (EmptyCell!12402) )
))
(declare-datatypes ((array!69403 0))(
  ( (array!69404 (arr!33375 (Array (_ BitVec 32) ValueCell!12402)) (size!33911 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69403)

(assert (=> b!1079493 (= res!719380 (and (= (size!33911 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33910 _keys!1070) (size!33911 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079494 () Bool)

(declare-fun e!617168 () Bool)

(declare-fun e!617166 () Bool)

(declare-fun mapRes!41089 () Bool)

(assert (=> b!1079494 (= e!617168 (and e!617166 mapRes!41089))))

(declare-fun condMapEmpty!41089 () Bool)

(declare-fun mapDefault!41089 () ValueCell!12402)

(assert (=> b!1079494 (= condMapEmpty!41089 (= (arr!33375 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12402)) mapDefault!41089)))))

(declare-fun b!1079495 () Bool)

(declare-fun res!719385 () Bool)

(assert (=> b!1079495 (=> (not res!719385) (not e!617170))))

(declare-datatypes ((List!23261 0))(
  ( (Nil!23258) (Cons!23257 (h!24466 (_ BitVec 64)) (t!32620 List!23261)) )
))
(declare-fun arrayNoDuplicates!0 (array!69401 (_ BitVec 32) List!23261) Bool)

(assert (=> b!1079495 (= res!719385 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23258))))

(declare-fun mapIsEmpty!41089 () Bool)

(assert (=> mapIsEmpty!41089 mapRes!41089))

(declare-fun b!1079496 () Bool)

(declare-fun e!617167 () Bool)

(assert (=> b!1079496 (= e!617170 e!617167)))

(declare-fun res!719388 () Bool)

(assert (=> b!1079496 (=> (not res!719388) (not e!617167))))

(declare-fun lt!478821 () array!69401)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69401 (_ BitVec 32)) Bool)

(assert (=> b!1079496 (= res!719388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478821 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079496 (= lt!478821 (array!69402 (store (arr!33374 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33910 _keys!1070)))))

(declare-fun mapNonEmpty!41089 () Bool)

(declare-fun tp!78551 () Bool)

(declare-fun e!617171 () Bool)

(assert (=> mapNonEmpty!41089 (= mapRes!41089 (and tp!78551 e!617171))))

(declare-fun mapKey!41089 () (_ BitVec 32))

(declare-fun mapValue!41089 () ValueCell!12402)

(declare-fun mapRest!41089 () (Array (_ BitVec 32) ValueCell!12402))

(assert (=> mapNonEmpty!41089 (= (arr!33375 _values!874) (store mapRest!41089 mapKey!41089 mapValue!41089))))

(declare-fun b!1079498 () Bool)

(declare-fun tp_is_empty!26223 () Bool)

(assert (=> b!1079498 (= e!617171 tp_is_empty!26223)))

(declare-fun b!1079499 () Bool)

(assert (=> b!1079499 (= e!617167 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079499 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35494 0))(
  ( (Unit!35495) )
))
(declare-fun lt!478822 () Unit!35494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69401 (_ BitVec 64) (_ BitVec 32)) Unit!35494)

(assert (=> b!1079499 (= lt!478822 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079500 () Bool)

(assert (=> b!1079500 (= e!617166 tp_is_empty!26223)))

(declare-fun b!1079501 () Bool)

(declare-fun res!719381 () Bool)

(assert (=> b!1079501 (=> (not res!719381) (not e!617170))))

(assert (=> b!1079501 (= res!719381 (= (select (arr!33374 _keys!1070) i!650) k0!904))))

(declare-fun b!1079502 () Bool)

(declare-fun res!719387 () Bool)

(assert (=> b!1079502 (=> (not res!719387) (not e!617170))))

(assert (=> b!1079502 (= res!719387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079497 () Bool)

(declare-fun res!719382 () Bool)

(assert (=> b!1079497 (=> (not res!719382) (not e!617170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079497 (= res!719382 (validKeyInArray!0 k0!904))))

(declare-fun res!719383 () Bool)

(assert (=> start!95568 (=> (not res!719383) (not e!617170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95568 (= res!719383 (validMask!0 mask!1414))))

(assert (=> start!95568 e!617170))

(assert (=> start!95568 true))

(declare-fun array_inv!25774 (array!69401) Bool)

(assert (=> start!95568 (array_inv!25774 _keys!1070)))

(declare-fun array_inv!25775 (array!69403) Bool)

(assert (=> start!95568 (and (array_inv!25775 _values!874) e!617168)))

(declare-fun b!1079503 () Bool)

(declare-fun res!719384 () Bool)

(assert (=> b!1079503 (=> (not res!719384) (not e!617170))))

(assert (=> b!1079503 (= res!719384 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33910 _keys!1070))))))

(declare-fun b!1079504 () Bool)

(declare-fun res!719386 () Bool)

(assert (=> b!1079504 (=> (not res!719386) (not e!617167))))

(assert (=> b!1079504 (= res!719386 (arrayNoDuplicates!0 lt!478821 #b00000000000000000000000000000000 Nil!23258))))

(assert (= (and start!95568 res!719383) b!1079493))

(assert (= (and b!1079493 res!719380) b!1079502))

(assert (= (and b!1079502 res!719387) b!1079495))

(assert (= (and b!1079495 res!719385) b!1079503))

(assert (= (and b!1079503 res!719384) b!1079497))

(assert (= (and b!1079497 res!719382) b!1079501))

(assert (= (and b!1079501 res!719381) b!1079496))

(assert (= (and b!1079496 res!719388) b!1079504))

(assert (= (and b!1079504 res!719386) b!1079499))

(assert (= (and b!1079494 condMapEmpty!41089) mapIsEmpty!41089))

(assert (= (and b!1079494 (not condMapEmpty!41089)) mapNonEmpty!41089))

(get-info :version)

(assert (= (and mapNonEmpty!41089 ((_ is ValueCellFull!12402) mapValue!41089)) b!1079498))

(assert (= (and b!1079494 ((_ is ValueCellFull!12402) mapDefault!41089)) b!1079500))

(assert (= start!95568 b!1079494))

(declare-fun m!997689 () Bool)

(assert (=> b!1079497 m!997689))

(declare-fun m!997691 () Bool)

(assert (=> b!1079499 m!997691))

(declare-fun m!997693 () Bool)

(assert (=> b!1079499 m!997693))

(declare-fun m!997695 () Bool)

(assert (=> b!1079504 m!997695))

(declare-fun m!997697 () Bool)

(assert (=> b!1079496 m!997697))

(declare-fun m!997699 () Bool)

(assert (=> b!1079496 m!997699))

(declare-fun m!997701 () Bool)

(assert (=> mapNonEmpty!41089 m!997701))

(declare-fun m!997703 () Bool)

(assert (=> start!95568 m!997703))

(declare-fun m!997705 () Bool)

(assert (=> start!95568 m!997705))

(declare-fun m!997707 () Bool)

(assert (=> start!95568 m!997707))

(declare-fun m!997709 () Bool)

(assert (=> b!1079495 m!997709))

(declare-fun m!997711 () Bool)

(assert (=> b!1079501 m!997711))

(declare-fun m!997713 () Bool)

(assert (=> b!1079502 m!997713))

(check-sat (not b!1079495) (not b!1079497) (not start!95568) (not b!1079502) (not b!1079499) (not b!1079504) tp_is_empty!26223 (not b!1079496) (not mapNonEmpty!41089))
(check-sat)
