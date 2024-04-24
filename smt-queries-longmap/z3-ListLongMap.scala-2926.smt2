; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41712 () Bool)

(assert start!41712)

(declare-fun b_free!11365 () Bool)

(declare-fun b_next!11365 () Bool)

(assert (=> start!41712 (= b_free!11365 (not b_next!11365))))

(declare-fun tp!40099 () Bool)

(declare-fun b_and!19731 () Bool)

(assert (=> start!41712 (= tp!40099 b_and!19731)))

(declare-fun mapNonEmpty!20872 () Bool)

(declare-fun mapRes!20872 () Bool)

(declare-fun tp!40098 () Bool)

(declare-fun e!272320 () Bool)

(assert (=> mapNonEmpty!20872 (= mapRes!20872 (and tp!40098 e!272320))))

(declare-datatypes ((V!18163 0))(
  ( (V!18164 (val!6441 Int)) )
))
(declare-datatypes ((ValueCell!6053 0))(
  ( (ValueCellFull!6053 (v!8729 V!18163)) (EmptyCell!6053) )
))
(declare-datatypes ((array!29368 0))(
  ( (array!29369 (arr!14113 (Array (_ BitVec 32) ValueCell!6053)) (size!14465 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29368)

(declare-fun mapValue!20872 () ValueCell!6053)

(declare-fun mapRest!20872 () (Array (_ BitVec 32) ValueCell!6053))

(declare-fun mapKey!20872 () (_ BitVec 32))

(assert (=> mapNonEmpty!20872 (= (arr!14113 _values!833) (store mapRest!20872 mapKey!20872 mapValue!20872))))

(declare-fun b!465853 () Bool)

(declare-fun e!272324 () Bool)

(declare-fun e!272323 () Bool)

(assert (=> b!465853 (= e!272324 (and e!272323 mapRes!20872))))

(declare-fun condMapEmpty!20872 () Bool)

(declare-fun mapDefault!20872 () ValueCell!6053)

(assert (=> b!465853 (= condMapEmpty!20872 (= (arr!14113 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6053)) mapDefault!20872)))))

(declare-fun b!465854 () Bool)

(declare-fun e!272322 () Bool)

(declare-fun e!272321 () Bool)

(assert (=> b!465854 (= e!272322 (not e!272321))))

(declare-fun res!278503 () Bool)

(assert (=> b!465854 (=> res!278503 e!272321)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465854 (= res!278503 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8380 0))(
  ( (tuple2!8381 (_1!4201 (_ BitVec 64)) (_2!4201 V!18163)) )
))
(declare-datatypes ((List!8465 0))(
  ( (Nil!8462) (Cons!8461 (h!9317 tuple2!8380) (t!14407 List!8465)) )
))
(declare-datatypes ((ListLongMap!7295 0))(
  ( (ListLongMap!7296 (toList!3663 List!8465)) )
))
(declare-fun lt!210469 () ListLongMap!7295)

(declare-fun lt!210471 () ListLongMap!7295)

(assert (=> b!465854 (= lt!210469 lt!210471)))

(declare-fun minValueBefore!38 () V!18163)

(declare-datatypes ((Unit!13540 0))(
  ( (Unit!13541) )
))
(declare-fun lt!210468 () Unit!13540)

(declare-fun zeroValue!794 () V!18163)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29370 0))(
  ( (array!29371 (arr!14114 (Array (_ BitVec 32) (_ BitVec 64))) (size!14466 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29370)

(declare-fun minValueAfter!38 () V!18163)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!48 (array!29370 array!29368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 V!18163 V!18163 (_ BitVec 32) Int) Unit!13540)

(assert (=> b!465854 (= lt!210468 (lemmaNoChangeToArrayThenSameMapNoExtras!48 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1888 (array!29370 array!29368 (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 (_ BitVec 32) Int) ListLongMap!7295)

(assert (=> b!465854 (= lt!210471 (getCurrentListMapNoExtraKeys!1888 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465854 (= lt!210469 (getCurrentListMapNoExtraKeys!1888 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465855 () Bool)

(declare-fun res!278502 () Bool)

(assert (=> b!465855 (=> (not res!278502) (not e!272322))))

(declare-datatypes ((List!8466 0))(
  ( (Nil!8463) (Cons!8462 (h!9318 (_ BitVec 64)) (t!14408 List!8466)) )
))
(declare-fun arrayNoDuplicates!0 (array!29370 (_ BitVec 32) List!8466) Bool)

(assert (=> b!465855 (= res!278502 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8463))))

(declare-fun mapIsEmpty!20872 () Bool)

(assert (=> mapIsEmpty!20872 mapRes!20872))

(declare-fun res!278505 () Bool)

(assert (=> start!41712 (=> (not res!278505) (not e!272322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41712 (= res!278505 (validMask!0 mask!1365))))

(assert (=> start!41712 e!272322))

(declare-fun tp_is_empty!12793 () Bool)

(assert (=> start!41712 tp_is_empty!12793))

(assert (=> start!41712 tp!40099))

(assert (=> start!41712 true))

(declare-fun array_inv!10274 (array!29370) Bool)

(assert (=> start!41712 (array_inv!10274 _keys!1025)))

(declare-fun array_inv!10275 (array!29368) Bool)

(assert (=> start!41712 (and (array_inv!10275 _values!833) e!272324)))

(declare-fun b!465856 () Bool)

(assert (=> b!465856 (= e!272320 tp_is_empty!12793)))

(declare-fun b!465857 () Bool)

(declare-fun res!278504 () Bool)

(assert (=> b!465857 (=> (not res!278504) (not e!272322))))

(assert (=> b!465857 (= res!278504 (and (= (size!14465 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14466 _keys!1025) (size!14465 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465858 () Bool)

(assert (=> b!465858 (= e!272323 tp_is_empty!12793)))

(declare-fun b!465859 () Bool)

(declare-fun res!278501 () Bool)

(assert (=> b!465859 (=> (not res!278501) (not e!272322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29370 (_ BitVec 32)) Bool)

(assert (=> b!465859 (= res!278501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465860 () Bool)

(assert (=> b!465860 (= e!272321 true)))

(declare-fun lt!210472 () ListLongMap!7295)

(declare-fun getCurrentListMap!2112 (array!29370 array!29368 (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 (_ BitVec 32) Int) ListLongMap!7295)

(assert (=> b!465860 (= lt!210472 (getCurrentListMap!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210470 () ListLongMap!7295)

(declare-fun +!1661 (ListLongMap!7295 tuple2!8380) ListLongMap!7295)

(assert (=> b!465860 (= lt!210470 (+!1661 (getCurrentListMap!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8381 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and start!41712 res!278505) b!465857))

(assert (= (and b!465857 res!278504) b!465859))

(assert (= (and b!465859 res!278501) b!465855))

(assert (= (and b!465855 res!278502) b!465854))

(assert (= (and b!465854 (not res!278503)) b!465860))

(assert (= (and b!465853 condMapEmpty!20872) mapIsEmpty!20872))

(assert (= (and b!465853 (not condMapEmpty!20872)) mapNonEmpty!20872))

(get-info :version)

(assert (= (and mapNonEmpty!20872 ((_ is ValueCellFull!6053) mapValue!20872)) b!465856))

(assert (= (and b!465853 ((_ is ValueCellFull!6053) mapDefault!20872)) b!465858))

(assert (= start!41712 b!465853))

(declare-fun m!448327 () Bool)

(assert (=> b!465860 m!448327))

(declare-fun m!448329 () Bool)

(assert (=> b!465860 m!448329))

(assert (=> b!465860 m!448329))

(declare-fun m!448331 () Bool)

(assert (=> b!465860 m!448331))

(declare-fun m!448333 () Bool)

(assert (=> mapNonEmpty!20872 m!448333))

(declare-fun m!448335 () Bool)

(assert (=> b!465859 m!448335))

(declare-fun m!448337 () Bool)

(assert (=> b!465854 m!448337))

(declare-fun m!448339 () Bool)

(assert (=> b!465854 m!448339))

(declare-fun m!448341 () Bool)

(assert (=> b!465854 m!448341))

(declare-fun m!448343 () Bool)

(assert (=> b!465855 m!448343))

(declare-fun m!448345 () Bool)

(assert (=> start!41712 m!448345))

(declare-fun m!448347 () Bool)

(assert (=> start!41712 m!448347))

(declare-fun m!448349 () Bool)

(assert (=> start!41712 m!448349))

(check-sat (not b!465854) tp_is_empty!12793 (not b!465855) b_and!19731 (not b!465859) (not b!465860) (not mapNonEmpty!20872) (not start!41712) (not b_next!11365))
(check-sat b_and!19731 (not b_next!11365))
