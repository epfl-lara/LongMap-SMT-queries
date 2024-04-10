; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42362 () Bool)

(assert start!42362)

(declare-fun b_free!11853 () Bool)

(declare-fun b_next!11853 () Bool)

(assert (=> start!42362 (= b_free!11853 (not b_next!11853))))

(declare-fun tp!41590 () Bool)

(declare-fun b_and!20299 () Bool)

(assert (=> start!42362 (= tp!41590 b_and!20299)))

(declare-fun b!472660 () Bool)

(declare-fun res!282346 () Bool)

(declare-fun e!277185 () Bool)

(assert (=> b!472660 (=> (not res!282346) (not e!277185))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30319 0))(
  ( (array!30320 (arr!14580 (Array (_ BitVec 32) (_ BitVec 64))) (size!14932 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30319)

(declare-datatypes ((V!18813 0))(
  ( (V!18814 (val!6685 Int)) )
))
(declare-datatypes ((ValueCell!6297 0))(
  ( (ValueCellFull!6297 (v!8976 V!18813)) (EmptyCell!6297) )
))
(declare-datatypes ((array!30321 0))(
  ( (array!30322 (arr!14581 (Array (_ BitVec 32) ValueCell!6297)) (size!14933 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30321)

(assert (=> b!472660 (= res!282346 (and (= (size!14933 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14932 _keys!1025) (size!14933 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21631 () Bool)

(declare-fun mapRes!21631 () Bool)

(declare-fun tp!41589 () Bool)

(declare-fun e!277187 () Bool)

(assert (=> mapNonEmpty!21631 (= mapRes!21631 (and tp!41589 e!277187))))

(declare-fun mapKey!21631 () (_ BitVec 32))

(declare-fun mapValue!21631 () ValueCell!6297)

(declare-fun mapRest!21631 () (Array (_ BitVec 32) ValueCell!6297))

(assert (=> mapNonEmpty!21631 (= (arr!14581 _values!833) (store mapRest!21631 mapKey!21631 mapValue!21631))))

(declare-fun b!472661 () Bool)

(declare-fun tp_is_empty!13281 () Bool)

(assert (=> b!472661 (= e!277187 tp_is_empty!13281)))

(declare-fun b!472662 () Bool)

(declare-fun res!282347 () Bool)

(assert (=> b!472662 (=> (not res!282347) (not e!277185))))

(declare-datatypes ((List!8886 0))(
  ( (Nil!8883) (Cons!8882 (h!9738 (_ BitVec 64)) (t!14854 List!8886)) )
))
(declare-fun arrayNoDuplicates!0 (array!30319 (_ BitVec 32) List!8886) Bool)

(assert (=> b!472662 (= res!282347 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8883))))

(declare-fun b!472663 () Bool)

(declare-fun e!277186 () Bool)

(assert (=> b!472663 (= e!277186 tp_is_empty!13281)))

(declare-fun b!472665 () Bool)

(declare-fun e!277188 () Bool)

(assert (=> b!472665 (= e!277185 (not e!277188))))

(declare-fun res!282344 () Bool)

(assert (=> b!472665 (=> res!282344 e!277188)))

(assert (=> b!472665 (= res!282344 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8802 0))(
  ( (tuple2!8803 (_1!4412 (_ BitVec 64)) (_2!4412 V!18813)) )
))
(declare-datatypes ((List!8887 0))(
  ( (Nil!8884) (Cons!8883 (h!9739 tuple2!8802) (t!14855 List!8887)) )
))
(declare-datatypes ((ListLongMap!7715 0))(
  ( (ListLongMap!7716 (toList!3873 List!8887)) )
))
(declare-fun lt!214457 () ListLongMap!7715)

(declare-fun lt!214458 () ListLongMap!7715)

(assert (=> b!472665 (= lt!214457 lt!214458)))

(declare-fun minValueBefore!38 () V!18813)

(declare-fun zeroValue!794 () V!18813)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13901 0))(
  ( (Unit!13902) )
))
(declare-fun lt!214456 () Unit!13901)

(declare-fun minValueAfter!38 () V!18813)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!214 (array!30319 array!30321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18813 V!18813 V!18813 V!18813 (_ BitVec 32) Int) Unit!13901)

(assert (=> b!472665 (= lt!214456 (lemmaNoChangeToArrayThenSameMapNoExtras!214 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2034 (array!30319 array!30321 (_ BitVec 32) (_ BitVec 32) V!18813 V!18813 (_ BitVec 32) Int) ListLongMap!7715)

(assert (=> b!472665 (= lt!214458 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472665 (= lt!214457 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472666 () Bool)

(declare-fun res!282345 () Bool)

(assert (=> b!472666 (=> (not res!282345) (not e!277185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30319 (_ BitVec 32)) Bool)

(assert (=> b!472666 (= res!282345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21631 () Bool)

(assert (=> mapIsEmpty!21631 mapRes!21631))

(declare-fun b!472667 () Bool)

(assert (=> b!472667 (= e!277188 true)))

(declare-fun lt!214455 () ListLongMap!7715)

(declare-fun getCurrentListMap!2243 (array!30319 array!30321 (_ BitVec 32) (_ BitVec 32) V!18813 V!18813 (_ BitVec 32) Int) ListLongMap!7715)

(assert (=> b!472667 (= lt!214455 (getCurrentListMap!2243 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472664 () Bool)

(declare-fun e!277184 () Bool)

(assert (=> b!472664 (= e!277184 (and e!277186 mapRes!21631))))

(declare-fun condMapEmpty!21631 () Bool)

(declare-fun mapDefault!21631 () ValueCell!6297)

(assert (=> b!472664 (= condMapEmpty!21631 (= (arr!14581 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6297)) mapDefault!21631)))))

(declare-fun res!282348 () Bool)

(assert (=> start!42362 (=> (not res!282348) (not e!277185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42362 (= res!282348 (validMask!0 mask!1365))))

(assert (=> start!42362 e!277185))

(assert (=> start!42362 tp_is_empty!13281))

(assert (=> start!42362 tp!41590))

(assert (=> start!42362 true))

(declare-fun array_inv!10514 (array!30319) Bool)

(assert (=> start!42362 (array_inv!10514 _keys!1025)))

(declare-fun array_inv!10515 (array!30321) Bool)

(assert (=> start!42362 (and (array_inv!10515 _values!833) e!277184)))

(assert (= (and start!42362 res!282348) b!472660))

(assert (= (and b!472660 res!282346) b!472666))

(assert (= (and b!472666 res!282345) b!472662))

(assert (= (and b!472662 res!282347) b!472665))

(assert (= (and b!472665 (not res!282344)) b!472667))

(assert (= (and b!472664 condMapEmpty!21631) mapIsEmpty!21631))

(assert (= (and b!472664 (not condMapEmpty!21631)) mapNonEmpty!21631))

(get-info :version)

(assert (= (and mapNonEmpty!21631 ((_ is ValueCellFull!6297) mapValue!21631)) b!472661))

(assert (= (and b!472664 ((_ is ValueCellFull!6297) mapDefault!21631)) b!472663))

(assert (= start!42362 b!472664))

(declare-fun m!454597 () Bool)

(assert (=> start!42362 m!454597))

(declare-fun m!454599 () Bool)

(assert (=> start!42362 m!454599))

(declare-fun m!454601 () Bool)

(assert (=> start!42362 m!454601))

(declare-fun m!454603 () Bool)

(assert (=> b!472666 m!454603))

(declare-fun m!454605 () Bool)

(assert (=> b!472662 m!454605))

(declare-fun m!454607 () Bool)

(assert (=> b!472665 m!454607))

(declare-fun m!454609 () Bool)

(assert (=> b!472665 m!454609))

(declare-fun m!454611 () Bool)

(assert (=> b!472665 m!454611))

(declare-fun m!454613 () Bool)

(assert (=> mapNonEmpty!21631 m!454613))

(declare-fun m!454615 () Bool)

(assert (=> b!472667 m!454615))

(check-sat (not b!472662) (not b_next!11853) (not b!472667) (not mapNonEmpty!21631) (not start!42362) b_and!20299 tp_is_empty!13281 (not b!472666) (not b!472665))
(check-sat b_and!20299 (not b_next!11853))
