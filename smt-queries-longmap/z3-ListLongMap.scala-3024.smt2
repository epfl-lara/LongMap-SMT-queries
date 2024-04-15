; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42484 () Bool)

(assert start!42484)

(declare-fun b_free!11953 () Bool)

(declare-fun b_next!11953 () Bool)

(assert (=> start!42484 (= b_free!11953 (not b_next!11953))))

(declare-fun tp!41895 () Bool)

(declare-fun b_and!20395 () Bool)

(assert (=> start!42484 (= tp!41895 b_and!20395)))

(declare-fun mapNonEmpty!21787 () Bool)

(declare-fun mapRes!21787 () Bool)

(declare-fun tp!41896 () Bool)

(declare-fun e!278120 () Bool)

(assert (=> mapNonEmpty!21787 (= mapRes!21787 (and tp!41896 e!278120))))

(declare-datatypes ((V!18947 0))(
  ( (V!18948 (val!6735 Int)) )
))
(declare-datatypes ((ValueCell!6347 0))(
  ( (ValueCellFull!6347 (v!9021 V!18947)) (EmptyCell!6347) )
))
(declare-datatypes ((array!30499 0))(
  ( (array!30500 (arr!14668 (Array (_ BitVec 32) ValueCell!6347)) (size!15021 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30499)

(declare-fun mapRest!21787 () (Array (_ BitVec 32) ValueCell!6347))

(declare-fun mapKey!21787 () (_ BitVec 32))

(declare-fun mapValue!21787 () ValueCell!6347)

(assert (=> mapNonEmpty!21787 (= (arr!14668 _values!833) (store mapRest!21787 mapKey!21787 mapValue!21787))))

(declare-fun b!473919 () Bool)

(declare-fun e!278118 () Bool)

(assert (=> b!473919 (= e!278118 true)))

(declare-datatypes ((tuple2!8934 0))(
  ( (tuple2!8935 (_1!4478 (_ BitVec 64)) (_2!4478 V!18947)) )
))
(declare-datatypes ((List!8998 0))(
  ( (Nil!8995) (Cons!8994 (h!9850 tuple2!8934) (t!14961 List!8998)) )
))
(declare-datatypes ((ListLongMap!7837 0))(
  ( (ListLongMap!7838 (toList!3934 List!8998)) )
))
(declare-fun lt!215637 () ListLongMap!7837)

(declare-fun lt!215630 () tuple2!8934)

(declare-fun minValueBefore!38 () V!18947)

(declare-fun +!1782 (ListLongMap!7837 tuple2!8934) ListLongMap!7837)

(assert (=> b!473919 (= (+!1782 lt!215637 lt!215630) (+!1782 (+!1782 lt!215637 (tuple2!8935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215630))))

(declare-fun minValueAfter!38 () V!18947)

(assert (=> b!473919 (= lt!215630 (tuple2!8935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13964 0))(
  ( (Unit!13965) )
))
(declare-fun lt!215633 () Unit!13964)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!161 (ListLongMap!7837 (_ BitVec 64) V!18947 V!18947) Unit!13964)

(assert (=> b!473919 (= lt!215633 (addSameAsAddTwiceSameKeyDiffValues!161 lt!215637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215631 () ListLongMap!7837)

(declare-fun zeroValue!794 () V!18947)

(assert (=> b!473919 (= lt!215637 (+!1782 lt!215631 (tuple2!8935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215634 () ListLongMap!7837)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30501 0))(
  ( (array!30502 (arr!14669 (Array (_ BitVec 32) (_ BitVec 64))) (size!15022 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30501)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2234 (array!30501 array!30499 (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 (_ BitVec 32) Int) ListLongMap!7837)

(assert (=> b!473919 (= lt!215634 (getCurrentListMap!2234 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215636 () ListLongMap!7837)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473919 (= lt!215636 (getCurrentListMap!2234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473920 () Bool)

(declare-fun tp_is_empty!13381 () Bool)

(assert (=> b!473920 (= e!278120 tp_is_empty!13381)))

(declare-fun b!473921 () Bool)

(declare-fun res!283103 () Bool)

(declare-fun e!278121 () Bool)

(assert (=> b!473921 (=> (not res!283103) (not e!278121))))

(declare-datatypes ((List!8999 0))(
  ( (Nil!8996) (Cons!8995 (h!9851 (_ BitVec 64)) (t!14962 List!8999)) )
))
(declare-fun arrayNoDuplicates!0 (array!30501 (_ BitVec 32) List!8999) Bool)

(assert (=> b!473921 (= res!283103 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8996))))

(declare-fun b!473922 () Bool)

(declare-fun res!283105 () Bool)

(assert (=> b!473922 (=> (not res!283105) (not e!278121))))

(assert (=> b!473922 (= res!283105 (and (= (size!15021 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15022 _keys!1025) (size!15021 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473923 () Bool)

(declare-fun e!278119 () Bool)

(declare-fun e!278117 () Bool)

(assert (=> b!473923 (= e!278119 (and e!278117 mapRes!21787))))

(declare-fun condMapEmpty!21787 () Bool)

(declare-fun mapDefault!21787 () ValueCell!6347)

(assert (=> b!473923 (= condMapEmpty!21787 (= (arr!14668 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6347)) mapDefault!21787)))))

(declare-fun mapIsEmpty!21787 () Bool)

(assert (=> mapIsEmpty!21787 mapRes!21787))

(declare-fun res!283102 () Bool)

(assert (=> start!42484 (=> (not res!283102) (not e!278121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42484 (= res!283102 (validMask!0 mask!1365))))

(assert (=> start!42484 e!278121))

(assert (=> start!42484 tp_is_empty!13381))

(assert (=> start!42484 tp!41895))

(assert (=> start!42484 true))

(declare-fun array_inv!10668 (array!30501) Bool)

(assert (=> start!42484 (array_inv!10668 _keys!1025)))

(declare-fun array_inv!10669 (array!30499) Bool)

(assert (=> start!42484 (and (array_inv!10669 _values!833) e!278119)))

(declare-fun b!473918 () Bool)

(assert (=> b!473918 (= e!278117 tp_is_empty!13381)))

(declare-fun b!473924 () Bool)

(assert (=> b!473924 (= e!278121 (not e!278118))))

(declare-fun res!283104 () Bool)

(assert (=> b!473924 (=> res!283104 e!278118)))

(assert (=> b!473924 (= res!283104 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215635 () ListLongMap!7837)

(assert (=> b!473924 (= lt!215631 lt!215635)))

(declare-fun lt!215632 () Unit!13964)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!258 (array!30501 array!30499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 V!18947 V!18947 (_ BitVec 32) Int) Unit!13964)

(assert (=> b!473924 (= lt!215632 (lemmaNoChangeToArrayThenSameMapNoExtras!258 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2101 (array!30501 array!30499 (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 (_ BitVec 32) Int) ListLongMap!7837)

(assert (=> b!473924 (= lt!215635 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473924 (= lt!215631 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473925 () Bool)

(declare-fun res!283106 () Bool)

(assert (=> b!473925 (=> (not res!283106) (not e!278121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30501 (_ BitVec 32)) Bool)

(assert (=> b!473925 (= res!283106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42484 res!283102) b!473922))

(assert (= (and b!473922 res!283105) b!473925))

(assert (= (and b!473925 res!283106) b!473921))

(assert (= (and b!473921 res!283103) b!473924))

(assert (= (and b!473924 (not res!283104)) b!473919))

(assert (= (and b!473923 condMapEmpty!21787) mapIsEmpty!21787))

(assert (= (and b!473923 (not condMapEmpty!21787)) mapNonEmpty!21787))

(get-info :version)

(assert (= (and mapNonEmpty!21787 ((_ is ValueCellFull!6347) mapValue!21787)) b!473920))

(assert (= (and b!473923 ((_ is ValueCellFull!6347) mapDefault!21787)) b!473918))

(assert (= start!42484 b!473923))

(declare-fun m!455727 () Bool)

(assert (=> start!42484 m!455727))

(declare-fun m!455729 () Bool)

(assert (=> start!42484 m!455729))

(declare-fun m!455731 () Bool)

(assert (=> start!42484 m!455731))

(declare-fun m!455733 () Bool)

(assert (=> mapNonEmpty!21787 m!455733))

(declare-fun m!455735 () Bool)

(assert (=> b!473921 m!455735))

(declare-fun m!455737 () Bool)

(assert (=> b!473924 m!455737))

(declare-fun m!455739 () Bool)

(assert (=> b!473924 m!455739))

(declare-fun m!455741 () Bool)

(assert (=> b!473924 m!455741))

(declare-fun m!455743 () Bool)

(assert (=> b!473919 m!455743))

(declare-fun m!455745 () Bool)

(assert (=> b!473919 m!455745))

(declare-fun m!455747 () Bool)

(assert (=> b!473919 m!455747))

(assert (=> b!473919 m!455743))

(declare-fun m!455749 () Bool)

(assert (=> b!473919 m!455749))

(declare-fun m!455751 () Bool)

(assert (=> b!473919 m!455751))

(declare-fun m!455753 () Bool)

(assert (=> b!473919 m!455753))

(declare-fun m!455755 () Bool)

(assert (=> b!473919 m!455755))

(declare-fun m!455757 () Bool)

(assert (=> b!473925 m!455757))

(check-sat (not b!473925) (not b_next!11953) (not b!473924) b_and!20395 (not start!42484) (not mapNonEmpty!21787) (not b!473921) (not b!473919) tp_is_empty!13381)
(check-sat b_and!20395 (not b_next!11953))
