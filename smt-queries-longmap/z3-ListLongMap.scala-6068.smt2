; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78518 () Bool)

(assert start!78518)

(declare-fun b!915354 () Bool)

(declare-fun e!513705 () Bool)

(declare-fun e!513704 () Bool)

(declare-fun mapRes!30615 () Bool)

(assert (=> b!915354 (= e!513705 (and e!513704 mapRes!30615))))

(declare-fun condMapEmpty!30615 () Bool)

(declare-datatypes ((V!30617 0))(
  ( (V!30618 (val!9670 Int)) )
))
(declare-datatypes ((ValueCell!9138 0))(
  ( (ValueCellFull!9138 (v!12188 V!30617)) (EmptyCell!9138) )
))
(declare-datatypes ((array!54476 0))(
  ( (array!54477 (arr!26183 (Array (_ BitVec 32) ValueCell!9138)) (size!26642 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54476)

(declare-fun mapDefault!30615 () ValueCell!9138)

(assert (=> b!915354 (= condMapEmpty!30615 (= (arr!26183 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9138)) mapDefault!30615)))))

(declare-fun res!617167 () Bool)

(declare-fun e!513703 () Bool)

(assert (=> start!78518 (=> (not res!617167) (not e!513703))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78518 (= res!617167 (validMask!0 mask!1881))))

(assert (=> start!78518 e!513703))

(assert (=> start!78518 true))

(declare-fun array_inv!20440 (array!54476) Bool)

(assert (=> start!78518 (and (array_inv!20440 _values!1231) e!513705)))

(declare-datatypes ((array!54478 0))(
  ( (array!54479 (arr!26184 (Array (_ BitVec 32) (_ BitVec 64))) (size!26643 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54478)

(declare-fun array_inv!20441 (array!54478) Bool)

(assert (=> start!78518 (array_inv!20441 _keys!1487)))

(declare-fun b!915355 () Bool)

(declare-fun res!617166 () Bool)

(assert (=> b!915355 (=> (not res!617166) (not e!513703))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915355 (= res!617166 (and (= (size!26642 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26643 _keys!1487) (size!26642 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915356 () Bool)

(assert (=> b!915356 (= e!513703 false)))

(declare-fun lt!411658 () Bool)

(declare-datatypes ((List!18368 0))(
  ( (Nil!18365) (Cons!18364 (h!19510 (_ BitVec 64)) (t!25981 List!18368)) )
))
(declare-fun arrayNoDuplicates!0 (array!54478 (_ BitVec 32) List!18368) Bool)

(assert (=> b!915356 (= lt!411658 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18365))))

(declare-fun b!915357 () Bool)

(declare-fun res!617165 () Bool)

(assert (=> b!915357 (=> (not res!617165) (not e!513703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54478 (_ BitVec 32)) Bool)

(assert (=> b!915357 (= res!617165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30615 () Bool)

(assert (=> mapIsEmpty!30615 mapRes!30615))

(declare-fun b!915358 () Bool)

(declare-fun tp_is_empty!19239 () Bool)

(assert (=> b!915358 (= e!513704 tp_is_empty!19239)))

(declare-fun b!915359 () Bool)

(declare-fun e!513702 () Bool)

(assert (=> b!915359 (= e!513702 tp_is_empty!19239)))

(declare-fun mapNonEmpty!30615 () Bool)

(declare-fun tp!58682 () Bool)

(assert (=> mapNonEmpty!30615 (= mapRes!30615 (and tp!58682 e!513702))))

(declare-fun mapRest!30615 () (Array (_ BitVec 32) ValueCell!9138))

(declare-fun mapValue!30615 () ValueCell!9138)

(declare-fun mapKey!30615 () (_ BitVec 32))

(assert (=> mapNonEmpty!30615 (= (arr!26183 _values!1231) (store mapRest!30615 mapKey!30615 mapValue!30615))))

(assert (= (and start!78518 res!617167) b!915355))

(assert (= (and b!915355 res!617166) b!915357))

(assert (= (and b!915357 res!617165) b!915356))

(assert (= (and b!915354 condMapEmpty!30615) mapIsEmpty!30615))

(assert (= (and b!915354 (not condMapEmpty!30615)) mapNonEmpty!30615))

(get-info :version)

(assert (= (and mapNonEmpty!30615 ((_ is ValueCellFull!9138) mapValue!30615)) b!915359))

(assert (= (and b!915354 ((_ is ValueCellFull!9138) mapDefault!30615)) b!915358))

(assert (= start!78518 b!915354))

(declare-fun m!849759 () Bool)

(assert (=> start!78518 m!849759))

(declare-fun m!849761 () Bool)

(assert (=> start!78518 m!849761))

(declare-fun m!849763 () Bool)

(assert (=> start!78518 m!849763))

(declare-fun m!849765 () Bool)

(assert (=> b!915356 m!849765))

(declare-fun m!849767 () Bool)

(assert (=> b!915357 m!849767))

(declare-fun m!849769 () Bool)

(assert (=> mapNonEmpty!30615 m!849769))

(check-sat tp_is_empty!19239 (not b!915356) (not b!915357) (not mapNonEmpty!30615) (not start!78518))
(check-sat)
