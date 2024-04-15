; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42522 () Bool)

(assert start!42522)

(declare-fun b_free!11971 () Bool)

(declare-fun b_next!11971 () Bool)

(assert (=> start!42522 (= b_free!11971 (not b_next!11971))))

(declare-fun tp!41953 () Bool)

(declare-fun b_and!20425 () Bool)

(assert (=> start!42522 (= tp!41953 b_and!20425)))

(declare-fun b!474313 () Bool)

(declare-fun e!278394 () Bool)

(declare-fun tp_is_empty!13399 () Bool)

(assert (=> b!474313 (= e!278394 tp_is_empty!13399)))

(declare-fun b!474314 () Bool)

(declare-fun e!278393 () Bool)

(assert (=> b!474314 (= e!278393 (not true))))

(declare-datatypes ((V!18971 0))(
  ( (V!18972 (val!6744 Int)) )
))
(declare-datatypes ((tuple2!8950 0))(
  ( (tuple2!8951 (_1!4486 (_ BitVec 64)) (_2!4486 V!18971)) )
))
(declare-datatypes ((List!9011 0))(
  ( (Nil!9008) (Cons!9007 (h!9863 tuple2!8950) (t!14976 List!9011)) )
))
(declare-datatypes ((ListLongMap!7853 0))(
  ( (ListLongMap!7854 (toList!3942 List!9011)) )
))
(declare-fun lt!215992 () ListLongMap!7853)

(declare-fun lt!215991 () ListLongMap!7853)

(assert (=> b!474314 (= lt!215992 lt!215991)))

(declare-fun minValueBefore!38 () V!18971)

(declare-fun zeroValue!794 () V!18971)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13982 0))(
  ( (Unit!13983) )
))
(declare-fun lt!215993 () Unit!13982)

(declare-datatypes ((array!30535 0))(
  ( (array!30536 (arr!14685 (Array (_ BitVec 32) (_ BitVec 64))) (size!15038 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30535)

(declare-datatypes ((ValueCell!6356 0))(
  ( (ValueCellFull!6356 (v!9031 V!18971)) (EmptyCell!6356) )
))
(declare-datatypes ((array!30537 0))(
  ( (array!30538 (arr!14686 (Array (_ BitVec 32) ValueCell!6356)) (size!15039 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30537)

(declare-fun minValueAfter!38 () V!18971)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!266 (array!30535 array!30537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18971 V!18971 V!18971 V!18971 (_ BitVec 32) Int) Unit!13982)

(assert (=> b!474314 (= lt!215993 (lemmaNoChangeToArrayThenSameMapNoExtras!266 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2109 (array!30535 array!30537 (_ BitVec 32) (_ BitVec 32) V!18971 V!18971 (_ BitVec 32) Int) ListLongMap!7853)

(assert (=> b!474314 (= lt!215991 (getCurrentListMapNoExtraKeys!2109 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474314 (= lt!215992 (getCurrentListMapNoExtraKeys!2109 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283314 () Bool)

(assert (=> start!42522 (=> (not res!283314) (not e!278393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42522 (= res!283314 (validMask!0 mask!1365))))

(assert (=> start!42522 e!278393))

(assert (=> start!42522 tp_is_empty!13399))

(assert (=> start!42522 tp!41953))

(assert (=> start!42522 true))

(declare-fun array_inv!10678 (array!30535) Bool)

(assert (=> start!42522 (array_inv!10678 _keys!1025)))

(declare-fun e!278390 () Bool)

(declare-fun array_inv!10679 (array!30537) Bool)

(assert (=> start!42522 (and (array_inv!10679 _values!833) e!278390)))

(declare-fun b!474315 () Bool)

(declare-fun res!283317 () Bool)

(assert (=> b!474315 (=> (not res!283317) (not e!278393))))

(declare-datatypes ((List!9012 0))(
  ( (Nil!9009) (Cons!9008 (h!9864 (_ BitVec 64)) (t!14977 List!9012)) )
))
(declare-fun arrayNoDuplicates!0 (array!30535 (_ BitVec 32) List!9012) Bool)

(assert (=> b!474315 (= res!283317 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9009))))

(declare-fun b!474316 () Bool)

(declare-fun e!278392 () Bool)

(declare-fun mapRes!21817 () Bool)

(assert (=> b!474316 (= e!278390 (and e!278392 mapRes!21817))))

(declare-fun condMapEmpty!21817 () Bool)

(declare-fun mapDefault!21817 () ValueCell!6356)

(assert (=> b!474316 (= condMapEmpty!21817 (= (arr!14686 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6356)) mapDefault!21817)))))

(declare-fun b!474317 () Bool)

(declare-fun res!283316 () Bool)

(assert (=> b!474317 (=> (not res!283316) (not e!278393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30535 (_ BitVec 32)) Bool)

(assert (=> b!474317 (= res!283316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474318 () Bool)

(declare-fun res!283315 () Bool)

(assert (=> b!474318 (=> (not res!283315) (not e!278393))))

(assert (=> b!474318 (= res!283315 (and (= (size!15039 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15038 _keys!1025) (size!15039 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21817 () Bool)

(declare-fun tp!41952 () Bool)

(assert (=> mapNonEmpty!21817 (= mapRes!21817 (and tp!41952 e!278394))))

(declare-fun mapValue!21817 () ValueCell!6356)

(declare-fun mapRest!21817 () (Array (_ BitVec 32) ValueCell!6356))

(declare-fun mapKey!21817 () (_ BitVec 32))

(assert (=> mapNonEmpty!21817 (= (arr!14686 _values!833) (store mapRest!21817 mapKey!21817 mapValue!21817))))

(declare-fun mapIsEmpty!21817 () Bool)

(assert (=> mapIsEmpty!21817 mapRes!21817))

(declare-fun b!474319 () Bool)

(assert (=> b!474319 (= e!278392 tp_is_empty!13399)))

(assert (= (and start!42522 res!283314) b!474318))

(assert (= (and b!474318 res!283315) b!474317))

(assert (= (and b!474317 res!283316) b!474315))

(assert (= (and b!474315 res!283317) b!474314))

(assert (= (and b!474316 condMapEmpty!21817) mapIsEmpty!21817))

(assert (= (and b!474316 (not condMapEmpty!21817)) mapNonEmpty!21817))

(get-info :version)

(assert (= (and mapNonEmpty!21817 ((_ is ValueCellFull!6356) mapValue!21817)) b!474313))

(assert (= (and b!474316 ((_ is ValueCellFull!6356) mapDefault!21817)) b!474319))

(assert (= start!42522 b!474316))

(declare-fun m!456227 () Bool)

(assert (=> b!474317 m!456227))

(declare-fun m!456229 () Bool)

(assert (=> b!474314 m!456229))

(declare-fun m!456231 () Bool)

(assert (=> b!474314 m!456231))

(declare-fun m!456233 () Bool)

(assert (=> b!474314 m!456233))

(declare-fun m!456235 () Bool)

(assert (=> b!474315 m!456235))

(declare-fun m!456237 () Bool)

(assert (=> mapNonEmpty!21817 m!456237))

(declare-fun m!456239 () Bool)

(assert (=> start!42522 m!456239))

(declare-fun m!456241 () Bool)

(assert (=> start!42522 m!456241))

(declare-fun m!456243 () Bool)

(assert (=> start!42522 m!456243))

(check-sat (not b!474314) b_and!20425 (not mapNonEmpty!21817) tp_is_empty!13399 (not b!474317) (not start!42522) (not b_next!11971) (not b!474315))
(check-sat b_and!20425 (not b_next!11971))
