; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78132 () Bool)

(assert start!78132)

(declare-fun b_free!16507 () Bool)

(declare-fun b_next!16507 () Bool)

(assert (=> start!78132 (= b_free!16507 (not b_next!16507))))

(declare-fun tp!57789 () Bool)

(declare-fun b_and!27087 () Bool)

(assert (=> start!78132 (= tp!57789 b_and!27087)))

(declare-fun b!911114 () Bool)

(declare-fun res!614587 () Bool)

(declare-fun e!510897 () Bool)

(assert (=> b!911114 (=> (not res!614587) (not e!510897))))

(declare-datatypes ((array!53919 0))(
  ( (array!53920 (arr!25912 (Array (_ BitVec 32) (_ BitVec 64))) (size!26372 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53919)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53919 (_ BitVec 32)) Bool)

(assert (=> b!911114 (= res!614587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911115 () Bool)

(declare-fun e!510898 () Bool)

(declare-fun tp_is_empty!18925 () Bool)

(assert (=> b!911115 (= e!510898 tp_is_empty!18925)))

(declare-fun b!911116 () Bool)

(declare-fun res!614586 () Bool)

(assert (=> b!911116 (=> (not res!614586) (not e!510897))))

(declare-datatypes ((V!30199 0))(
  ( (V!30200 (val!9513 Int)) )
))
(declare-datatypes ((ValueCell!8981 0))(
  ( (ValueCellFull!8981 (v!12018 V!30199)) (EmptyCell!8981) )
))
(declare-datatypes ((array!53921 0))(
  ( (array!53922 (arr!25913 (Array (_ BitVec 32) ValueCell!8981)) (size!26373 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53921)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911116 (= res!614586 (and (= (size!26373 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26372 _keys!1386) (size!26373 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911117 () Bool)

(declare-fun e!510899 () Bool)

(assert (=> b!911117 (= e!510899 tp_is_empty!18925)))

(declare-fun b!911118 () Bool)

(declare-fun res!614588 () Bool)

(assert (=> b!911118 (=> (not res!614588) (not e!510897))))

(declare-datatypes ((List!18172 0))(
  ( (Nil!18169) (Cons!18168 (h!19320 (_ BitVec 64)) (t!25747 List!18172)) )
))
(declare-fun arrayNoDuplicates!0 (array!53919 (_ BitVec 32) List!18172) Bool)

(assert (=> b!911118 (= res!614588 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18169))))

(declare-fun b!911119 () Bool)

(assert (=> b!911119 (= e!510897 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30199)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30199)

(declare-fun lt!410526 () Bool)

(declare-datatypes ((tuple2!12354 0))(
  ( (tuple2!12355 (_1!6188 (_ BitVec 64)) (_2!6188 V!30199)) )
))
(declare-datatypes ((List!18173 0))(
  ( (Nil!18170) (Cons!18169 (h!19321 tuple2!12354) (t!25748 List!18173)) )
))
(declare-datatypes ((ListLongMap!11053 0))(
  ( (ListLongMap!11054 (toList!5542 List!18173)) )
))
(declare-fun contains!4594 (ListLongMap!11053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2803 (array!53919 array!53921 (_ BitVec 32) (_ BitVec 32) V!30199 V!30199 (_ BitVec 32) Int) ListLongMap!11053)

(assert (=> b!911119 (= lt!410526 (contains!4594 (getCurrentListMap!2803 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614585 () Bool)

(assert (=> start!78132 (=> (not res!614585) (not e!510897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78132 (= res!614585 (validMask!0 mask!1756))))

(assert (=> start!78132 e!510897))

(declare-fun e!510900 () Bool)

(declare-fun array_inv!20332 (array!53921) Bool)

(assert (=> start!78132 (and (array_inv!20332 _values!1152) e!510900)))

(assert (=> start!78132 tp!57789))

(assert (=> start!78132 true))

(assert (=> start!78132 tp_is_empty!18925))

(declare-fun array_inv!20333 (array!53919) Bool)

(assert (=> start!78132 (array_inv!20333 _keys!1386)))

(declare-fun mapNonEmpty!30106 () Bool)

(declare-fun mapRes!30106 () Bool)

(declare-fun tp!57790 () Bool)

(assert (=> mapNonEmpty!30106 (= mapRes!30106 (and tp!57790 e!510898))))

(declare-fun mapRest!30106 () (Array (_ BitVec 32) ValueCell!8981))

(declare-fun mapValue!30106 () ValueCell!8981)

(declare-fun mapKey!30106 () (_ BitVec 32))

(assert (=> mapNonEmpty!30106 (= (arr!25913 _values!1152) (store mapRest!30106 mapKey!30106 mapValue!30106))))

(declare-fun b!911120 () Bool)

(assert (=> b!911120 (= e!510900 (and e!510899 mapRes!30106))))

(declare-fun condMapEmpty!30106 () Bool)

(declare-fun mapDefault!30106 () ValueCell!8981)

(assert (=> b!911120 (= condMapEmpty!30106 (= (arr!25913 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8981)) mapDefault!30106)))))

(declare-fun mapIsEmpty!30106 () Bool)

(assert (=> mapIsEmpty!30106 mapRes!30106))

(assert (= (and start!78132 res!614585) b!911116))

(assert (= (and b!911116 res!614586) b!911114))

(assert (= (and b!911114 res!614587) b!911118))

(assert (= (and b!911118 res!614588) b!911119))

(assert (= (and b!911120 condMapEmpty!30106) mapIsEmpty!30106))

(assert (= (and b!911120 (not condMapEmpty!30106)) mapNonEmpty!30106))

(get-info :version)

(assert (= (and mapNonEmpty!30106 ((_ is ValueCellFull!8981) mapValue!30106)) b!911115))

(assert (= (and b!911120 ((_ is ValueCellFull!8981) mapDefault!30106)) b!911117))

(assert (= start!78132 b!911120))

(declare-fun m!846563 () Bool)

(assert (=> mapNonEmpty!30106 m!846563))

(declare-fun m!846565 () Bool)

(assert (=> b!911118 m!846565))

(declare-fun m!846567 () Bool)

(assert (=> b!911119 m!846567))

(assert (=> b!911119 m!846567))

(declare-fun m!846569 () Bool)

(assert (=> b!911119 m!846569))

(declare-fun m!846571 () Bool)

(assert (=> b!911114 m!846571))

(declare-fun m!846573 () Bool)

(assert (=> start!78132 m!846573))

(declare-fun m!846575 () Bool)

(assert (=> start!78132 m!846575))

(declare-fun m!846577 () Bool)

(assert (=> start!78132 m!846577))

(check-sat (not b!911118) b_and!27087 (not mapNonEmpty!30106) (not b!911119) tp_is_empty!18925 (not start!78132) (not b_next!16507) (not b!911114))
(check-sat b_and!27087 (not b_next!16507))
