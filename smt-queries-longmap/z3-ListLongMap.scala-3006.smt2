; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42340 () Bool)

(assert start!42340)

(declare-fun b_free!11845 () Bool)

(declare-fun b_next!11845 () Bool)

(assert (=> start!42340 (= b_free!11845 (not b_next!11845))))

(declare-fun tp!41566 () Bool)

(declare-fun b_and!20301 () Bool)

(assert (=> start!42340 (= tp!41566 b_and!20301)))

(declare-fun b!472503 () Bool)

(declare-fun e!277077 () Bool)

(assert (=> b!472503 (= e!277077 true)))

(declare-datatypes ((V!18803 0))(
  ( (V!18804 (val!6681 Int)) )
))
(declare-fun minValueBefore!38 () V!18803)

(declare-fun zeroValue!794 () V!18803)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8724 0))(
  ( (tuple2!8725 (_1!4373 (_ BitVec 64)) (_2!4373 V!18803)) )
))
(declare-datatypes ((List!8789 0))(
  ( (Nil!8786) (Cons!8785 (h!9641 tuple2!8724) (t!14749 List!8789)) )
))
(declare-datatypes ((ListLongMap!7639 0))(
  ( (ListLongMap!7640 (toList!3835 List!8789)) )
))
(declare-fun lt!214422 () ListLongMap!7639)

