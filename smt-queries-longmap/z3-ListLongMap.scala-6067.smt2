; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78512 () Bool)

(assert start!78512)

(declare-fun b!915300 () Bool)

(declare-fun e!513660 () Bool)

(assert (=> b!915300 (= e!513660 false)))

(declare-fun lt!411649 () Bool)

(declare-datatypes ((array!54464 0))(
  ( (array!54465 (arr!26177 (Array (_ BitVec 32) (_ BitVec 64))) (size!26636 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54464)

(declare-datatypes ((List!18366 0))(
  ( (Nil!18363) (Cons!18362 (h!19508 (_ BitVec 64)) (t!25979 List!18366)) )
))
(declare-fun arrayNoDuplicates!0 (array!54464 (_ BitVec 32) List!18366) Bool)

(assert (=> b!915300 (= lt!411649 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18363))))

(declare-fun res!617138 () Bool)

(assert (=> start!78512 (=> (not res!617138) (not e!513660))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78512 (= res!617138 (validMask!0 mask!1881))))

(assert (=> start!78512 e!513660))

(assert (=> start!78512 true))

(declare-datatypes ((V!30609 0))(
  ( (V!30610 (val!9667 Int)) )
))
(declare-datatypes ((ValueCell!9135 0))(
  ( (ValueCellFull!9135 (v!12185 V!30609)) (EmptyCell!9135) )
))
(declare-datatypes ((array!54466 0))(
  ( (array!54467 (arr!26178 (Array (_ BitVec 32) ValueCell!9135)) (size!26637 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54466)

(declare-fun e!513661 () Bool)

(declare-fun array_inv!20438 (array!54466) Bool)

(assert (=> start!78512 (and (array_inv!20438 _values!1231) e!513661)))

(declare-fun array_inv!20439 (array!54464) Bool)

(assert (=> start!78512 (array_inv!20439 _keys!1487)))

(declare-fun mapIsEmpty!30606 () Bool)

(declare-fun mapRes!30606 () Bool)

(assert (=> mapIsEmpty!30606 mapRes!30606))

(declare-fun b!915301 () Bool)

(declare-fun res!617140 () Bool)

(assert (=> b!915301 (=> (not res!617140) (not e!513660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54464 (_ BitVec 32)) Bool)

(assert (=> b!915301 (= res!617140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915302 () Bool)

(declare-fun e!513658 () Bool)

(assert (=> b!915302 (= e!513661 (and e!513658 mapRes!30606))))

(declare-fun condMapEmpty!30606 () Bool)

(declare-fun mapDefault!30606 () ValueCell!9135)

(assert (=> b!915302 (= condMapEmpty!30606 (= (arr!26178 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9135)) mapDefault!30606)))))

(declare-fun b!915303 () Bool)

(declare-fun e!513657 () Bool)

(declare-fun tp_is_empty!19233 () Bool)

(assert (=> b!915303 (= e!513657 tp_is_empty!19233)))

(declare-fun b!915304 () Bool)

(assert (=> b!915304 (= e!513658 tp_is_empty!19233)))

(declare-fun mapNonEmpty!30606 () Bool)

(declare-fun tp!58673 () Bool)

(assert (=> mapNonEmpty!30606 (= mapRes!30606 (and tp!58673 e!513657))))

(declare-fun mapKey!30606 () (_ BitVec 32))

(declare-fun mapValue!30606 () ValueCell!9135)

(declare-fun mapRest!30606 () (Array (_ BitVec 32) ValueCell!9135))

(assert (=> mapNonEmpty!30606 (= (arr!26178 _values!1231) (store mapRest!30606 mapKey!30606 mapValue!30606))))

(declare-fun b!915305 () Bool)

(declare-fun res!617139 () Bool)

(assert (=> b!915305 (=> (not res!617139) (not e!513660))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915305 (= res!617139 (and (= (size!26637 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26636 _keys!1487) (size!26637 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78512 res!617138) b!915305))

(assert (= (and b!915305 res!617139) b!915301))

(assert (= (and b!915301 res!617140) b!915300))

(assert (= (and b!915302 condMapEmpty!30606) mapIsEmpty!30606))

(assert (= (and b!915302 (not condMapEmpty!30606)) mapNonEmpty!30606))

(get-info :version)

(assert (= (and mapNonEmpty!30606 ((_ is ValueCellFull!9135) mapValue!30606)) b!915303))

(assert (= (and b!915302 ((_ is ValueCellFull!9135) mapDefault!30606)) b!915304))

(assert (= start!78512 b!915302))

(declare-fun m!849723 () Bool)

(assert (=> b!915300 m!849723))

(declare-fun m!849725 () Bool)

(assert (=> start!78512 m!849725))

(declare-fun m!849727 () Bool)

(assert (=> start!78512 m!849727))

(declare-fun m!849729 () Bool)

(assert (=> start!78512 m!849729))

(declare-fun m!849731 () Bool)

(assert (=> b!915301 m!849731))

(declare-fun m!849733 () Bool)

(assert (=> mapNonEmpty!30606 m!849733))

(check-sat (not b!915300) tp_is_empty!19233 (not b!915301) (not start!78512) (not mapNonEmpty!30606))
(check-sat)
