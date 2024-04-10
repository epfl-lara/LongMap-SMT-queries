; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42500 () Bool)

(assert start!42500)

(declare-fun b_free!11955 () Bool)

(declare-fun b_next!11955 () Bool)

(assert (=> start!42500 (= b_free!11955 (not b_next!11955))))

(declare-fun tp!41902 () Bool)

(declare-fun b_and!20423 () Bool)

(assert (=> start!42500 (= tp!41902 b_and!20423)))

(declare-fun b!474213 () Bool)

(declare-fun res!283248 () Bool)

(declare-fun e!278310 () Bool)

(assert (=> b!474213 (=> (not res!283248) (not e!278310))))

(declare-datatypes ((array!30517 0))(
  ( (array!30518 (arr!14677 (Array (_ BitVec 32) (_ BitVec 64))) (size!15029 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30517)

(declare-datatypes ((List!8960 0))(
  ( (Nil!8957) (Cons!8956 (h!9812 (_ BitVec 64)) (t!14932 List!8960)) )
))
(declare-fun arrayNoDuplicates!0 (array!30517 (_ BitVec 32) List!8960) Bool)

(assert (=> b!474213 (= res!283248 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8957))))

(declare-fun mapNonEmpty!21790 () Bool)

(declare-fun mapRes!21790 () Bool)

(declare-fun tp!41901 () Bool)

(declare-fun e!278312 () Bool)

(assert (=> mapNonEmpty!21790 (= mapRes!21790 (and tp!41901 e!278312))))

(declare-fun mapKey!21790 () (_ BitVec 32))

(declare-datatypes ((V!18949 0))(
  ( (V!18950 (val!6736 Int)) )
))
(declare-datatypes ((ValueCell!6348 0))(
  ( (ValueCellFull!6348 (v!9028 V!18949)) (EmptyCell!6348) )
))
(declare-datatypes ((array!30519 0))(
  ( (array!30520 (arr!14678 (Array (_ BitVec 32) ValueCell!6348)) (size!15030 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30519)

(declare-fun mapValue!21790 () ValueCell!6348)

(declare-fun mapRest!21790 () (Array (_ BitVec 32) ValueCell!6348))

(assert (=> mapNonEmpty!21790 (= (arr!14678 _values!833) (store mapRest!21790 mapKey!21790 mapValue!21790))))

(declare-fun res!283247 () Bool)

(assert (=> start!42500 (=> (not res!283247) (not e!278310))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42500 (= res!283247 (validMask!0 mask!1365))))

(assert (=> start!42500 e!278310))

(declare-fun tp_is_empty!13383 () Bool)

(assert (=> start!42500 tp_is_empty!13383))

(assert (=> start!42500 tp!41902))

(assert (=> start!42500 true))

(declare-fun array_inv!10590 (array!30517) Bool)

(assert (=> start!42500 (array_inv!10590 _keys!1025)))

(declare-fun e!278311 () Bool)

(declare-fun array_inv!10591 (array!30519) Bool)

(assert (=> start!42500 (and (array_inv!10591 _values!833) e!278311)))

(declare-fun b!474214 () Bool)

(declare-fun e!278313 () Bool)

(assert (=> b!474214 (= e!278313 true)))

(declare-datatypes ((tuple2!8882 0))(
  ( (tuple2!8883 (_1!4452 (_ BitVec 64)) (_2!4452 V!18949)) )
))
(declare-datatypes ((List!8961 0))(
  ( (Nil!8958) (Cons!8957 (h!9813 tuple2!8882) (t!14933 List!8961)) )
))
(declare-datatypes ((ListLongMap!7795 0))(
  ( (ListLongMap!7796 (toList!3913 List!8961)) )
))
(declare-fun lt!215889 () ListLongMap!7795)

(declare-fun lt!215894 () tuple2!8882)

(declare-fun minValueBefore!38 () V!18949)

(declare-fun +!1748 (ListLongMap!7795 tuple2!8882) ListLongMap!7795)

(assert (=> b!474214 (= (+!1748 lt!215889 lt!215894) (+!1748 (+!1748 lt!215889 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215894))))

(declare-fun minValueAfter!38 () V!18949)

(assert (=> b!474214 (= lt!215894 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13984 0))(
  ( (Unit!13985) )
))
(declare-fun lt!215891 () Unit!13984)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!157 (ListLongMap!7795 (_ BitVec 64) V!18949 V!18949) Unit!13984)

(assert (=> b!474214 (= lt!215891 (addSameAsAddTwiceSameKeyDiffValues!157 lt!215889 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215893 () ListLongMap!7795)

(declare-fun zeroValue!794 () V!18949)

(assert (=> b!474214 (= lt!215889 (+!1748 lt!215893 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215890 () ListLongMap!7795)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2277 (array!30517 array!30519 (_ BitVec 32) (_ BitVec 32) V!18949 V!18949 (_ BitVec 32) Int) ListLongMap!7795)

(assert (=> b!474214 (= lt!215890 (getCurrentListMap!2277 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215888 () ListLongMap!7795)

(assert (=> b!474214 (= lt!215888 (getCurrentListMap!2277 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474215 () Bool)

(declare-fun res!283246 () Bool)

(assert (=> b!474215 (=> (not res!283246) (not e!278310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30517 (_ BitVec 32)) Bool)

(assert (=> b!474215 (= res!283246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474216 () Bool)

(assert (=> b!474216 (= e!278312 tp_is_empty!13383)))

(declare-fun b!474217 () Bool)

(assert (=> b!474217 (= e!278310 (not e!278313))))

(declare-fun res!283250 () Bool)

(assert (=> b!474217 (=> res!283250 e!278313)))

(assert (=> b!474217 (= res!283250 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215892 () ListLongMap!7795)

(assert (=> b!474217 (= lt!215893 lt!215892)))

(declare-fun lt!215895 () Unit!13984)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!250 (array!30517 array!30519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18949 V!18949 V!18949 V!18949 (_ BitVec 32) Int) Unit!13984)

(assert (=> b!474217 (= lt!215895 (lemmaNoChangeToArrayThenSameMapNoExtras!250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2070 (array!30517 array!30519 (_ BitVec 32) (_ BitVec 32) V!18949 V!18949 (_ BitVec 32) Int) ListLongMap!7795)

(assert (=> b!474217 (= lt!215892 (getCurrentListMapNoExtraKeys!2070 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474217 (= lt!215893 (getCurrentListMapNoExtraKeys!2070 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474218 () Bool)

(declare-fun res!283249 () Bool)

(assert (=> b!474218 (=> (not res!283249) (not e!278310))))

(assert (=> b!474218 (= res!283249 (and (= (size!15030 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15029 _keys!1025) (size!15030 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21790 () Bool)

(assert (=> mapIsEmpty!21790 mapRes!21790))

(declare-fun b!474219 () Bool)

(declare-fun e!278309 () Bool)

(assert (=> b!474219 (= e!278309 tp_is_empty!13383)))

(declare-fun b!474220 () Bool)

(assert (=> b!474220 (= e!278311 (and e!278309 mapRes!21790))))

(declare-fun condMapEmpty!21790 () Bool)

(declare-fun mapDefault!21790 () ValueCell!6348)

(assert (=> b!474220 (= condMapEmpty!21790 (= (arr!14678 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6348)) mapDefault!21790)))))

(assert (= (and start!42500 res!283247) b!474218))

(assert (= (and b!474218 res!283249) b!474215))

(assert (= (and b!474215 res!283246) b!474213))

(assert (= (and b!474213 res!283248) b!474217))

(assert (= (and b!474217 (not res!283250)) b!474214))

(assert (= (and b!474220 condMapEmpty!21790) mapIsEmpty!21790))

(assert (= (and b!474220 (not condMapEmpty!21790)) mapNonEmpty!21790))

(get-info :version)

(assert (= (and mapNonEmpty!21790 ((_ is ValueCellFull!6348) mapValue!21790)) b!474216))

(assert (= (and b!474220 ((_ is ValueCellFull!6348) mapDefault!21790)) b!474219))

(assert (= start!42500 b!474220))

(declare-fun m!456493 () Bool)

(assert (=> mapNonEmpty!21790 m!456493))

(declare-fun m!456495 () Bool)

(assert (=> b!474217 m!456495))

(declare-fun m!456497 () Bool)

(assert (=> b!474217 m!456497))

(declare-fun m!456499 () Bool)

(assert (=> b!474217 m!456499))

(declare-fun m!456501 () Bool)

(assert (=> b!474213 m!456501))

(declare-fun m!456503 () Bool)

(assert (=> b!474214 m!456503))

(declare-fun m!456505 () Bool)

(assert (=> b!474214 m!456505))

(assert (=> b!474214 m!456503))

(declare-fun m!456507 () Bool)

(assert (=> b!474214 m!456507))

(declare-fun m!456509 () Bool)

(assert (=> b!474214 m!456509))

(declare-fun m!456511 () Bool)

(assert (=> b!474214 m!456511))

(declare-fun m!456513 () Bool)

(assert (=> b!474214 m!456513))

(declare-fun m!456515 () Bool)

(assert (=> b!474214 m!456515))

(declare-fun m!456517 () Bool)

(assert (=> start!42500 m!456517))

(declare-fun m!456519 () Bool)

(assert (=> start!42500 m!456519))

(declare-fun m!456521 () Bool)

(assert (=> start!42500 m!456521))

(declare-fun m!456523 () Bool)

(assert (=> b!474215 m!456523))

(check-sat (not b!474213) b_and!20423 (not mapNonEmpty!21790) (not b!474214) (not start!42500) (not b!474217) tp_is_empty!13383 (not b!474215) (not b_next!11955))
(check-sat b_and!20423 (not b_next!11955))
