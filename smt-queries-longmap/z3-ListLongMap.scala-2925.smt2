; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41706 () Bool)

(assert start!41706)

(declare-fun b_free!11359 () Bool)

(declare-fun b_next!11359 () Bool)

(assert (=> start!41706 (= b_free!11359 (not b_next!11359))))

(declare-fun tp!40081 () Bool)

(declare-fun b_and!19725 () Bool)

(assert (=> start!41706 (= tp!40081 b_and!19725)))

(declare-fun b!465781 () Bool)

(declare-fun res!278456 () Bool)

(declare-fun e!272266 () Bool)

(assert (=> b!465781 (=> (not res!278456) (not e!272266))))

(declare-datatypes ((array!29356 0))(
  ( (array!29357 (arr!14107 (Array (_ BitVec 32) (_ BitVec 64))) (size!14459 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29356)

(declare-datatypes ((List!8461 0))(
  ( (Nil!8458) (Cons!8457 (h!9313 (_ BitVec 64)) (t!14403 List!8461)) )
))
(declare-fun arrayNoDuplicates!0 (array!29356 (_ BitVec 32) List!8461) Bool)

(assert (=> b!465781 (= res!278456 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8458))))

(declare-fun res!278457 () Bool)

(assert (=> start!41706 (=> (not res!278457) (not e!272266))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41706 (= res!278457 (validMask!0 mask!1365))))

(assert (=> start!41706 e!272266))

(declare-fun tp_is_empty!12787 () Bool)

(assert (=> start!41706 tp_is_empty!12787))

(assert (=> start!41706 tp!40081))

(assert (=> start!41706 true))

(declare-fun array_inv!10268 (array!29356) Bool)

(assert (=> start!41706 (array_inv!10268 _keys!1025)))

(declare-datatypes ((V!18155 0))(
  ( (V!18156 (val!6438 Int)) )
))
(declare-datatypes ((ValueCell!6050 0))(
  ( (ValueCellFull!6050 (v!8726 V!18155)) (EmptyCell!6050) )
))
(declare-datatypes ((array!29358 0))(
  ( (array!29359 (arr!14108 (Array (_ BitVec 32) ValueCell!6050)) (size!14460 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29358)

(declare-fun e!272270 () Bool)

(declare-fun array_inv!10269 (array!29358) Bool)

(assert (=> start!41706 (and (array_inv!10269 _values!833) e!272270)))

(declare-fun mapIsEmpty!20863 () Bool)

(declare-fun mapRes!20863 () Bool)

(assert (=> mapIsEmpty!20863 mapRes!20863))

(declare-fun b!465782 () Bool)

(declare-fun e!272267 () Bool)

(assert (=> b!465782 (= e!272267 true)))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18155)

(declare-datatypes ((tuple2!8374 0))(
  ( (tuple2!8375 (_1!4198 (_ BitVec 64)) (_2!4198 V!18155)) )
))
(declare-datatypes ((List!8462 0))(
  ( (Nil!8459) (Cons!8458 (h!9314 tuple2!8374) (t!14404 List!8462)) )
))
(declare-datatypes ((ListLongMap!7289 0))(
  ( (ListLongMap!7290 (toList!3660 List!8462)) )
))
(declare-fun lt!210426 () ListLongMap!7289)

(declare-fun minValueAfter!38 () V!18155)

(declare-fun getCurrentListMap!2110 (array!29356 array!29358 (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 (_ BitVec 32) Int) ListLongMap!7289)

(assert (=> b!465782 (= lt!210426 (getCurrentListMap!2110 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18155)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210424 () ListLongMap!7289)

(declare-fun +!1659 (ListLongMap!7289 tuple2!8374) ListLongMap!7289)

(assert (=> b!465782 (= lt!210424 (+!1659 (getCurrentListMap!2110 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8375 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465783 () Bool)

(declare-fun e!272269 () Bool)

(assert (=> b!465783 (= e!272269 tp_is_empty!12787)))

(declare-fun b!465784 () Bool)

(declare-fun e!272265 () Bool)

(assert (=> b!465784 (= e!272265 tp_is_empty!12787)))

(declare-fun b!465785 () Bool)

(declare-fun res!278458 () Bool)

(assert (=> b!465785 (=> (not res!278458) (not e!272266))))

(assert (=> b!465785 (= res!278458 (and (= (size!14460 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14459 _keys!1025) (size!14460 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20863 () Bool)

(declare-fun tp!40080 () Bool)

(assert (=> mapNonEmpty!20863 (= mapRes!20863 (and tp!40080 e!272269))))

(declare-fun mapRest!20863 () (Array (_ BitVec 32) ValueCell!6050))

(declare-fun mapKey!20863 () (_ BitVec 32))

(declare-fun mapValue!20863 () ValueCell!6050)

(assert (=> mapNonEmpty!20863 (= (arr!14108 _values!833) (store mapRest!20863 mapKey!20863 mapValue!20863))))

(declare-fun b!465786 () Bool)

(assert (=> b!465786 (= e!272266 (not e!272267))))

(declare-fun res!278460 () Bool)

(assert (=> b!465786 (=> res!278460 e!272267)))

(assert (=> b!465786 (= res!278460 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210425 () ListLongMap!7289)

(declare-fun lt!210423 () ListLongMap!7289)

(assert (=> b!465786 (= lt!210425 lt!210423)))

(declare-datatypes ((Unit!13534 0))(
  ( (Unit!13535) )
))
(declare-fun lt!210427 () Unit!13534)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!45 (array!29356 array!29358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 V!18155 V!18155 (_ BitVec 32) Int) Unit!13534)

(assert (=> b!465786 (= lt!210427 (lemmaNoChangeToArrayThenSameMapNoExtras!45 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1885 (array!29356 array!29358 (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 (_ BitVec 32) Int) ListLongMap!7289)

(assert (=> b!465786 (= lt!210423 (getCurrentListMapNoExtraKeys!1885 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465786 (= lt!210425 (getCurrentListMapNoExtraKeys!1885 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465787 () Bool)

(declare-fun res!278459 () Bool)

(assert (=> b!465787 (=> (not res!278459) (not e!272266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29356 (_ BitVec 32)) Bool)

(assert (=> b!465787 (= res!278459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465788 () Bool)

(assert (=> b!465788 (= e!272270 (and e!272265 mapRes!20863))))

(declare-fun condMapEmpty!20863 () Bool)

(declare-fun mapDefault!20863 () ValueCell!6050)

(assert (=> b!465788 (= condMapEmpty!20863 (= (arr!14108 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6050)) mapDefault!20863)))))

(assert (= (and start!41706 res!278457) b!465785))

(assert (= (and b!465785 res!278458) b!465787))

(assert (= (and b!465787 res!278459) b!465781))

(assert (= (and b!465781 res!278456) b!465786))

(assert (= (and b!465786 (not res!278460)) b!465782))

(assert (= (and b!465788 condMapEmpty!20863) mapIsEmpty!20863))

(assert (= (and b!465788 (not condMapEmpty!20863)) mapNonEmpty!20863))

(get-info :version)

(assert (= (and mapNonEmpty!20863 ((_ is ValueCellFull!6050) mapValue!20863)) b!465783))

(assert (= (and b!465788 ((_ is ValueCellFull!6050) mapDefault!20863)) b!465784))

(assert (= start!41706 b!465788))

(declare-fun m!448255 () Bool)

(assert (=> b!465786 m!448255))

(declare-fun m!448257 () Bool)

(assert (=> b!465786 m!448257))

(declare-fun m!448259 () Bool)

(assert (=> b!465786 m!448259))

(declare-fun m!448261 () Bool)

(assert (=> b!465787 m!448261))

(declare-fun m!448263 () Bool)

(assert (=> b!465782 m!448263))

(declare-fun m!448265 () Bool)

(assert (=> b!465782 m!448265))

(assert (=> b!465782 m!448265))

(declare-fun m!448267 () Bool)

(assert (=> b!465782 m!448267))

(declare-fun m!448269 () Bool)

(assert (=> mapNonEmpty!20863 m!448269))

(declare-fun m!448271 () Bool)

(assert (=> start!41706 m!448271))

(declare-fun m!448273 () Bool)

(assert (=> start!41706 m!448273))

(declare-fun m!448275 () Bool)

(assert (=> start!41706 m!448275))

(declare-fun m!448277 () Bool)

(assert (=> b!465781 m!448277))

(check-sat (not mapNonEmpty!20863) (not b!465781) tp_is_empty!12787 (not b!465782) b_and!19725 (not b_next!11359) (not b!465787) (not start!41706) (not b!465786))
(check-sat b_and!19725 (not b_next!11359))
