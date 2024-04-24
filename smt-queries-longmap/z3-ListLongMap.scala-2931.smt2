; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41760 () Bool)

(assert start!41760)

(declare-fun b_free!11395 () Bool)

(declare-fun b_next!11395 () Bool)

(assert (=> start!41760 (= b_free!11395 (not b_next!11395))))

(declare-fun tp!40192 () Bool)

(declare-fun b_and!19773 () Bool)

(assert (=> start!41760 (= tp!40192 b_and!19773)))

(declare-fun b!466397 () Bool)

(declare-fun res!278811 () Bool)

(declare-fun e!272702 () Bool)

(assert (=> b!466397 (=> (not res!278811) (not e!272702))))

(declare-datatypes ((array!29424 0))(
  ( (array!29425 (arr!14140 (Array (_ BitVec 32) (_ BitVec 64))) (size!14492 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29424)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29424 (_ BitVec 32)) Bool)

(assert (=> b!466397 (= res!278811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466398 () Bool)

(declare-fun res!278810 () Bool)

(assert (=> b!466398 (=> (not res!278810) (not e!272702))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18203 0))(
  ( (V!18204 (val!6456 Int)) )
))
(declare-datatypes ((ValueCell!6068 0))(
  ( (ValueCellFull!6068 (v!8745 V!18203)) (EmptyCell!6068) )
))
(declare-datatypes ((array!29426 0))(
  ( (array!29427 (arr!14141 (Array (_ BitVec 32) ValueCell!6068)) (size!14493 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29426)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466398 (= res!278810 (and (= (size!14493 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14492 _keys!1025) (size!14493 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20920 () Bool)

(declare-fun mapRes!20920 () Bool)

(assert (=> mapIsEmpty!20920 mapRes!20920))

(declare-fun res!278812 () Bool)

(assert (=> start!41760 (=> (not res!278812) (not e!272702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41760 (= res!278812 (validMask!0 mask!1365))))

(assert (=> start!41760 e!272702))

(declare-fun tp_is_empty!12823 () Bool)

(assert (=> start!41760 tp_is_empty!12823))

(assert (=> start!41760 tp!40192))

(assert (=> start!41760 true))

(declare-fun array_inv!10294 (array!29424) Bool)

(assert (=> start!41760 (array_inv!10294 _keys!1025)))

(declare-fun e!272701 () Bool)

(declare-fun array_inv!10295 (array!29426) Bool)

(assert (=> start!41760 (and (array_inv!10295 _values!833) e!272701)))

(declare-fun b!466399 () Bool)

(declare-fun res!278808 () Bool)

(assert (=> b!466399 (=> (not res!278808) (not e!272702))))

(declare-datatypes ((List!8485 0))(
  ( (Nil!8482) (Cons!8481 (h!9337 (_ BitVec 64)) (t!14429 List!8485)) )
))
(declare-fun arrayNoDuplicates!0 (array!29424 (_ BitVec 32) List!8485) Bool)

(assert (=> b!466399 (= res!278808 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8482))))

(declare-fun b!466400 () Bool)

(declare-fun e!272703 () Bool)

(assert (=> b!466400 (= e!272701 (and e!272703 mapRes!20920))))

(declare-fun condMapEmpty!20920 () Bool)

(declare-fun mapDefault!20920 () ValueCell!6068)

(assert (=> b!466400 (= condMapEmpty!20920 (= (arr!14141 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6068)) mapDefault!20920)))))

(declare-fun mapNonEmpty!20920 () Bool)

(declare-fun tp!40191 () Bool)

(declare-fun e!272700 () Bool)

(assert (=> mapNonEmpty!20920 (= mapRes!20920 (and tp!40191 e!272700))))

(declare-fun mapValue!20920 () ValueCell!6068)

(declare-fun mapKey!20920 () (_ BitVec 32))

(declare-fun mapRest!20920 () (Array (_ BitVec 32) ValueCell!6068))

(assert (=> mapNonEmpty!20920 (= (arr!14141 _values!833) (store mapRest!20920 mapKey!20920 mapValue!20920))))

(declare-fun b!466401 () Bool)

(assert (=> b!466401 (= e!272703 tp_is_empty!12823)))

(declare-fun b!466402 () Bool)

(declare-fun e!272704 () Bool)

(assert (=> b!466402 (= e!272704 true)))

(declare-datatypes ((tuple2!8402 0))(
  ( (tuple2!8403 (_1!4212 (_ BitVec 64)) (_2!4212 V!18203)) )
))
(declare-datatypes ((List!8486 0))(
  ( (Nil!8483) (Cons!8482 (h!9338 tuple2!8402) (t!14430 List!8486)) )
))
(declare-datatypes ((ListLongMap!7317 0))(
  ( (ListLongMap!7318 (toList!3674 List!8486)) )
))
(declare-fun lt!210815 () ListLongMap!7317)

(declare-fun zeroValue!794 () V!18203)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18203)

(declare-fun getCurrentListMap!2123 (array!29424 array!29426 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7317)

(assert (=> b!466402 (= lt!210815 (getCurrentListMap!2123 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18203)

(declare-fun lt!210818 () ListLongMap!7317)

(declare-fun +!1672 (ListLongMap!7317 tuple2!8402) ListLongMap!7317)

(assert (=> b!466402 (= lt!210818 (+!1672 (getCurrentListMap!2123 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8403 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466403 () Bool)

(assert (=> b!466403 (= e!272702 (not e!272704))))

(declare-fun res!278809 () Bool)

(assert (=> b!466403 (=> res!278809 e!272704)))

(assert (=> b!466403 (= res!278809 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210817 () ListLongMap!7317)

(declare-fun lt!210819 () ListLongMap!7317)

(assert (=> b!466403 (= lt!210817 lt!210819)))

(declare-datatypes ((Unit!13562 0))(
  ( (Unit!13563) )
))
(declare-fun lt!210816 () Unit!13562)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!58 (array!29424 array!29426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 V!18203 V!18203 (_ BitVec 32) Int) Unit!13562)

(assert (=> b!466403 (= lt!210816 (lemmaNoChangeToArrayThenSameMapNoExtras!58 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1898 (array!29424 array!29426 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7317)

(assert (=> b!466403 (= lt!210819 (getCurrentListMapNoExtraKeys!1898 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466403 (= lt!210817 (getCurrentListMapNoExtraKeys!1898 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466404 () Bool)

(assert (=> b!466404 (= e!272700 tp_is_empty!12823)))

(assert (= (and start!41760 res!278812) b!466398))

(assert (= (and b!466398 res!278810) b!466397))

(assert (= (and b!466397 res!278811) b!466399))

(assert (= (and b!466399 res!278808) b!466403))

(assert (= (and b!466403 (not res!278809)) b!466402))

(assert (= (and b!466400 condMapEmpty!20920) mapIsEmpty!20920))

(assert (= (and b!466400 (not condMapEmpty!20920)) mapNonEmpty!20920))

(get-info :version)

(assert (= (and mapNonEmpty!20920 ((_ is ValueCellFull!6068) mapValue!20920)) b!466404))

(assert (= (and b!466400 ((_ is ValueCellFull!6068) mapDefault!20920)) b!466401))

(assert (= start!41760 b!466400))

(declare-fun m!448857 () Bool)

(assert (=> b!466402 m!448857))

(declare-fun m!448859 () Bool)

(assert (=> b!466402 m!448859))

(assert (=> b!466402 m!448859))

(declare-fun m!448861 () Bool)

(assert (=> b!466402 m!448861))

(declare-fun m!448863 () Bool)

(assert (=> start!41760 m!448863))

(declare-fun m!448865 () Bool)

(assert (=> start!41760 m!448865))

(declare-fun m!448867 () Bool)

(assert (=> start!41760 m!448867))

(declare-fun m!448869 () Bool)

(assert (=> b!466399 m!448869))

(declare-fun m!448871 () Bool)

(assert (=> mapNonEmpty!20920 m!448871))

(declare-fun m!448873 () Bool)

(assert (=> b!466403 m!448873))

(declare-fun m!448875 () Bool)

(assert (=> b!466403 m!448875))

(declare-fun m!448877 () Bool)

(assert (=> b!466403 m!448877))

(declare-fun m!448879 () Bool)

(assert (=> b!466397 m!448879))

(check-sat (not b!466397) (not b!466403) (not start!41760) tp_is_empty!12823 (not mapNonEmpty!20920) (not b!466402) b_and!19773 (not b_next!11395) (not b!466399))
(check-sat b_and!19773 (not b_next!11395))
