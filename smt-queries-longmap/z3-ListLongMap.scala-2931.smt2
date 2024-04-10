; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41776 () Bool)

(assert start!41776)

(declare-fun b_free!11397 () Bool)

(declare-fun b_next!11397 () Bool)

(assert (=> start!41776 (= b_free!11397 (not b_next!11397))))

(declare-fun tp!40198 () Bool)

(declare-fun b_and!19765 () Bool)

(assert (=> start!41776 (= tp!40198 b_and!19765)))

(declare-fun b!466482 () Bool)

(declare-fun res!278831 () Bool)

(declare-fun e!272760 () Bool)

(assert (=> b!466482 (=> (not res!278831) (not e!272760))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29433 0))(
  ( (array!29434 (arr!14145 (Array (_ BitVec 32) (_ BitVec 64))) (size!14497 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29433)

(declare-datatypes ((V!18205 0))(
  ( (V!18206 (val!6457 Int)) )
))
(declare-datatypes ((ValueCell!6069 0))(
  ( (ValueCellFull!6069 (v!8745 V!18205)) (EmptyCell!6069) )
))
(declare-datatypes ((array!29435 0))(
  ( (array!29436 (arr!14146 (Array (_ BitVec 32) ValueCell!6069)) (size!14498 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29435)

(assert (=> b!466482 (= res!278831 (and (= (size!14498 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14497 _keys!1025) (size!14498 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20923 () Bool)

(declare-fun mapRes!20923 () Bool)

(assert (=> mapIsEmpty!20923 mapRes!20923))

(declare-fun b!466483 () Bool)

(declare-fun e!272758 () Bool)

(assert (=> b!466483 (= e!272758 true)))

(declare-datatypes ((tuple2!8468 0))(
  ( (tuple2!8469 (_1!4245 (_ BitVec 64)) (_2!4245 V!18205)) )
))
(declare-datatypes ((List!8558 0))(
  ( (Nil!8555) (Cons!8554 (h!9410 tuple2!8468) (t!14510 List!8558)) )
))
(declare-datatypes ((ListLongMap!7381 0))(
  ( (ListLongMap!7382 (toList!3706 List!8558)) )
))
(declare-fun lt!210821 () ListLongMap!7381)

(declare-fun zeroValue!794 () V!18205)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18205)

(declare-fun getCurrentListMap!2156 (array!29433 array!29435 (_ BitVec 32) (_ BitVec 32) V!18205 V!18205 (_ BitVec 32) Int) ListLongMap!7381)

(assert (=> b!466483 (= lt!210821 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210818 () ListLongMap!7381)

(declare-fun minValueBefore!38 () V!18205)

(declare-fun +!1662 (ListLongMap!7381 tuple2!8468) ListLongMap!7381)

(assert (=> b!466483 (= lt!210818 (+!1662 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8469 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278833 () Bool)

(assert (=> start!41776 (=> (not res!278833) (not e!272760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41776 (= res!278833 (validMask!0 mask!1365))))

(assert (=> start!41776 e!272760))

(declare-fun tp_is_empty!12825 () Bool)

(assert (=> start!41776 tp_is_empty!12825))

(assert (=> start!41776 tp!40198))

(assert (=> start!41776 true))

(declare-fun array_inv!10214 (array!29433) Bool)

(assert (=> start!41776 (array_inv!10214 _keys!1025)))

(declare-fun e!272757 () Bool)

(declare-fun array_inv!10215 (array!29435) Bool)

(assert (=> start!41776 (and (array_inv!10215 _values!833) e!272757)))

(declare-fun b!466484 () Bool)

(declare-fun e!272756 () Bool)

(assert (=> b!466484 (= e!272757 (and e!272756 mapRes!20923))))

(declare-fun condMapEmpty!20923 () Bool)

(declare-fun mapDefault!20923 () ValueCell!6069)

(assert (=> b!466484 (= condMapEmpty!20923 (= (arr!14146 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6069)) mapDefault!20923)))))

(declare-fun b!466485 () Bool)

(assert (=> b!466485 (= e!272760 (not e!272758))))

(declare-fun res!278832 () Bool)

(assert (=> b!466485 (=> res!278832 e!272758)))

(assert (=> b!466485 (= res!278832 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210819 () ListLongMap!7381)

(declare-fun lt!210822 () ListLongMap!7381)

(assert (=> b!466485 (= lt!210819 lt!210822)))

(declare-datatypes ((Unit!13576 0))(
  ( (Unit!13577) )
))
(declare-fun lt!210820 () Unit!13576)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!63 (array!29433 array!29435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18205 V!18205 V!18205 V!18205 (_ BitVec 32) Int) Unit!13576)

(assert (=> b!466485 (= lt!210820 (lemmaNoChangeToArrayThenSameMapNoExtras!63 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1883 (array!29433 array!29435 (_ BitVec 32) (_ BitVec 32) V!18205 V!18205 (_ BitVec 32) Int) ListLongMap!7381)

(assert (=> b!466485 (= lt!210822 (getCurrentListMapNoExtraKeys!1883 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466485 (= lt!210819 (getCurrentListMapNoExtraKeys!1883 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466486 () Bool)

(declare-fun e!272759 () Bool)

(assert (=> b!466486 (= e!272759 tp_is_empty!12825)))

(declare-fun b!466487 () Bool)

(assert (=> b!466487 (= e!272756 tp_is_empty!12825)))

(declare-fun b!466488 () Bool)

(declare-fun res!278830 () Bool)

(assert (=> b!466488 (=> (not res!278830) (not e!272760))))

(declare-datatypes ((List!8559 0))(
  ( (Nil!8556) (Cons!8555 (h!9411 (_ BitVec 64)) (t!14511 List!8559)) )
))
(declare-fun arrayNoDuplicates!0 (array!29433 (_ BitVec 32) List!8559) Bool)

(assert (=> b!466488 (= res!278830 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8556))))

(declare-fun b!466489 () Bool)

(declare-fun res!278834 () Bool)

(assert (=> b!466489 (=> (not res!278834) (not e!272760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29433 (_ BitVec 32)) Bool)

(assert (=> b!466489 (= res!278834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20923 () Bool)

(declare-fun tp!40197 () Bool)

(assert (=> mapNonEmpty!20923 (= mapRes!20923 (and tp!40197 e!272759))))

(declare-fun mapRest!20923 () (Array (_ BitVec 32) ValueCell!6069))

(declare-fun mapKey!20923 () (_ BitVec 32))

(declare-fun mapValue!20923 () ValueCell!6069)

(assert (=> mapNonEmpty!20923 (= (arr!14146 _values!833) (store mapRest!20923 mapKey!20923 mapValue!20923))))

(assert (= (and start!41776 res!278833) b!466482))

(assert (= (and b!466482 res!278831) b!466489))

(assert (= (and b!466489 res!278834) b!466488))

(assert (= (and b!466488 res!278830) b!466485))

(assert (= (and b!466485 (not res!278832)) b!466483))

(assert (= (and b!466484 condMapEmpty!20923) mapIsEmpty!20923))

(assert (= (and b!466484 (not condMapEmpty!20923)) mapNonEmpty!20923))

(get-info :version)

(assert (= (and mapNonEmpty!20923 ((_ is ValueCellFull!6069) mapValue!20923)) b!466486))

(assert (= (and b!466484 ((_ is ValueCellFull!6069) mapDefault!20923)) b!466487))

(assert (= start!41776 b!466484))

(declare-fun m!448699 () Bool)

(assert (=> b!466483 m!448699))

(declare-fun m!448701 () Bool)

(assert (=> b!466483 m!448701))

(assert (=> b!466483 m!448701))

(declare-fun m!448703 () Bool)

(assert (=> b!466483 m!448703))

(declare-fun m!448705 () Bool)

(assert (=> start!41776 m!448705))

(declare-fun m!448707 () Bool)

(assert (=> start!41776 m!448707))

(declare-fun m!448709 () Bool)

(assert (=> start!41776 m!448709))

(declare-fun m!448711 () Bool)

(assert (=> b!466485 m!448711))

(declare-fun m!448713 () Bool)

(assert (=> b!466485 m!448713))

(declare-fun m!448715 () Bool)

(assert (=> b!466485 m!448715))

(declare-fun m!448717 () Bool)

(assert (=> b!466488 m!448717))

(declare-fun m!448719 () Bool)

(assert (=> mapNonEmpty!20923 m!448719))

(declare-fun m!448721 () Bool)

(assert (=> b!466489 m!448721))

(check-sat (not b_next!11397) b_and!19765 (not start!41776) (not b!466489) (not b!466488) tp_is_empty!12825 (not mapNonEmpty!20923) (not b!466483) (not b!466485))
(check-sat b_and!19765 (not b_next!11397))
