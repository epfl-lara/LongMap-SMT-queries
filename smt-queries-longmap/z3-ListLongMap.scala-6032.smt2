; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78078 () Bool)

(assert start!78078)

(declare-fun b_free!16605 () Bool)

(declare-fun b_next!16605 () Bool)

(assert (=> start!78078 (= b_free!16605 (not b_next!16605))))

(declare-fun tp!58085 () Bool)

(declare-fun b_and!27177 () Bool)

(assert (=> start!78078 (= tp!58085 b_and!27177)))

(declare-fun b!911367 () Bool)

(declare-fun res!614895 () Bool)

(declare-fun e!511121 () Bool)

(assert (=> b!911367 (=> (not res!614895) (not e!511121))))

(declare-datatypes ((array!54046 0))(
  ( (array!54047 (arr!25979 (Array (_ BitVec 32) (_ BitVec 64))) (size!26438 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54046)

(declare-datatypes ((List!18248 0))(
  ( (Nil!18245) (Cons!18244 (h!19390 (_ BitVec 64)) (t!25833 List!18248)) )
))
(declare-fun arrayNoDuplicates!0 (array!54046 (_ BitVec 32) List!18248) Bool)

(assert (=> b!911367 (= res!614895 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18245))))

(declare-fun b!911368 () Bool)

(declare-fun e!511122 () Bool)

(declare-fun tp_is_empty!19023 () Bool)

(assert (=> b!911368 (= e!511122 tp_is_empty!19023)))

(declare-fun mapIsEmpty!30256 () Bool)

(declare-fun mapRes!30256 () Bool)

(assert (=> mapIsEmpty!30256 mapRes!30256))

(declare-fun mapNonEmpty!30256 () Bool)

(declare-fun tp!58086 () Bool)

(declare-fun e!511125 () Bool)

(assert (=> mapNonEmpty!30256 (= mapRes!30256 (and tp!58086 e!511125))))

(declare-datatypes ((V!30329 0))(
  ( (V!30330 (val!9562 Int)) )
))
(declare-datatypes ((ValueCell!9030 0))(
  ( (ValueCellFull!9030 (v!12071 V!30329)) (EmptyCell!9030) )
))
(declare-datatypes ((array!54048 0))(
  ( (array!54049 (arr!25980 (Array (_ BitVec 32) ValueCell!9030)) (size!26439 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54048)

(declare-fun mapRest!30256 () (Array (_ BitVec 32) ValueCell!9030))

(declare-fun mapValue!30256 () ValueCell!9030)

(declare-fun mapKey!30256 () (_ BitVec 32))

(assert (=> mapNonEmpty!30256 (= (arr!25980 _values!1152) (store mapRest!30256 mapKey!30256 mapValue!30256))))

(declare-fun b!911369 () Bool)

(assert (=> b!911369 (= e!511121 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30329)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410390 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30329)

(declare-datatypes ((tuple2!12456 0))(
  ( (tuple2!12457 (_1!6239 (_ BitVec 64)) (_2!6239 V!30329)) )
))
(declare-datatypes ((List!18249 0))(
  ( (Nil!18246) (Cons!18245 (h!19391 tuple2!12456) (t!25834 List!18249)) )
))
(declare-datatypes ((ListLongMap!11153 0))(
  ( (ListLongMap!11154 (toList!5592 List!18249)) )
))
(declare-fun contains!4636 (ListLongMap!11153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2854 (array!54046 array!54048 (_ BitVec 32) (_ BitVec 32) V!30329 V!30329 (_ BitVec 32) Int) ListLongMap!11153)

(assert (=> b!911369 (= lt!410390 (contains!4636 (getCurrentListMap!2854 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911370 () Bool)

(declare-fun res!614893 () Bool)

(assert (=> b!911370 (=> (not res!614893) (not e!511121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54046 (_ BitVec 32)) Bool)

(assert (=> b!911370 (= res!614893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911371 () Bool)

(declare-fun res!614892 () Bool)

(assert (=> b!911371 (=> (not res!614892) (not e!511121))))

(assert (=> b!911371 (= res!614892 (and (= (size!26439 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26438 _keys!1386) (size!26439 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614894 () Bool)

(assert (=> start!78078 (=> (not res!614894) (not e!511121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78078 (= res!614894 (validMask!0 mask!1756))))

(assert (=> start!78078 e!511121))

(declare-fun e!511123 () Bool)

(declare-fun array_inv!20306 (array!54048) Bool)

(assert (=> start!78078 (and (array_inv!20306 _values!1152) e!511123)))

(assert (=> start!78078 tp!58085))

(assert (=> start!78078 true))

(assert (=> start!78078 tp_is_empty!19023))

(declare-fun array_inv!20307 (array!54046) Bool)

(assert (=> start!78078 (array_inv!20307 _keys!1386)))

(declare-fun b!911372 () Bool)

(assert (=> b!911372 (= e!511125 tp_is_empty!19023)))

(declare-fun b!911373 () Bool)

(assert (=> b!911373 (= e!511123 (and e!511122 mapRes!30256))))

(declare-fun condMapEmpty!30256 () Bool)

(declare-fun mapDefault!30256 () ValueCell!9030)

(assert (=> b!911373 (= condMapEmpty!30256 (= (arr!25980 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9030)) mapDefault!30256)))))

(assert (= (and start!78078 res!614894) b!911371))

(assert (= (and b!911371 res!614892) b!911370))

(assert (= (and b!911370 res!614893) b!911367))

(assert (= (and b!911367 res!614895) b!911369))

(assert (= (and b!911373 condMapEmpty!30256) mapIsEmpty!30256))

(assert (= (and b!911373 (not condMapEmpty!30256)) mapNonEmpty!30256))

(get-info :version)

(assert (= (and mapNonEmpty!30256 ((_ is ValueCellFull!9030) mapValue!30256)) b!911372))

(assert (= (and b!911373 ((_ is ValueCellFull!9030) mapDefault!30256)) b!911368))

(assert (= start!78078 b!911373))

(declare-fun m!846145 () Bool)

(assert (=> mapNonEmpty!30256 m!846145))

(declare-fun m!846147 () Bool)

(assert (=> b!911367 m!846147))

(declare-fun m!846149 () Bool)

(assert (=> start!78078 m!846149))

(declare-fun m!846151 () Bool)

(assert (=> start!78078 m!846151))

(declare-fun m!846153 () Bool)

(assert (=> start!78078 m!846153))

(declare-fun m!846155 () Bool)

(assert (=> b!911369 m!846155))

(assert (=> b!911369 m!846155))

(declare-fun m!846157 () Bool)

(assert (=> b!911369 m!846157))

(declare-fun m!846159 () Bool)

(assert (=> b!911370 m!846159))

(check-sat tp_is_empty!19023 (not b!911367) b_and!27177 (not b!911370) (not mapNonEmpty!30256) (not b!911369) (not b_next!16605) (not start!78078))
(check-sat b_and!27177 (not b_next!16605))
