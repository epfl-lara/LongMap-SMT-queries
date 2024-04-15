; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41856 () Bool)

(assert start!41856)

(declare-fun b_free!11473 () Bool)

(declare-fun b_next!11473 () Bool)

(assert (=> start!41856 (= b_free!11473 (not b_next!11473))))

(declare-fun tp!40428 () Bool)

(declare-fun b_and!19827 () Bool)

(assert (=> start!41856 (= tp!40428 b_and!19827)))

(declare-fun b!467242 () Bool)

(declare-fun res!279291 () Bool)

(declare-fun e!273311 () Bool)

(assert (=> b!467242 (=> (not res!279291) (not e!273311))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29573 0))(
  ( (array!29574 (arr!14214 (Array (_ BitVec 32) (_ BitVec 64))) (size!14567 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29573)

(declare-datatypes ((V!18307 0))(
  ( (V!18308 (val!6495 Int)) )
))
(declare-datatypes ((ValueCell!6107 0))(
  ( (ValueCellFull!6107 (v!8778 V!18307)) (EmptyCell!6107) )
))
(declare-datatypes ((array!29575 0))(
  ( (array!29576 (arr!14215 (Array (_ BitVec 32) ValueCell!6107)) (size!14568 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29575)

(assert (=> b!467242 (= res!279291 (and (= (size!14568 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14567 _keys!1025) (size!14568 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467243 () Bool)

(declare-fun res!279289 () Bool)

(assert (=> b!467243 (=> (not res!279289) (not e!273311))))

(declare-datatypes ((List!8648 0))(
  ( (Nil!8645) (Cons!8644 (h!9500 (_ BitVec 64)) (t!14593 List!8648)) )
))
(declare-fun arrayNoDuplicates!0 (array!29573 (_ BitVec 32) List!8648) Bool)

(assert (=> b!467243 (= res!279289 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8645))))

(declare-fun b!467245 () Bool)

(declare-fun e!273312 () Bool)

(declare-fun tp_is_empty!12901 () Bool)

(assert (=> b!467245 (= e!273312 tp_is_empty!12901)))

(declare-fun b!467246 () Bool)

(declare-fun e!273313 () Bool)

(declare-fun mapRes!21040 () Bool)

(assert (=> b!467246 (= e!273313 (and e!273312 mapRes!21040))))

(declare-fun condMapEmpty!21040 () Bool)

(declare-fun mapDefault!21040 () ValueCell!6107)

(assert (=> b!467246 (= condMapEmpty!21040 (= (arr!14215 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6107)) mapDefault!21040)))))

(declare-fun b!467247 () Bool)

(declare-fun e!273315 () Bool)

(assert (=> b!467247 (= e!273315 tp_is_empty!12901)))

(declare-fun mapNonEmpty!21040 () Bool)

(declare-fun tp!40429 () Bool)

(assert (=> mapNonEmpty!21040 (= mapRes!21040 (and tp!40429 e!273315))))

(declare-fun mapRest!21040 () (Array (_ BitVec 32) ValueCell!6107))

(declare-fun mapKey!21040 () (_ BitVec 32))

(declare-fun mapValue!21040 () ValueCell!6107)

(assert (=> mapNonEmpty!21040 (= (arr!14215 _values!833) (store mapRest!21040 mapKey!21040 mapValue!21040))))

(declare-fun b!467244 () Bool)

(declare-fun res!279288 () Bool)

(assert (=> b!467244 (=> (not res!279288) (not e!273311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29573 (_ BitVec 32)) Bool)

(assert (=> b!467244 (= res!279288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!279290 () Bool)

(assert (=> start!41856 (=> (not res!279290) (not e!273311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41856 (= res!279290 (validMask!0 mask!1365))))

(assert (=> start!41856 e!273311))

(assert (=> start!41856 tp_is_empty!12901))

(assert (=> start!41856 tp!40428))

(assert (=> start!41856 true))

(declare-fun array_inv!10344 (array!29573) Bool)

(assert (=> start!41856 (array_inv!10344 _keys!1025)))

(declare-fun array_inv!10345 (array!29575) Bool)

(assert (=> start!41856 (and (array_inv!10345 _values!833) e!273313)))

(declare-fun mapIsEmpty!21040 () Bool)

(assert (=> mapIsEmpty!21040 mapRes!21040))

(declare-fun b!467248 () Bool)

(assert (=> b!467248 (= e!273311 (not true))))

(declare-datatypes ((tuple2!8568 0))(
  ( (tuple2!8569 (_1!4295 (_ BitVec 64)) (_2!4295 V!18307)) )
))
(declare-datatypes ((List!8649 0))(
  ( (Nil!8646) (Cons!8645 (h!9501 tuple2!8568) (t!14594 List!8649)) )
))
(declare-datatypes ((ListLongMap!7471 0))(
  ( (ListLongMap!7472 (toList!3751 List!8649)) )
))
(declare-fun lt!211146 () ListLongMap!7471)

(declare-fun lt!211147 () ListLongMap!7471)

(assert (=> b!467248 (= lt!211146 lt!211147)))

(declare-fun minValueBefore!38 () V!18307)

(declare-fun zeroValue!794 () V!18307)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13606 0))(
  ( (Unit!13607) )
))
(declare-fun lt!211148 () Unit!13606)

(declare-fun minValueAfter!38 () V!18307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!92 (array!29573 array!29575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 V!18307 V!18307 (_ BitVec 32) Int) Unit!13606)

(assert (=> b!467248 (= lt!211148 (lemmaNoChangeToArrayThenSameMapNoExtras!92 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1935 (array!29573 array!29575 (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 (_ BitVec 32) Int) ListLongMap!7471)

(assert (=> b!467248 (= lt!211147 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467248 (= lt!211146 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41856 res!279290) b!467242))

(assert (= (and b!467242 res!279291) b!467244))

(assert (= (and b!467244 res!279288) b!467243))

(assert (= (and b!467243 res!279289) b!467248))

(assert (= (and b!467246 condMapEmpty!21040) mapIsEmpty!21040))

(assert (= (and b!467246 (not condMapEmpty!21040)) mapNonEmpty!21040))

(get-info :version)

(assert (= (and mapNonEmpty!21040 ((_ is ValueCellFull!6107) mapValue!21040)) b!467247))

(assert (= (and b!467246 ((_ is ValueCellFull!6107) mapDefault!21040)) b!467245))

(assert (= start!41856 b!467246))

(declare-fun m!448921 () Bool)

(assert (=> mapNonEmpty!21040 m!448921))

(declare-fun m!448923 () Bool)

(assert (=> b!467244 m!448923))

(declare-fun m!448925 () Bool)

(assert (=> start!41856 m!448925))

(declare-fun m!448927 () Bool)

(assert (=> start!41856 m!448927))

(declare-fun m!448929 () Bool)

(assert (=> start!41856 m!448929))

(declare-fun m!448931 () Bool)

(assert (=> b!467248 m!448931))

(declare-fun m!448933 () Bool)

(assert (=> b!467248 m!448933))

(declare-fun m!448935 () Bool)

(assert (=> b!467248 m!448935))

(declare-fun m!448937 () Bool)

(assert (=> b!467243 m!448937))

(check-sat (not b!467248) (not b!467243) (not b_next!11473) (not mapNonEmpty!21040) (not start!41856) tp_is_empty!12901 b_and!19827 (not b!467244))
(check-sat b_and!19827 (not b_next!11473))
