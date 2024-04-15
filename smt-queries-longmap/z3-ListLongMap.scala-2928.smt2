; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41742 () Bool)

(assert start!41742)

(declare-fun b_free!11377 () Bool)

(declare-fun b_next!11377 () Bool)

(assert (=> start!41742 (= b_free!11377 (not b_next!11377))))

(declare-fun tp!40137 () Bool)

(declare-fun b_and!19719 () Bool)

(assert (=> start!41742 (= tp!40137 b_and!19719)))

(declare-fun b!465971 () Bool)

(declare-fun e!272403 () Bool)

(assert (=> b!465971 (= e!272403 true)))

(declare-datatypes ((V!18179 0))(
  ( (V!18180 (val!6447 Int)) )
))
(declare-datatypes ((tuple2!8496 0))(
  ( (tuple2!8497 (_1!4259 (_ BitVec 64)) (_2!4259 V!18179)) )
))
(declare-datatypes ((List!8579 0))(
  ( (Nil!8576) (Cons!8575 (h!9431 tuple2!8496) (t!14522 List!8579)) )
))
(declare-datatypes ((ListLongMap!7399 0))(
  ( (ListLongMap!7400 (toList!3715 List!8579)) )
))
(declare-fun lt!210438 () ListLongMap!7399)

(declare-fun zeroValue!794 () V!18179)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29389 0))(
  ( (array!29390 (arr!14123 (Array (_ BitVec 32) (_ BitVec 64))) (size!14476 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29389)

(declare-datatypes ((ValueCell!6059 0))(
  ( (ValueCellFull!6059 (v!8729 V!18179)) (EmptyCell!6059) )
))
(declare-datatypes ((array!29391 0))(
  ( (array!29392 (arr!14124 (Array (_ BitVec 32) ValueCell!6059)) (size!14477 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29391)

(declare-fun minValueAfter!38 () V!18179)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2107 (array!29389 array!29391 (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 (_ BitVec 32) Int) ListLongMap!7399)

(assert (=> b!465971 (= lt!210438 (getCurrentListMap!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18179)

(declare-fun lt!210437 () ListLongMap!7399)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1688 (ListLongMap!7399 tuple2!8496) ListLongMap!7399)

(assert (=> b!465971 (= lt!210437 (+!1688 (getCurrentListMap!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8497 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapNonEmpty!20893 () Bool)

(declare-fun mapRes!20893 () Bool)

(declare-fun tp!40138 () Bool)

(declare-fun e!272405 () Bool)

(assert (=> mapNonEmpty!20893 (= mapRes!20893 (and tp!40138 e!272405))))

(declare-fun mapRest!20893 () (Array (_ BitVec 32) ValueCell!6059))

(declare-fun mapKey!20893 () (_ BitVec 32))

(declare-fun mapValue!20893 () ValueCell!6059)

(assert (=> mapNonEmpty!20893 (= (arr!14124 _values!833) (store mapRest!20893 mapKey!20893 mapValue!20893))))

(declare-fun b!465972 () Bool)

(declare-fun res!278555 () Bool)

(declare-fun e!272406 () Bool)

(assert (=> b!465972 (=> (not res!278555) (not e!272406))))

(assert (=> b!465972 (= res!278555 (and (= (size!14477 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14476 _keys!1025) (size!14477 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278554 () Bool)

(assert (=> start!41742 (=> (not res!278554) (not e!272406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41742 (= res!278554 (validMask!0 mask!1365))))

(assert (=> start!41742 e!272406))

(declare-fun tp_is_empty!12805 () Bool)

(assert (=> start!41742 tp_is_empty!12805))

(assert (=> start!41742 tp!40137))

(assert (=> start!41742 true))

(declare-fun array_inv!10282 (array!29389) Bool)

(assert (=> start!41742 (array_inv!10282 _keys!1025)))

(declare-fun e!272402 () Bool)

(declare-fun array_inv!10283 (array!29391) Bool)

(assert (=> start!41742 (and (array_inv!10283 _values!833) e!272402)))

(declare-fun b!465973 () Bool)

(declare-fun res!278552 () Bool)

(assert (=> b!465973 (=> (not res!278552) (not e!272406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29389 (_ BitVec 32)) Bool)

(assert (=> b!465973 (= res!278552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465974 () Bool)

(declare-fun e!272404 () Bool)

(assert (=> b!465974 (= e!272404 tp_is_empty!12805)))

(declare-fun b!465975 () Bool)

(declare-fun res!278553 () Bool)

(assert (=> b!465975 (=> (not res!278553) (not e!272406))))

(declare-datatypes ((List!8580 0))(
  ( (Nil!8577) (Cons!8576 (h!9432 (_ BitVec 64)) (t!14523 List!8580)) )
))
(declare-fun arrayNoDuplicates!0 (array!29389 (_ BitVec 32) List!8580) Bool)

(assert (=> b!465975 (= res!278553 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8577))))

(declare-fun b!465976 () Bool)

(assert (=> b!465976 (= e!272402 (and e!272404 mapRes!20893))))

(declare-fun condMapEmpty!20893 () Bool)

(declare-fun mapDefault!20893 () ValueCell!6059)

(assert (=> b!465976 (= condMapEmpty!20893 (= (arr!14124 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6059)) mapDefault!20893)))))

(declare-fun mapIsEmpty!20893 () Bool)

(assert (=> mapIsEmpty!20893 mapRes!20893))

(declare-fun b!465977 () Bool)

(assert (=> b!465977 (= e!272406 (not e!272403))))

(declare-fun res!278551 () Bool)

(assert (=> b!465977 (=> res!278551 e!272403)))

(assert (=> b!465977 (= res!278551 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210436 () ListLongMap!7399)

(declare-fun lt!210435 () ListLongMap!7399)

(assert (=> b!465977 (= lt!210436 lt!210435)))

(declare-datatypes ((Unit!13538 0))(
  ( (Unit!13539) )
))
(declare-fun lt!210434 () Unit!13538)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!59 (array!29389 array!29391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 V!18179 V!18179 (_ BitVec 32) Int) Unit!13538)

(assert (=> b!465977 (= lt!210434 (lemmaNoChangeToArrayThenSameMapNoExtras!59 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1902 (array!29389 array!29391 (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 (_ BitVec 32) Int) ListLongMap!7399)

(assert (=> b!465977 (= lt!210435 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465977 (= lt!210436 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465978 () Bool)

(assert (=> b!465978 (= e!272405 tp_is_empty!12805)))

(assert (= (and start!41742 res!278554) b!465972))

(assert (= (and b!465972 res!278555) b!465973))

(assert (= (and b!465973 res!278552) b!465975))

(assert (= (and b!465975 res!278553) b!465977))

(assert (= (and b!465977 (not res!278551)) b!465971))

(assert (= (and b!465976 condMapEmpty!20893) mapIsEmpty!20893))

(assert (= (and b!465976 (not condMapEmpty!20893)) mapNonEmpty!20893))

(get-info :version)

(assert (= (and mapNonEmpty!20893 ((_ is ValueCellFull!6059) mapValue!20893)) b!465978))

(assert (= (and b!465976 ((_ is ValueCellFull!6059) mapDefault!20893)) b!465974))

(assert (= start!41742 b!465976))

(declare-fun m!447725 () Bool)

(assert (=> b!465975 m!447725))

(declare-fun m!447727 () Bool)

(assert (=> b!465973 m!447727))

(declare-fun m!447729 () Bool)

(assert (=> b!465971 m!447729))

(declare-fun m!447731 () Bool)

(assert (=> b!465971 m!447731))

(assert (=> b!465971 m!447731))

(declare-fun m!447733 () Bool)

(assert (=> b!465971 m!447733))

(declare-fun m!447735 () Bool)

(assert (=> mapNonEmpty!20893 m!447735))

(declare-fun m!447737 () Bool)

(assert (=> b!465977 m!447737))

(declare-fun m!447739 () Bool)

(assert (=> b!465977 m!447739))

(declare-fun m!447741 () Bool)

(assert (=> b!465977 m!447741))

(declare-fun m!447743 () Bool)

(assert (=> start!41742 m!447743))

(declare-fun m!447745 () Bool)

(assert (=> start!41742 m!447745))

(declare-fun m!447747 () Bool)

(assert (=> start!41742 m!447747))

(check-sat tp_is_empty!12805 (not b_next!11377) b_and!19719 (not b!465975) (not b!465973) (not b!465971) (not start!41742) (not b!465977) (not mapNonEmpty!20893))
(check-sat b_and!19719 (not b_next!11377))
