; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41906 () Bool)

(assert start!41906)

(declare-fun b_free!11509 () Bool)

(declare-fun b_next!11509 () Bool)

(assert (=> start!41906 (= b_free!11509 (not b_next!11509))))

(declare-fun tp!40539 () Bool)

(declare-fun b_and!19907 () Bool)

(assert (=> start!41906 (= tp!40539 b_and!19907)))

(declare-fun mapIsEmpty!21097 () Bool)

(declare-fun mapRes!21097 () Bool)

(assert (=> mapIsEmpty!21097 mapRes!21097))

(declare-fun b!467953 () Bool)

(declare-fun e!273809 () Bool)

(assert (=> b!467953 (= e!273809 true)))

(declare-datatypes ((V!18355 0))(
  ( (V!18356 (val!6513 Int)) )
))
(declare-fun minValueBefore!38 () V!18355)

(declare-datatypes ((tuple2!8482 0))(
  ( (tuple2!8483 (_1!4252 (_ BitVec 64)) (_2!4252 V!18355)) )
))
(declare-datatypes ((List!8562 0))(
  ( (Nil!8559) (Cons!8558 (h!9414 tuple2!8482) (t!14510 List!8562)) )
))
(declare-datatypes ((ListLongMap!7397 0))(
  ( (ListLongMap!7398 (toList!3714 List!8562)) )
))
(declare-fun lt!211632 () ListLongMap!7397)

