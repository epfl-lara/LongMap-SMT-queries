; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78098 () Bool)

(assert start!78098)

(declare-fun b_free!16627 () Bool)

(declare-fun b_next!16627 () Bool)

(assert (=> start!78098 (= b_free!16627 (not b_next!16627))))

(declare-fun tp!58156 () Bool)

(declare-fun b_and!27175 () Bool)

(assert (=> start!78098 (= tp!58156 b_and!27175)))

(declare-fun b!911486 () Bool)

(declare-fun e!511213 () Bool)

(assert (=> b!911486 (= e!511213 false)))

(declare-datatypes ((V!30359 0))(
  ( (V!30360 (val!9573 Int)) )
))
(declare-datatypes ((ValueCell!9041 0))(
  ( (ValueCellFull!9041 (v!12082 V!30359)) (EmptyCell!9041) )
))
(declare-datatypes ((array!54091 0))(
  ( (array!54092 (arr!26001 (Array (_ BitVec 32) ValueCell!9041)) (size!26462 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54091)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30359)

(declare-datatypes ((array!54093 0))(
  ( (array!54094 (arr!26002 (Array (_ BitVec 32) (_ BitVec 64))) (size!26463 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54093)

(declare-fun lt!410265 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30359)

(declare-datatypes ((tuple2!12514 0))(
  ( (tuple2!12515 (_1!6268 (_ BitVec 64)) (_2!6268 V!30359)) )
))
(declare-datatypes ((List!18296 0))(
  ( (Nil!18293) (Cons!18292 (h!19438 tuple2!12514) (t!25874 List!18296)) )
))
(declare-datatypes ((ListLongMap!11201 0))(
  ( (ListLongMap!11202 (toList!5616 List!18296)) )
))
(declare-fun contains!4618 (ListLongMap!11201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2818 (array!54093 array!54091 (_ BitVec 32) (_ BitVec 32) V!30359 V!30359 (_ BitVec 32) Int) ListLongMap!11201)

(assert (=> b!911486 (= lt!410265 (contains!4618 (getCurrentListMap!2818 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911487 () Bool)

(declare-fun e!511211 () Bool)

(declare-fun e!511210 () Bool)

(declare-fun mapRes!30292 () Bool)

(assert (=> b!911487 (= e!511211 (and e!511210 mapRes!30292))))

(declare-fun condMapEmpty!30292 () Bool)

(declare-fun mapDefault!30292 () ValueCell!9041)

(assert (=> b!911487 (= condMapEmpty!30292 (= (arr!26001 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9041)) mapDefault!30292)))))

(declare-fun b!911488 () Bool)

(declare-fun res!614980 () Bool)

(assert (=> b!911488 (=> (not res!614980) (not e!511213))))

(declare-datatypes ((List!18297 0))(
  ( (Nil!18294) (Cons!18293 (h!19439 (_ BitVec 64)) (t!25875 List!18297)) )
))
(declare-fun arrayNoDuplicates!0 (array!54093 (_ BitVec 32) List!18297) Bool)

(assert (=> b!911488 (= res!614980 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18294))))

(declare-fun mapNonEmpty!30292 () Bool)

(declare-fun tp!58155 () Bool)

(declare-fun e!511212 () Bool)

(assert (=> mapNonEmpty!30292 (= mapRes!30292 (and tp!58155 e!511212))))

(declare-fun mapValue!30292 () ValueCell!9041)

(declare-fun mapRest!30292 () (Array (_ BitVec 32) ValueCell!9041))

(declare-fun mapKey!30292 () (_ BitVec 32))

(assert (=> mapNonEmpty!30292 (= (arr!26001 _values!1152) (store mapRest!30292 mapKey!30292 mapValue!30292))))

(declare-fun b!911489 () Bool)

(declare-fun res!614978 () Bool)

(assert (=> b!911489 (=> (not res!614978) (not e!511213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54093 (_ BitVec 32)) Bool)

(assert (=> b!911489 (= res!614978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614979 () Bool)

(assert (=> start!78098 (=> (not res!614979) (not e!511213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78098 (= res!614979 (validMask!0 mask!1756))))

(assert (=> start!78098 e!511213))

(declare-fun array_inv!20388 (array!54091) Bool)

(assert (=> start!78098 (and (array_inv!20388 _values!1152) e!511211)))

(assert (=> start!78098 tp!58156))

(assert (=> start!78098 true))

(declare-fun tp_is_empty!19045 () Bool)

(assert (=> start!78098 tp_is_empty!19045))

(declare-fun array_inv!20389 (array!54093) Bool)

(assert (=> start!78098 (array_inv!20389 _keys!1386)))

(declare-fun mapIsEmpty!30292 () Bool)

(assert (=> mapIsEmpty!30292 mapRes!30292))

(declare-fun b!911490 () Bool)

(assert (=> b!911490 (= e!511210 tp_is_empty!19045)))

(declare-fun b!911491 () Bool)

(assert (=> b!911491 (= e!511212 tp_is_empty!19045)))

(declare-fun b!911492 () Bool)

(declare-fun res!614977 () Bool)

(assert (=> b!911492 (=> (not res!614977) (not e!511213))))

(assert (=> b!911492 (= res!614977 (and (= (size!26462 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26463 _keys!1386) (size!26462 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78098 res!614979) b!911492))

(assert (= (and b!911492 res!614977) b!911489))

(assert (= (and b!911489 res!614978) b!911488))

(assert (= (and b!911488 res!614980) b!911486))

(assert (= (and b!911487 condMapEmpty!30292) mapIsEmpty!30292))

(assert (= (and b!911487 (not condMapEmpty!30292)) mapNonEmpty!30292))

(get-info :version)

(assert (= (and mapNonEmpty!30292 ((_ is ValueCellFull!9041) mapValue!30292)) b!911491))

(assert (= (and b!911487 ((_ is ValueCellFull!9041) mapDefault!30292)) b!911490))

(assert (= start!78098 b!911487))

(declare-fun m!845649 () Bool)

(assert (=> start!78098 m!845649))

(declare-fun m!845651 () Bool)

(assert (=> start!78098 m!845651))

(declare-fun m!845653 () Bool)

(assert (=> start!78098 m!845653))

(declare-fun m!845655 () Bool)

(assert (=> b!911489 m!845655))

(declare-fun m!845657 () Bool)

(assert (=> b!911486 m!845657))

(assert (=> b!911486 m!845657))

(declare-fun m!845659 () Bool)

(assert (=> b!911486 m!845659))

(declare-fun m!845661 () Bool)

(assert (=> mapNonEmpty!30292 m!845661))

(declare-fun m!845663 () Bool)

(assert (=> b!911488 m!845663))

(check-sat b_and!27175 (not start!78098) (not b!911489) (not mapNonEmpty!30292) (not b!911486) (not b_next!16627) (not b!911488) tp_is_empty!19045)
(check-sat b_and!27175 (not b_next!16627))
