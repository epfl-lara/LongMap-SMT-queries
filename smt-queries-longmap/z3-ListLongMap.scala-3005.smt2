; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42334 () Bool)

(assert start!42334)

(declare-fun b_free!11839 () Bool)

(declare-fun b_next!11839 () Bool)

(assert (=> start!42334 (= b_free!11839 (not b_next!11839))))

(declare-fun tp!41548 () Bool)

(declare-fun b_and!20259 () Bool)

(assert (=> start!42334 (= tp!41548 b_and!20259)))

(declare-fun b!472221 () Bool)

(declare-fun e!276886 () Bool)

(declare-fun e!276884 () Bool)

(assert (=> b!472221 (= e!276886 (not e!276884))))

(declare-fun res!282111 () Bool)

(assert (=> b!472221 (=> res!282111 e!276884)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472221 (= res!282111 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18795 0))(
  ( (V!18796 (val!6678 Int)) )
))
(declare-datatypes ((tuple2!8836 0))(
  ( (tuple2!8837 (_1!4429 (_ BitVec 64)) (_2!4429 V!18795)) )
))
(declare-datatypes ((List!8907 0))(
  ( (Nil!8904) (Cons!8903 (h!9759 tuple2!8836) (t!14866 List!8907)) )
))
(declare-datatypes ((ListLongMap!7739 0))(
  ( (ListLongMap!7740 (toList!3885 List!8907)) )
))
(declare-fun lt!214137 () ListLongMap!7739)

(declare-fun lt!214139 () ListLongMap!7739)

(assert (=> b!472221 (= lt!214137 lt!214139)))

(declare-fun minValueBefore!38 () V!18795)

