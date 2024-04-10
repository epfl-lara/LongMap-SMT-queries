; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7406 () Bool)

(assert start!7406)

(declare-fun b!47542 () Bool)

(declare-fun e!30461 () Bool)

(declare-fun tp_is_empty!2043 () Bool)

(assert (=> b!47542 (= e!30461 tp_is_empty!2043)))

(declare-fun b!47543 () Bool)

(declare-fun e!30462 () Bool)

(declare-fun mapRes!2108 () Bool)

(assert (=> b!47543 (= e!30462 (and e!30461 mapRes!2108))))

(declare-fun condMapEmpty!2108 () Bool)

(declare-datatypes ((V!2457 0))(
  ( (V!2458 (val!1060 Int)) )
))
(declare-datatypes ((ValueCell!732 0))(
  ( (ValueCellFull!732 (v!2121 V!2457)) (EmptyCell!732) )
))
(declare-datatypes ((array!3149 0))(
  ( (array!3150 (arr!1509 (Array (_ BitVec 32) ValueCell!732)) (size!1731 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3149)

(declare-fun mapDefault!2108 () ValueCell!732)

(assert (=> b!47543 (= condMapEmpty!2108 (= (arr!1509 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!732)) mapDefault!2108)))))

(declare-fun b!47544 () Bool)

(declare-fun res!27654 () Bool)

(declare-fun e!30459 () Bool)

(assert (=> b!47544 (=> (not res!27654) (not e!30459))))

(declare-datatypes ((array!3151 0))(
  ( (array!3152 (arr!1510 (Array (_ BitVec 32) (_ BitVec 64))) (size!1732 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3151)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3151 (_ BitVec 32)) Bool)

(assert (=> b!47544 (= res!27654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47545 () Bool)

(declare-fun e!30460 () Bool)

(assert (=> b!47545 (= e!30460 tp_is_empty!2043)))

(declare-fun mapIsEmpty!2108 () Bool)

(assert (=> mapIsEmpty!2108 mapRes!2108))

(declare-fun b!47546 () Bool)

(assert (=> b!47546 (= e!30459 false)))

(declare-fun lt!20435 () Bool)

(declare-datatypes ((List!1262 0))(
  ( (Nil!1259) (Cons!1258 (h!1838 (_ BitVec 64)) (t!4290 List!1262)) )
))
(declare-fun arrayNoDuplicates!0 (array!3151 (_ BitVec 32) List!1262) Bool)

(assert (=> b!47546 (= lt!20435 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1259))))

(declare-fun b!47547 () Bool)

(declare-fun res!27655 () Bool)

(assert (=> b!47547 (=> (not res!27655) (not e!30459))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47547 (= res!27655 (and (= (size!1731 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1732 _keys!1940) (size!1731 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun res!27656 () Bool)

(assert (=> start!7406 (=> (not res!27656) (not e!30459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7406 (= res!27656 (validMask!0 mask!2458))))

(assert (=> start!7406 e!30459))

(assert (=> start!7406 true))

(declare-fun array_inv!908 (array!3149) Bool)

(assert (=> start!7406 (and (array_inv!908 _values!1550) e!30462)))

(declare-fun array_inv!909 (array!3151) Bool)

(assert (=> start!7406 (array_inv!909 _keys!1940)))

(declare-fun mapNonEmpty!2108 () Bool)

(declare-fun tp!6257 () Bool)

(assert (=> mapNonEmpty!2108 (= mapRes!2108 (and tp!6257 e!30460))))

(declare-fun mapRest!2108 () (Array (_ BitVec 32) ValueCell!732))

(declare-fun mapKey!2108 () (_ BitVec 32))

(declare-fun mapValue!2108 () ValueCell!732)

(assert (=> mapNonEmpty!2108 (= (arr!1509 _values!1550) (store mapRest!2108 mapKey!2108 mapValue!2108))))

(assert (= (and start!7406 res!27656) b!47547))

(assert (= (and b!47547 res!27655) b!47544))

(assert (= (and b!47544 res!27654) b!47546))

(assert (= (and b!47543 condMapEmpty!2108) mapIsEmpty!2108))

(assert (= (and b!47543 (not condMapEmpty!2108)) mapNonEmpty!2108))

(get-info :version)

(assert (= (and mapNonEmpty!2108 ((_ is ValueCellFull!732) mapValue!2108)) b!47545))

(assert (= (and b!47543 ((_ is ValueCellFull!732) mapDefault!2108)) b!47542))

(assert (= start!7406 b!47543))

(declare-fun m!41725 () Bool)

(assert (=> b!47544 m!41725))

(declare-fun m!41727 () Bool)

(assert (=> b!47546 m!41727))

(declare-fun m!41729 () Bool)

(assert (=> start!7406 m!41729))

(declare-fun m!41731 () Bool)

(assert (=> start!7406 m!41731))

(declare-fun m!41733 () Bool)

(assert (=> start!7406 m!41733))

(declare-fun m!41735 () Bool)

(assert (=> mapNonEmpty!2108 m!41735))

(check-sat (not mapNonEmpty!2108) (not start!7406) tp_is_empty!2043 (not b!47544) (not b!47546))
(check-sat)
