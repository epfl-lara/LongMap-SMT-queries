; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42404 () Bool)

(assert start!42404)

(declare-fun b_free!11893 () Bool)

(declare-fun b_next!11893 () Bool)

(assert (=> start!42404 (= b_free!11893 (not b_next!11893))))

(declare-fun tp!41713 () Bool)

(declare-fun b_and!20359 () Bool)

(assert (=> start!42404 (= tp!41713 b_and!20359)))

(declare-fun mapIsEmpty!21694 () Bool)

(declare-fun mapRes!21694 () Bool)

(assert (=> mapIsEmpty!21694 mapRes!21694))

(declare-fun b!473227 () Bool)

(declare-fun e!277599 () Bool)

(declare-fun tp_is_empty!13321 () Bool)

(assert (=> b!473227 (= e!277599 tp_is_empty!13321)))

(declare-fun b!473228 () Bool)

(declare-fun res!282697 () Bool)

(declare-fun e!277602 () Bool)

(assert (=> b!473228 (=> (not res!282697) (not e!277602))))

(declare-datatypes ((array!30378 0))(
  ( (array!30379 (arr!14608 (Array (_ BitVec 32) (_ BitVec 64))) (size!14960 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30378)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30378 (_ BitVec 32)) Bool)

(assert (=> b!473228 (= res!282697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473229 () Bool)

(declare-fun e!277600 () Bool)

(assert (=> b!473229 (= e!277600 tp_is_empty!13321)))

(declare-fun b!473230 () Bool)

(declare-fun e!277601 () Bool)

(assert (=> b!473230 (= e!277602 (not e!277601))))

(declare-fun res!282696 () Bool)

(assert (=> b!473230 (=> res!282696 e!277601)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473230 (= res!282696 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18867 0))(
  ( (V!18868 (val!6705 Int)) )
))
(declare-datatypes ((tuple2!8760 0))(
  ( (tuple2!8761 (_1!4391 (_ BitVec 64)) (_2!4391 V!18867)) )
))
(declare-datatypes ((List!8823 0))(
  ( (Nil!8820) (Cons!8819 (h!9675 tuple2!8760) (t!14785 List!8823)) )
))
(declare-datatypes ((ListLongMap!7675 0))(
  ( (ListLongMap!7676 (toList!3853 List!8823)) )
))
(declare-fun lt!215005 () ListLongMap!7675)

(declare-fun lt!215003 () ListLongMap!7675)

(assert (=> b!473230 (= lt!215005 lt!215003)))

(declare-fun minValueBefore!38 () V!18867)

(declare-fun zeroValue!794 () V!18867)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13910 0))(
  ( (Unit!13911) )
))
(declare-fun lt!215007 () Unit!13910)

(declare-datatypes ((ValueCell!6317 0))(
  ( (ValueCellFull!6317 (v!8997 V!18867)) (EmptyCell!6317) )
))
(declare-datatypes ((array!30380 0))(
  ( (array!30381 (arr!14609 (Array (_ BitVec 32) ValueCell!6317)) (size!14961 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30380)

(declare-fun minValueAfter!38 () V!18867)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!222 (array!30378 array!30380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 V!18867 V!18867 (_ BitVec 32) Int) Unit!13910)

(assert (=> b!473230 (= lt!215007 (lemmaNoChangeToArrayThenSameMapNoExtras!222 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2062 (array!30378 array!30380 (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 (_ BitVec 32) Int) ListLongMap!7675)

(assert (=> b!473230 (= lt!215003 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473230 (= lt!215005 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21694 () Bool)

(declare-fun tp!41712 () Bool)

(assert (=> mapNonEmpty!21694 (= mapRes!21694 (and tp!41712 e!277600))))

(declare-fun mapRest!21694 () (Array (_ BitVec 32) ValueCell!6317))

(declare-fun mapValue!21694 () ValueCell!6317)

(declare-fun mapKey!21694 () (_ BitVec 32))

(assert (=> mapNonEmpty!21694 (= (arr!14609 _values!833) (store mapRest!21694 mapKey!21694 mapValue!21694))))

(declare-fun b!473231 () Bool)

(assert (=> b!473231 (= e!277601 true)))

(declare-fun lt!215004 () ListLongMap!7675)

(declare-fun lt!215002 () tuple2!8760)

(declare-fun +!1738 (ListLongMap!7675 tuple2!8760) ListLongMap!7675)

(assert (=> b!473231 (= (+!1738 lt!215004 lt!215002) (+!1738 (+!1738 lt!215004 (tuple2!8761 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215002))))

(assert (=> b!473231 (= lt!215002 (tuple2!8761 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215001 () Unit!13910)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!140 (ListLongMap!7675 (_ BitVec 64) V!18867 V!18867) Unit!13910)

(assert (=> b!473231 (= lt!215001 (addSameAsAddTwiceSameKeyDiffValues!140 lt!215004 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473231 (= lt!215004 (+!1738 lt!215005 (tuple2!8761 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215008 () ListLongMap!7675)

(declare-fun getCurrentListMap!2218 (array!30378 array!30380 (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 (_ BitVec 32) Int) ListLongMap!7675)

(assert (=> b!473231 (= lt!215008 (getCurrentListMap!2218 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215006 () ListLongMap!7675)

(assert (=> b!473231 (= lt!215006 (getCurrentListMap!2218 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473232 () Bool)

(declare-fun res!282698 () Bool)

(assert (=> b!473232 (=> (not res!282698) (not e!277602))))

(assert (=> b!473232 (= res!282698 (and (= (size!14961 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14960 _keys!1025) (size!14961 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473233 () Bool)

(declare-fun res!282699 () Bool)

(assert (=> b!473233 (=> (not res!282699) (not e!277602))))

(declare-datatypes ((List!8824 0))(
  ( (Nil!8821) (Cons!8820 (h!9676 (_ BitVec 64)) (t!14786 List!8824)) )
))
(declare-fun arrayNoDuplicates!0 (array!30378 (_ BitVec 32) List!8824) Bool)

(assert (=> b!473233 (= res!282699 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8821))))

(declare-fun res!282695 () Bool)

(assert (=> start!42404 (=> (not res!282695) (not e!277602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42404 (= res!282695 (validMask!0 mask!1365))))

(assert (=> start!42404 e!277602))

(assert (=> start!42404 tp_is_empty!13321))

(assert (=> start!42404 tp!41713))

(assert (=> start!42404 true))

(declare-fun array_inv!10620 (array!30378) Bool)

(assert (=> start!42404 (array_inv!10620 _keys!1025)))

(declare-fun e!277604 () Bool)

(declare-fun array_inv!10621 (array!30380) Bool)

(assert (=> start!42404 (and (array_inv!10621 _values!833) e!277604)))

(declare-fun b!473234 () Bool)

(assert (=> b!473234 (= e!277604 (and e!277599 mapRes!21694))))

(declare-fun condMapEmpty!21694 () Bool)

(declare-fun mapDefault!21694 () ValueCell!6317)

(assert (=> b!473234 (= condMapEmpty!21694 (= (arr!14609 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6317)) mapDefault!21694)))))

(assert (= (and start!42404 res!282695) b!473232))

(assert (= (and b!473232 res!282698) b!473228))

(assert (= (and b!473228 res!282697) b!473233))

(assert (= (and b!473233 res!282699) b!473230))

(assert (= (and b!473230 (not res!282696)) b!473231))

(assert (= (and b!473234 condMapEmpty!21694) mapIsEmpty!21694))

(assert (= (and b!473234 (not condMapEmpty!21694)) mapNonEmpty!21694))

(get-info :version)

(assert (= (and mapNonEmpty!21694 ((_ is ValueCellFull!6317) mapValue!21694)) b!473229))

(assert (= (and b!473234 ((_ is ValueCellFull!6317) mapDefault!21694)) b!473227))

(assert (= start!42404 b!473234))

(declare-fun m!455471 () Bool)

(assert (=> b!473231 m!455471))

(declare-fun m!455473 () Bool)

(assert (=> b!473231 m!455473))

(declare-fun m!455475 () Bool)

(assert (=> b!473231 m!455475))

(declare-fun m!455477 () Bool)

(assert (=> b!473231 m!455477))

(declare-fun m!455479 () Bool)

(assert (=> b!473231 m!455479))

(assert (=> b!473231 m!455475))

(declare-fun m!455481 () Bool)

(assert (=> b!473231 m!455481))

(declare-fun m!455483 () Bool)

(assert (=> b!473231 m!455483))

(declare-fun m!455485 () Bool)

(assert (=> mapNonEmpty!21694 m!455485))

(declare-fun m!455487 () Bool)

(assert (=> start!42404 m!455487))

(declare-fun m!455489 () Bool)

(assert (=> start!42404 m!455489))

(declare-fun m!455491 () Bool)

(assert (=> start!42404 m!455491))

(declare-fun m!455493 () Bool)

(assert (=> b!473228 m!455493))

(declare-fun m!455495 () Bool)

(assert (=> b!473233 m!455495))

(declare-fun m!455497 () Bool)

(assert (=> b!473230 m!455497))

(declare-fun m!455499 () Bool)

(assert (=> b!473230 m!455499))

(declare-fun m!455501 () Bool)

(assert (=> b!473230 m!455501))

(check-sat (not b!473233) (not b_next!11893) tp_is_empty!13321 (not mapNonEmpty!21694) (not b!473228) (not start!42404) (not b!473231) b_and!20359 (not b!473230))
(check-sat b_and!20359 (not b_next!11893))
