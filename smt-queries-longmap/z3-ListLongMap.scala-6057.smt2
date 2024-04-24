; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78556 () Bool)

(assert start!78556)

(declare-fun b_free!16753 () Bool)

(declare-fun b_next!16753 () Bool)

(assert (=> start!78556 (= b_free!16753 (not b_next!16753))))

(declare-fun tp!58548 () Bool)

(declare-fun b_and!27383 () Bool)

(assert (=> start!78556 (= tp!58548 b_and!27383)))

(declare-fun b!915340 () Bool)

(declare-fun res!617047 () Bool)

(declare-fun e!513565 () Bool)

(assert (=> b!915340 (=> (not res!617047) (not e!513565))))

(declare-datatypes ((V!30527 0))(
  ( (V!30528 (val!9636 Int)) )
))
(declare-datatypes ((ValueCell!9104 0))(
  ( (ValueCellFull!9104 (v!12149 V!30527)) (EmptyCell!9104) )
))
(declare-datatypes ((array!54395 0))(
  ( (array!54396 (arr!26144 (Array (_ BitVec 32) ValueCell!9104)) (size!26604 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54395)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54397 0))(
  ( (array!54398 (arr!26145 (Array (_ BitVec 32) (_ BitVec 64))) (size!26605 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54397)

(assert (=> b!915340 (= res!617047 (and (= (size!26604 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26605 _keys!1386) (size!26604 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!915341 () Bool)

(declare-fun res!617046 () Bool)

(assert (=> b!915341 (=> (not res!617046) (not e!513565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54397 (_ BitVec 32)) Bool)

(assert (=> b!915341 (= res!617046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!617044 () Bool)

(assert (=> start!78556 (=> (not res!617044) (not e!513565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78556 (= res!617044 (validMask!0 mask!1756))))

(assert (=> start!78556 e!513565))

(declare-fun e!513564 () Bool)

(declare-fun array_inv!20510 (array!54395) Bool)

(assert (=> start!78556 (and (array_inv!20510 _values!1152) e!513564)))

(assert (=> start!78556 tp!58548))

(assert (=> start!78556 true))

(declare-fun tp_is_empty!19171 () Bool)

(assert (=> start!78556 tp_is_empty!19171))

(declare-fun array_inv!20511 (array!54397) Bool)

(assert (=> start!78556 (array_inv!20511 _keys!1386)))

(declare-fun b!915342 () Bool)

(declare-fun e!513566 () Bool)

(declare-fun mapRes!30495 () Bool)

(assert (=> b!915342 (= e!513564 (and e!513566 mapRes!30495))))

(declare-fun condMapEmpty!30495 () Bool)

(declare-fun mapDefault!30495 () ValueCell!9104)

(assert (=> b!915342 (= condMapEmpty!30495 (= (arr!26144 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9104)) mapDefault!30495)))))

(declare-fun mapIsEmpty!30495 () Bool)

(assert (=> mapIsEmpty!30495 mapRes!30495))

(declare-fun b!915343 () Bool)

(assert (=> b!915343 (= e!513566 tp_is_empty!19171)))

(declare-fun b!915344 () Bool)

(assert (=> b!915344 (= e!513565 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30527)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!411844 () Bool)

(declare-fun minValue!1094 () V!30527)

(declare-datatypes ((tuple2!12522 0))(
  ( (tuple2!12523 (_1!6272 (_ BitVec 64)) (_2!6272 V!30527)) )
))
(declare-datatypes ((List!18334 0))(
  ( (Nil!18331) (Cons!18330 (h!19482 tuple2!12522) (t!25937 List!18334)) )
))
(declare-datatypes ((ListLongMap!11221 0))(
  ( (ListLongMap!11222 (toList!5626 List!18334)) )
))
(declare-fun contains!4685 (ListLongMap!11221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2886 (array!54397 array!54395 (_ BitVec 32) (_ BitVec 32) V!30527 V!30527 (_ BitVec 32) Int) ListLongMap!11221)

(assert (=> b!915344 (= lt!411844 (contains!4685 (getCurrentListMap!2886 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!915345 () Bool)

(declare-fun e!513562 () Bool)

(assert (=> b!915345 (= e!513562 tp_is_empty!19171)))

(declare-fun b!915346 () Bool)

(declare-fun res!617045 () Bool)

(assert (=> b!915346 (=> (not res!617045) (not e!513565))))

(declare-datatypes ((List!18335 0))(
  ( (Nil!18332) (Cons!18331 (h!19483 (_ BitVec 64)) (t!25938 List!18335)) )
))
(declare-fun arrayNoDuplicates!0 (array!54397 (_ BitVec 32) List!18335) Bool)

(assert (=> b!915346 (= res!617045 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18332))))

(declare-fun mapNonEmpty!30495 () Bool)

(declare-fun tp!58547 () Bool)

(assert (=> mapNonEmpty!30495 (= mapRes!30495 (and tp!58547 e!513562))))

(declare-fun mapKey!30495 () (_ BitVec 32))

(declare-fun mapValue!30495 () ValueCell!9104)

(declare-fun mapRest!30495 () (Array (_ BitVec 32) ValueCell!9104))

(assert (=> mapNonEmpty!30495 (= (arr!26144 _values!1152) (store mapRest!30495 mapKey!30495 mapValue!30495))))

(assert (= (and start!78556 res!617044) b!915340))

(assert (= (and b!915340 res!617047) b!915341))

(assert (= (and b!915341 res!617046) b!915346))

(assert (= (and b!915346 res!617045) b!915344))

(assert (= (and b!915342 condMapEmpty!30495) mapIsEmpty!30495))

(assert (= (and b!915342 (not condMapEmpty!30495)) mapNonEmpty!30495))

(get-info :version)

(assert (= (and mapNonEmpty!30495 ((_ is ValueCellFull!9104) mapValue!30495)) b!915345))

(assert (= (and b!915342 ((_ is ValueCellFull!9104) mapDefault!30495)) b!915343))

(assert (= start!78556 b!915342))

(declare-fun m!850469 () Bool)

(assert (=> b!915344 m!850469))

(assert (=> b!915344 m!850469))

(declare-fun m!850471 () Bool)

(assert (=> b!915344 m!850471))

(declare-fun m!850473 () Bool)

(assert (=> b!915346 m!850473))

(declare-fun m!850475 () Bool)

(assert (=> mapNonEmpty!30495 m!850475))

(declare-fun m!850477 () Bool)

(assert (=> b!915341 m!850477))

(declare-fun m!850479 () Bool)

(assert (=> start!78556 m!850479))

(declare-fun m!850481 () Bool)

(assert (=> start!78556 m!850481))

(declare-fun m!850483 () Bool)

(assert (=> start!78556 m!850483))

(check-sat (not start!78556) (not b!915344) tp_is_empty!19171 b_and!27383 (not mapNonEmpty!30495) (not b!915346) (not b!915341) (not b_next!16753))
(check-sat b_and!27383 (not b_next!16753))
