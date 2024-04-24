; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41912 () Bool)

(assert start!41912)

(declare-fun b_free!11515 () Bool)

(declare-fun b_next!11515 () Bool)

(assert (=> start!41912 (= b_free!11515 (not b_next!11515))))

(declare-fun tp!40558 () Bool)

(declare-fun b_and!19913 () Bool)

(assert (=> start!41912 (= tp!40558 b_and!19913)))

(declare-fun b!468025 () Bool)

(declare-fun e!273863 () Bool)

(declare-fun e!273867 () Bool)

(declare-fun mapRes!21106 () Bool)

(assert (=> b!468025 (= e!273863 (and e!273867 mapRes!21106))))

(declare-fun condMapEmpty!21106 () Bool)

(declare-datatypes ((V!18363 0))(
  ( (V!18364 (val!6516 Int)) )
))
(declare-datatypes ((ValueCell!6128 0))(
  ( (ValueCellFull!6128 (v!8806 V!18363)) (EmptyCell!6128) )
))
(declare-datatypes ((array!29652 0))(
  ( (array!29653 (arr!14252 (Array (_ BitVec 32) ValueCell!6128)) (size!14604 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29652)

(declare-fun mapDefault!21106 () ValueCell!6128)

(assert (=> b!468025 (= condMapEmpty!21106 (= (arr!14252 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6128)) mapDefault!21106)))))

(declare-fun b!468026 () Bool)

(declare-fun res!279744 () Bool)

(declare-fun e!273864 () Bool)

(assert (=> b!468026 (=> (not res!279744) (not e!273864))))

(declare-datatypes ((array!29654 0))(
  ( (array!29655 (arr!14253 (Array (_ BitVec 32) (_ BitVec 64))) (size!14605 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29654)

(declare-datatypes ((List!8566 0))(
  ( (Nil!8563) (Cons!8562 (h!9418 (_ BitVec 64)) (t!14514 List!8566)) )
))
(declare-fun arrayNoDuplicates!0 (array!29654 (_ BitVec 32) List!8566) Bool)

(assert (=> b!468026 (= res!279744 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8563))))

(declare-fun b!468027 () Bool)

(declare-fun res!279742 () Bool)

(assert (=> b!468027 (=> (not res!279742) (not e!273864))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29654 (_ BitVec 32)) Bool)

(assert (=> b!468027 (= res!279742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468028 () Bool)

(declare-fun e!273865 () Bool)

(declare-fun tp_is_empty!12943 () Bool)

(assert (=> b!468028 (= e!273865 tp_is_empty!12943)))

(declare-fun mapNonEmpty!21106 () Bool)

(declare-fun tp!40557 () Bool)

(assert (=> mapNonEmpty!21106 (= mapRes!21106 (and tp!40557 e!273865))))

(declare-fun mapRest!21106 () (Array (_ BitVec 32) ValueCell!6128))

(declare-fun mapValue!21106 () ValueCell!6128)

(declare-fun mapKey!21106 () (_ BitVec 32))

(assert (=> mapNonEmpty!21106 (= (arr!14252 _values!833) (store mapRest!21106 mapKey!21106 mapValue!21106))))

(declare-fun b!468029 () Bool)

(declare-fun res!279743 () Bool)

(assert (=> b!468029 (=> (not res!279743) (not e!273864))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468029 (= res!279743 (and (= (size!14604 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14605 _keys!1025) (size!14604 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468030 () Bool)

(assert (=> b!468030 (= e!273867 tp_is_empty!12943)))

(declare-fun b!468031 () Bool)

(declare-fun e!273868 () Bool)

(assert (=> b!468031 (= e!273868 true)))

(declare-fun minValueBefore!38 () V!18363)

(declare-fun zeroValue!794 () V!18363)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8486 0))(
  ( (tuple2!8487 (_1!4254 (_ BitVec 64)) (_2!4254 V!18363)) )
))
(declare-datatypes ((List!8567 0))(
  ( (Nil!8564) (Cons!8563 (h!9419 tuple2!8486) (t!14515 List!8567)) )
))
(declare-datatypes ((ListLongMap!7401 0))(
  ( (ListLongMap!7402 (toList!3716 List!8567)) )
))
(declare-fun lt!211671 () ListLongMap!7401)

(declare-fun getCurrentListMap!2145 (array!29654 array!29652 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7401)

(assert (=> b!468031 (= lt!211671 (getCurrentListMap!2145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468032 () Bool)

(assert (=> b!468032 (= e!273864 (not e!273868))))

(declare-fun res!279740 () Bool)

(assert (=> b!468032 (=> res!279740 e!273868)))

(assert (=> b!468032 (= res!279740 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211668 () ListLongMap!7401)

(declare-fun lt!211669 () ListLongMap!7401)

(assert (=> b!468032 (= lt!211668 lt!211669)))

(declare-datatypes ((Unit!13642 0))(
  ( (Unit!13643) )
))
(declare-fun lt!211670 () Unit!13642)

(declare-fun minValueAfter!38 () V!18363)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!97 (array!29654 array!29652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 V!18363 V!18363 (_ BitVec 32) Int) Unit!13642)

(assert (=> b!468032 (= lt!211670 (lemmaNoChangeToArrayThenSameMapNoExtras!97 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1937 (array!29654 array!29652 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7401)

(assert (=> b!468032 (= lt!211669 (getCurrentListMapNoExtraKeys!1937 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468032 (= lt!211668 (getCurrentListMapNoExtraKeys!1937 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21106 () Bool)

(assert (=> mapIsEmpty!21106 mapRes!21106))

(declare-fun res!279741 () Bool)

(assert (=> start!41912 (=> (not res!279741) (not e!273864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41912 (= res!279741 (validMask!0 mask!1365))))

(assert (=> start!41912 e!273864))

(assert (=> start!41912 tp_is_empty!12943))

(assert (=> start!41912 tp!40558))

(assert (=> start!41912 true))

(declare-fun array_inv!10380 (array!29654) Bool)

(assert (=> start!41912 (array_inv!10380 _keys!1025)))

(declare-fun array_inv!10381 (array!29652) Bool)

(assert (=> start!41912 (and (array_inv!10381 _values!833) e!273863)))

(assert (= (and start!41912 res!279741) b!468029))

(assert (= (and b!468029 res!279743) b!468027))

(assert (= (and b!468027 res!279742) b!468026))

(assert (= (and b!468026 res!279744) b!468032))

(assert (= (and b!468032 (not res!279740)) b!468031))

(assert (= (and b!468025 condMapEmpty!21106) mapIsEmpty!21106))

(assert (= (and b!468025 (not condMapEmpty!21106)) mapNonEmpty!21106))

(get-info :version)

(assert (= (and mapNonEmpty!21106 ((_ is ValueCellFull!6128) mapValue!21106)) b!468028))

(assert (= (and b!468025 ((_ is ValueCellFull!6128) mapDefault!21106)) b!468030))

(assert (= start!41912 b!468025))

(declare-fun m!450311 () Bool)

(assert (=> b!468027 m!450311))

(declare-fun m!450313 () Bool)

(assert (=> b!468031 m!450313))

(declare-fun m!450315 () Bool)

(assert (=> b!468026 m!450315))

(declare-fun m!450317 () Bool)

(assert (=> mapNonEmpty!21106 m!450317))

(declare-fun m!450319 () Bool)

(assert (=> b!468032 m!450319))

(declare-fun m!450321 () Bool)

(assert (=> b!468032 m!450321))

(declare-fun m!450323 () Bool)

(assert (=> b!468032 m!450323))

(declare-fun m!450325 () Bool)

(assert (=> start!41912 m!450325))

(declare-fun m!450327 () Bool)

(assert (=> start!41912 m!450327))

(declare-fun m!450329 () Bool)

(assert (=> start!41912 m!450329))

(check-sat (not b_next!11515) (not b!468026) tp_is_empty!12943 (not mapNonEmpty!21106) (not start!41912) (not b!468027) (not b!468031) (not b!468032) b_and!19913)
(check-sat b_and!19913 (not b_next!11515))
