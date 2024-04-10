; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41592 () Bool)

(assert start!41592)

(declare-fun b_free!11259 () Bool)

(declare-fun b_next!11259 () Bool)

(assert (=> start!41592 (= b_free!11259 (not b_next!11259))))

(declare-fun tp!39774 () Bool)

(declare-fun b_and!19599 () Bool)

(assert (=> start!41592 (= tp!39774 b_and!19599)))

(declare-fun b!464566 () Bool)

(declare-fun res!277747 () Bool)

(declare-fun e!271389 () Bool)

(assert (=> b!464566 (=> (not res!277747) (not e!271389))))

(declare-datatypes ((array!29159 0))(
  ( (array!29160 (arr!14011 (Array (_ BitVec 32) (_ BitVec 64))) (size!14363 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29159)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29159 (_ BitVec 32)) Bool)

(assert (=> b!464566 (= res!277747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464567 () Bool)

(declare-fun e!271390 () Bool)

(declare-fun tp_is_empty!12687 () Bool)

(assert (=> b!464567 (= e!271390 tp_is_empty!12687)))

(declare-fun b!464568 () Bool)

(assert (=> b!464568 (= e!271389 (not true))))

(declare-datatypes ((V!18021 0))(
  ( (V!18022 (val!6388 Int)) )
))
(declare-datatypes ((tuple2!8366 0))(
  ( (tuple2!8367 (_1!4194 (_ BitVec 64)) (_2!4194 V!18021)) )
))
(declare-datatypes ((List!8461 0))(
  ( (Nil!8458) (Cons!8457 (h!9313 tuple2!8366) (t!14407 List!8461)) )
))
(declare-datatypes ((ListLongMap!7279 0))(
  ( (ListLongMap!7280 (toList!3655 List!8461)) )
))
(declare-fun lt!209769 () ListLongMap!7279)

(declare-fun lt!209770 () ListLongMap!7279)

(assert (=> b!464568 (= lt!209769 lt!209770)))

(declare-fun minValueBefore!38 () V!18021)

(declare-fun zeroValue!794 () V!18021)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6000 0))(
  ( (ValueCellFull!6000 (v!8675 V!18021)) (EmptyCell!6000) )
))
(declare-datatypes ((array!29161 0))(
  ( (array!29162 (arr!14012 (Array (_ BitVec 32) ValueCell!6000)) (size!14364 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29161)

(declare-datatypes ((Unit!13478 0))(
  ( (Unit!13479) )
))
(declare-fun lt!209771 () Unit!13478)

(declare-fun minValueAfter!38 () V!18021)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!15 (array!29159 array!29161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18021 V!18021 V!18021 V!18021 (_ BitVec 32) Int) Unit!13478)

(assert (=> b!464568 (= lt!209771 (lemmaNoChangeToArrayThenSameMapNoExtras!15 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1835 (array!29159 array!29161 (_ BitVec 32) (_ BitVec 32) V!18021 V!18021 (_ BitVec 32) Int) ListLongMap!7279)

(assert (=> b!464568 (= lt!209770 (getCurrentListMapNoExtraKeys!1835 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464568 (= lt!209769 (getCurrentListMapNoExtraKeys!1835 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20707 () Bool)

(declare-fun mapRes!20707 () Bool)

(assert (=> mapIsEmpty!20707 mapRes!20707))

(declare-fun b!464569 () Bool)

(declare-fun e!271392 () Bool)

(assert (=> b!464569 (= e!271392 tp_is_empty!12687)))

(declare-fun b!464570 () Bool)

(declare-fun e!271388 () Bool)

(assert (=> b!464570 (= e!271388 (and e!271390 mapRes!20707))))

(declare-fun condMapEmpty!20707 () Bool)

(declare-fun mapDefault!20707 () ValueCell!6000)

(assert (=> b!464570 (= condMapEmpty!20707 (= (arr!14012 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6000)) mapDefault!20707)))))

(declare-fun mapNonEmpty!20707 () Bool)

(declare-fun tp!39775 () Bool)

(assert (=> mapNonEmpty!20707 (= mapRes!20707 (and tp!39775 e!271392))))

(declare-fun mapKey!20707 () (_ BitVec 32))

(declare-fun mapRest!20707 () (Array (_ BitVec 32) ValueCell!6000))

(declare-fun mapValue!20707 () ValueCell!6000)

(assert (=> mapNonEmpty!20707 (= (arr!14012 _values!833) (store mapRest!20707 mapKey!20707 mapValue!20707))))

(declare-fun b!464571 () Bool)

(declare-fun res!277746 () Bool)

(assert (=> b!464571 (=> (not res!277746) (not e!271389))))

(assert (=> b!464571 (= res!277746 (and (= (size!14364 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14363 _keys!1025) (size!14364 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464572 () Bool)

(declare-fun res!277748 () Bool)

(assert (=> b!464572 (=> (not res!277748) (not e!271389))))

(declare-datatypes ((List!8462 0))(
  ( (Nil!8459) (Cons!8458 (h!9314 (_ BitVec 64)) (t!14408 List!8462)) )
))
(declare-fun arrayNoDuplicates!0 (array!29159 (_ BitVec 32) List!8462) Bool)

(assert (=> b!464572 (= res!277748 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8459))))

(declare-fun res!277745 () Bool)

(assert (=> start!41592 (=> (not res!277745) (not e!271389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41592 (= res!277745 (validMask!0 mask!1365))))

(assert (=> start!41592 e!271389))

(assert (=> start!41592 tp_is_empty!12687))

(assert (=> start!41592 tp!39774))

(assert (=> start!41592 true))

(declare-fun array_inv!10118 (array!29159) Bool)

(assert (=> start!41592 (array_inv!10118 _keys!1025)))

(declare-fun array_inv!10119 (array!29161) Bool)

(assert (=> start!41592 (and (array_inv!10119 _values!833) e!271388)))

(assert (= (and start!41592 res!277745) b!464571))

(assert (= (and b!464571 res!277746) b!464566))

(assert (= (and b!464566 res!277747) b!464572))

(assert (= (and b!464572 res!277748) b!464568))

(assert (= (and b!464570 condMapEmpty!20707) mapIsEmpty!20707))

(assert (= (and b!464570 (not condMapEmpty!20707)) mapNonEmpty!20707))

(get-info :version)

(assert (= (and mapNonEmpty!20707 ((_ is ValueCellFull!6000) mapValue!20707)) b!464569))

(assert (= (and b!464570 ((_ is ValueCellFull!6000) mapDefault!20707)) b!464567))

(assert (= start!41592 b!464570))

(declare-fun m!446933 () Bool)

(assert (=> b!464568 m!446933))

(declare-fun m!446935 () Bool)

(assert (=> b!464568 m!446935))

(declare-fun m!446937 () Bool)

(assert (=> b!464568 m!446937))

(declare-fun m!446939 () Bool)

(assert (=> mapNonEmpty!20707 m!446939))

(declare-fun m!446941 () Bool)

(assert (=> start!41592 m!446941))

(declare-fun m!446943 () Bool)

(assert (=> start!41592 m!446943))

(declare-fun m!446945 () Bool)

(assert (=> start!41592 m!446945))

(declare-fun m!446947 () Bool)

(assert (=> b!464572 m!446947))

(declare-fun m!446949 () Bool)

(assert (=> b!464566 m!446949))

(check-sat b_and!19599 (not b_next!11259) (not b!464572) (not mapNonEmpty!20707) (not b!464568) tp_is_empty!12687 (not b!464566) (not start!41592))
(check-sat b_and!19599 (not b_next!11259))
