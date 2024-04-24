; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78090 () Bool)

(assert start!78090)

(declare-fun b_free!16465 () Bool)

(declare-fun b_next!16465 () Bool)

(assert (=> start!78090 (= b_free!16465 (not b_next!16465))))

(declare-fun tp!57663 () Bool)

(declare-fun b_and!27045 () Bool)

(assert (=> start!78090 (= tp!57663 b_and!27045)))

(declare-fun res!614336 () Bool)

(declare-fun e!510583 () Bool)

(assert (=> start!78090 (=> (not res!614336) (not e!510583))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78090 (= res!614336 (validMask!0 mask!1756))))

(assert (=> start!78090 e!510583))

(declare-datatypes ((V!30143 0))(
  ( (V!30144 (val!9492 Int)) )
))
(declare-datatypes ((ValueCell!8960 0))(
  ( (ValueCellFull!8960 (v!11997 V!30143)) (EmptyCell!8960) )
))
(declare-datatypes ((array!53839 0))(
  ( (array!53840 (arr!25872 (Array (_ BitVec 32) ValueCell!8960)) (size!26332 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53839)

(declare-fun e!510584 () Bool)

(declare-fun array_inv!20306 (array!53839) Bool)

(assert (=> start!78090 (and (array_inv!20306 _values!1152) e!510584)))

(assert (=> start!78090 tp!57663))

(assert (=> start!78090 true))

(declare-fun tp_is_empty!18883 () Bool)

(assert (=> start!78090 tp_is_empty!18883))

(declare-datatypes ((array!53841 0))(
  ( (array!53842 (arr!25873 (Array (_ BitVec 32) (_ BitVec 64))) (size!26333 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53841)

(declare-fun array_inv!20307 (array!53841) Bool)

(assert (=> start!78090 (array_inv!20307 _keys!1386)))

(declare-fun b!910673 () Bool)

(declare-fun e!510582 () Bool)

(assert (=> b!910673 (= e!510582 tp_is_empty!18883)))

(declare-fun b!910674 () Bool)

(assert (=> b!910674 (= e!510583 false)))

(declare-fun zeroValue!1094 () V!30143)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30143)

(declare-fun lt!410463 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12326 0))(
  ( (tuple2!12327 (_1!6174 (_ BitVec 64)) (_2!6174 V!30143)) )
))
(declare-datatypes ((List!18145 0))(
  ( (Nil!18142) (Cons!18141 (h!19293 tuple2!12326) (t!25720 List!18145)) )
))
(declare-datatypes ((ListLongMap!11025 0))(
  ( (ListLongMap!11026 (toList!5528 List!18145)) )
))
(declare-fun contains!4580 (ListLongMap!11025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2789 (array!53841 array!53839 (_ BitVec 32) (_ BitVec 32) V!30143 V!30143 (_ BitVec 32) Int) ListLongMap!11025)

(assert (=> b!910674 (= lt!410463 (contains!4580 (getCurrentListMap!2789 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910675 () Bool)

(declare-fun res!614334 () Bool)

(assert (=> b!910675 (=> (not res!614334) (not e!510583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53841 (_ BitVec 32)) Bool)

(assert (=> b!910675 (= res!614334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30043 () Bool)

(declare-fun mapRes!30043 () Bool)

(declare-fun tp!57664 () Bool)

(declare-fun e!510585 () Bool)

(assert (=> mapNonEmpty!30043 (= mapRes!30043 (and tp!57664 e!510585))))

(declare-fun mapValue!30043 () ValueCell!8960)

(declare-fun mapRest!30043 () (Array (_ BitVec 32) ValueCell!8960))

(declare-fun mapKey!30043 () (_ BitVec 32))

(assert (=> mapNonEmpty!30043 (= (arr!25872 _values!1152) (store mapRest!30043 mapKey!30043 mapValue!30043))))

(declare-fun b!910676 () Bool)

(declare-fun res!614335 () Bool)

(assert (=> b!910676 (=> (not res!614335) (not e!510583))))

(assert (=> b!910676 (= res!614335 (and (= (size!26332 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26333 _keys!1386) (size!26332 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910677 () Bool)

(assert (=> b!910677 (= e!510585 tp_is_empty!18883)))

(declare-fun b!910678 () Bool)

(declare-fun res!614333 () Bool)

(assert (=> b!910678 (=> (not res!614333) (not e!510583))))

(declare-datatypes ((List!18146 0))(
  ( (Nil!18143) (Cons!18142 (h!19294 (_ BitVec 64)) (t!25721 List!18146)) )
))
(declare-fun arrayNoDuplicates!0 (array!53841 (_ BitVec 32) List!18146) Bool)

(assert (=> b!910678 (= res!614333 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18143))))

(declare-fun b!910679 () Bool)

(assert (=> b!910679 (= e!510584 (and e!510582 mapRes!30043))))

(declare-fun condMapEmpty!30043 () Bool)

(declare-fun mapDefault!30043 () ValueCell!8960)

(assert (=> b!910679 (= condMapEmpty!30043 (= (arr!25872 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8960)) mapDefault!30043)))))

(declare-fun mapIsEmpty!30043 () Bool)

(assert (=> mapIsEmpty!30043 mapRes!30043))

(assert (= (and start!78090 res!614336) b!910676))

(assert (= (and b!910676 res!614335) b!910675))

(assert (= (and b!910675 res!614334) b!910678))

(assert (= (and b!910678 res!614333) b!910674))

(assert (= (and b!910679 condMapEmpty!30043) mapIsEmpty!30043))

(assert (= (and b!910679 (not condMapEmpty!30043)) mapNonEmpty!30043))

(get-info :version)

(assert (= (and mapNonEmpty!30043 ((_ is ValueCellFull!8960) mapValue!30043)) b!910677))

(assert (= (and b!910679 ((_ is ValueCellFull!8960) mapDefault!30043)) b!910673))

(assert (= start!78090 b!910679))

(declare-fun m!846227 () Bool)

(assert (=> start!78090 m!846227))

(declare-fun m!846229 () Bool)

(assert (=> start!78090 m!846229))

(declare-fun m!846231 () Bool)

(assert (=> start!78090 m!846231))

(declare-fun m!846233 () Bool)

(assert (=> b!910675 m!846233))

(declare-fun m!846235 () Bool)

(assert (=> b!910674 m!846235))

(assert (=> b!910674 m!846235))

(declare-fun m!846237 () Bool)

(assert (=> b!910674 m!846237))

(declare-fun m!846239 () Bool)

(assert (=> mapNonEmpty!30043 m!846239))

(declare-fun m!846241 () Bool)

(assert (=> b!910678 m!846241))

(check-sat b_and!27045 (not b!910675) (not b_next!16465) (not start!78090) tp_is_empty!18883 (not b!910678) (not b!910674) (not mapNonEmpty!30043))
(check-sat b_and!27045 (not b_next!16465))
