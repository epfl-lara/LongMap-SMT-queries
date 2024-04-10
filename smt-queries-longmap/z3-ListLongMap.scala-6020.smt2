; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78006 () Bool)

(assert start!78006)

(declare-fun b_free!16533 () Bool)

(declare-fun b_next!16533 () Bool)

(assert (=> start!78006 (= b_free!16533 (not b_next!16533))))

(declare-fun tp!57869 () Bool)

(declare-fun b_and!27105 () Bool)

(assert (=> start!78006 (= tp!57869 b_and!27105)))

(declare-fun b!910611 () Bool)

(declare-fun res!614460 () Bool)

(declare-fun e!510582 () Bool)

(assert (=> b!910611 (=> (not res!614460) (not e!510582))))

(declare-datatypes ((array!53918 0))(
  ( (array!53919 (arr!25915 (Array (_ BitVec 32) (_ BitVec 64))) (size!26374 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53918)

(declare-datatypes ((List!18204 0))(
  ( (Nil!18201) (Cons!18200 (h!19346 (_ BitVec 64)) (t!25789 List!18204)) )
))
(declare-fun arrayNoDuplicates!0 (array!53918 (_ BitVec 32) List!18204) Bool)

(assert (=> b!910611 (= res!614460 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18201))))

(declare-fun b!910612 () Bool)

(declare-fun e!510583 () Bool)

(declare-fun tp_is_empty!18951 () Bool)

(assert (=> b!910612 (= e!510583 tp_is_empty!18951)))

(declare-fun b!910613 () Bool)

(declare-fun e!510581 () Bool)

(assert (=> b!910613 (= e!510581 tp_is_empty!18951)))

(declare-fun b!910614 () Bool)

(declare-fun e!510585 () Bool)

(declare-fun mapRes!30148 () Bool)

(assert (=> b!910614 (= e!510585 (and e!510581 mapRes!30148))))

(declare-fun condMapEmpty!30148 () Bool)

(declare-datatypes ((V!30233 0))(
  ( (V!30234 (val!9526 Int)) )
))
(declare-datatypes ((ValueCell!8994 0))(
  ( (ValueCellFull!8994 (v!12035 V!30233)) (EmptyCell!8994) )
))
(declare-datatypes ((array!53920 0))(
  ( (array!53921 (arr!25916 (Array (_ BitVec 32) ValueCell!8994)) (size!26375 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53920)

(declare-fun mapDefault!30148 () ValueCell!8994)

(assert (=> b!910614 (= condMapEmpty!30148 (= (arr!25916 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8994)) mapDefault!30148)))))

(declare-fun mapIsEmpty!30148 () Bool)

(assert (=> mapIsEmpty!30148 mapRes!30148))

(declare-fun b!910615 () Bool)

(declare-fun res!614463 () Bool)

(assert (=> b!910615 (=> (not res!614463) (not e!510582))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!910615 (= res!614463 (and (= (size!26375 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26374 _keys!1386) (size!26375 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614461 () Bool)

(assert (=> start!78006 (=> (not res!614461) (not e!510582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78006 (= res!614461 (validMask!0 mask!1756))))

(assert (=> start!78006 e!510582))

(declare-fun array_inv!20264 (array!53920) Bool)

(assert (=> start!78006 (and (array_inv!20264 _values!1152) e!510585)))

(assert (=> start!78006 tp!57869))

(assert (=> start!78006 true))

(assert (=> start!78006 tp_is_empty!18951))

(declare-fun array_inv!20265 (array!53918) Bool)

(assert (=> start!78006 (array_inv!20265 _keys!1386)))

(declare-fun b!910616 () Bool)

(assert (=> b!910616 (= e!510582 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410282 () Bool)

(declare-fun zeroValue!1094 () V!30233)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30233)

(declare-datatypes ((tuple2!12414 0))(
  ( (tuple2!12415 (_1!6218 (_ BitVec 64)) (_2!6218 V!30233)) )
))
(declare-datatypes ((List!18205 0))(
  ( (Nil!18202) (Cons!18201 (h!19347 tuple2!12414) (t!25790 List!18205)) )
))
(declare-datatypes ((ListLongMap!11111 0))(
  ( (ListLongMap!11112 (toList!5571 List!18205)) )
))
(declare-fun contains!4615 (ListLongMap!11111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2833 (array!53918 array!53920 (_ BitVec 32) (_ BitVec 32) V!30233 V!30233 (_ BitVec 32) Int) ListLongMap!11111)

(assert (=> b!910616 (= lt!410282 (contains!4615 (getCurrentListMap!2833 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30148 () Bool)

(declare-fun tp!57870 () Bool)

(assert (=> mapNonEmpty!30148 (= mapRes!30148 (and tp!57870 e!510583))))

(declare-fun mapRest!30148 () (Array (_ BitVec 32) ValueCell!8994))

(declare-fun mapKey!30148 () (_ BitVec 32))

(declare-fun mapValue!30148 () ValueCell!8994)

(assert (=> mapNonEmpty!30148 (= (arr!25916 _values!1152) (store mapRest!30148 mapKey!30148 mapValue!30148))))

(declare-fun b!910617 () Bool)

(declare-fun res!614462 () Bool)

(assert (=> b!910617 (=> (not res!614462) (not e!510582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53918 (_ BitVec 32)) Bool)

(assert (=> b!910617 (= res!614462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78006 res!614461) b!910615))

(assert (= (and b!910615 res!614463) b!910617))

(assert (= (and b!910617 res!614462) b!910611))

(assert (= (and b!910611 res!614460) b!910616))

(assert (= (and b!910614 condMapEmpty!30148) mapIsEmpty!30148))

(assert (= (and b!910614 (not condMapEmpty!30148)) mapNonEmpty!30148))

(get-info :version)

(assert (= (and mapNonEmpty!30148 ((_ is ValueCellFull!8994) mapValue!30148)) b!910612))

(assert (= (and b!910614 ((_ is ValueCellFull!8994) mapDefault!30148)) b!910613))

(assert (= start!78006 b!910614))

(declare-fun m!845569 () Bool)

(assert (=> b!910617 m!845569))

(declare-fun m!845571 () Bool)

(assert (=> b!910616 m!845571))

(assert (=> b!910616 m!845571))

(declare-fun m!845573 () Bool)

(assert (=> b!910616 m!845573))

(declare-fun m!845575 () Bool)

(assert (=> start!78006 m!845575))

(declare-fun m!845577 () Bool)

(assert (=> start!78006 m!845577))

(declare-fun m!845579 () Bool)

(assert (=> start!78006 m!845579))

(declare-fun m!845581 () Bool)

(assert (=> b!910611 m!845581))

(declare-fun m!845583 () Bool)

(assert (=> mapNonEmpty!30148 m!845583))

(check-sat (not b_next!16533) (not start!78006) tp_is_empty!18951 (not b!910611) (not b!910616) (not b!910617) (not mapNonEmpty!30148) b_and!27105)
(check-sat b_and!27105 (not b_next!16533))
