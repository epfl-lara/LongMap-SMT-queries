; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78586 () Bool)

(assert start!78586)

(declare-fun b!915641 () Bool)

(declare-fun e!513773 () Bool)

(declare-fun e!513771 () Bool)

(declare-fun mapRes!30516 () Bool)

(assert (=> b!915641 (= e!513773 (and e!513771 mapRes!30516))))

(declare-fun condMapEmpty!30516 () Bool)

(declare-datatypes ((V!30543 0))(
  ( (V!30544 (val!9642 Int)) )
))
(declare-datatypes ((ValueCell!9110 0))(
  ( (ValueCellFull!9110 (v!12156 V!30543)) (EmptyCell!9110) )
))
(declare-datatypes ((array!54421 0))(
  ( (array!54422 (arr!26156 (Array (_ BitVec 32) ValueCell!9110)) (size!26616 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54421)

(declare-fun mapDefault!30516 () ValueCell!9110)

(assert (=> b!915641 (= condMapEmpty!30516 (= (arr!26156 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9110)) mapDefault!30516)))))

(declare-fun res!617209 () Bool)

(declare-fun e!513772 () Bool)

(assert (=> start!78586 (=> (not res!617209) (not e!513772))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78586 (= res!617209 (validMask!0 mask!1881))))

(assert (=> start!78586 e!513772))

(assert (=> start!78586 true))

(declare-fun array_inv!20516 (array!54421) Bool)

(assert (=> start!78586 (and (array_inv!20516 _values!1231) e!513773)))

(declare-datatypes ((array!54423 0))(
  ( (array!54424 (arr!26157 (Array (_ BitVec 32) (_ BitVec 64))) (size!26617 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54423)

(declare-fun array_inv!20517 (array!54423) Bool)

(assert (=> start!78586 (array_inv!20517 _keys!1487)))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!915642 () Bool)

(assert (=> b!915642 (= e!513772 (and (= (size!26616 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26617 _keys!1487) (size!26616 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (not (= (size!26617 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)))))))

(declare-fun b!915643 () Bool)

(declare-fun tp_is_empty!19183 () Bool)

(assert (=> b!915643 (= e!513771 tp_is_empty!19183)))

(declare-fun mapNonEmpty!30516 () Bool)

(declare-fun tp!58584 () Bool)

(declare-fun e!513769 () Bool)

(assert (=> mapNonEmpty!30516 (= mapRes!30516 (and tp!58584 e!513769))))

(declare-fun mapRest!30516 () (Array (_ BitVec 32) ValueCell!9110))

(declare-fun mapKey!30516 () (_ BitVec 32))

(declare-fun mapValue!30516 () ValueCell!9110)

(assert (=> mapNonEmpty!30516 (= (arr!26156 _values!1231) (store mapRest!30516 mapKey!30516 mapValue!30516))))

(declare-fun mapIsEmpty!30516 () Bool)

(assert (=> mapIsEmpty!30516 mapRes!30516))

(declare-fun b!915644 () Bool)

(assert (=> b!915644 (= e!513769 tp_is_empty!19183)))

(assert (= (and start!78586 res!617209) b!915642))

(assert (= (and b!915641 condMapEmpty!30516) mapIsEmpty!30516))

(assert (= (and b!915641 (not condMapEmpty!30516)) mapNonEmpty!30516))

(get-info :version)

(assert (= (and mapNonEmpty!30516 ((_ is ValueCellFull!9110) mapValue!30516)) b!915644))

(assert (= (and b!915641 ((_ is ValueCellFull!9110) mapDefault!30516)) b!915643))

(assert (= start!78586 b!915641))

(declare-fun m!850665 () Bool)

(assert (=> start!78586 m!850665))

(declare-fun m!850667 () Bool)

(assert (=> start!78586 m!850667))

(declare-fun m!850669 () Bool)

(assert (=> start!78586 m!850669))

(declare-fun m!850671 () Bool)

(assert (=> mapNonEmpty!30516 m!850671))

(check-sat (not start!78586) (not mapNonEmpty!30516) tp_is_empty!19183)
(check-sat)
