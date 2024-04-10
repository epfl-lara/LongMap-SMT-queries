; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78524 () Bool)

(assert start!78524)

(declare-fun b!915408 () Bool)

(declare-fun res!617193 () Bool)

(declare-fun e!513749 () Bool)

(assert (=> b!915408 (=> (not res!617193) (not e!513749))))

(declare-datatypes ((array!54488 0))(
  ( (array!54489 (arr!26189 (Array (_ BitVec 32) (_ BitVec 64))) (size!26648 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54488)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54488 (_ BitVec 32)) Bool)

(assert (=> b!915408 (= res!617193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617192 () Bool)

(assert (=> start!78524 (=> (not res!617192) (not e!513749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78524 (= res!617192 (validMask!0 mask!1881))))

(assert (=> start!78524 e!513749))

(assert (=> start!78524 true))

(declare-datatypes ((V!30625 0))(
  ( (V!30626 (val!9673 Int)) )
))
(declare-datatypes ((ValueCell!9141 0))(
  ( (ValueCellFull!9141 (v!12191 V!30625)) (EmptyCell!9141) )
))
(declare-datatypes ((array!54490 0))(
  ( (array!54491 (arr!26190 (Array (_ BitVec 32) ValueCell!9141)) (size!26649 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54490)

(declare-fun e!513748 () Bool)

(declare-fun array_inv!20444 (array!54490) Bool)

(assert (=> start!78524 (and (array_inv!20444 _values!1231) e!513748)))

(declare-fun array_inv!20445 (array!54488) Bool)

(assert (=> start!78524 (array_inv!20445 _keys!1487)))

(declare-fun b!915409 () Bool)

(declare-fun e!513750 () Bool)

(declare-fun mapRes!30624 () Bool)

(assert (=> b!915409 (= e!513748 (and e!513750 mapRes!30624))))

(declare-fun condMapEmpty!30624 () Bool)

(declare-fun mapDefault!30624 () ValueCell!9141)

(assert (=> b!915409 (= condMapEmpty!30624 (= (arr!26190 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9141)) mapDefault!30624)))))

(declare-fun mapIsEmpty!30624 () Bool)

(assert (=> mapIsEmpty!30624 mapRes!30624))

(declare-fun b!915410 () Bool)

(declare-fun tp_is_empty!19245 () Bool)

(assert (=> b!915410 (= e!513750 tp_is_empty!19245)))

(declare-fun b!915411 () Bool)

(declare-fun res!617194 () Bool)

(assert (=> b!915411 (=> (not res!617194) (not e!513749))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915411 (= res!617194 (and (= (size!26649 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26648 _keys!1487) (size!26649 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30624 () Bool)

(declare-fun tp!58691 () Bool)

(declare-fun e!513747 () Bool)

(assert (=> mapNonEmpty!30624 (= mapRes!30624 (and tp!58691 e!513747))))

(declare-fun mapKey!30624 () (_ BitVec 32))

(declare-fun mapValue!30624 () ValueCell!9141)

(declare-fun mapRest!30624 () (Array (_ BitVec 32) ValueCell!9141))

(assert (=> mapNonEmpty!30624 (= (arr!26190 _values!1231) (store mapRest!30624 mapKey!30624 mapValue!30624))))

(declare-fun b!915412 () Bool)

(assert (=> b!915412 (= e!513749 false)))

(declare-fun lt!411667 () Bool)

(declare-datatypes ((List!18371 0))(
  ( (Nil!18368) (Cons!18367 (h!19513 (_ BitVec 64)) (t!25984 List!18371)) )
))
(declare-fun arrayNoDuplicates!0 (array!54488 (_ BitVec 32) List!18371) Bool)

(assert (=> b!915412 (= lt!411667 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18368))))

(declare-fun b!915413 () Bool)

(assert (=> b!915413 (= e!513747 tp_is_empty!19245)))

(assert (= (and start!78524 res!617192) b!915411))

(assert (= (and b!915411 res!617194) b!915408))

(assert (= (and b!915408 res!617193) b!915412))

(assert (= (and b!915409 condMapEmpty!30624) mapIsEmpty!30624))

(assert (= (and b!915409 (not condMapEmpty!30624)) mapNonEmpty!30624))

(get-info :version)

(assert (= (and mapNonEmpty!30624 ((_ is ValueCellFull!9141) mapValue!30624)) b!915413))

(assert (= (and b!915409 ((_ is ValueCellFull!9141) mapDefault!30624)) b!915410))

(assert (= start!78524 b!915409))

(declare-fun m!849795 () Bool)

(assert (=> b!915408 m!849795))

(declare-fun m!849797 () Bool)

(assert (=> start!78524 m!849797))

(declare-fun m!849799 () Bool)

(assert (=> start!78524 m!849799))

(declare-fun m!849801 () Bool)

(assert (=> start!78524 m!849801))

(declare-fun m!849803 () Bool)

(assert (=> mapNonEmpty!30624 m!849803))

(declare-fun m!849805 () Bool)

(assert (=> b!915412 m!849805))

(check-sat (not b!915412) (not start!78524) (not mapNonEmpty!30624) (not b!915408) tp_is_empty!19245)
(check-sat)
