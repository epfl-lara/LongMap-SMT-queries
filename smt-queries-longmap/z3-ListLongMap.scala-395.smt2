; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7412 () Bool)

(assert start!7412)

(declare-fun b!47516 () Bool)

(declare-fun res!27659 () Bool)

(declare-fun e!30448 () Bool)

(assert (=> b!47516 (=> (not res!27659) (not e!30448))))

(declare-datatypes ((array!3134 0))(
  ( (array!3135 (arr!1501 (Array (_ BitVec 32) (_ BitVec 64))) (size!1724 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3134)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3134 (_ BitVec 32)) Bool)

(assert (=> b!47516 (= res!27659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47517 () Bool)

(declare-fun e!30447 () Bool)

(declare-fun tp_is_empty!2047 () Bool)

(assert (=> b!47517 (= e!30447 tp_is_empty!2047)))

(declare-fun b!47518 () Bool)

(declare-fun res!27658 () Bool)

(assert (=> b!47518 (=> (not res!27658) (not e!30448))))

(declare-datatypes ((List!1257 0))(
  ( (Nil!1254) (Cons!1253 (h!1833 (_ BitVec 64)) (t!4284 List!1257)) )
))
(declare-fun arrayNoDuplicates!0 (array!3134 (_ BitVec 32) List!1257) Bool)

(assert (=> b!47518 (= res!27658 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1254))))

(declare-fun b!47519 () Bool)

(declare-fun e!30446 () Bool)

(declare-fun mapRes!2114 () Bool)

(assert (=> b!47519 (= e!30446 (and e!30447 mapRes!2114))))

(declare-fun condMapEmpty!2114 () Bool)

(declare-datatypes ((V!2463 0))(
  ( (V!2464 (val!1062 Int)) )
))
(declare-datatypes ((ValueCell!734 0))(
  ( (ValueCellFull!734 (v!2121 V!2463)) (EmptyCell!734) )
))
(declare-datatypes ((array!3136 0))(
  ( (array!3137 (arr!1502 (Array (_ BitVec 32) ValueCell!734)) (size!1725 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3136)

(declare-fun mapDefault!2114 () ValueCell!734)

(assert (=> b!47519 (= condMapEmpty!2114 (= (arr!1502 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!734)) mapDefault!2114)))))

(declare-fun res!27660 () Bool)

(assert (=> start!7412 (=> (not res!27660) (not e!30448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7412 (= res!27660 (validMask!0 mask!2458))))

(assert (=> start!7412 e!30448))

(assert (=> start!7412 true))

(declare-fun array_inv!906 (array!3134) Bool)

(assert (=> start!7412 (array_inv!906 _keys!1940)))

(declare-fun array_inv!907 (array!3136) Bool)

(assert (=> start!7412 (and (array_inv!907 _values!1550) e!30446)))

(declare-fun b!47520 () Bool)

(declare-fun res!27656 () Bool)

(assert (=> b!47520 (=> (not res!27656) (not e!30448))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47520 (= res!27656 (validKeyInArray!0 k0!1421))))

(declare-fun mapIsEmpty!2114 () Bool)

(assert (=> mapIsEmpty!2114 mapRes!2114))

(declare-fun mapNonEmpty!2114 () Bool)

(declare-fun tp!6263 () Bool)

(declare-fun e!30449 () Bool)

(assert (=> mapNonEmpty!2114 (= mapRes!2114 (and tp!6263 e!30449))))

(declare-fun mapValue!2114 () ValueCell!734)

(declare-fun mapKey!2114 () (_ BitVec 32))

(declare-fun mapRest!2114 () (Array (_ BitVec 32) ValueCell!734))

(assert (=> mapNonEmpty!2114 (= (arr!1502 _values!1550) (store mapRest!2114 mapKey!2114 mapValue!2114))))

(declare-fun b!47521 () Bool)

(declare-fun res!27657 () Bool)

(assert (=> b!47521 (=> (not res!27657) (not e!30448))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47521 (= res!27657 (and (= (size!1725 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1724 _keys!1940) (size!1725 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47522 () Bool)

(assert (=> b!47522 (= e!30448 (not (= (size!1724 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458))))))

(declare-fun b!47523 () Bool)

(assert (=> b!47523 (= e!30449 tp_is_empty!2047)))

(assert (= (and start!7412 res!27660) b!47521))

(assert (= (and b!47521 res!27657) b!47516))

(assert (= (and b!47516 res!27659) b!47518))

(assert (= (and b!47518 res!27658) b!47520))

(assert (= (and b!47520 res!27656) b!47522))

(assert (= (and b!47519 condMapEmpty!2114) mapIsEmpty!2114))

(assert (= (and b!47519 (not condMapEmpty!2114)) mapNonEmpty!2114))

(get-info :version)

(assert (= (and mapNonEmpty!2114 ((_ is ValueCellFull!734) mapValue!2114)) b!47523))

(assert (= (and b!47519 ((_ is ValueCellFull!734) mapDefault!2114)) b!47517))

(assert (= start!7412 b!47519))

(declare-fun m!41667 () Bool)

(assert (=> mapNonEmpty!2114 m!41667))

(declare-fun m!41669 () Bool)

(assert (=> start!7412 m!41669))

(declare-fun m!41671 () Bool)

(assert (=> start!7412 m!41671))

(declare-fun m!41673 () Bool)

(assert (=> start!7412 m!41673))

(declare-fun m!41675 () Bool)

(assert (=> b!47520 m!41675))

(declare-fun m!41677 () Bool)

(assert (=> b!47516 m!41677))

(declare-fun m!41679 () Bool)

(assert (=> b!47518 m!41679))

(check-sat (not b!47520) tp_is_empty!2047 (not start!7412) (not mapNonEmpty!2114) (not b!47516) (not b!47518))
(check-sat)
