; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78606 () Bool)

(assert start!78606)

(declare-fun b_free!16837 () Bool)

(declare-fun b_next!16837 () Bool)

(assert (=> start!78606 (= b_free!16837 (not b_next!16837))))

(declare-fun tp!58953 () Bool)

(declare-fun b_and!27433 () Bool)

(assert (=> start!78606 (= tp!58953 b_and!27433)))

(declare-fun b!916328 () Bool)

(declare-fun res!617792 () Bool)

(declare-fun e!514372 () Bool)

(assert (=> b!916328 (=> (not res!617792) (not e!514372))))

(declare-datatypes ((array!54667 0))(
  ( (array!54668 (arr!26279 (Array (_ BitVec 32) (_ BitVec 64))) (size!26740 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54667)

(declare-datatypes ((List!18458 0))(
  ( (Nil!18455) (Cons!18454 (h!19600 (_ BitVec 64)) (t!26062 List!18458)) )
))
(declare-fun arrayNoDuplicates!0 (array!54667 (_ BitVec 32) List!18458) Bool)

(assert (=> b!916328 (= res!617792 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18455))))

(declare-fun b!916329 () Bool)

(declare-fun e!514371 () Bool)

(declare-fun tp_is_empty!19345 () Bool)

(assert (=> b!916329 (= e!514371 tp_is_empty!19345)))

(declare-fun mapNonEmpty!30774 () Bool)

(declare-fun mapRes!30774 () Bool)

(declare-fun tp!58952 () Bool)

(assert (=> mapNonEmpty!30774 (= mapRes!30774 (and tp!58952 e!514371))))

(declare-fun mapKey!30774 () (_ BitVec 32))

(declare-datatypes ((V!30759 0))(
  ( (V!30760 (val!9723 Int)) )
))
(declare-datatypes ((ValueCell!9191 0))(
  ( (ValueCellFull!9191 (v!12240 V!30759)) (EmptyCell!9191) )
))
(declare-fun mapRest!30774 () (Array (_ BitVec 32) ValueCell!9191))

(declare-datatypes ((array!54669 0))(
  ( (array!54670 (arr!26280 (Array (_ BitVec 32) ValueCell!9191)) (size!26741 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54669)

(declare-fun mapValue!30774 () ValueCell!9191)

(assert (=> mapNonEmpty!30774 (= (arr!26280 _values!1231) (store mapRest!30774 mapKey!30774 mapValue!30774))))

(declare-fun b!916330 () Bool)

(declare-fun e!514369 () Bool)

(assert (=> b!916330 (= e!514369 false)))

(declare-fun lt!411584 () V!30759)

(declare-datatypes ((tuple2!12662 0))(
  ( (tuple2!12663 (_1!6342 (_ BitVec 64)) (_2!6342 V!30759)) )
))
(declare-datatypes ((List!18459 0))(
  ( (Nil!18456) (Cons!18455 (h!19601 tuple2!12662) (t!26063 List!18459)) )
))
(declare-datatypes ((ListLongMap!11349 0))(
  ( (ListLongMap!11350 (toList!5690 List!18459)) )
))
(declare-fun lt!411583 () ListLongMap!11349)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!534 (ListLongMap!11349 (_ BitVec 64)) V!30759)

(assert (=> b!916330 (= lt!411584 (apply!534 lt!411583 k0!1099))))

(declare-fun b!916331 () Bool)

(declare-fun res!617790 () Bool)

(assert (=> b!916331 (=> (not res!617790) (not e!514372))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916331 (= res!617790 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26740 _keys!1487))))))

(declare-fun b!916332 () Bool)

(declare-fun e!514370 () Bool)

(assert (=> b!916332 (= e!514370 tp_is_empty!19345)))

(declare-fun b!916333 () Bool)

(declare-fun e!514373 () Bool)

(assert (=> b!916333 (= e!514373 (and e!514370 mapRes!30774))))

(declare-fun condMapEmpty!30774 () Bool)

(declare-fun mapDefault!30774 () ValueCell!9191)

(assert (=> b!916333 (= condMapEmpty!30774 (= (arr!26280 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9191)) mapDefault!30774)))))

(declare-fun b!916334 () Bool)

(declare-fun res!617791 () Bool)

(assert (=> b!916334 (=> (not res!617791) (not e!514372))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54667 (_ BitVec 32)) Bool)

(assert (=> b!916334 (= res!617791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617795 () Bool)

(assert (=> start!78606 (=> (not res!617795) (not e!514372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78606 (= res!617795 (validMask!0 mask!1881))))

(assert (=> start!78606 e!514372))

(assert (=> start!78606 true))

(declare-fun array_inv!20582 (array!54669) Bool)

(assert (=> start!78606 (and (array_inv!20582 _values!1231) e!514373)))

(assert (=> start!78606 tp!58953))

(declare-fun array_inv!20583 (array!54667) Bool)

(assert (=> start!78606 (array_inv!20583 _keys!1487)))

(assert (=> start!78606 tp_is_empty!19345))

(declare-fun b!916327 () Bool)

(assert (=> b!916327 (= e!514372 e!514369)))

(declare-fun res!617794 () Bool)

(assert (=> b!916327 (=> (not res!617794) (not e!514369))))

(declare-fun contains!4700 (ListLongMap!11349 (_ BitVec 64)) Bool)

(assert (=> b!916327 (= res!617794 (contains!4700 lt!411583 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30759)

(declare-fun minValue!1173 () V!30759)

(declare-fun getCurrentListMap!2889 (array!54667 array!54669 (_ BitVec 32) (_ BitVec 32) V!30759 V!30759 (_ BitVec 32) Int) ListLongMap!11349)

(assert (=> b!916327 (= lt!411583 (getCurrentListMap!2889 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30774 () Bool)

(assert (=> mapIsEmpty!30774 mapRes!30774))

(declare-fun b!916335 () Bool)

(declare-fun res!617793 () Bool)

(assert (=> b!916335 (=> (not res!617793) (not e!514372))))

(assert (=> b!916335 (= res!617793 (and (= (size!26741 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26740 _keys!1487) (size!26741 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78606 res!617795) b!916335))

(assert (= (and b!916335 res!617793) b!916334))

(assert (= (and b!916334 res!617791) b!916328))

(assert (= (and b!916328 res!617792) b!916331))

(assert (= (and b!916331 res!617790) b!916327))

(assert (= (and b!916327 res!617794) b!916330))

(assert (= (and b!916333 condMapEmpty!30774) mapIsEmpty!30774))

(assert (= (and b!916333 (not condMapEmpty!30774)) mapNonEmpty!30774))

(get-info :version)

(assert (= (and mapNonEmpty!30774 ((_ is ValueCellFull!9191) mapValue!30774)) b!916329))

(assert (= (and b!916333 ((_ is ValueCellFull!9191) mapDefault!30774)) b!916332))

(assert (= start!78606 b!916333))

(declare-fun m!849793 () Bool)

(assert (=> start!78606 m!849793))

(declare-fun m!849795 () Bool)

(assert (=> start!78606 m!849795))

(declare-fun m!849797 () Bool)

(assert (=> start!78606 m!849797))

(declare-fun m!849799 () Bool)

(assert (=> b!916327 m!849799))

(declare-fun m!849801 () Bool)

(assert (=> b!916327 m!849801))

(declare-fun m!849803 () Bool)

(assert (=> b!916334 m!849803))

(declare-fun m!849805 () Bool)

(assert (=> b!916328 m!849805))

(declare-fun m!849807 () Bool)

(assert (=> b!916330 m!849807))

(declare-fun m!849809 () Bool)

(assert (=> mapNonEmpty!30774 m!849809))

(check-sat (not b!916327) (not b!916328) (not b!916330) tp_is_empty!19345 (not b!916334) (not b_next!16837) b_and!27433 (not mapNonEmpty!30774) (not start!78606))
(check-sat b_and!27433 (not b_next!16837))
