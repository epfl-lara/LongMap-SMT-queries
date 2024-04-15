; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78400 () Bool)

(assert start!78400)

(declare-fun mapNonEmpty!30516 () Bool)

(declare-fun mapRes!30516 () Bool)

(declare-fun tp!58584 () Bool)

(declare-fun e!513042 () Bool)

(assert (=> mapNonEmpty!30516 (= mapRes!30516 (and tp!58584 e!513042))))

(declare-datatypes ((V!30543 0))(
  ( (V!30544 (val!9642 Int)) )
))
(declare-datatypes ((ValueCell!9110 0))(
  ( (ValueCellFull!9110 (v!12158 V!30543)) (EmptyCell!9110) )
))
(declare-fun mapValue!30516 () ValueCell!9110)

(declare-fun mapKey!30516 () (_ BitVec 32))

(declare-datatypes ((array!54361 0))(
  ( (array!54362 (arr!26131 (Array (_ BitVec 32) ValueCell!9110)) (size!26592 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54361)

(declare-fun mapRest!30516 () (Array (_ BitVec 32) ValueCell!9110))

(assert (=> mapNonEmpty!30516 (= (arr!26131 _values!1231) (store mapRest!30516 mapKey!30516 mapValue!30516))))

(declare-datatypes ((array!54363 0))(
  ( (array!54364 (arr!26132 (Array (_ BitVec 32) (_ BitVec 64))) (size!26593 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54363)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!914499 () Bool)

(declare-fun e!513039 () Bool)

(assert (=> b!914499 (= e!513039 (and (= (size!26592 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26593 _keys!1487) (size!26592 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (not (= (size!26593 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)))))))

(declare-fun res!616755 () Bool)

(assert (=> start!78400 (=> (not res!616755) (not e!513039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78400 (= res!616755 (validMask!0 mask!1881))))

(assert (=> start!78400 e!513039))

(assert (=> start!78400 true))

(declare-fun e!513040 () Bool)

(declare-fun array_inv!20486 (array!54361) Bool)

(assert (=> start!78400 (and (array_inv!20486 _values!1231) e!513040)))

(declare-fun array_inv!20487 (array!54363) Bool)

(assert (=> start!78400 (array_inv!20487 _keys!1487)))

(declare-fun b!914500 () Bool)

(declare-fun e!513043 () Bool)

(assert (=> b!914500 (= e!513040 (and e!513043 mapRes!30516))))

(declare-fun condMapEmpty!30516 () Bool)

(declare-fun mapDefault!30516 () ValueCell!9110)

(assert (=> b!914500 (= condMapEmpty!30516 (= (arr!26131 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9110)) mapDefault!30516)))))

(declare-fun mapIsEmpty!30516 () Bool)

(assert (=> mapIsEmpty!30516 mapRes!30516))

(declare-fun b!914501 () Bool)

(declare-fun tp_is_empty!19183 () Bool)

(assert (=> b!914501 (= e!513042 tp_is_empty!19183)))

(declare-fun b!914502 () Bool)

(assert (=> b!914502 (= e!513043 tp_is_empty!19183)))

(assert (= (and start!78400 res!616755) b!914499))

(assert (= (and b!914500 condMapEmpty!30516) mapIsEmpty!30516))

(assert (= (and b!914500 (not condMapEmpty!30516)) mapNonEmpty!30516))

(get-info :version)

(assert (= (and mapNonEmpty!30516 ((_ is ValueCellFull!9110) mapValue!30516)) b!914501))

(assert (= (and b!914500 ((_ is ValueCellFull!9110) mapDefault!30516)) b!914502))

(assert (= start!78400 b!914500))

(declare-fun m!848613 () Bool)

(assert (=> mapNonEmpty!30516 m!848613))

(declare-fun m!848615 () Bool)

(assert (=> start!78400 m!848615))

(declare-fun m!848617 () Bool)

(assert (=> start!78400 m!848617))

(declare-fun m!848619 () Bool)

(assert (=> start!78400 m!848619))

(check-sat (not start!78400) (not mapNonEmpty!30516) tp_is_empty!19183)
(check-sat)
