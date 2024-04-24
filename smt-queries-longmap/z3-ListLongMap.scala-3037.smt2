; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42582 () Bool)

(assert start!42582)

(declare-fun b_free!12031 () Bool)

(declare-fun b_next!12031 () Bool)

(assert (=> start!42582 (= b_free!12031 (not b_next!12031))))

(declare-fun tp!42132 () Bool)

(declare-fun b_and!20521 () Bool)

(assert (=> start!42582 (= tp!42132 b_and!20521)))

(declare-fun mapNonEmpty!21907 () Bool)

(declare-fun mapRes!21907 () Bool)

(declare-fun tp!42133 () Bool)

(declare-fun e!278979 () Bool)

(assert (=> mapNonEmpty!21907 (= mapRes!21907 (and tp!42133 e!278979))))

(declare-datatypes ((V!19051 0))(
  ( (V!19052 (val!6774 Int)) )
))
(declare-datatypes ((ValueCell!6386 0))(
  ( (ValueCellFull!6386 (v!9068 V!19051)) (EmptyCell!6386) )
))
(declare-datatypes ((array!30642 0))(
  ( (array!30643 (arr!14738 (Array (_ BitVec 32) ValueCell!6386)) (size!15090 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30642)

(declare-fun mapValue!21907 () ValueCell!6386)

(declare-fun mapKey!21907 () (_ BitVec 32))

(declare-fun mapRest!21907 () (Array (_ BitVec 32) ValueCell!6386))

(assert (=> mapNonEmpty!21907 (= (arr!14738 _values!833) (store mapRest!21907 mapKey!21907 mapValue!21907))))

(declare-fun b!475153 () Bool)

(declare-fun e!278975 () Bool)

(declare-fun tp_is_empty!13459 () Bool)

(assert (=> b!475153 (= e!278975 tp_is_empty!13459)))

(declare-fun b!475154 () Bool)

(declare-fun res!283798 () Bool)

(declare-fun e!278978 () Bool)

(assert (=> b!475154 (=> (not res!283798) (not e!278978))))

(declare-datatypes ((array!30644 0))(
  ( (array!30645 (arr!14739 (Array (_ BitVec 32) (_ BitVec 64))) (size!15091 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30644)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30644 (_ BitVec 32)) Bool)

(assert (=> b!475154 (= res!283798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21907 () Bool)

(assert (=> mapIsEmpty!21907 mapRes!21907))

(declare-fun res!283799 () Bool)

(assert (=> start!42582 (=> (not res!283799) (not e!278978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42582 (= res!283799 (validMask!0 mask!1365))))

(assert (=> start!42582 e!278978))

(assert (=> start!42582 tp_is_empty!13459))

(assert (=> start!42582 tp!42132))

(assert (=> start!42582 true))

(declare-fun array_inv!10710 (array!30644) Bool)

(assert (=> start!42582 (array_inv!10710 _keys!1025)))

(declare-fun e!278976 () Bool)

(declare-fun array_inv!10711 (array!30642) Bool)

(assert (=> start!42582 (and (array_inv!10711 _values!833) e!278976)))

(declare-fun b!475155 () Bool)

(assert (=> b!475155 (= e!278978 false)))

(declare-datatypes ((tuple2!8860 0))(
  ( (tuple2!8861 (_1!4441 (_ BitVec 64)) (_2!4441 V!19051)) )
))
(declare-datatypes ((List!8918 0))(
  ( (Nil!8915) (Cons!8914 (h!9770 tuple2!8860) (t!14884 List!8918)) )
))
(declare-datatypes ((ListLongMap!7775 0))(
  ( (ListLongMap!7776 (toList!3903 List!8918)) )
))
(declare-fun lt!216425 () ListLongMap!7775)

(declare-fun zeroValue!794 () V!19051)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19051)

(declare-fun getCurrentListMapNoExtraKeys!2110 (array!30644 array!30642 (_ BitVec 32) (_ BitVec 32) V!19051 V!19051 (_ BitVec 32) Int) ListLongMap!7775)

(assert (=> b!475155 (= lt!216425 (getCurrentListMapNoExtraKeys!2110 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19051)

(declare-fun lt!216424 () ListLongMap!7775)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475155 (= lt!216424 (getCurrentListMapNoExtraKeys!2110 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475156 () Bool)

(declare-fun res!283796 () Bool)

(assert (=> b!475156 (=> (not res!283796) (not e!278978))))

(declare-datatypes ((List!8919 0))(
  ( (Nil!8916) (Cons!8915 (h!9771 (_ BitVec 64)) (t!14885 List!8919)) )
))
(declare-fun arrayNoDuplicates!0 (array!30644 (_ BitVec 32) List!8919) Bool)

(assert (=> b!475156 (= res!283796 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8916))))

(declare-fun b!475157 () Bool)

(assert (=> b!475157 (= e!278979 tp_is_empty!13459)))

(declare-fun b!475158 () Bool)

(declare-fun res!283797 () Bool)

(assert (=> b!475158 (=> (not res!283797) (not e!278978))))

(assert (=> b!475158 (= res!283797 (and (= (size!15090 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15091 _keys!1025) (size!15090 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475159 () Bool)

(assert (=> b!475159 (= e!278976 (and e!278975 mapRes!21907))))

(declare-fun condMapEmpty!21907 () Bool)

(declare-fun mapDefault!21907 () ValueCell!6386)

(assert (=> b!475159 (= condMapEmpty!21907 (= (arr!14738 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6386)) mapDefault!21907)))))

(assert (= (and start!42582 res!283799) b!475158))

(assert (= (and b!475158 res!283797) b!475154))

(assert (= (and b!475154 res!283798) b!475156))

(assert (= (and b!475156 res!283796) b!475155))

(assert (= (and b!475159 condMapEmpty!21907) mapIsEmpty!21907))

(assert (= (and b!475159 (not condMapEmpty!21907)) mapNonEmpty!21907))

(get-info :version)

(assert (= (and mapNonEmpty!21907 ((_ is ValueCellFull!6386) mapValue!21907)) b!475157))

(assert (= (and b!475159 ((_ is ValueCellFull!6386) mapDefault!21907)) b!475153))

(assert (= start!42582 b!475159))

(declare-fun m!457629 () Bool)

(assert (=> mapNonEmpty!21907 m!457629))

(declare-fun m!457631 () Bool)

(assert (=> b!475154 m!457631))

(declare-fun m!457633 () Bool)

(assert (=> start!42582 m!457633))

(declare-fun m!457635 () Bool)

(assert (=> start!42582 m!457635))

(declare-fun m!457637 () Bool)

(assert (=> start!42582 m!457637))

(declare-fun m!457639 () Bool)

(assert (=> b!475156 m!457639))

(declare-fun m!457641 () Bool)

(assert (=> b!475155 m!457641))

(declare-fun m!457643 () Bool)

(assert (=> b!475155 m!457643))

(check-sat (not b!475156) (not start!42582) b_and!20521 tp_is_empty!13459 (not b_next!12031) (not b!475155) (not mapNonEmpty!21907) (not b!475154))
(check-sat b_and!20521 (not b_next!12031))