(declare-fun zeroValue!794 () V!18355)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29640 0))(
  ( (array!29641 (arr!14246 (Array (_ BitVec 32) (_ BitVec 64))) (size!14598 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29640)

(declare-datatypes ((ValueCell!6125 0))(
  ( (ValueCellFull!6125 (v!8803 V!18355)) (EmptyCell!6125) )
))
(declare-datatypes ((array!29642 0))(
  ( (array!29643 (arr!14247 (Array (_ BitVec 32) ValueCell!6125)) (size!14599 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29642)

(declare-fun getCurrentListMap!2143 (array!29640 array!29642 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7397)

(assert (=> b!467953 (= lt!211632 (getCurrentListMap!2143 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467954 () Bool)

(declare-fun e!273810 () Bool)

(declare-fun tp_is_empty!12937 () Bool)

(assert (=> b!467954 (= e!273810 tp_is_empty!12937)))

(declare-fun mapNonEmpty!21097 () Bool)

(declare-fun tp!40540 () Bool)

(assert (=> mapNonEmpty!21097 (= mapRes!21097 (and tp!40540 e!273810))))

(declare-fun mapValue!21097 () ValueCell!6125)

(declare-fun mapKey!21097 () (_ BitVec 32))

(declare-fun mapRest!21097 () (Array (_ BitVec 32) ValueCell!6125))

(assert (=> mapNonEmpty!21097 (= (arr!14247 _values!833) (store mapRest!21097 mapKey!21097 mapValue!21097))))

(declare-fun b!467955 () Bool)

(declare-fun res!279697 () Bool)

(declare-fun e!273813 () Bool)

(assert (=> b!467955 (=> (not res!279697) (not e!273813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29640 (_ BitVec 32)) Bool)

(assert (=> b!467955 (= res!279697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467956 () Bool)

(declare-fun e!273811 () Bool)

(assert (=> b!467956 (= e!273811 tp_is_empty!12937)))

(declare-fun b!467957 () Bool)

(assert (=> b!467957 (= e!273813 (not e!273809))))

(declare-fun res!279696 () Bool)

(assert (=> b!467957 (=> res!279696 e!273809)))

(assert (=> b!467957 (= res!279696 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211633 () ListLongMap!7397)

(declare-fun lt!211635 () ListLongMap!7397)

(assert (=> b!467957 (= lt!211633 lt!211635)))

(declare-datatypes ((Unit!13638 0))(
  ( (Unit!13639) )
))
(declare-fun lt!211634 () Unit!13638)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18355)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!95 (array!29640 array!29642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 V!18355 V!18355 (_ BitVec 32) Int) Unit!13638)

(assert (=> b!467957 (= lt!211634 (lemmaNoChangeToArrayThenSameMapNoExtras!95 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1935 (array!29640 array!29642 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7397)

(assert (=> b!467957 (= lt!211635 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467957 (= lt!211633 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279698 () Bool)

(assert (=> start!41906 (=> (not res!279698) (not e!273813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41906 (= res!279698 (validMask!0 mask!1365))))

(assert (=> start!41906 e!273813))

(assert (=> start!41906 tp_is_empty!12937))

(assert (=> start!41906 tp!40539))

(assert (=> start!41906 true))

(declare-fun array_inv!10374 (array!29640) Bool)

(assert (=> start!41906 (array_inv!10374 _keys!1025)))

(declare-fun e!273814 () Bool)

(declare-fun array_inv!10375 (array!29642) Bool)

(assert (=> start!41906 (and (array_inv!10375 _values!833) e!273814)))

(declare-fun b!467958 () Bool)

(assert (=> b!467958 (= e!273814 (and e!273811 mapRes!21097))))

(declare-fun condMapEmpty!21097 () Bool)

(declare-fun mapDefault!21097 () ValueCell!6125)

(assert (=> b!467958 (= condMapEmpty!21097 (= (arr!14247 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6125)) mapDefault!21097)))))

(declare-fun b!467959 () Bool)

(declare-fun res!279699 () Bool)

(assert (=> b!467959 (=> (not res!279699) (not e!273813))))

(assert (=> b!467959 (= res!279699 (and (= (size!14599 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14598 _keys!1025) (size!14599 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467960 () Bool)

(declare-fun res!279695 () Bool)

(assert (=> b!467960 (=> (not res!279695) (not e!273813))))

(declare-datatypes ((List!8563 0))(
  ( (Nil!8560) (Cons!8559 (h!9415 (_ BitVec 64)) (t!14511 List!8563)) )
))
(declare-fun arrayNoDuplicates!0 (array!29640 (_ BitVec 32) List!8563) Bool)

(assert (=> b!467960 (= res!279695 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8560))))

(assert (= (and start!41906 res!279698) b!467959))

(assert (= (and b!467959 res!279699) b!467955))

(assert (= (and b!467955 res!279697) b!467960))

(assert (= (and b!467960 res!279695) b!467957))

(assert (= (and b!467957 (not res!279696)) b!467953))

(assert (= (and b!467958 condMapEmpty!21097) mapIsEmpty!21097))

(assert (= (and b!467958 (not condMapEmpty!21097)) mapNonEmpty!21097))

(get-info :version)

(assert (= (and mapNonEmpty!21097 ((_ is ValueCellFull!6125) mapValue!21097)) b!467954))

(assert (= (and b!467958 ((_ is ValueCellFull!6125) mapDefault!21097)) b!467956))

(assert (= start!41906 b!467958))

(declare-fun m!450251 () Bool)

(assert (=> b!467957 m!450251))

(declare-fun m!450253 () Bool)

(assert (=> b!467957 m!450253))

(declare-fun m!450255 () Bool)

(assert (=> b!467957 m!450255))

(declare-fun m!450257 () Bool)

(assert (=> b!467960 m!450257))

(declare-fun m!450259 () Bool)

(assert (=> mapNonEmpty!21097 m!450259))

(declare-fun m!450261 () Bool)

(assert (=> b!467955 m!450261))

(declare-fun m!450263 () Bool)

(assert (=> b!467953 m!450263))

(declare-fun m!450265 () Bool)

(assert (=> start!41906 m!450265))

(declare-fun m!450267 () Bool)

(assert (=> start!41906 m!450267))

(declare-fun m!450269 () Bool)

(assert (=> start!41906 m!450269))

(check-sat (not start!41906) (not mapNonEmpty!21097) (not b!467960) b_and!19907 (not b!467957) (not b!467955) (not b!467953) (not b_next!11509) tp_is_empty!12937)
(check-sat b_and!19907 (not b_next!11509))
