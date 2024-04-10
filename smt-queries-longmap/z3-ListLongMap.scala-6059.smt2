; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78420 () Bool)

(assert start!78420)

(declare-fun b!914750 () Bool)

(declare-fun e!513206 () Bool)

(declare-fun e!513204 () Bool)

(declare-fun mapRes!30519 () Bool)

(assert (=> b!914750 (= e!513206 (and e!513204 mapRes!30519))))

(declare-fun condMapEmpty!30519 () Bool)

(declare-datatypes ((V!30545 0))(
  ( (V!30546 (val!9643 Int)) )
))
(declare-datatypes ((ValueCell!9111 0))(
  ( (ValueCellFull!9111 (v!12160 V!30545)) (EmptyCell!9111) )
))
(declare-datatypes ((array!54362 0))(
  ( (array!54363 (arr!26131 (Array (_ BitVec 32) ValueCell!9111)) (size!26590 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54362)

(declare-fun mapDefault!30519 () ValueCell!9111)

(assert (=> b!914750 (= condMapEmpty!30519 (= (arr!26131 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9111)) mapDefault!30519)))))

(declare-fun mapIsEmpty!30519 () Bool)

(assert (=> mapIsEmpty!30519 mapRes!30519))

(declare-fun b!914751 () Bool)

(declare-fun tp_is_empty!19185 () Bool)

(assert (=> b!914751 (= e!513204 tp_is_empty!19185)))

(declare-fun b!914752 () Bool)

(declare-fun e!513202 () Bool)

(assert (=> b!914752 (= e!513202 tp_is_empty!19185)))

(declare-datatypes ((array!54364 0))(
  ( (array!54365 (arr!26132 (Array (_ BitVec 32) (_ BitVec 64))) (size!26591 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54364)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun e!513203 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!914753 () Bool)

(assert (=> b!914753 (= e!513203 (and (= (size!26590 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26591 _keys!1487) (size!26590 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (not (= (size!26591 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)))))))

(declare-fun mapNonEmpty!30519 () Bool)

(declare-fun tp!58586 () Bool)

(assert (=> mapNonEmpty!30519 (= mapRes!30519 (and tp!58586 e!513202))))

(declare-fun mapKey!30519 () (_ BitVec 32))

(declare-fun mapRest!30519 () (Array (_ BitVec 32) ValueCell!9111))

(declare-fun mapValue!30519 () ValueCell!9111)

(assert (=> mapNonEmpty!30519 (= (arr!26131 _values!1231) (store mapRest!30519 mapKey!30519 mapValue!30519))))

(declare-fun res!616868 () Bool)

(assert (=> start!78420 (=> (not res!616868) (not e!513203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78420 (= res!616868 (validMask!0 mask!1881))))

(assert (=> start!78420 e!513203))

(assert (=> start!78420 true))

(declare-fun array_inv!20408 (array!54362) Bool)

(assert (=> start!78420 (and (array_inv!20408 _values!1231) e!513206)))

(declare-fun array_inv!20409 (array!54364) Bool)

(assert (=> start!78420 (array_inv!20409 _keys!1487)))

(assert (= (and start!78420 res!616868) b!914753))

(assert (= (and b!914750 condMapEmpty!30519) mapIsEmpty!30519))

(assert (= (and b!914750 (not condMapEmpty!30519)) mapNonEmpty!30519))

(get-info :version)

(assert (= (and mapNonEmpty!30519 ((_ is ValueCellFull!9111) mapValue!30519)) b!914752))

(assert (= (and b!914750 ((_ is ValueCellFull!9111) mapDefault!30519)) b!914751))

(assert (= start!78420 b!914750))

(declare-fun m!849379 () Bool)

(assert (=> mapNonEmpty!30519 m!849379))

(declare-fun m!849381 () Bool)

(assert (=> start!78420 m!849381))

(declare-fun m!849383 () Bool)

(assert (=> start!78420 m!849383))

(declare-fun m!849385 () Bool)

(assert (=> start!78420 m!849385))

(check-sat (not start!78420) (not mapNonEmpty!30519) tp_is_empty!19185)
(check-sat)