(declare-datatypes ((array!30290 0))(
  ( (array!30291 (arr!14565 (Array (_ BitVec 32) (_ BitVec 64))) (size!14917 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30290)

(declare-datatypes ((ValueCell!6293 0))(
  ( (ValueCellFull!6293 (v!8973 V!18803)) (EmptyCell!6293) )
))
(declare-datatypes ((array!30292 0))(
  ( (array!30293 (arr!14566 (Array (_ BitVec 32) ValueCell!6293)) (size!14918 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30292)

(declare-fun getCurrentListMap!2203 (array!30290 array!30292 (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 (_ BitVec 32) Int) ListLongMap!7639)

(assert (=> b!472503 (= lt!214422 (getCurrentListMap!2203 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21619 () Bool)

(declare-fun mapRes!21619 () Bool)

(assert (=> mapIsEmpty!21619 mapRes!21619))

(declare-fun res!282279 () Bool)

(declare-fun e!277074 () Bool)

(assert (=> start!42340 (=> (not res!282279) (not e!277074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42340 (= res!282279 (validMask!0 mask!1365))))

(assert (=> start!42340 e!277074))

(declare-fun tp_is_empty!13273 () Bool)

(assert (=> start!42340 tp_is_empty!13273))

(assert (=> start!42340 tp!41566))

(assert (=> start!42340 true))

(declare-fun array_inv!10592 (array!30290) Bool)

(assert (=> start!42340 (array_inv!10592 _keys!1025)))

(declare-fun e!277073 () Bool)

(declare-fun array_inv!10593 (array!30292) Bool)

(assert (=> start!42340 (and (array_inv!10593 _values!833) e!277073)))

(declare-fun b!472504 () Bool)

(declare-fun res!282281 () Bool)

(assert (=> b!472504 (=> (not res!282281) (not e!277074))))

(declare-datatypes ((List!8790 0))(
  ( (Nil!8787) (Cons!8786 (h!9642 (_ BitVec 64)) (t!14750 List!8790)) )
))
(declare-fun arrayNoDuplicates!0 (array!30290 (_ BitVec 32) List!8790) Bool)

(assert (=> b!472504 (= res!282281 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8787))))

(declare-fun b!472505 () Bool)

(declare-fun res!282278 () Bool)

(assert (=> b!472505 (=> (not res!282278) (not e!277074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30290 (_ BitVec 32)) Bool)

(assert (=> b!472505 (= res!282278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472506 () Bool)

(declare-fun e!277076 () Bool)

(assert (=> b!472506 (= e!277073 (and e!277076 mapRes!21619))))

(declare-fun condMapEmpty!21619 () Bool)

(declare-fun mapDefault!21619 () ValueCell!6293)

(assert (=> b!472506 (= condMapEmpty!21619 (= (arr!14566 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6293)) mapDefault!21619)))))

(declare-fun b!472507 () Bool)

(declare-fun res!282280 () Bool)

(assert (=> b!472507 (=> (not res!282280) (not e!277074))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472507 (= res!282280 (and (= (size!14918 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14917 _keys!1025) (size!14918 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21619 () Bool)

(declare-fun tp!41565 () Bool)

(declare-fun e!277078 () Bool)

(assert (=> mapNonEmpty!21619 (= mapRes!21619 (and tp!41565 e!277078))))

(declare-fun mapValue!21619 () ValueCell!6293)

(declare-fun mapKey!21619 () (_ BitVec 32))

(declare-fun mapRest!21619 () (Array (_ BitVec 32) ValueCell!6293))

(assert (=> mapNonEmpty!21619 (= (arr!14566 _values!833) (store mapRest!21619 mapKey!21619 mapValue!21619))))

(declare-fun b!472508 () Bool)

(assert (=> b!472508 (= e!277078 tp_is_empty!13273)))

(declare-fun b!472509 () Bool)

(assert (=> b!472509 (= e!277076 tp_is_empty!13273)))

(declare-fun b!472510 () Bool)

(assert (=> b!472510 (= e!277074 (not e!277077))))

(declare-fun res!282277 () Bool)

(assert (=> b!472510 (=> res!282277 e!277077)))

(assert (=> b!472510 (= res!282277 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214421 () ListLongMap!7639)

(declare-fun lt!214420 () ListLongMap!7639)

(assert (=> b!472510 (= lt!214421 lt!214420)))

(declare-datatypes ((Unit!13877 0))(
  ( (Unit!13878) )
))
(declare-fun lt!214419 () Unit!13877)

(declare-fun minValueAfter!38 () V!18803)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!207 (array!30290 array!30292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 V!18803 V!18803 (_ BitVec 32) Int) Unit!13877)

(assert (=> b!472510 (= lt!214419 (lemmaNoChangeToArrayThenSameMapNoExtras!207 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2047 (array!30290 array!30292 (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 (_ BitVec 32) Int) ListLongMap!7639)

(assert (=> b!472510 (= lt!214420 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472510 (= lt!214421 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42340 res!282279) b!472507))

(assert (= (and b!472507 res!282280) b!472505))

(assert (= (and b!472505 res!282278) b!472504))

(assert (= (and b!472504 res!282281) b!472510))

(assert (= (and b!472510 (not res!282277)) b!472503))

(assert (= (and b!472506 condMapEmpty!21619) mapIsEmpty!21619))

(assert (= (and b!472506 (not condMapEmpty!21619)) mapNonEmpty!21619))

(get-info :version)

(assert (= (and mapNonEmpty!21619 ((_ is ValueCellFull!6293) mapValue!21619)) b!472508))

(assert (= (and b!472506 ((_ is ValueCellFull!6293) mapDefault!21619)) b!472509))

(assert (= start!42340 b!472506))

(declare-fun m!454699 () Bool)

(assert (=> mapNonEmpty!21619 m!454699))

(declare-fun m!454701 () Bool)

(assert (=> b!472505 m!454701))

(declare-fun m!454703 () Bool)

(assert (=> b!472504 m!454703))

(declare-fun m!454705 () Bool)

(assert (=> start!42340 m!454705))

(declare-fun m!454707 () Bool)

(assert (=> start!42340 m!454707))

(declare-fun m!454709 () Bool)

(assert (=> start!42340 m!454709))

(declare-fun m!454711 () Bool)

(assert (=> b!472503 m!454711))

(declare-fun m!454713 () Bool)

(assert (=> b!472510 m!454713))

(declare-fun m!454715 () Bool)

(assert (=> b!472510 m!454715))

(declare-fun m!454717 () Bool)

(assert (=> b!472510 m!454717))

(check-sat tp_is_empty!13273 b_and!20301 (not b!472503) (not mapNonEmpty!21619) (not b!472505) (not b!472510) (not b!472504) (not start!42340) (not b_next!11845))
(check-sat b_and!20301 (not b_next!11845))
