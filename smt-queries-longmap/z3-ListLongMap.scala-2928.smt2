; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41742 () Bool)

(assert start!41742)

(declare-fun b_free!11377 () Bool)

(declare-fun b_next!11377 () Bool)

(assert (=> start!41742 (= b_free!11377 (not b_next!11377))))

(declare-fun tp!40138 () Bool)

(declare-fun b_and!19755 () Bool)

(assert (=> start!41742 (= tp!40138 b_and!19755)))

(declare-fun b!466181 () Bool)

(declare-fun e!272538 () Bool)

(declare-fun e!272537 () Bool)

(declare-fun mapRes!20893 () Bool)

(assert (=> b!466181 (= e!272538 (and e!272537 mapRes!20893))))

(declare-fun condMapEmpty!20893 () Bool)

(declare-datatypes ((V!18179 0))(
  ( (V!18180 (val!6447 Int)) )
))
(declare-datatypes ((ValueCell!6059 0))(
  ( (ValueCellFull!6059 (v!8736 V!18179)) (EmptyCell!6059) )
))
(declare-datatypes ((array!29394 0))(
  ( (array!29395 (arr!14125 (Array (_ BitVec 32) ValueCell!6059)) (size!14477 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29394)

(declare-fun mapDefault!20893 () ValueCell!6059)

(assert (=> b!466181 (= condMapEmpty!20893 (= (arr!14125 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6059)) mapDefault!20893)))))

(declare-fun b!466182 () Bool)

(declare-fun res!278675 () Bool)

(declare-fun e!272541 () Bool)

(assert (=> b!466182 (=> (not res!278675) (not e!272541))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29396 0))(
  ( (array!29397 (arr!14126 (Array (_ BitVec 32) (_ BitVec 64))) (size!14478 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29396)

(assert (=> b!466182 (= res!278675 (and (= (size!14477 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14478 _keys!1025) (size!14477 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466183 () Bool)

(declare-fun tp_is_empty!12805 () Bool)

(assert (=> b!466183 (= e!272537 tp_is_empty!12805)))

(declare-fun b!466184 () Bool)

(declare-fun e!272540 () Bool)

(assert (=> b!466184 (= e!272540 tp_is_empty!12805)))

(declare-fun b!466185 () Bool)

(declare-fun res!278677 () Bool)

(assert (=> b!466185 (=> (not res!278677) (not e!272541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29396 (_ BitVec 32)) Bool)

(assert (=> b!466185 (= res!278677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20893 () Bool)

(assert (=> mapIsEmpty!20893 mapRes!20893))

(declare-fun b!466186 () Bool)

(declare-fun e!272542 () Bool)

(assert (=> b!466186 (= e!272541 (not e!272542))))

(declare-fun res!278676 () Bool)

(assert (=> b!466186 (=> res!278676 e!272542)))

(assert (=> b!466186 (= res!278676 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8392 0))(
  ( (tuple2!8393 (_1!4207 (_ BitVec 64)) (_2!4207 V!18179)) )
))
(declare-datatypes ((List!8475 0))(
  ( (Nil!8472) (Cons!8471 (h!9327 tuple2!8392) (t!14419 List!8475)) )
))
(declare-datatypes ((ListLongMap!7307 0))(
  ( (ListLongMap!7308 (toList!3669 List!8475)) )
))
(declare-fun lt!210680 () ListLongMap!7307)

(declare-fun lt!210681 () ListLongMap!7307)

(assert (=> b!466186 (= lt!210680 lt!210681)))

(declare-fun minValueBefore!38 () V!18179)

(declare-fun zeroValue!794 () V!18179)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18179)

(declare-datatypes ((Unit!13552 0))(
  ( (Unit!13553) )
))
(declare-fun lt!210682 () Unit!13552)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!53 (array!29396 array!29394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 V!18179 V!18179 (_ BitVec 32) Int) Unit!13552)

(assert (=> b!466186 (= lt!210682 (lemmaNoChangeToArrayThenSameMapNoExtras!53 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1893 (array!29396 array!29394 (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 (_ BitVec 32) Int) ListLongMap!7307)

(assert (=> b!466186 (= lt!210681 (getCurrentListMapNoExtraKeys!1893 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466186 (= lt!210680 (getCurrentListMapNoExtraKeys!1893 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466187 () Bool)

(assert (=> b!466187 (= e!272542 true)))

(declare-fun lt!210684 () ListLongMap!7307)

(declare-fun getCurrentListMap!2118 (array!29396 array!29394 (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 (_ BitVec 32) Int) ListLongMap!7307)

(assert (=> b!466187 (= lt!210684 (getCurrentListMap!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210683 () ListLongMap!7307)

(declare-fun +!1667 (ListLongMap!7307 tuple2!8392) ListLongMap!7307)

(assert (=> b!466187 (= lt!210683 (+!1667 (getCurrentListMap!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8393 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278673 () Bool)

(assert (=> start!41742 (=> (not res!278673) (not e!272541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41742 (= res!278673 (validMask!0 mask!1365))))

(assert (=> start!41742 e!272541))

(assert (=> start!41742 tp_is_empty!12805))

(assert (=> start!41742 tp!40138))

(assert (=> start!41742 true))

(declare-fun array_inv!10284 (array!29396) Bool)

(assert (=> start!41742 (array_inv!10284 _keys!1025)))

(declare-fun array_inv!10285 (array!29394) Bool)

(assert (=> start!41742 (and (array_inv!10285 _values!833) e!272538)))

(declare-fun mapNonEmpty!20893 () Bool)

(declare-fun tp!40137 () Bool)

(assert (=> mapNonEmpty!20893 (= mapRes!20893 (and tp!40137 e!272540))))

(declare-fun mapRest!20893 () (Array (_ BitVec 32) ValueCell!6059))

(declare-fun mapValue!20893 () ValueCell!6059)

(declare-fun mapKey!20893 () (_ BitVec 32))

(assert (=> mapNonEmpty!20893 (= (arr!14125 _values!833) (store mapRest!20893 mapKey!20893 mapValue!20893))))

(declare-fun b!466188 () Bool)

(declare-fun res!278674 () Bool)

(assert (=> b!466188 (=> (not res!278674) (not e!272541))))

(declare-datatypes ((List!8476 0))(
  ( (Nil!8473) (Cons!8472 (h!9328 (_ BitVec 64)) (t!14420 List!8476)) )
))
(declare-fun arrayNoDuplicates!0 (array!29396 (_ BitVec 32) List!8476) Bool)

(assert (=> b!466188 (= res!278674 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8473))))

(assert (= (and start!41742 res!278673) b!466182))

(assert (= (and b!466182 res!278675) b!466185))

(assert (= (and b!466185 res!278677) b!466188))

(assert (= (and b!466188 res!278674) b!466186))

(assert (= (and b!466186 (not res!278676)) b!466187))

(assert (= (and b!466181 condMapEmpty!20893) mapIsEmpty!20893))

(assert (= (and b!466181 (not condMapEmpty!20893)) mapNonEmpty!20893))

(get-info :version)

(assert (= (and mapNonEmpty!20893 ((_ is ValueCellFull!6059) mapValue!20893)) b!466184))

(assert (= (and b!466181 ((_ is ValueCellFull!6059) mapDefault!20893)) b!466183))

(assert (= start!41742 b!466181))

(declare-fun m!448641 () Bool)

(assert (=> start!41742 m!448641))

(declare-fun m!448643 () Bool)

(assert (=> start!41742 m!448643))

(declare-fun m!448645 () Bool)

(assert (=> start!41742 m!448645))

(declare-fun m!448647 () Bool)

(assert (=> b!466186 m!448647))

(declare-fun m!448649 () Bool)

(assert (=> b!466186 m!448649))

(declare-fun m!448651 () Bool)

(assert (=> b!466186 m!448651))

(declare-fun m!448653 () Bool)

(assert (=> b!466187 m!448653))

(declare-fun m!448655 () Bool)

(assert (=> b!466187 m!448655))

(assert (=> b!466187 m!448655))

(declare-fun m!448657 () Bool)

(assert (=> b!466187 m!448657))

(declare-fun m!448659 () Bool)

(assert (=> mapNonEmpty!20893 m!448659))

(declare-fun m!448661 () Bool)

(assert (=> b!466185 m!448661))

(declare-fun m!448663 () Bool)

(assert (=> b!466188 m!448663))

(check-sat (not b!466186) b_and!19755 tp_is_empty!12805 (not mapNonEmpty!20893) (not start!41742) (not b!466187) (not b!466185) (not b!466188) (not b_next!11377))
(check-sat b_and!19755 (not b_next!11377))