(declare-fun zeroValue!794 () V!18795)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!30275 0))(
  ( (array!30276 (arr!14558 (Array (_ BitVec 32) (_ BitVec 64))) (size!14911 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30275)

(declare-datatypes ((ValueCell!6290 0))(
  ( (ValueCellFull!6290 (v!8963 V!18795)) (EmptyCell!6290) )
))
(declare-datatypes ((array!30277 0))(
  ( (array!30278 (arr!14559 (Array (_ BitVec 32) ValueCell!6290)) (size!14912 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30277)

(declare-fun minValueAfter!38 () V!18795)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13865 0))(
  ( (Unit!13866) )
))
(declare-fun lt!214140 () Unit!13865)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!214 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 V!18795 V!18795 (_ BitVec 32) Int) Unit!13865)

(assert (=> b!472221 (= lt!214140 (lemmaNoChangeToArrayThenSameMapNoExtras!214 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2057 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 (_ BitVec 32) Int) ListLongMap!7739)

(assert (=> b!472221 (= lt!214139 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472221 (= lt!214137 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472223 () Bool)

(declare-fun e!276888 () Bool)

(declare-fun tp_is_empty!13267 () Bool)

(assert (=> b!472223 (= e!276888 tp_is_empty!13267)))

(declare-fun b!472224 () Bool)

(declare-fun res!282110 () Bool)

(assert (=> b!472224 (=> (not res!282110) (not e!276886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30275 (_ BitVec 32)) Bool)

(assert (=> b!472224 (= res!282110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472225 () Bool)

(declare-fun res!282113 () Bool)

(assert (=> b!472225 (=> (not res!282113) (not e!276886))))

(declare-datatypes ((List!8908 0))(
  ( (Nil!8905) (Cons!8904 (h!9760 (_ BitVec 64)) (t!14867 List!8908)) )
))
(declare-fun arrayNoDuplicates!0 (array!30275 (_ BitVec 32) List!8908) Bool)

(assert (=> b!472225 (= res!282113 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8905))))

(declare-fun mapIsEmpty!21610 () Bool)

(declare-fun mapRes!21610 () Bool)

(assert (=> mapIsEmpty!21610 mapRes!21610))

(declare-fun b!472222 () Bool)

(assert (=> b!472222 (= e!276884 true)))

(declare-fun lt!214138 () ListLongMap!7739)

(declare-fun getCurrentListMap!2191 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 (_ BitVec 32) Int) ListLongMap!7739)

(assert (=> b!472222 (= lt!214138 (getCurrentListMap!2191 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282112 () Bool)

(assert (=> start!42334 (=> (not res!282112) (not e!276886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42334 (= res!282112 (validMask!0 mask!1365))))

(assert (=> start!42334 e!276886))

(assert (=> start!42334 tp_is_empty!13267))

(assert (=> start!42334 tp!41548))

(assert (=> start!42334 true))

(declare-fun array_inv!10586 (array!30275) Bool)

(assert (=> start!42334 (array_inv!10586 _keys!1025)))

(declare-fun e!276887 () Bool)

(declare-fun array_inv!10587 (array!30277) Bool)

(assert (=> start!42334 (and (array_inv!10587 _values!833) e!276887)))

(declare-fun b!472226 () Bool)

(assert (=> b!472226 (= e!276887 (and e!276888 mapRes!21610))))

(declare-fun condMapEmpty!21610 () Bool)

(declare-fun mapDefault!21610 () ValueCell!6290)

(assert (=> b!472226 (= condMapEmpty!21610 (= (arr!14559 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6290)) mapDefault!21610)))))

(declare-fun mapNonEmpty!21610 () Bool)

(declare-fun tp!41547 () Bool)

(declare-fun e!276885 () Bool)

(assert (=> mapNonEmpty!21610 (= mapRes!21610 (and tp!41547 e!276885))))

(declare-fun mapValue!21610 () ValueCell!6290)

(declare-fun mapRest!21610 () (Array (_ BitVec 32) ValueCell!6290))

(declare-fun mapKey!21610 () (_ BitVec 32))

(assert (=> mapNonEmpty!21610 (= (arr!14559 _values!833) (store mapRest!21610 mapKey!21610 mapValue!21610))))

(declare-fun b!472227 () Bool)

(assert (=> b!472227 (= e!276885 tp_is_empty!13267)))

(declare-fun b!472228 () Bool)

(declare-fun res!282114 () Bool)

(assert (=> b!472228 (=> (not res!282114) (not e!276886))))

(assert (=> b!472228 (= res!282114 (and (= (size!14912 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14911 _keys!1025) (size!14912 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42334 res!282112) b!472228))

(assert (= (and b!472228 res!282114) b!472224))

(assert (= (and b!472224 res!282110) b!472225))

(assert (= (and b!472225 res!282113) b!472221))

(assert (= (and b!472221 (not res!282111)) b!472222))

(assert (= (and b!472226 condMapEmpty!21610) mapIsEmpty!21610))

(assert (= (and b!472226 (not condMapEmpty!21610)) mapNonEmpty!21610))

(get-info :version)

(assert (= (and mapNonEmpty!21610 ((_ is ValueCellFull!6290) mapValue!21610)) b!472227))

(assert (= (and b!472226 ((_ is ValueCellFull!6290) mapDefault!21610)) b!472223))

(assert (= start!42334 b!472226))

(declare-fun m!453723 () Bool)

(assert (=> b!472221 m!453723))

(declare-fun m!453725 () Bool)

(assert (=> b!472221 m!453725))

(declare-fun m!453727 () Bool)

(assert (=> b!472221 m!453727))

(declare-fun m!453729 () Bool)

(assert (=> b!472222 m!453729))

(declare-fun m!453731 () Bool)

(assert (=> b!472225 m!453731))

(declare-fun m!453733 () Bool)

(assert (=> mapNonEmpty!21610 m!453733))

(declare-fun m!453735 () Bool)

(assert (=> start!42334 m!453735))

(declare-fun m!453737 () Bool)

(assert (=> start!42334 m!453737))

(declare-fun m!453739 () Bool)

(assert (=> start!42334 m!453739))

(declare-fun m!453741 () Bool)

(assert (=> b!472224 m!453741))

(check-sat (not b!472221) (not b!472225) tp_is_empty!13267 b_and!20259 (not b_next!11839) (not b!472224) (not start!42334) (not b!472222) (not mapNonEmpty!21610))
(check-sat b_and!20259 (not b_next!11839))
