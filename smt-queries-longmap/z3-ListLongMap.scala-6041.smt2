; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78128 () Bool)

(assert start!78128)

(declare-fun b_free!16657 () Bool)

(declare-fun b_next!16657 () Bool)

(assert (=> start!78128 (= b_free!16657 (not b_next!16657))))

(declare-fun tp!58245 () Bool)

(declare-fun b_and!27205 () Bool)

(assert (=> start!78128 (= tp!58245 b_and!27205)))

(declare-fun mapIsEmpty!30337 () Bool)

(declare-fun mapRes!30337 () Bool)

(assert (=> mapIsEmpty!30337 mapRes!30337))

(declare-fun b!911801 () Bool)

(declare-fun e!511435 () Bool)

(declare-fun tp_is_empty!19075 () Bool)

(assert (=> b!911801 (= e!511435 tp_is_empty!19075)))

(declare-fun b!911802 () Bool)

(declare-fun e!511437 () Bool)

(assert (=> b!911802 (= e!511437 tp_is_empty!19075)))

(declare-fun b!911803 () Bool)

(declare-fun e!511436 () Bool)

(assert (=> b!911803 (= e!511436 (and e!511435 mapRes!30337))))

(declare-fun condMapEmpty!30337 () Bool)

(declare-datatypes ((V!30399 0))(
  ( (V!30400 (val!9588 Int)) )
))
(declare-datatypes ((ValueCell!9056 0))(
  ( (ValueCellFull!9056 (v!12097 V!30399)) (EmptyCell!9056) )
))
(declare-datatypes ((array!54145 0))(
  ( (array!54146 (arr!26028 (Array (_ BitVec 32) ValueCell!9056)) (size!26489 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54145)

(declare-fun mapDefault!30337 () ValueCell!9056)

(assert (=> b!911803 (= condMapEmpty!30337 (= (arr!26028 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9056)) mapDefault!30337)))))

(declare-fun b!911804 () Bool)

(declare-fun e!511439 () Bool)

(assert (=> b!911804 (= e!511439 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30399)

(declare-datatypes ((array!54147 0))(
  ( (array!54148 (arr!26029 (Array (_ BitVec 32) (_ BitVec 64))) (size!26490 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54147)

(declare-fun lt!410310 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30399)

(declare-datatypes ((tuple2!12536 0))(
  ( (tuple2!12537 (_1!6279 (_ BitVec 64)) (_2!6279 V!30399)) )
))
(declare-datatypes ((List!18316 0))(
  ( (Nil!18313) (Cons!18312 (h!19458 tuple2!12536) (t!25894 List!18316)) )
))
(declare-datatypes ((ListLongMap!11223 0))(
  ( (ListLongMap!11224 (toList!5627 List!18316)) )
))
(declare-fun contains!4629 (ListLongMap!11223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2829 (array!54147 array!54145 (_ BitVec 32) (_ BitVec 32) V!30399 V!30399 (_ BitVec 32) Int) ListLongMap!11223)

(assert (=> b!911804 (= lt!410310 (contains!4629 (getCurrentListMap!2829 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911805 () Bool)

(declare-fun res!615159 () Bool)

(assert (=> b!911805 (=> (not res!615159) (not e!511439))))

(assert (=> b!911805 (= res!615159 (and (= (size!26489 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26490 _keys!1386) (size!26489 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615157 () Bool)

(assert (=> start!78128 (=> (not res!615157) (not e!511439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78128 (= res!615157 (validMask!0 mask!1756))))

(assert (=> start!78128 e!511439))

(declare-fun array_inv!20408 (array!54145) Bool)

(assert (=> start!78128 (and (array_inv!20408 _values!1152) e!511436)))

(assert (=> start!78128 tp!58245))

(assert (=> start!78128 true))

(assert (=> start!78128 tp_is_empty!19075))

(declare-fun array_inv!20409 (array!54147) Bool)

(assert (=> start!78128 (array_inv!20409 _keys!1386)))

(declare-fun b!911806 () Bool)

(declare-fun res!615158 () Bool)

(assert (=> b!911806 (=> (not res!615158) (not e!511439))))

(declare-datatypes ((List!18317 0))(
  ( (Nil!18314) (Cons!18313 (h!19459 (_ BitVec 64)) (t!25895 List!18317)) )
))
(declare-fun arrayNoDuplicates!0 (array!54147 (_ BitVec 32) List!18317) Bool)

(assert (=> b!911806 (= res!615158 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18314))))

(declare-fun mapNonEmpty!30337 () Bool)

(declare-fun tp!58246 () Bool)

(assert (=> mapNonEmpty!30337 (= mapRes!30337 (and tp!58246 e!511437))))

(declare-fun mapKey!30337 () (_ BitVec 32))

(declare-fun mapValue!30337 () ValueCell!9056)

(declare-fun mapRest!30337 () (Array (_ BitVec 32) ValueCell!9056))

(assert (=> mapNonEmpty!30337 (= (arr!26028 _values!1152) (store mapRest!30337 mapKey!30337 mapValue!30337))))

(declare-fun b!911807 () Bool)

(declare-fun res!615160 () Bool)

(assert (=> b!911807 (=> (not res!615160) (not e!511439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54147 (_ BitVec 32)) Bool)

(assert (=> b!911807 (= res!615160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78128 res!615157) b!911805))

(assert (= (and b!911805 res!615159) b!911807))

(assert (= (and b!911807 res!615160) b!911806))

(assert (= (and b!911806 res!615158) b!911804))

(assert (= (and b!911803 condMapEmpty!30337) mapIsEmpty!30337))

(assert (= (and b!911803 (not condMapEmpty!30337)) mapNonEmpty!30337))

(get-info :version)

(assert (= (and mapNonEmpty!30337 ((_ is ValueCellFull!9056) mapValue!30337)) b!911802))

(assert (= (and b!911803 ((_ is ValueCellFull!9056) mapDefault!30337)) b!911801))

(assert (= start!78128 b!911803))

(declare-fun m!845889 () Bool)

(assert (=> mapNonEmpty!30337 m!845889))

(declare-fun m!845891 () Bool)

(assert (=> b!911806 m!845891))

(declare-fun m!845893 () Bool)

(assert (=> b!911804 m!845893))

(assert (=> b!911804 m!845893))

(declare-fun m!845895 () Bool)

(assert (=> b!911804 m!845895))

(declare-fun m!845897 () Bool)

(assert (=> start!78128 m!845897))

(declare-fun m!845899 () Bool)

(assert (=> start!78128 m!845899))

(declare-fun m!845901 () Bool)

(assert (=> start!78128 m!845901))

(declare-fun m!845903 () Bool)

(assert (=> b!911807 m!845903))

(check-sat (not start!78128) (not b!911806) b_and!27205 (not mapNonEmpty!30337) (not b!911804) tp_is_empty!19075 (not b_next!16657) (not b!911807))
(check-sat b_and!27205 (not b_next!16657))
