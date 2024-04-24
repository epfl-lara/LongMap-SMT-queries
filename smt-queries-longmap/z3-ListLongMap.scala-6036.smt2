; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78284 () Bool)

(assert start!78284)

(declare-fun b_free!16627 () Bool)

(declare-fun b_next!16627 () Bool)

(assert (=> start!78284 (= b_free!16627 (not b_next!16627))))

(declare-fun tp!58155 () Bool)

(declare-fun b_and!27211 () Bool)

(assert (=> start!78284 (= tp!58155 b_and!27211)))

(declare-fun mapNonEmpty!30292 () Bool)

(declare-fun mapRes!30292 () Bool)

(declare-fun tp!58156 () Bool)

(declare-fun e!511942 () Bool)

(assert (=> mapNonEmpty!30292 (= mapRes!30292 (and tp!58156 e!511942))))

(declare-datatypes ((V!30359 0))(
  ( (V!30360 (val!9573 Int)) )
))
(declare-datatypes ((ValueCell!9041 0))(
  ( (ValueCellFull!9041 (v!12080 V!30359)) (EmptyCell!9041) )
))
(declare-datatypes ((array!54151 0))(
  ( (array!54152 (arr!26026 (Array (_ BitVec 32) ValueCell!9041)) (size!26486 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54151)

(declare-fun mapValue!30292 () ValueCell!9041)

(declare-fun mapRest!30292 () (Array (_ BitVec 32) ValueCell!9041))

(declare-fun mapKey!30292 () (_ BitVec 32))

(assert (=> mapNonEmpty!30292 (= (arr!26026 _values!1152) (store mapRest!30292 mapKey!30292 mapValue!30292))))

(declare-fun b!912628 () Bool)

(declare-fun res!615432 () Bool)

(declare-fun e!511940 () Bool)

(assert (=> b!912628 (=> (not res!615432) (not e!511940))))

(declare-datatypes ((array!54153 0))(
  ( (array!54154 (arr!26027 (Array (_ BitVec 32) (_ BitVec 64))) (size!26487 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54153)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54153 (_ BitVec 32)) Bool)

(assert (=> b!912628 (= res!615432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912629 () Bool)

(declare-fun tp_is_empty!19045 () Bool)

(assert (=> b!912629 (= e!511942 tp_is_empty!19045)))

(declare-fun b!912630 () Bool)

(declare-fun res!615434 () Bool)

(assert (=> b!912630 (=> (not res!615434) (not e!511940))))

(declare-datatypes ((List!18254 0))(
  ( (Nil!18251) (Cons!18250 (h!19402 (_ BitVec 64)) (t!25833 List!18254)) )
))
(declare-fun arrayNoDuplicates!0 (array!54153 (_ BitVec 32) List!18254) Bool)

(assert (=> b!912630 (= res!615434 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18251))))

(declare-fun b!912631 () Bool)

(declare-fun e!511943 () Bool)

(assert (=> b!912631 (= e!511943 tp_is_empty!19045)))

(declare-fun b!912632 () Bool)

(assert (=> b!912632 (= e!511940 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30359)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30359)

(declare-fun lt!410862 () Bool)

(declare-datatypes ((tuple2!12434 0))(
  ( (tuple2!12435 (_1!6228 (_ BitVec 64)) (_2!6228 V!30359)) )
))
(declare-datatypes ((List!18255 0))(
  ( (Nil!18252) (Cons!18251 (h!19403 tuple2!12434) (t!25834 List!18255)) )
))
(declare-datatypes ((ListLongMap!11133 0))(
  ( (ListLongMap!11134 (toList!5582 List!18255)) )
))
(declare-fun contains!4636 (ListLongMap!11133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2843 (array!54153 array!54151 (_ BitVec 32) (_ BitVec 32) V!30359 V!30359 (_ BitVec 32) Int) ListLongMap!11133)

(assert (=> b!912632 (= lt!410862 (contains!4636 (getCurrentListMap!2843 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912633 () Bool)

(declare-fun res!615433 () Bool)

(assert (=> b!912633 (=> (not res!615433) (not e!511940))))

(assert (=> b!912633 (= res!615433 (and (= (size!26486 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26487 _keys!1386) (size!26486 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912634 () Bool)

(declare-fun e!511944 () Bool)

(assert (=> b!912634 (= e!511944 (and e!511943 mapRes!30292))))

(declare-fun condMapEmpty!30292 () Bool)

(declare-fun mapDefault!30292 () ValueCell!9041)

(assert (=> b!912634 (= condMapEmpty!30292 (= (arr!26026 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9041)) mapDefault!30292)))))

(declare-fun mapIsEmpty!30292 () Bool)

(assert (=> mapIsEmpty!30292 mapRes!30292))

(declare-fun res!615431 () Bool)

(assert (=> start!78284 (=> (not res!615431) (not e!511940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78284 (= res!615431 (validMask!0 mask!1756))))

(assert (=> start!78284 e!511940))

(declare-fun array_inv!20420 (array!54151) Bool)

(assert (=> start!78284 (and (array_inv!20420 _values!1152) e!511944)))

(assert (=> start!78284 tp!58155))

(assert (=> start!78284 true))

(assert (=> start!78284 tp_is_empty!19045))

(declare-fun array_inv!20421 (array!54153) Bool)

(assert (=> start!78284 (array_inv!20421 _keys!1386)))

(assert (= (and start!78284 res!615431) b!912633))

(assert (= (and b!912633 res!615433) b!912628))

(assert (= (and b!912628 res!615432) b!912630))

(assert (= (and b!912630 res!615434) b!912632))

(assert (= (and b!912634 condMapEmpty!30292) mapIsEmpty!30292))

(assert (= (and b!912634 (not condMapEmpty!30292)) mapNonEmpty!30292))

(get-info :version)

(assert (= (and mapNonEmpty!30292 ((_ is ValueCellFull!9041) mapValue!30292)) b!912629))

(assert (= (and b!912634 ((_ is ValueCellFull!9041) mapDefault!30292)) b!912631))

(assert (= start!78284 b!912634))

(declare-fun m!847701 () Bool)

(assert (=> b!912628 m!847701))

(declare-fun m!847703 () Bool)

(assert (=> b!912632 m!847703))

(assert (=> b!912632 m!847703))

(declare-fun m!847705 () Bool)

(assert (=> b!912632 m!847705))

(declare-fun m!847707 () Bool)

(assert (=> start!78284 m!847707))

(declare-fun m!847709 () Bool)

(assert (=> start!78284 m!847709))

(declare-fun m!847711 () Bool)

(assert (=> start!78284 m!847711))

(declare-fun m!847713 () Bool)

(assert (=> b!912630 m!847713))

(declare-fun m!847715 () Bool)

(assert (=> mapNonEmpty!30292 m!847715))

(check-sat (not mapNonEmpty!30292) (not b!912628) tp_is_empty!19045 (not b!912630) b_and!27211 (not b!912632) (not start!78284) (not b_next!16627))
(check-sat b_and!27211 (not b_next!16627))
