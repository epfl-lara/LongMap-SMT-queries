; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41722 () Bool)

(assert start!41722)

(declare-fun b_free!11361 () Bool)

(declare-fun b_next!11361 () Bool)

(assert (=> start!41722 (= b_free!11361 (not b_next!11361))))

(declare-fun tp!40087 () Bool)

(declare-fun b_and!19717 () Bool)

(assert (=> start!41722 (= tp!40087 b_and!19717)))

(declare-fun b!465866 () Bool)

(declare-fun e!272323 () Bool)

(assert (=> b!465866 (= e!272323 true)))

(declare-datatypes ((V!18157 0))(
  ( (V!18158 (val!6439 Int)) )
))
(declare-fun zeroValue!794 () V!18157)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8434 0))(
  ( (tuple2!8435 (_1!4228 (_ BitVec 64)) (_2!4228 V!18157)) )
))
(declare-datatypes ((List!8528 0))(
  ( (Nil!8525) (Cons!8524 (h!9380 tuple2!8434) (t!14478 List!8528)) )
))
(declare-datatypes ((ListLongMap!7347 0))(
  ( (ListLongMap!7348 (toList!3689 List!8528)) )
))
(declare-fun lt!210426 () ListLongMap!7347)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29359 0))(
  ( (array!29360 (arr!14109 (Array (_ BitVec 32) (_ BitVec 64))) (size!14461 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29359)

(declare-datatypes ((ValueCell!6051 0))(
  ( (ValueCellFull!6051 (v!8726 V!18157)) (EmptyCell!6051) )
))
(declare-datatypes ((array!29361 0))(
  ( (array!29362 (arr!14110 (Array (_ BitVec 32) ValueCell!6051)) (size!14462 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29361)

(declare-fun minValueAfter!38 () V!18157)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2142 (array!29359 array!29361 (_ BitVec 32) (_ BitVec 32) V!18157 V!18157 (_ BitVec 32) Int) ListLongMap!7347)

(assert (=> b!465866 (= lt!210426 (getCurrentListMap!2142 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18157)

(declare-fun lt!210428 () ListLongMap!7347)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1648 (ListLongMap!7347 tuple2!8434) ListLongMap!7347)

(assert (=> b!465866 (= lt!210428 (+!1648 (getCurrentListMap!2142 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8435 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278481 () Bool)

(declare-fun e!272326 () Bool)

(assert (=> start!41722 (=> (not res!278481) (not e!272326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41722 (= res!278481 (validMask!0 mask!1365))))

(assert (=> start!41722 e!272326))

(declare-fun tp_is_empty!12789 () Bool)

(assert (=> start!41722 tp_is_empty!12789))

(assert (=> start!41722 tp!40087))

(assert (=> start!41722 true))

(declare-fun array_inv!10188 (array!29359) Bool)

(assert (=> start!41722 (array_inv!10188 _keys!1025)))

(declare-fun e!272324 () Bool)

(declare-fun array_inv!10189 (array!29361) Bool)

(assert (=> start!41722 (and (array_inv!10189 _values!833) e!272324)))

(declare-fun mapNonEmpty!20866 () Bool)

(declare-fun mapRes!20866 () Bool)

(declare-fun tp!40086 () Bool)

(declare-fun e!272322 () Bool)

(assert (=> mapNonEmpty!20866 (= mapRes!20866 (and tp!40086 e!272322))))

(declare-fun mapValue!20866 () ValueCell!6051)

(declare-fun mapRest!20866 () (Array (_ BitVec 32) ValueCell!6051))

(declare-fun mapKey!20866 () (_ BitVec 32))

(assert (=> mapNonEmpty!20866 (= (arr!14110 _values!833) (store mapRest!20866 mapKey!20866 mapValue!20866))))

(declare-fun mapIsEmpty!20866 () Bool)

(assert (=> mapIsEmpty!20866 mapRes!20866))

(declare-fun b!465867 () Bool)

(assert (=> b!465867 (= e!272322 tp_is_empty!12789)))

(declare-fun b!465868 () Bool)

(declare-fun res!278480 () Bool)

(assert (=> b!465868 (=> (not res!278480) (not e!272326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29359 (_ BitVec 32)) Bool)

(assert (=> b!465868 (= res!278480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465869 () Bool)

(declare-fun e!272325 () Bool)

(assert (=> b!465869 (= e!272325 tp_is_empty!12789)))

(declare-fun b!465870 () Bool)

(declare-fun res!278479 () Bool)

(assert (=> b!465870 (=> (not res!278479) (not e!272326))))

(assert (=> b!465870 (= res!278479 (and (= (size!14462 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14461 _keys!1025) (size!14462 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465871 () Bool)

(assert (=> b!465871 (= e!272326 (not e!272323))))

(declare-fun res!278482 () Bool)

(assert (=> b!465871 (=> res!278482 e!272323)))

(assert (=> b!465871 (= res!278482 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210427 () ListLongMap!7347)

(declare-fun lt!210430 () ListLongMap!7347)

(assert (=> b!465871 (= lt!210427 lt!210430)))

(declare-datatypes ((Unit!13546 0))(
  ( (Unit!13547) )
))
(declare-fun lt!210429 () Unit!13546)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!49 (array!29359 array!29361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18157 V!18157 V!18157 V!18157 (_ BitVec 32) Int) Unit!13546)

(assert (=> b!465871 (= lt!210429 (lemmaNoChangeToArrayThenSameMapNoExtras!49 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1869 (array!29359 array!29361 (_ BitVec 32) (_ BitVec 32) V!18157 V!18157 (_ BitVec 32) Int) ListLongMap!7347)

(assert (=> b!465871 (= lt!210430 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465871 (= lt!210427 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465872 () Bool)

(declare-fun res!278478 () Bool)

(assert (=> b!465872 (=> (not res!278478) (not e!272326))))

(declare-datatypes ((List!8529 0))(
  ( (Nil!8526) (Cons!8525 (h!9381 (_ BitVec 64)) (t!14479 List!8529)) )
))
(declare-fun arrayNoDuplicates!0 (array!29359 (_ BitVec 32) List!8529) Bool)

(assert (=> b!465872 (= res!278478 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8526))))

(declare-fun b!465873 () Bool)

(assert (=> b!465873 (= e!272324 (and e!272325 mapRes!20866))))

(declare-fun condMapEmpty!20866 () Bool)

(declare-fun mapDefault!20866 () ValueCell!6051)

(assert (=> b!465873 (= condMapEmpty!20866 (= (arr!14110 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6051)) mapDefault!20866)))))

(assert (= (and start!41722 res!278481) b!465870))

(assert (= (and b!465870 res!278479) b!465868))

(assert (= (and b!465868 res!278480) b!465872))

(assert (= (and b!465872 res!278478) b!465871))

(assert (= (and b!465871 (not res!278482)) b!465866))

(assert (= (and b!465873 condMapEmpty!20866) mapIsEmpty!20866))

(assert (= (and b!465873 (not condMapEmpty!20866)) mapNonEmpty!20866))

(get-info :version)

(assert (= (and mapNonEmpty!20866 ((_ is ValueCellFull!6051) mapValue!20866)) b!465867))

(assert (= (and b!465873 ((_ is ValueCellFull!6051) mapDefault!20866)) b!465869))

(assert (= start!41722 b!465873))

(declare-fun m!448097 () Bool)

(assert (=> mapNonEmpty!20866 m!448097))

(declare-fun m!448099 () Bool)

(assert (=> b!465871 m!448099))

(declare-fun m!448101 () Bool)

(assert (=> b!465871 m!448101))

(declare-fun m!448103 () Bool)

(assert (=> b!465871 m!448103))

(declare-fun m!448105 () Bool)

(assert (=> b!465872 m!448105))

(declare-fun m!448107 () Bool)

(assert (=> start!41722 m!448107))

(declare-fun m!448109 () Bool)

(assert (=> start!41722 m!448109))

(declare-fun m!448111 () Bool)

(assert (=> start!41722 m!448111))

(declare-fun m!448113 () Bool)

(assert (=> b!465868 m!448113))

(declare-fun m!448115 () Bool)

(assert (=> b!465866 m!448115))

(declare-fun m!448117 () Bool)

(assert (=> b!465866 m!448117))

(assert (=> b!465866 m!448117))

(declare-fun m!448119 () Bool)

(assert (=> b!465866 m!448119))

(check-sat tp_is_empty!12789 b_and!19717 (not b!465866) (not start!41722) (not b_next!11361) (not b!465868) (not mapNonEmpty!20866) (not b!465872) (not b!465871))
(check-sat b_and!19717 (not b_next!11361))
